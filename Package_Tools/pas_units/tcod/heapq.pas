unit heapq;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TCOD_HEAP_DEFAULT_CAPACITY = 256;
  TCOD_HEAP_MAX_NODE_SIZE = 256;

type
  TTCOD_HeapNode = record
    priority: longint;
    data: pbyte;
  end;
  PTCOD_HeapNode = ^TTCOD_HeapNode;

type
  TTCOD_Heap = record
    heap: PTCOD_HeapNode;
    size: longint;
    capacity: longint;
    node_size: Tsize_t;
    data_size: Tsize_t;
  end;
  PTCOD_Heap = ^TTCOD_Heap;

function TCOD_heap_init(heap: PTCOD_Heap; data_size: Tsize_t): longint; cdecl; external libtcod;
procedure TCOD_heap_uninit(heap: PTCOD_Heap); cdecl; external libtcod;
procedure TCOD_heap_clear(heap: PTCOD_Heap); cdecl; external libtcod;
function TCOD_minheap_push(minheap: PTCOD_Heap; priority: longint; data: pointer): longint; cdecl; external libtcod;
procedure TCOD_minheap_pop(minheap: PTCOD_Heap; out_: pointer); cdecl; external libtcod;
procedure TCOD_minheap_heapify(minheap: PTCOD_Heap); cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:49:21 ===


implementation



end.
