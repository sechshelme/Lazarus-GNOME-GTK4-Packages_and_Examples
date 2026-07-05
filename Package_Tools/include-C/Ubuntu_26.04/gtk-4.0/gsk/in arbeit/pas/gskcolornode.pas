unit gskcolornode;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_color_node_get_type: TGType; cdecl; external libgtk4;
function gsk_color_node_new(rgba: PGdkRGBA; bounds: Pgraphene_rect_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_color_node_get_color(node: PGskRenderNode): PGdkRGBA; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:08:18 ===

function GSK_TYPE_COLOR_NODE: TGType;

implementation

function GSK_TYPE_COLOR_NODE: TGType;
begin
  GSK_TYPE_COLOR_NODE := gsk_color_node_get_type;
end;



end.
