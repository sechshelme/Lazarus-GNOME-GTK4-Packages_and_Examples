{$IFDEF read_interface}


function gsk_inset_shadow_node_get_type: TGType; cdecl; external libgtk4;
function gsk_inset_shadow_node_new(outline: PGskRoundedRect; color: PGdkRGBA; dx: single; dy: single; spread: single;
  blur_radius: single): PGskRenderNode; cdecl; external libgtk4;
function gsk_inset_shadow_node_get_outline(node: PGskRenderNode): PGskRoundedRect; cdecl; external libgtk4;
function gsk_inset_shadow_node_get_color(node: PGskRenderNode): PGdkRGBA; cdecl; external libgtk4;
function gsk_inset_shadow_node_get_dx(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_inset_shadow_node_get_dy(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_inset_shadow_node_get_spread(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_inset_shadow_node_get_blur_radius(node: PGskRenderNode): single; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:32:03 ===

function GSK_TYPE_INSET_SHADOW_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_INSET_SHADOW_NODE: TGType;
begin
  GSK_TYPE_INSET_SHADOW_NODE := gsk_inset_shadow_node_get_type;
end;



{$ENDIF read_implementation}
