
{$IFDEF read_interface}

type
  PPangoRenderPart = ^TPangoRenderPart;
  TPangoRenderPart = longint;

const
  PANGO_RENDER_PART_FOREGROUND = 0;
  PANGO_RENDER_PART_BACKGROUND = 1;
  PANGO_RENDER_PART_UNDERLINE = 2;
  PANGO_RENDER_PART_STRIKETHROUGH = 3;
  PANGO_RENDER_PART_OVERLINE = 4;

type
  TPangoRendererPrivate = record
  end;
  PPangoRendererPrivate = ^TPangoRendererPrivate;

  TPangoRenderer = record
    parent_instance: TGObject;
    underline: TPangoUnderline;
    strikethrough: Tgboolean;
    active_count: longint;
    matrix: PPangoMatrix;
    priv: PPangoRendererPrivate;
  end;
  PPangoRenderer = ^TPangoRenderer;

  TPangoRendererClass = record
    parent_class: TGObjectClass;
    draw_glyphs: procedure(renderer: PPangoRenderer; font: PPangoFont; glyphs: PPangoGlyphString; x: longint; y: longint); cdecl;
    draw_rectangle: procedure(renderer: PPangoRenderer; part: TPangoRenderPart; x: longint; y: longint; Width: longint;
      Height: longint); cdecl;
    draw_error_underline: procedure(renderer: PPangoRenderer; x: longint; y: longint; Width: longint; Height: longint); cdecl;
    draw_shape: procedure(renderer: PPangoRenderer; attr: PPangoAttrShape; x: longint; y: longint); cdecl;
    draw_trapezoid: procedure(renderer: PPangoRenderer; part: TPangoRenderPart; y1_: Tdouble; x11: Tdouble; x21: Tdouble;
      y2: Tdouble; x12: Tdouble; x22: Tdouble); cdecl;
    draw_glyph: procedure(renderer: PPangoRenderer; font: PPangoFont; glyph: TPangoGlyph; x: Tdouble; y: Tdouble); cdecl;
    part_changed: procedure(renderer: PPangoRenderer; part: TPangoRenderPart); cdecl;
    begin_: procedure(renderer: PPangoRenderer); cdecl;
    end_: procedure(renderer: PPangoRenderer); cdecl;
    prepare_run: procedure(renderer: PPangoRenderer; run: PPangoLayoutRun); cdecl;
    draw_glyph_item: procedure(renderer: PPangoRenderer; Text: pchar; glyph_item: PPangoGlyphItem; x: longint; y: longint); cdecl;
    _pango_reserved2: procedure; cdecl;
    _pango_reserved3: procedure; cdecl;
    _pango_reserved4: procedure; cdecl;
  end;
  PPangoRendererClass = ^TPangoRendererClass;


function pango_renderer_get_type: TGType; cdecl; external libpango;
procedure pango_renderer_draw_layout(renderer: PPangoRenderer; layout: PPangoLayout; x: longint; y: longint); cdecl; external libpango;
procedure pango_renderer_draw_layout_line(renderer: PPangoRenderer; line: PPangoLayoutLine; x: longint; y: longint); cdecl; external libpango;
procedure pango_renderer_draw_glyphs(renderer: PPangoRenderer; font: PPangoFont; glyphs: PPangoGlyphString; x: longint; y: longint); cdecl; external libpango;
procedure pango_renderer_draw_glyph_item(renderer: PPangoRenderer; Text: pchar; glyph_item: PPangoGlyphItem; x: longint; y: longint); cdecl; external libpango;
procedure pango_renderer_draw_rectangle(renderer: PPangoRenderer; part: TPangoRenderPart; x: longint; y: longint; Width: longint;
  Height: longint); cdecl; external libpango;
procedure pango_renderer_draw_error_underline(renderer: PPangoRenderer; x: longint; y: longint; Width: longint; Height: longint); cdecl; external libpango;
procedure pango_renderer_draw_trapezoid(renderer: PPangoRenderer; part: TPangoRenderPart; y1_: Tdouble; x11: Tdouble; x21: Tdouble;
  y2: Tdouble; x12: Tdouble; x22: Tdouble); cdecl; external libpango;
procedure pango_renderer_draw_glyph(renderer: PPangoRenderer; font: PPangoFont; glyph: TPangoGlyph; x: Tdouble; y: Tdouble); cdecl; external libpango;
procedure pango_renderer_activate(renderer: PPangoRenderer); cdecl; external libpango;
procedure pango_renderer_deactivate(renderer: PPangoRenderer); cdecl; external libpango;
procedure pango_renderer_part_changed(renderer: PPangoRenderer; part: TPangoRenderPart); cdecl; external libpango;
procedure pango_renderer_set_color(renderer: PPangoRenderer; part: TPangoRenderPart; color: PPangoColor); cdecl; external libpango;
function pango_renderer_get_color(renderer: PPangoRenderer; part: TPangoRenderPart): PPangoColor; cdecl; external libpango;
procedure pango_renderer_set_alpha(renderer: PPangoRenderer; part: TPangoRenderPart; alpha: Tguint16); cdecl; external libpango;
function pango_renderer_get_alpha(renderer: PPangoRenderer; part: TPangoRenderPart): Tguint16; cdecl; external libpango;
procedure pango_renderer_set_matrix(renderer: PPangoRenderer; matrix: PPangoMatrix); cdecl; external libpango;
function pango_renderer_get_matrix(renderer: PPangoRenderer): PPangoMatrix; cdecl; external libpango;
function pango_renderer_get_layout(renderer: PPangoRenderer): PPangoLayout; cdecl; external libpango;
function pango_renderer_get_layout_line(renderer: PPangoRenderer): PPangoLayoutLine; cdecl; external libpango;

function PANGO_TYPE_RENDERER: TGType;
function PANGO_RENDERER(obj: Pointer): PPangoRenderer;
function PANGO_RENDERER_CLASS(klass: Pointer): PPangoRendererClass;
function PANGO_IS_RENDERER(obj: Pointer): Tgboolean;
function PANGO_IS_RENDERER_CLASS(klass: Pointer): Tgboolean;
function PANGO_RENDERER_GET_CLASS(obj: Pointer): PPangoRendererClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_RENDERER: TGType;
begin
  PANGO_TYPE_RENDERER := pango_renderer_get_type;
end;

function PANGO_RENDERER(obj: Pointer): PPangoRenderer;
begin
  Result := PPangoRenderer(g_type_check_instance_cast(obj, PANGO_TYPE_RENDERER));
end;

function PANGO_RENDERER_CLASS(klass: Pointer): PPangoRendererClass;
begin
  Result := PPangoRendererClass(g_type_check_class_cast(klass, PANGO_TYPE_RENDERER));
end;

function PANGO_IS_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_RENDERER);
end;

function PANGO_IS_RENDERER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_RENDERER);
end;

function PANGO_RENDERER_GET_CLASS(obj: Pointer): PPangoRendererClass;
begin
  Result := PPangoRendererClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
