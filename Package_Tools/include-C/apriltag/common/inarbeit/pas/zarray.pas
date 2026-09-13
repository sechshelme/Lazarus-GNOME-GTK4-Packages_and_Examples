unit zarray;

interface

uses
  fp_apriltag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pzarray_t = ^Tzarray_t;
  Tzarray_t = record
    el_sz: Tsize_t;
    size: longint;
    alloc: longint;
    data: pchar;
  end;


function zstrcmp(a_pp: pointer; b_pp: pointer): longint; cdecl; external libapriltag;
procedure zarray_vmap(za: Pzarray_t; f: Pointer); cdecl; external libapriltag;

function zarray_create(el_sz: SizeInt): Pzarray_t;
procedure zarray_destroy(za: Pzarray_t);
function zarray_copy(za: Pzarray_t): Pzarray_t;
function iceillog2(v: integer): integer;
function zarray_copy_subset(za: Pzarray_t; start_idx, end_idx_exclusive: integer): Pzarray_t;
function zarray_size(za: Pzarray_t): integer;
procedure zarray_ensure_capacity(za: Pzarray_t; capacity: integer);
procedure zarray_add(za: Pzarray_t; p: Pointer);
procedure zarray_get(za: Pzarray_t; idx: integer; p: Pointer);
procedure zarray_get_volatile(za: Pzarray_t; idx: integer; p: Pointer);
procedure zarray_truncate(za: Pzarray_t; sz: integer);
procedure zarray_remove_index(za: Pzarray_t; idx: integer; shuffle: integer);
function zarray_remove_value(za: Pzarray_t; p: Pointer; shuffle: integer): integer;
procedure zarray_insert(za: Pzarray_t; idx: integer; p: Pointer);
procedure zarray_set(za: Pzarray_t; idx: integer; p: Pointer; outp: Pointer);

type
  Tzarray_map_func = procedure(p: Pointer); cdecl;
  Tzarray_compar_func = function(p1, p2: Pointer): integer; cdecl;

procedure zarray_map(za: Pzarray_t; f: Tzarray_map_func);
procedure zarray_clear(za: Pzarray_t);
function zarray_contains(za: Pzarray_t; p: Pointer): integer;
procedure zarray_sort(za: Pzarray_t; compar: Tzarray_compar_func);
function zarray_index_of(za: Pzarray_t; p: Pointer): integer;
procedure zarray_add_all(dest: Pzarray_t; source: Pzarray_t);


// === Konventiert am: 12-9-26 17:28:31 ===


implementation

function zarray_create(el_sz: SizeInt): Pzarray_t;
var
  za: Pzarray_t;
begin
  if el_sz <= 0 then begin Halt(1); end;
  za := Pzarray_t(calloc(1, SizeOf(Tzarray_t)));
  za^.el_sz := el_sz;
  Result := za;
end;

procedure zarray_destroy(za: Pzarray_t);
begin
  if za = nil then  begin Exit; end;
  if za^.data <> nil then  begin free(za^.data); end;
  memset(za, 0, SizeOf(Tzarray_t));
  free(za);
end;

function zarray_copy(za: Pzarray_t): Pzarray_t;
var
  zb: Pzarray_t;
begin
  if za = nil then begin Halt(1); end;

  zb := Pzarray_t(calloc(1, SizeOf(Tzarray_t)));
  zb^.el_sz := za^.el_sz;
  zb^.size := za^.size;
  zb^.alloc := za^.alloc;
  zb^.data := malloc(zb^.alloc * zb^.el_sz);
  memcpy(zb^.data, za^.data, za^.size * za^.el_sz);
  Result := zb;
end;

function iceillog2(v: integer): integer;
begin
  Dec(v);
  v := v or (v shr 1);
  v := v or (v shr 2);
  v := v or (v shr 4);
  v := v or (v shr 8);
  v := v or (v shr 16);
  Inc(v);
  Result := v;
end;

function zarray_copy_subset(za: Pzarray_t; start_idx, end_idx_exclusive: integer): Pzarray_t;
var
  out_za: Pzarray_t;
begin
  out_za := Pzarray_t(calloc(1, SizeOf(Tzarray_t)));
  out_za^.el_sz := za^.el_sz;
  out_za^.size := end_idx_exclusive - start_idx;
  out_za^.alloc := iceillog2(out_za^.size);
  out_za^.data := malloc(out_za^.alloc * out_za^.el_sz);
  memcpy(out_za^.data, pbyte(za^.data) + (start_idx * out_za^.el_sz), out_za^.size * out_za^.el_sz);
  Result := out_za;
