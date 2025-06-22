{$IFDEF read_interface}

function eina_list_last(list: PEina_List): PEina_List;
function eina_list_next(list: PEina_List): PEina_List;
function eina_list_prev(list: PEina_List): PEina_List;
function eina_list_data_get(list: PEina_List): Pointer;
function eina_list_data_set(list: PEina_List; data: Pointer): Pointer;
function eina_list_count(list: PEina_List): DWord;
function eina_list_last_data_get(list: PEina_List): Pointer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_list_last(list: PEina_List): PEina_List;
begin
  if (list <> nil) then begin
    Result := list^.accounting^.last;
  end else begin
    Result := nil;
  end;
end;

function eina_list_next(list: PEina_List): PEina_List;
begin
  if (list <> nil) then begin
    Result := list^.next;
  end else begin
    Result := nil;
  end;
end;

function eina_list_prev(list: PEina_List): PEina_List;
begin
  if (list <> nil) then begin
    Result := list^.prev;
  end else begin
    Result := nil;
  end;
end;

function eina_list_data_get(list: PEina_List): Pointer;
begin
  if (list <> nil) then begin
    Result := list^.data;
  end else begin
    Result := nil;
  end;
end;

function eina_list_data_set(list: PEina_List; data: Pointer): Pointer;
var
  tmp: Pointer;
begin
  if (list <> nil) then begin
    tmp := list^.data;
    list^.data := data;
    Result := tmp;
  end else begin
    Result := nil;
  end;
end;

function eina_list_count(list: PEina_List): DWord;
begin
  if (list <> nil) then begin
    Result := list^.accounting^.count;
  end else begin
    Result := 0;
  end;
end;

function eina_list_last_data_get(list: PEina_List): Pointer;
begin
  if (list <> nil) then begin
    Result := eina_list_data_get(eina_list_last(list));
  end else begin
    Result := nil;
  end;
end;

{$ENDIF read_implementation}
