unit eina_inline_rbtree;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_rbtree_inline_lookup(root: PEina_Rbtree; key: Pointer; length: integer; cmp: TEina_Rbtree_Cmp_Key_Cb; data: Pointer): PEina_Rbtree;

implementation

function eina_rbtree_inline_lookup(root: PEina_Rbtree; key: Pointer; length: integer; cmp: TEina_Rbtree_Cmp_Key_Cb; data: Pointer): PEina_Rbtree;
var
  current: PEina_Rbtree;
  result_cmp: integer;
begin
  current := root;
  while current <> nil do begin
    result_cmp := cmp(current, key, length, Pointer(data));
    if result_cmp <> 0 then begin
      current := current^.son[Ord(result_cmp < 0)];
    end else begin
      Break;
    end;
  end;
  Result := current;
end;

end.
