unit pathfinder;

interface

uses
  fp_tcod, heapq;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TCOD_PATHFINDER_MAX_DIMENSIONS = 4;

type
  TTCOD_ArrayData = record
    ndim: Tint8_t;
    int_type: longint;
    shape: array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS + 1) - 1] of Tsize_t;
    strides: array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS + 1) - 1] of Tsize_t;
    data: pbyte;
  end;
  PTCOD_ArrayData = ^TTCOD_ArrayData;

  TTCOD_BasicGraph2D = record
    cost: TTCOD_ArrayData;
    cardinal: longint;
    diagonal: longint;
  end;
  PTCOD_BasicGraph2D = ^TTCOD_BasicGraph2D;

  TTCOD_Pathfinder = record
    ndim: Tint8_t;
    shape: array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS) - 1] of Tsize_t;
    owns_distance: Tbool;
    owns_graph: Tbool;
    owns_traversal: Tbool;
    distance: TTCOD_ArrayData;
    graph: TTCOD_BasicGraph2D;
    traversal: TTCOD_ArrayData;
    heap: TTCOD_Heap;
  end;
  PTCOD_Pathfinder = ^TTCOD_Pathfinder;

function TCOD_pf_new(ndim: longint; shape: Psize_t): PTCOD_Pathfinder; cdecl; external libtcod;
procedure TCOD_pf_delete(path: PTCOD_Pathfinder); cdecl; external libtcod;
procedure TCOD_pf_set_distance_pointer(path: PTCOD_Pathfinder; data: pointer; int_type: longint; strides: Psize_t); cdecl; external libtcod;
procedure TCOD_pf_set_graph2d_pointer(path: PTCOD_Pathfinder; data: pointer; int_type: longint; strides: Psize_t; cardinal: longint;
  diagonal: longint); cdecl; external libtcod;
procedure TCOD_pf_set_traversal_pointer(path: PTCOD_Pathfinder; data: pointer; int_type: longint; strides: Psize_t); cdecl; external libtcod;
function TCOD_pf_recompile(path: PTCOD_Pathfinder): longint; cdecl; external libtcod;
function TCOD_pf_compute(path: PTCOD_Pathfinder): longint; cdecl; external libtcod;
function TCOD_pf_compute_step(path: PTCOD_Pathfinder): longint; cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:54:02 ===


implementation



end.
