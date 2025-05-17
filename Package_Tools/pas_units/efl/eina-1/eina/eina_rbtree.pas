unit eina_rbtree;

interface

uses
  ctypes, efl, eina_iterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Rbtree_Color = ^TEina_Rbtree_Color;
  TEina_Rbtree_Color = longint;

const
  EINA_RBTREE_RED = 0;
  EINA_RBTREE_BLACK = 1;

type
  PEina_Rbtree_Direction = ^TEina_Rbtree_Direction;
  TEina_Rbtree_Direction = longint;

const
  EINA_RBTREE_LEFT = 0;
  EINA_RBTREE_RIGHT = 1;

type
  PEina_Rbtree = ^TEina_Rbtree;

  TEina_Rbtree = record
    son: array[0..1] of PEina_Rbtree;
    color: 0..1;
  end;

const
  bm_TEina_Rbtree_color = $1;
  bp_TEina_Rbtree_color = 0;

type
  TEina_Rbtree_Cmp_Node_Cb = function(left: PEina_Rbtree; right: PEina_Rbtree; data: pointer): TEina_Rbtree_Direction; cdecl;
  TEina_Rbtree_Cmp_Key_Cb = function(node: PEina_Rbtree; key: pointer; length: longint; data: pointer): longint; cdecl;
  TEina_Rbtree_Free_Cb = procedure(node: PEina_Rbtree; data: pointer); cdecl;

function eina_rbtree_inline_insert(root: PEina_Rbtree; node: PEina_Rbtree; cmp: TEina_Rbtree_Cmp_Node_Cb; data: pointer): PEina_Rbtree; cdecl; external libeina;
function eina_rbtree_inline_remove(root: PEina_Rbtree; node: PEina_Rbtree; cmp: TEina_Rbtree_Cmp_Node_Cb; data: pointer): PEina_Rbtree; cdecl; external libeina;
procedure eina_rbtree_delete(root: PEina_Rbtree; func: TEina_Rbtree_Free_Cb; data: pointer); cdecl; external libeina;
function eina_rbtree_iterator_prefix(root: PEina_Rbtree): PEina_Iterator; cdecl; external libeina;
function eina_rbtree_iterator_infix(root: PEina_Rbtree): PEina_Iterator; cdecl; external libeina;
function eina_rbtree_iterator_postfix(root: PEina_Rbtree): PEina_Iterator; cdecl; external libeina;

function EINA_RBTREE_CMP_NODE_CB(_Function: Pointer): TEina_Rbtree_Cmp_Node_Cb;
function EINA_RBTREE_CMP_KEY_CB(_Function: Pointer): TEina_Rbtree_Cmp_Key_Cb;
function EINA_RBTREE_FREE_CB(_Function: Pointer): TEina_Rbtree_Free_Cb;

// === Konventiert am: 17-5-25 15:33:55 ===


implementation


function EINA_RBTREE_CMP_NODE_CB(_Function: Pointer): TEina_Rbtree_Cmp_Node_Cb;
begin
  EINA_RBTREE_CMP_NODE_CB := TEina_Rbtree_Cmp_Node_Cb(_Function);
end;

function EINA_RBTREE_CMP_KEY_CB(_Function: Pointer): TEina_Rbtree_Cmp_Key_Cb;
begin
  EINA_RBTREE_CMP_KEY_CB := TEina_Rbtree_Cmp_Key_Cb(_Function);
end;

function EINA_RBTREE_FREE_CB(_Function: Pointer): TEina_Rbtree_Free_Cb;
begin
  EINA_RBTREE_FREE_CB := TEina_Rbtree_Free_Cb(_Function);
end;


end.
