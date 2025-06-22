{$IFDEF read_interface}


function eina_rw_slice_slice_get(rw_slice: TEina_Rw_Slice): TEina_Slice;
function eina_slice_dup(slice: TEina_Slice): TEina_Rw_Slice;
function eina_rw_slice_dup(rw_slice: TEina_Rw_Slice): TEina_Rw_Slice;
function eina_slice_compare(a, b: TEina_Slice): integer;
function eina_rw_slice_compare(a, b: TEina_Rw_Slice): integer;
function eina_rw_slice_copy(dst: TEina_Rw_Slice; src: TEina_Slice): TEina_Rw_Slice;
function eina_slice_seek(slice: TEina_Slice; offset: Tssize_t; whence: integer): TEina_Slice;
function eina_rw_slice_seek(rw_slice: TEina_Rw_Slice; offset: Tssize_t; whence: integer): TEina_Rw_Slice;
function eina_slice_strchr(slice: TEina_Slice; c: integer): Pointer;
function eina_slice_find(slice, needle: TEina_Slice): Pointer;
function eina_slice_startswith(slice, prefix: TEina_Slice): TEina_Bool;
function eina_slice_endswith(slice, suffix: TEina_Slice): TEina_Bool;
function eina_rw_slice_strchr(rw_slice: TEina_Rw_Slice; c: integer): Pointer;
function eina_rw_slice_find(rw_slice: TEina_Rw_Slice; needle: TEina_Slice): Pointer;
function eina_rw_slice_startswith(rw_slice: TEina_Rw_Slice; prefix: TEina_Slice): TEina_Bool;
function eina_rw_slice_endswith(rw_slice: TEina_Rw_Slice; suffix: TEina_Slice): TEina_Bool;
function eina_slice_end_get(slice: TEina_Slice): Pointer;
function eina_rw_slice_end_get(rw_slice: TEina_Rw_Slice): Pointer;
function eina_slice_strdup(slice: TEina_Slice): pansichar;
function eina_rw_slice_strdup(rw_slice: TEina_Rw_Slice): pansichar;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_rw_slice_slice_get(rw_slice: TEina_Rw_Slice): TEina_Slice;
begin
  Result.len := rw_slice.len;
  Result.mem := rw_slice.mem;
end;

function eina_slice_dup(slice: TEina_Slice): TEina_Rw_Slice;
begin
  Result.len := slice.len;
  Result.mem := nil;
  if Result.len = 0 then begin
    Exit;
  end;

  Result.mem := malloc(Result.len);
  if Result.mem <> nil then begin
    memcpy(Result.mem, slice.mem, Result.len);
  end else begin
    Result.len := 0;
  end;
end;

function eina_rw_slice_dup(rw_slice: TEina_Rw_Slice): TEina_Rw_Slice;
begin
  Result := eina_slice_dup(eina_rw_slice_slice_get(rw_slice));
end;

function eina_slice_compare(a, b: TEina_Slice): integer;
var
  len: Tsize_t;
  r: integer;
begin
  if a.len <= b.len then begin
    len := a.len;
  end else begin
    len := b.len;
  end;

  if len > 0 then begin
    r := memcmp(a.mem, b.mem, len);
    if r <> 0 then begin
      Result := r;
      Exit;
    end;
  end;

  if a.len < b.len then begin
    Result := -1;
  end else if a.len > b.len then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;

function eina_rw_slice_compare(a, b: TEina_Rw_Slice): integer;
begin
  Result := eina_slice_compare(eina_rw_slice_slice_get(a), eina_rw_slice_slice_get(b));
end;

function eina_rw_slice_copy(dst: TEina_Rw_Slice; src: TEina_Slice): TEina_Rw_Slice;
var
  len: SizeUInt;
begin
  if src.len <= dst.len then begin
    len := src.len;
  end else begin
    len := dst.len;
  end;

  Result.len := len;
  Result.mem := dst.mem;
  if len > 0 then begin
    memcpy(Result.mem, src.mem, len);
  end;
  Result := Result;
end;

function eina_slice_seek(slice: TEina_Slice; offset: Tssize_t; whence: integer): TEina_Slice;
begin
  Result.len := 0;
  Result.mem := slice.mem;

  if whence = SEEK_END then begin
    whence := SEEK_SET;
    Inc(offset, slice.len);
  end;

  if whence = SEEK_SET then begin
    if Tsize_t(offset) > slice.len then begin
      offset := slice.len;
    end else if offset < 0 then begin
      offset := 0;
    end;
    Result.len := slice.len - offset;
    Result.mem := Pointer(slice.bytes + offset);
  end;
end;

