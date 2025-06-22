{$IFDEF read_interface}

procedure eina_trash_init(trash: PPEina_Trash);
procedure eina_trash_push(trash: PPEina_Trash; data: Pointer);
function eina_trash_pop(trash: PPEina_Trash): Pointer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure eina_trash_init(trash: PPEina_Trash);
begin
  trash^ := nil;
end;

procedure eina_trash_push(trash: PPEina_Trash; data: Pointer);
var
  tmp: PEina_Trash;
begin
  tmp := PEina_Trash(data);
  tmp^.next := trash^;
  trash^ := tmp;
end;

function eina_trash_pop(trash: PPEina_Trash): Pointer;
var
  tmp: Pointer;
begin
  tmp := trash^;
  if trash^ <> nil then begin
    trash^ := trash^^.next;
  end;
  Result := tmp;
end;

{$ENDIF read_implementation}
