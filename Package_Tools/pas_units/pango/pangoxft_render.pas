unit pangoxft_render;

interface

uses
  fp_cairo, fp_glib2, pango_renderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TPangoXftRenderer = record
    parent_instance: TPangoRenderer;
    display: PDisplay;
    screen: longint;
    draw: PXftDraw;
    priv: PPangoXftRendererPrivate;
  end;
  PPangoXftRenderer = ^TPangoXftRenderer;

  TPangoXftRendererClass = record
    parent_class: TPangoRendererClass;
    composite_trapezoids: procedure(xftrenderer: PPangoXftRenderer; part: TPangoRenderPart; trapezoids: PXTrapezoid; n_trapezoids: longint); cdecl;
    composite_glyphs: procedure(xftrenderer: PPangoXftRenderer; xft_font: PXftFont; glyphs: PXftGlyphSpec; n_glyphs: longint); cdecl;
  end;
  PPangoXftRendererClass = ^TPangoXftRendererClass;

function pango_xft_renderer_get_type: TGType; cdecl; external libpango;
function pango_xft_renderer_new(display: PDisplay; screen: longint): PPangoRenderer; cdecl; external libpango;
procedure pango_xft_renderer_set_draw(xftrenderer: PPangoXftRenderer; draw: PXftDraw); cdecl; external libpango;
procedure pango_xft_renderer_set_default_color(xftrenderer: PPangoXftRenderer; default_color: PPangoColor); cdecl; external libpango;
procedure pango_xft_render(draw: PXftDraw; color: PXftColor; font: PPangoFont; glyphs: PPangoGlyphString; x: Tgint;
  y: Tgint); cdecl; external libpango;
procedure pango_xft_picture_render(display: PDisplay; src_picture: TPicture; dest_picture: TPicture; font: PPangoFont; glyphs: PPangoGlyphString;
  x: Tgint; y: Tgint); cdecl; external libpango;
procedure pango_xft_render_transformed(draw: PXftDraw; color: PXftColor; matrix: PPangoMatrix; font: PPangoFont; glyphs: PPangoGlyphString;
  x: longint; y: longint); cdecl; external libpango;
procedure pango_xft_render_layout_line(draw: PXftDraw; color: PXftColor; line: PPangoLayoutLine; x: longint; y: longint); cdecl; external libpango;
procedure pango_xft_render_layout(draw: PXftDraw; color: PXftColor; layout: PPangoLayout; x: longint; y: longint); cdecl; external libpango;

// === Konventiert am: 26-11-24 13:58:46 ===

function PANGO_TYPE_XFT_RENDERER: TGType;
function PANGO_XFT_RENDERER(obj: Pointer): PPangoXftRenderer;
function PANGO_XFT_RENDERER_CLASS(klass: Pointer): PPangoXftRendererClass;
function PANGO_IS_XFT_RENDERER(obj: Pointer): Tgboolean;
function PANGO_IS_XFT_RENDERER_CLASS(klass: Pointer): Tgboolean;
function PANGO_XFT_RENDERER_GET_CLASS(obj: Pointer): PPangoXftRendererClass;

implementation

function PANGO_TYPE_XFT_RENDERER: TGType;
begin
  PANGO_TYPE_XFT_RENDERER := pango_xft_renderer_get_type;
end;

function PANGO_XFT_RENDERER(obj: Pointer): PPangoXftRenderer;
begin
  Result := PPangoXftRenderer(g_type_check_instance_cast(obj, PANGO_TYPE_XFT_RENDERER));
end;

function PANGO_XFT_RENDERER_CLASS(klass: Pointer): PPangoXftRendererClass;
begin
  Result := PPangoXftRendererClass(g_type_check_class_cast(klass, PANGO_TYPE_XFT_RENDERER));
end;

function PANGO_IS_XFT_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_XFT_RENDERER);
end;

function PANGO_IS_XFT_RENDERER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_XFT_RENDERER);
end;

function PANGO_XFT_RENDERER_GET_CLASS(obj: Pointer): PPangoXftRendererClass;
begin
  Result := PPangoXftRendererClass(PGTypeInstance(obj)^.g_class);
end;



end.