end;

function zarray_size(za: Pzarray_t): integer;
begin
  if za = nil then begin Halt(1); end;
  Result := za^.size;
end;

procedure zarray_ensure_capacity(za: Pzarray_t; capacity: integer);
begin
  if za = nil then begin Halt(1); end;

  if capacity <= za^.alloc then  begin Exit; end;

  while za^.alloc < capacity do begin
    za^.alloc := za^.alloc * 2;
    if za^.alloc < 8 then begin za^.alloc := 8; end;
  end;

  za^.data := realloc(za^.data, za^.alloc * za^.el_sz);
end;

procedure zarray_add(za: Pzarray_t; p: Pointer);
var
  dest_ptr: Pointer;
begin
  if (za = nil) or (p = nil) then begin Halt(1); end;

  zarray_ensure_capacity(za, za^.size + 1);

  //  dest_ptr := PByte(za^.data) + (za^.size * za^.el_sz);
  //  memcpy(dest_ptr, p, za^.el_sz);
  memcpy(@za^.data[za^.size * za^.el_sz], p, za^.el_sz);
  Inc(za^.size);
end;

procedure zarray_get(za: Pzarray_t; idx: integer; p: Pointer);
var
  src_ptr: Pointer;
begin
  if (za = nil) or (p = nil) or (idx < 0) or (idx >= za^.size) then begin Halt(1); end;

  //  src_ptr := PByte(za^.data) + (idx * za^.el_sz);
  //  memcpy(p, src_ptr, za^.el_sz);
  memcpy(p, @za^.data[idx * za^.el_sz], za^.el_sz);
end;

procedure zarray_get_volatile(za: Pzarray_t; idx: integer; p: Pointer);
var
  src_ptr: Pointer;
begin
  if (za = nil) or (p = nil) or (idx < 0) or (idx >= za^.size) then begin Halt(1); end;

  //  src_ptr := PByte(za^.data) + (idx * za^.el_sz);
  //  PPointer(p)^ := src_ptr;

  PPointer(p)^ := @za^.data[idx * za^.el_sz];

end;

procedure zarray_truncate(za: Pzarray_t; sz: integer);
begin
  if (za = nil) or (sz > za^.size) then begin Halt(1); end;
  za^.size := sz;
end;

procedure zarray_remove_index(za: Pzarray_t; idx: integer; shuffle: integer);
var
  dest_ptr, src_ptr: Pointer;
  ncopy: integer;
begin
  if (za = nil) or (idx < 0) or (idx >= za^.size) then begin Halt(1); end;

  if shuffle <> 0 then  begin
    if idx < (za^.size - 1) then  begin
      //      dest_ptr := PByte(za^.data) + (idx * za^.el_sz);
      //      src_ptr := PByte(za^.data) + ((za^.size - 1) * za^.el_sz);
      //      memcpy(dest_ptr, src_ptr, za^.el_sz);

      memcpy(@za^.data[idx * za^.el_sz], @za^.data[(za^.size - 1) * za^.el_sz], za^.el_sz);
      Dec(za^.size);
    end;
  end else begin
    ncopy := za^.size - idx - 1;
    if ncopy > 0 then  begin
      //      dest_ptr := PByte(za^.data) + (idx * za^.el_sz);
      //      src_ptr := PByte(za^.data) + ((idx + 1) * za^.el_sz);
      //      memmove(dest_ptr, src_ptr, ncopy * za^.el_sz);
      memmove(@za^.data[idx * za^.el_sz], @za^.data[(idx + 1) * za^.el_sz], ncopy * za^.el_sz);
      Dec(za^.size);
    end;
  end;
end;

function zarray_remove_value(za: Pzarray_t; p: Pointer; shuffle: integer
  ): integer;
var
  idx: SizeInt;
  current_item_ptr: Pointer;
begin
  if (za = nil) or (p = nil) then begin Halt(1); end;

  for idx := 0 to za^.size - 1 do begin
    //    current_item_ptr := PByte(za^.data) + (idx * za^.el_sz);

    //      if memcmp(p, current_item_ptr, za^.el_sz) = 0 then    begin
    if memcmp(p, @za^.data[idx * za^.el_sz], za^.el_sz) = 0 then  begin
      zarray_remove_index(za, idx, shuffle);
      Exit(1);
    end;
  end;

  Result := 0;
