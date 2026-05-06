unit shumate_raster_renderer;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_map_source, shumate_data_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateRasterRenderer = record
  end;
  PShumateRasterRenderer = ^TShumateRasterRenderer;

  TShumateRasterRendererClass = record
    parent_class: TShumateMapSourceClass;
  end;
  PShumateRasterRendererClass = ^TShumateRasterRendererClass;

function shumate_raster_renderer_get_type: TGType; cdecl; external libshumate;
function shumate_raster_renderer_new(data_source: PShumateDataSource): PShumateRasterRenderer; cdecl; external libshumate;
function shumate_raster_renderer_new_from_url(url_template: pchar): PShumateRasterRenderer; cdecl; external libshumate;
function shumate_raster_renderer_new_full(id: pchar; name: pchar; license: pchar; license_uri: pchar; min_zoom: Tguint;
  max_zoom: Tguint; tile_size: Tguint; projection: TShumateMapProjection; data_source: PShumateDataSource): PShumateRasterRenderer; cdecl; external libshumate;
function shumate_raster_renderer_new_full_from_url(id: pchar; name: pchar; license: pchar; license_uri: pchar; min_zoom: Tguint;
  max_zoom: Tguint; tile_size: Tguint; projection: TShumateMapProjection; url_template: pchar): PShumateRasterRenderer; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:46 ===

function SHUMATE_TYPE_RASTER_RENDERER: TGType;
function SHUMATE_RASTER_RENDERER(obj: Pointer): PShumateRasterRenderer;
function SHUMATE_IS_RASTER_RENDERER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_RASTER_RENDERER: TGType;
begin
  Result := shumate_raster_renderer_get_type;
end;

function SHUMATE_RASTER_RENDERER(obj: Pointer): PShumateRasterRenderer;
begin
  Result := PShumateRasterRenderer(g_type_check_instance_cast(obj, SHUMATE_TYPE_RASTER_RENDERER));
end;

function SHUMATE_IS_RASTER_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_RASTER_RENDERER);
end;


end.
