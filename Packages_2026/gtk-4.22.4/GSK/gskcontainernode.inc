{$IFDEF read_interface}


function gsk_container_node_get_type: TGType; cdecl; external libgtk4;
function gsk_container_node_new(children: PPGskRenderNode; n_children: Tguint): PGskRenderNode; cdecl; external libgtk4;
function gsk_container_node_get_n_children(node: PGskRenderNode): Tguint; cdecl; external libgtk4;
function gsk_container_node_get_child(node: PGskRenderNode; idx: Tguint): PGskRenderNode; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:28:59 ===

function GSK_TYPE_CONTAINER_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_CONTAINER_NODE: TGType;
begin
  GSK_TYPE_CONTAINER_NODE := gsk_container_node_get_type;
end;



{$ENDIF read_implementation}
