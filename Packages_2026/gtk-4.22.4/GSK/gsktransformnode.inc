{$IFDEF read_interface}


function gsk_transform_node_get_type: TGType; cdecl; external libgtk4;
function gsk_transform_node_new(child: PGskRenderNode; transform: PGskTransform): PGskRenderNode; cdecl; external libgtk4;
function gsk_transform_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_transform_node_get_transform(node: PGskRenderNode): PGskTransform; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:38:47 ===

function GSK_TYPE_TRANSFORM_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_TRANSFORM_NODE: TGType;
begin
  GSK_TYPE_TRANSFORM_NODE := gsk_transform_node_get_type;
end;



{$ENDIF read_implementation}
