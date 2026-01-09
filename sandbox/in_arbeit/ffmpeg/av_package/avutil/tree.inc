{$IFDEF read_interface}


type
  PAVTreeNode = type Pointer;
  PPAVTreeNode = ^PAVTreeNode;

var
  av_tree_node_size: longint; cvar;external libavutil;

type
  TCompareFunc = function(key, b: pointer): longint; cdecl;
  TEnumFunc = function(opaque, elem: pointer): longint; cdecl;

function av_tree_node_alloc: PAVTreeNode; cdecl; external libavutil;
function av_tree_find(root: PAVTreeNode; key: pointer; cmp: TCompareFunc; next: PPointer): pointer; cdecl; external libavutil;
function av_tree_insert(rootp: PPAVTreeNode; key: pointer; cmp: TCompareFunc; next: PPAVTreeNode): pointer; cdecl; external libavutil;
procedure av_tree_destroy(t: PAVTreeNode); cdecl; external libavutil;
procedure av_tree_enumerate(t: PAVTreeNode; opaque: pointer; cmp: TCompareFunc; enu: TEnumFunc); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
