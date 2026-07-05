{$IFDEF read_interface}



function gsk_radial_gradient_node_get_type: TGType; cdecl; external libgtk4;
function gsk_radial_gradient_node_new(bounds: Pgraphene_rect_t; center: Pgraphene_point_t; hradius: single; vradius: single; start: single;
  end_: single; color_stops: PGskColorStop; n_color_stops: Tgsize): PGskRenderNode; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_n_color_stops(node: PGskRenderNode): Tgsize; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_color_stops(node: PGskRenderNode; n_stops: Pgsize): PGskColorStop; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_center(node: PGskRenderNode): Pgraphene_point_t; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_hradius(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_vradius(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_start(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_radial_gradient_node_get_end(node: PGskRenderNode): single; cdecl; external libgtk4;
function gsk_repeating_radial_gradient_node_get_type: TGType; cdecl; external libgtk4;
function gsk_repeating_radial_gradient_node_new(bounds: Pgraphene_rect_t; center: Pgraphene_point_t; hradius: single; vradius: single; start: single;
  end_: single; color_stops: PGskColorStop; n_color_stops: Tgsize): PGskRenderNode; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:36:52 ===

function GSK_TYPE_RADIAL_GRADIENT_NODE: TGType;
function GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_RADIAL_GRADIENT_NODE: TGType;
begin
  GSK_TYPE_RADIAL_GRADIENT_NODE := gsk_radial_gradient_node_get_type;
end;


function GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE: TGType;
begin
  GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE := gsk_repeating_radial_gradient_node_get_type;
end;


{$ENDIF read_implementation}
