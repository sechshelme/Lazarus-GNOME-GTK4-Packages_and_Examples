{$IFDEF read_interface}


function gsk_conic_gradient_node_get_type: TGType; cdecl; external libgtk4;
function gsk_conic_gradient_node_new(bounds: Pgraphene_rect_t; center: Pgraphene_point_t; rotation: single; color_stops: PGskColorStop; n_color_stops: Tgsize): PGskRenderNode; cdecl; external libgtk4;
function gsk_conic_gradient_node_get_center(node: PGskRenderNode): Pgraphene_point_t; cdecl; external libgtk4;
function gsk_conic_gradient_node_get_rotation(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_conic_gradient_node_get_angle(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_conic_gradient_node_get_n_color_stops(node: PGskRenderNode): Tgsize; cdecl; external libgtk4;
function gsk_conic_gradient_node_get_color_stops(node: PGskRenderNode; n_stops: Pgsize): PGskColorStop; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:29:04 ===

function GSK_TYPE_CONIC_GRADIENT_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_CONIC_GRADIENT_NODE: TGType;
begin
  GSK_TYPE_CONIC_GRADIENT_NODE := gsk_conic_gradient_node_get_type;
end;



{$ENDIF read_implementation}
