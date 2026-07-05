{$IFDEF read_interface}


function gsk_copy_node_get_type: TGType; cdecl; external libgtk4;
function gsk_copy_node_new(child: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_copy_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:28:54 ===

function GSK_TYPE_COPY_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_COPY_NODE: TGType;
begin
  GSK_TYPE_COPY_NODE := gsk_copy_node_get_type;
end;



{$ENDIF read_implementation}