function eina_rw_slice_seek(rw_slice: TEina_Rw_Slice; offset: Tssize_t; whence: integer): TEina_Rw_Slice;
begin
  Result.len := 0;
  Result.mem := rw_slice.mem;

  if whence = SEEK_END then begin
    whence := SEEK_SET;
    Inc(offset, rw_slice.len);
  end;

  if whence = SEEK_SET then begin
    if Tsize_t(offset) > rw_slice.len then begin
      offset := rw_slice.len;
    end else if offset < 0 then begin
      offset := 0;
    end;
    Result.len := rw_slice.len - offset;
    Result.mem := Pointer(rw_slice.mem + offset);
  end;
end;

function eina_slice_strchr(slice: TEina_Slice; c: integer): Pointer;
begin
  if slice.len <> 0 then begin
    Result := memchr(slice.mem, c, slice.len);
  end else begin
    Result := nil;
  end;
end;

function eina_slice_find(slice, needle: TEina_Slice): Pointer;
var
  s, n: TEina_Slice;
  c: byte;
  offset: Tsize_t;
  p: PUInt8;
begin
  Result := nil;
  if (slice.len <> 0) and (needle.len <> 0) and (slice.len >= needle.len) then begin
    if needle.len = 1 then begin
      Result := eina_slice_strchr(slice, needle.bytes[0]);
      Exit;
    end;

    if (slice.len = needle.len) and (memcmp(slice.mem, needle.mem, needle.len) = 0) then begin
      Result := slice.mem;
      Exit;
    end;

    s.mem := slice.mem;
    s.len := slice.len - (needle.len - 1);

    c := needle.bytes[0];
    n.mem := Pointer(needle.bytes + 1);
    n.len := needle.len - 1;

    while s.len > 0 do begin
      p := PUInt8(eina_slice_strchr(s, c));
      if p <> nil then begin
        Inc(p);
        if memcmp(p, n.mem, n.len) = 0 then begin
          Result := Pointer(p - 1);
          Exit;
        end;
        offset := p - s.bytes;
        Inc(s.bytes, offset);
        s.len := s.len - offset;
        Continue;
      end;
      Break;
    end;
  end;
end;

function eina_slice_startswith(slice, prefix: TEina_Slice): TEina_Bool;
begin
  if (prefix.len <> 0) and (slice.len >= prefix.len) then begin
    Result := memcmp(slice.mem, prefix.mem, prefix.len) = 0;
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_slice_endswith(slice, suffix: TEina_Slice): TEina_Bool;
begin
  if (suffix.len <> 0) and (slice.len >= suffix.len) then begin
    Result := memcmp(slice.mem + slice.len - suffix.len, suffix.mem, suffix.len) = 0;
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_rw_slice_strchr(rw_slice: TEina_Rw_Slice; c: integer): Pointer;
begin
  if rw_slice.len <> 0 then begin
    Result := memchr(rw_slice.mem, c, rw_slice.len);
  end else begin
    Result := nil;
  end;
end;

function eina_rw_slice_find(rw_slice: TEina_Rw_Slice; needle: TEina_Slice): Pointer;
begin
  Result := eina_slice_find(eina_rw_slice_slice_get(rw_slice), needle);
end;

function eina_rw_slice_startswith(rw_slice: TEina_Rw_Slice; prefix: TEina_Slice): TEina_Bool;
begin
  if (prefix.len <> 0) and (rw_slice.len >= prefix.len) then begin
    Result := memcmp(rw_slice.mem, prefix.mem, prefix.len) = 0;
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_rw_slice_endswith(rw_slice: TEina_Rw_Slice; suffix: TEina_Slice): TEina_Bool;
begin
  if (suffix.len <> 0) and (rw_slice.len >= suffix.len) then begin
    Result := memcmp(rw_slice.mem + rw_slice.len - suffix.len, suffix.mem, suffix.len) = 0;
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_slice_end_get(slice: TEina_Slice): Pointer;
begin
  Result := Pointer(slice.mem + slice.len);
end;

function eina_rw_slice_end_get(rw_slice: TEina_Rw_Slice): Pointer;
begin
  Result := Pointer(rw_slice.mem + rw_slice.len);
end;

function eina_slice_strdup(slice: TEina_Slice): pansichar;
begin
  if slice.len <> 0 then begin
    Result := eina_strndup(pchar(slice.mem), slice.len);
  end else begin
    Result := strdup('');
  end;
end;

function eina_rw_slice_strdup(rw_slice: TEina_Rw_Slice): pansichar;
begin
  if rw_slice.len <> 0 then begin
    Result := eina_strndup(pchar(rw_slice.mem), rw_slice.len);
  end else begin
    Result := strdup('');
  end;
end;

{$ENDIF read_implementation}