end;

procedure zarray_insert(za: Pzarray_t; idx: integer; p: Pointer);
var
  dest_ptr, src_ptr: Pointer;
  ncopy: integer;
begin
  if (za = nil) or (p = nil) or (idx < 0) or (idx > za^.size) then begin Halt(1); end;

  zarray_ensure_capacity(za, za^.size + 1);

  ncopy := za^.size - idx;

  //  dest_ptr := PByte(za^.data) + ((idx + 1) * za^.el_sz);
  //  src_ptr := PByte(za^.data) + (idx * za^.el_sz);
  //  memmove(dest_ptr, src_ptr, ncopy * za^.el_sz);
  //  memcpy(src_ptr, p, za^.el_sz);
  memmove(@za^.data[(idx + 1) * za^.el_sz], @za^.data[idx * za^.el_sz], ncopy * za^.el_sz);
  memcpy(@za^.data[idx * za^.el_sz], p, za^.el_sz);

  Inc(za^.size);
end;

procedure zarray_set(za: Pzarray_t; idx: integer; p: Pointer; outp: Pointer);
var
  item_ptr: Pointer;
begin
  if (za = nil) or (p = nil) or (idx < 0) or (idx >= za^.size) then begin Halt(1); end;

  //  item_ptr := PByte(za^.data) + (idx * za^.el_sz);

  if outp <> nil then  begin
    //    memcpy(outp, item_ptr, za^.el_sz);
    memcpy(outp, @za^.data[idx * za^.el_sz], za^.el_sz);
  end;

  //  memcpy(item_ptr, p, za^.el_sz);
  memcpy(@za^.data[idx * za^.el_sz], p, za^.el_sz);
end;

procedure zarray_map(za: Pzarray_t; f: Tzarray_map_func);
var
  idx: integer;
  item_ptr: Pointer;
begin
  if (za = nil) or (f = nil) then begin Halt(1); end;

  for idx := 0 to za^.size - 1 do begin
    item_ptr := pbyte(za^.data) + (idx * za^.el_sz);
    f(item_ptr);
  end;
end;


procedure zarray_clear(za: Pzarray_t);
begin
  if za = nil then begin Halt(1); end;
  za^.size := 0;
end;


function zarray_contains(za: Pzarray_t; p: Pointer): integer;
var
  idx: integer;
  current_item_ptr: Pointer;
begin
  if (za = nil) or (p = nil) then begin Halt(1); end;

  for idx := 0 to za^.size - 1 do begin
    //    current_item_ptr := PByte(za^.data) + (idx * za^.el_sz);

    //    if memcmp(p, current_item_ptr, za^.el_sz) = 0 then    begin
    if memcmp(p, @za^.data[idx * za^.el_sz], za^.el_sz) = 0 then  begin
      Exit(1);
    end;
  end;

  Result := 0;
end;

procedure zarray_sort(za: Pzarray_t; compar: Tzarray_compar_func);
begin
  if (za = nil) or (compar = nil) then begin Halt(1); end;

  if za^.size = 0 then  begin Exit; end;

  qsort(za^.data, za^.size, za^.el_sz, compar);
end;

function zarray_index_of(za: Pzarray_t; p: Pointer): integer;
var
  i: integer;
  current_item_ptr: Pointer;
begin
  if (za = nil) or (p = nil) then begin Halt(1); end;

  for i := 0 to za^.size - 1 do begin
    //    current_item_ptr := PByte(za^.data) + (i * za^.el_sz);

    //      if memcmp(p, current_item_ptr, za^.el_sz) = 0 then    begin
    if memcmp(p, @za^.data[i * za^.el_sz], za^.el_sz) = 0 then  begin
      Exit(i);
    end;
  end;

  Result := -1;
end;

procedure zarray_add_all(dest: Pzarray_t; source: Pzarray_t);
var
  tmp: pansichar;
  i: integer;
begin
  if (dest = nil) or (source = nil) then begin Halt(1); end;

  tmp := pansichar(calloc(1, dest^.el_sz));

  for i := 0 to zarray_size(source) - 1 do begin
    zarray_get(source, i, tmp);
    zarray_add(dest, tmp);
  end;
  free(tmp);
end;


end.
