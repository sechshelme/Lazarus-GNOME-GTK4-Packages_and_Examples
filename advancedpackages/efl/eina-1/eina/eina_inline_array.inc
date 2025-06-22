{$IFDEF read_interface}


function eina_array_grow(array_: PEina_Array): TEina_Bool; cdecl; external libeina;

function eina_array_push(array_: PEina_Array; data: Pointer): TEina_Bool;
function eina_array_pop(array_: PEina_Array): Pointer;
function eina_array_data_get(array_: PEina_Array; idx: cardinal): Pointer;
procedure eina_array_data_set(array_: PEina_Array; idx: cardinal; data: Pointer);
function eina_array_count_get(array_: PEina_Array): cardinal;
function eina_array_count(array_: PEina_Array): cardinal;
function eina_array_find(array_: PEina_Array; data: Pointer; out_idx: PCardinal): TEina_Bool;
function eina_array_foreach(array_: PEina_Array; cb: TEina_Each_Cb; fdata: Pointer): TEina_Bool;
procedure eina_array_clean(array_: PEina_Array);

{$ENDIF read_interface}


{$IFDEF read_implementation}


function eina_array_push(array_: PEina_Array; data: Pointer): TEina_Bool;
begin
  if data = nil then begin
    Exit(EINA_FALSE);
  end;
  if (array_^.count + 1) > array_^.total then begin
    if not eina_array_grow(array_) then begin
      Exit(EINA_FALSE);
    end;
  end;
  array_^.data[array_^.count] := Pointer(data);
  Inc(array_^.count);
  Result := EINA_TRUE;
end;

function eina_array_pop(array_: PEina_Array): Pointer;
begin
  if array_^.count > 0 then begin
    Dec(array_^.count);
    Result := array_^.data[array_^.count];
  end else begin
    Result := nil;
  end;
end;

function eina_array_data_get(array_: PEina_Array; idx: cardinal): Pointer;
begin
  Result := array_^.data[idx];
end;

procedure eina_array_data_set(array_: PEina_Array; idx: cardinal; data: Pointer);
begin
  array_^.data[idx] := Pointer(data);
end;

function eina_array_count_get(array_: PEina_Array): cardinal;
begin
  Result := array_^.count;
end;

function eina_array_count(array_: PEina_Array): cardinal;
begin
  if array_ = nil then begin
    Result := 0;
  end else begin
    Result := array_^.count;
  end;
end;

function eina_array_find(array_: PEina_Array; data: Pointer; out_idx: PCardinal): TEina_Bool;
var
  i: cardinal;
begin
  if array_ = nil then begin
    Exit(EINA_FALSE);
  end;
  for i := 0 to array_^.count - 1 do begin
    if array_^.data[i] = data then begin
      if out_idx <> nil then begin
        out_idx^ := i;
      end;
      Exit(EINA_TRUE);
    end;
  end;
  Result := EINA_FALSE;
end;

function eina_array_foreach(array_: PEina_Array; cb: TEina_Each_Cb; fdata: Pointer): TEina_Bool;
var
  i: integer;
  data: Pointer;
begin
  Result := EINA_TRUE;
  for i := 0 to eina_array_count(array_) - 1 do begin
    data := array_^.data[i];
    if not cb(array_, data, fdata) then begin
      Result := EINA_FALSE;
      Break;
    end;
  end;
end;

procedure eina_array_clean(array_: PEina_Array);
begin
  array_^.count := 0;
end;

{$ENDIF read_implementation}
