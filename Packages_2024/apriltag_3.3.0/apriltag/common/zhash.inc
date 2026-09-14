{$IFDEF read_interface}


type
  Pzhash_t = type Pointer;

  Pzhash_iterator_t = ^Tzhash_iterator_t;
  Tzhash_iterator_t = record
    zh: Pzhash_t;
    czh: Pzhash_t;
    last_entry: longint;
  end;

function zhash_create(keysz: Tsize_t; valuesz: Tsize_t; hash: Pointer; equals: Pointer): Pzhash_t; cdecl; external libapriltag_utils;
procedure zhash_destroy(zh: Pzhash_t); cdecl; external libapriltag_utils;
function zhash_copy(other: Pzhash_t): Pzhash_t; cdecl; external libapriltag_utils;
function zhash_contains(zh: Pzhash_t; key: pointer): longint; cdecl; external libapriltag_utils;
function zhash_get(zh: Pzhash_t; key: pointer; out_value: pointer): longint; cdecl; external libapriltag_utils;
function zhash_get_volatile(zh: Pzhash_t; key: pointer; out_p: pointer): longint; cdecl; external libapriltag_utils;
function zhash_put(zh: Pzhash_t; key: pointer; value: pointer; oldkey: pointer; oldvalue: pointer): longint; cdecl; external libapriltag_utils;
function zhash_remove(zh: Pzhash_t; key: pointer; oldkey: pointer; oldvalue: pointer): longint; cdecl; external libapriltag_utils;
procedure zhash_clear(zh: Pzhash_t); cdecl; external libapriltag_utils;
function zhash_size(zh: Pzhash_t): longint; cdecl; external libapriltag_utils;
procedure zhash_iterator_init(zh: Pzhash_t; zit: Pzhash_iterator_t); cdecl; external libapriltag_utils;
procedure zhash_iterator_init_const(zh: Pzhash_t; zit: Pzhash_iterator_t); cdecl; external libapriltag_utils;
function zhash_iterator_next(zit: Pzhash_iterator_t; outkey: pointer; outvalue: pointer): longint; cdecl; external libapriltag_utils;
function zhash_iterator_next_volatile(zit: Pzhash_iterator_t; outkey: pointer; outvalue: pointer): longint; cdecl; external libapriltag_utils;
procedure zhash_iterator_remove(zit: Pzhash_iterator_t); cdecl; external libapriltag_utils;
procedure zhash_map_keys(zh: Pzhash_t; f: Pointer); cdecl; external libapriltag_utils;
procedure zhash_map_values(zh: Pzhash_t; f: Pointer); cdecl; external libapriltag_utils;
procedure zhash_vmap_keys(vh: Pzhash_t; f: Pointer); cdecl; external libapriltag_utils;
procedure zhash_vmap_values(vh: Pzhash_t; f: Pointer); cdecl; external libapriltag_utils;
function zhash_keys(zh: Pzhash_t): Pzarray_t; cdecl; external libapriltag_utils;
function zhash_values(zh: Pzhash_t): Pzarray_t; cdecl; external libapriltag_utils;
function zhash_uint32_hash(a: pointer): Tuint32_t; cdecl; external libapriltag_utils;
function zhash_uint32_equals(a: pointer; b: pointer): longint; cdecl; external libapriltag_utils;
function zhash_uint64_hash(a: pointer): Tuint32_t; cdecl; external libapriltag_utils;
function zhash_uint64_equals(a: pointer; b: pointer): longint; cdecl; external libapriltag_utils;
function zhash_ptr_hash(a: pointer): Tuint32_t; cdecl; external libapriltag_utils;
function zhash_ptr_equals(a: pointer; b: pointer): longint; cdecl; external libapriltag_utils;
function zhash_str_hash(a: pointer): Tuint32_t; cdecl; external libapriltag_utils;
function zhash_str_equals(a: pointer; b: pointer): longint; cdecl; external libapriltag_utils;
procedure zhash_debug(zh: Pzhash_t); cdecl; external libapriltag_utils;

function zhash_str_str_create: Pzhash_t;
function zhash_str_str_get(zh: Pzhash_t; const key: pansichar): pansichar;
procedure zhash_str_str_put(zh: Pzhash_t; key, value: pansichar);
procedure zhash_str_str_destroy(zh: Pzhash_t);
function zhash_int_hash(const _a: Pointer): Tuint32_t;
function zhash_int_equals(const _a, _b: Pointer): integer;

// === Konventiert am: 12-9-26 17:28:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function zhash_str_str_create: Pzhash_t;
begin
  Result := zhash_create(SizeOf(pansichar), SizeOf(pansichar), @zhash_str_hash, @zhash_str_equals);
end;

function zhash_str_str_get(zh: Pzhash_t; const key: pansichar): pansichar;
var
  value: pchar = nil;
begin
  if zh = nil then begin
    Halt(1);
  end;
  if zhash_get(zh, @key, @value) <> 0 then begin
    Exit(value);
  end;

  Result := nil;
end;

procedure zhash_str_str_put(zh: Pzhash_t; key, value: pansichar);
var
  oldkey, oldval: pansichar;
begin
  if zhash_put(zh, @key, @value, @oldkey, @oldval) <> 0 then  begin
    free(oldkey);
    free(oldval);
  end;
end;

procedure zhash_str_str_destroy(zh: Pzhash_t);
var
  zit_storage: array[0..63] of byte;
  zit: Pointer;
  key, value: pansichar;
begin
  zit := @zit_storage;
  zhash_iterator_init(zh, zit);

  while zhash_iterator_next(zit, @key, @value) <> 0 do begin
    free(key);
    free(value);
  end;

  zhash_destroy(zh);
end;

function zhash_int_hash(const _a: Pointer): Tuint32_t;
begin
  if _a = nil then begin
    Halt(1);
  end;
  Result := Tuint32_t(PInteger(_a)^);
end;

function zhash_int_equals(const _a, _b: Pointer): integer;
var
  a, b: integer;
begin
  if (_a = nil) or (_b = nil) then begin
    Halt(1);
  end;

  a := PInteger(_a)^;
  b := PInteger(_b)^;

  if a = b then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;




{$ENDIF read_implementation}
