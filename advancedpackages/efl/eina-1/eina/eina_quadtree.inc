{$IFDEF read_interface}

type
  PEina_Quad_Direction = ^TEina_Quad_Direction;
  TEina_Quad_Direction = longint;

const
  EINA_QUAD_LEFT = 0;
  EINA_QUAD_RIGHT = 1;
  EINA_QUAD_BOTH = 2;

type
  TEina_Quad_Callback = function(obj: pointer; middle: Tsize_t): TEina_Quad_Direction; cdecl;

  TEina_QuadTree = record
  end;
  PEina_QuadTree = ^TEina_QuadTree;

  TEina_QuadTree_Item = record
  end;
  PEina_QuadTree_Item = ^TEina_QuadTree_Item;

function eina_quadtree_new(w: Tsize_t; h: Tsize_t; vertical: TEina_Quad_Callback; horizontal: TEina_Quad_Callback): PEina_QuadTree; cdecl; external libeina;
procedure eina_quadtree_free(q: PEina_QuadTree); cdecl; external libeina;
procedure eina_quadtree_resize(q: PEina_QuadTree; w: Tsize_t; h: Tsize_t); cdecl; external libeina;
procedure eina_quadtree_cycle(q: PEina_QuadTree); cdecl; external libeina;
procedure eina_quadtree_increase(obj: PEina_QuadTree_Item); cdecl; external libeina;
function eina_quadtree_add(q: PEina_QuadTree; obj: pointer): PEina_QuadTree_Item; cdecl; external libeina;
function eina_quadtree_del(obj: PEina_QuadTree_Item): TEina_Bool; cdecl; external libeina;
function eina_quadtree_change(obj: PEina_QuadTree_Item): TEina_Bool; cdecl; external libeina;
function eina_quadtree_hide(obj: PEina_QuadTree_Item): TEina_Bool; cdecl; external libeina;
function eina_quadtree_show(obj: PEina_QuadTree_Item): TEina_Bool; cdecl; external libeina;
function eina_quadtree_collide(q: PEina_QuadTree; x: longint; y: longint; w: longint; h: longint): PEina_Inlist; cdecl; external libeina;
function eina_quadtree_object(list: PEina_Inlist): pointer; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:00:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
