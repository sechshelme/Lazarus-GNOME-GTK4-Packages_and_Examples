{$IFDEF read_interface}


function gsk_blur_node_get_type: TGType; cdecl; external libgtk4;
function gsk_blur_node_new(child: PGskRenderNode; radius: single): PGskRenderNode; cdecl; external libgtk4;
function gsk_blur_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_blur_node_get_radius(node: PGskRenderNode): single; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:09:41 ===

function GSK_TYPE_BLUR_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_BLUR_NODE: TGType;
begin
  GSK_TYPE_BLUR_NODE := gsk_blur_node_get_type;
end;



{$ENDIF read_implementation}
