unit gskcaironode;

interface

uses
  fp_glib2, fp_graphene, fp_cairo, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_cairo_node_get_type: TGType; cdecl; external libgtk4;
function gsk_cairo_node_new(bounds: Pgraphene_rect_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_cairo_node_get_draw_context(node: PGskRenderNode): Pcairo_t; cdecl; external libgtk4;
function gsk_cairo_node_get_surface(node: PGskRenderNode): Pcairo_surface_t; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:09:33 ===

function GSK_TYPE_CAIRO_NODE: TGType;

implementation

function GSK_TYPE_CAIRO_NODE: TGType;
begin
  GSK_TYPE_CAIRO_NODE := gsk_cairo_node_get_type;
end;



end.
