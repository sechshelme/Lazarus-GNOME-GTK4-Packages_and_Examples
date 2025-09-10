{$IFDEF read_interface}



type
  TTCOD_Frontier = record
    ndim: Tint8_t;
    active_dist: longint;
    active_index: array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS) - 1] of longint;
    heap: TTCOD_Heap;
  end;
  PTCOD_Frontier = ^TTCOD_Frontier;

function TCOD_frontier_new(ndim: longint): PTCOD_Frontier; cdecl; external libtcod;
procedure TCOD_frontier_delete(frontier: PTCOD_Frontier); cdecl; external libtcod;
function TCOD_frontier_pop(frontier: PTCOD_Frontier): TTCOD_Error; cdecl; external libtcod;
function TCOD_frontier_push(frontier: PTCOD_Frontier; index: Plongint; dist: longint; heuristic: longint): TTCOD_Error; cdecl; external libtcod;
function TCOD_frontier_size(frontier: PTCOD_Frontier): longint; cdecl; external libtcod;
function TCOD_frontier_clear(frontier: PTCOD_Frontier): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:54:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
