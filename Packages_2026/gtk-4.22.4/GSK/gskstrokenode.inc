{$IFDEF read_interface}


function gsk_stroke_node_get_type: TGType; cdecl; external libgtk4;
function gsk_stroke_node_new(child: PGskRenderNode; path: PGskPath; stroke: PGskStroke): PGskRenderNode; cdecl; external libgtk4;
function gsk_stroke_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_stroke_node_get_path(node: PGskRenderNode): PGskPath; cdecl; external libgtk4;
function gsk_stroke_node_get_stroke(node: PGskRenderNode): PGskStroke; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:39:10 ===

function GSK_TYPE_STROKE_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_STROKE_NODE: TGType;
begin
  GSK_TYPE_STROKE_NODE := gsk_stroke_node_get_type;
end;



{$ENDIF read_implementation}
