{$IFDEF read_interface}

function eina_rbtree_inline_lookup(root: PEina_Rbtree; key: Pointer; length: integer; cmp: TEina_Rbtree_Cmp_Key_Cb; data: Pointer): PEina_Rbtree;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_rbtree_inline_lookup(root: PEina_Rbtree; key: Pointer; length: integer; cmp: TEina_Rbtree_Cmp_Key_Cb; data: Pointer): PEina_Rbtree;
var
  current: PEina_Rbtree;
  result_cmp: integer;
begin
  current := root;
  while current <> nil do begin
    result_cmp := cmp(current, key, length, Pointer(data));
    if result_cmp <> 0 then begin
//      current := current^.son[Ord(result_cmp < 0)];
    end else begin
      Break;
    end;
  end;
  Result := current;
end;

{$ENDIF read_implementation}
