unit gsklineargradientnode;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4, gsktypes, gskrendernode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gsk_linear_gradient_node_get_type: TGType; cdecl; external libgtk4;
function gsk_linear_gradient_node_new(bounds: Pgraphene_rect_t; start: Pgraphene_point_t; end_: Pgraphene_point_t; color_stops: PGskColorStop; n_color_stops: Tgsize): PGskRenderNode; cdecl; external libgtk4;
function gsk_linear_gradient_node_get_start(node: PGskRenderNode): Pgraphene_point_t; cdecl; external libgtk4;
function gsk_linear_gradient_node_get_end(node: PGskRenderNode): Pgraphene_point_t; cdecl; external libgtk4;
function gsk_linear_gradient_node_get_n_color_stops(node: PGskRenderNode): Tgsize; cdecl; external libgtk4;
function gsk_linear_gradient_node_get_color_stops(node: PGskRenderNode; n_stops: Pgsize): PGskColorStop; cdecl; external libgtk4;
function gsk_repeating_linear_gradient_node_get_type: TGType; cdecl; external libgtk4;
function gsk_repeating_linear_gradient_node_new(bounds: Pgraphene_rect_t; start: Pgraphene_point_t; end_: Pgraphene_point_t; color_stops: PGskColorStop; n_color_stops: Tgsize): PGskRenderNode; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:52 ===

function GSK_TYPE_LINEAR_GRADIENT_NODE: TGType;
function GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE: TGType;

implementation

function GSK_TYPE_LINEAR_GRADIENT_NODE: TGType;
begin
  GSK_TYPE_LINEAR_GRADIENT_NODE := gsk_linear_gradient_node_get_type;
end;


function GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE: TGType;
begin
  GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE := gsk_repeating_linear_gradient_node_get_type;
end;


end.
