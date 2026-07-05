unit gsktextnode;

interface

uses
  fp_glib2, fp_graphene, fp_pango, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_text_node_get_type: TGType; cdecl; external libgtk4;
function gsk_text_node_new(font: PPangoFont; glyphs: PPangoGlyphString; color: PGdkRGBA; offset: Pgraphene_point_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_text_node_get_font(node: PGskRenderNode): PPangoFont; cdecl; external libgtk4;
function gsk_text_node_has_color_glyphs(node: PGskRenderNode): Tgboolean; cdecl; external libgtk4;
function gsk_text_node_get_num_glyphs(node: PGskRenderNode): Tguint; cdecl; external libgtk4;
function gsk_text_node_get_glyphs(node: PGskRenderNode; n_glyphs: Pguint): PPangoGlyphInfo; cdecl; external libgtk4;
function gsk_text_node_get_color(node: PGskRenderNode): PGdkRGBA; cdecl; external libgtk4;
function gsk_text_node_get_offset(node: PGskRenderNode): Pgraphene_point_t; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:39:03 ===

function GSK_TYPE_TEXT_NODE: TGType;

implementation

function GSK_TYPE_TEXT_NODE: TGType;
begin
  GSK_TYPE_TEXT_NODE := gsk_text_node_get_type;
end;



end.
