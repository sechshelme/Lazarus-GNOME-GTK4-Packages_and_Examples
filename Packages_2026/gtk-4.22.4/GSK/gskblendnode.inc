{$IFDEF read_interface}


function gsk_blend_node_get_type: TGType; cdecl; external libgtk4;
function gsk_blend_node_new(bottom: PGskRenderNode; top: PGskRenderNode; blend_mode: TGskBlendMode): PGskRenderNode; cdecl; external libgtk4;
function gsk_blend_node_get_bottom_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_blend_node_get_top_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_blend_node_get_blend_mode(node: PGskRenderNode): TGskBlendMode; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:09:45 ===

function GSK_TYPE_BLEND_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_BLEND_NODE: TGType;
begin
  GSK_TYPE_BLEND_NODE := gsk_blend_node_get_type;
end;



{$ENDIF read_implementation}
