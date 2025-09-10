unit bsp;

interface

uses
  fp_tcod, tree, mersenne_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_bsp_t = record
    tree: TTCOD_tree_t;
    x: longint;
    y: longint;
    w: longint;
    h: longint;
    position: longint;
    level: Tuint8_t;
    horizontal: Tbool;
  end;
  PTCOD_bsp_t = ^TTCOD_bsp_t;

  TTCOD_bsp_callback_t = function(node: PTCOD_bsp_t; userData: pointer): Tbool; cdecl;

function TCOD_bsp_new: PTCOD_bsp_t; cdecl; external libtcod;
function TCOD_bsp_new_with_size(x: longint; y: longint; w: longint; h: longint): PTCOD_bsp_t; cdecl; external libtcod;
procedure TCOD_bsp_delete(node: PTCOD_bsp_t); cdecl; external libtcod;
function TCOD_bsp_left(node: PTCOD_bsp_t): PTCOD_bsp_t; cdecl; external libtcod;
function TCOD_bsp_right(node: PTCOD_bsp_t): PTCOD_bsp_t; cdecl; external libtcod;
function TCOD_bsp_father(node: PTCOD_bsp_t): PTCOD_bsp_t; cdecl; external libtcod;
function TCOD_bsp_is_leaf(node: PTCOD_bsp_t): Tbool; cdecl; external libtcod;
function TCOD_bsp_traverse_pre_order(node: PTCOD_bsp_t; listener: TTCOD_bsp_callback_t; userData: pointer): Tbool; cdecl; external libtcod;
function TCOD_bsp_traverse_in_order(node: PTCOD_bsp_t; listener: TTCOD_bsp_callback_t; userData: pointer): Tbool; cdecl; external libtcod;
function TCOD_bsp_traverse_post_order(node: PTCOD_bsp_t; listener: TTCOD_bsp_callback_t; userData: pointer): Tbool; cdecl; external libtcod;
function TCOD_bsp_traverse_level_order(node: PTCOD_bsp_t; listener: TTCOD_bsp_callback_t; userData: pointer): Tbool; cdecl; external libtcod;
function TCOD_bsp_traverse_inverted_level_order(node: PTCOD_bsp_t; listener: TTCOD_bsp_callback_t; userData: pointer): Tbool; cdecl; external libtcod;
function TCOD_bsp_contains(node: PTCOD_bsp_t; x: longint; y: longint): Tbool; cdecl; external libtcod;
function TCOD_bsp_find_node(node: PTCOD_bsp_t; x: longint; y: longint): PTCOD_bsp_t; cdecl; external libtcod;
procedure TCOD_bsp_resize(node: PTCOD_bsp_t; x: longint; y: longint; w: longint; h: longint); cdecl; external libtcod;
procedure TCOD_bsp_split_once(node: PTCOD_bsp_t; horizontal: Tbool; position: longint); cdecl; external libtcod;
procedure TCOD_bsp_split_recursive(node: PTCOD_bsp_t; randomizer: TTCOD_random_t; nb: longint; minHSize: longint; minVSize: longint;
  maxHRatio: single; maxVRatio: single); cdecl; external libtcod;
procedure TCOD_bsp_remove_sons(node: PTCOD_bsp_t); cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:48:44 ===


implementation



end.
