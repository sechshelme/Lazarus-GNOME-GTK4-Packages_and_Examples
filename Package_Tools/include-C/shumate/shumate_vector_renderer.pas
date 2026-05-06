unit shumate_vector_renderer;

interface

uses
  fp_GTK4, fp_gdk_pixbuf2, fp_glib2, fp_shumate, shumate_map_source,shumate_vector_sprite_sheet,shumate_data_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateVectorRenderer = record
  end;
  PShumateVectorRenderer = ^TShumateVectorRenderer;

  TShumateVectorRendererClass = record
    parent_class: TShumateMapSourceClass;
  end;
  PShumateVectorRendererClass = ^TShumateVectorRendererClass;

function shumate_vector_renderer_get_type: TGType; cdecl; external libshumate;
function shumate_vector_renderer_is_supported: Tgboolean; cdecl; external libshumate;
function shumate_vector_renderer_new(id: pchar; style_json: pchar; error: PPGError): PShumateVectorRenderer; cdecl; external libshumate;
function shumate_vector_renderer_set_sprite_sheet_data(self: PShumateVectorRenderer; sprites_pixbuf: PGdkPixbuf; sprites_json: pchar; error: PPGError): Tgboolean; cdecl; external libshumate;
function shumate_vector_renderer_get_sprite_sheet(self: PShumateVectorRenderer): PShumateVectorSpriteSheet; cdecl; external libshumate;
procedure shumate_vector_renderer_set_sprite_sheet(self: PShumateVectorRenderer; sprites: PShumateVectorSpriteSheet); cdecl; external libshumate;
procedure shumate_vector_renderer_set_data_source(self: PShumateVectorRenderer; name: pchar; data_source: PShumateDataSource); cdecl; external libshumate;

function shumate_style_error_quark: TGQuark; cdecl; external libshumate;

type
  PShumateStyleError = ^TShumateStyleError;
  TShumateStyleError = longint;

const
  SHUMATE_STYLE_ERROR_FAILED = 0;
  SHUMATE_STYLE_ERROR_MALFORMED_STYLE = 1;
  SHUMATE_STYLE_ERROR_UNSUPPORTED_LAYER = 2;
  SHUMATE_STYLE_ERROR_INVALID_EXPRESSION = 3;
  SHUMATE_STYLE_ERROR_SUPPORT_OMITTED = 4;
  SHUMATE_STYLE_ERROR_UNSUPPORTED = 5;

function SHUMATE_STYLE_ERROR: TGQuark;

// === Konventiert am: 6-5-26 15:48:03 ===

function SHUMATE_TYPE_VECTOR_RENDERER: TGType;
function SHUMATE_VECTOR_RENDERER(obj: Pointer): PShumateVectorRenderer;
function SHUMATE_IS_VECTOR_RENDERER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_VECTOR_RENDERER: TGType;
begin
  Result := shumate_vector_renderer_get_type;
end;

function SHUMATE_VECTOR_RENDERER(obj: Pointer): PShumateVectorRenderer;
begin
  Result := PShumateVectorRenderer(g_type_check_instance_cast(obj, SHUMATE_TYPE_VECTOR_RENDERER));
end;

function SHUMATE_IS_VECTOR_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_VECTOR_RENDERER);
end;


function SHUMATE_STYLE_ERROR: TGQuark;
begin
  SHUMATE_STYLE_ERROR := shumate_style_error_quark;
end;


end.
