unit tree;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTCOD_tree_t = ^TTCOD_tree_t;
  TTCOD_tree_t = record
    next: PTCOD_tree_t;
    father: PTCOD_tree_t;
    sons: PTCOD_tree_t;
  end;

function TCOD_tree_new: PTCOD_tree_t; cdecl; external libtcod;
procedure TCOD_tree_add_son(node: PTCOD_tree_t; son: PTCOD_tree_t); cdecl; external libtcod;

// === Konventiert am: 10-9-25 14:10:26 ===


implementation



end.
