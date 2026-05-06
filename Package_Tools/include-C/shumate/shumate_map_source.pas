unit shumate_map_source;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate,shumate_tile;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PShumateMapProjection = ^TShumateMapProjection;
  TShumateMapProjection = longint;

const
  SHUMATE_MAP_PROJECTION_MERCATOR = 0;

type
  TShumateMapSource = record
    parent_instance: TGObject;
  end;
  PShumateMapSource = ^TShumateMapSource;

  TShumateMapSourceClass = record
    parent_class: TGObjectClass;
    fill_tile_async: procedure(self: PShumateMapSource; tile: PShumateTile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    fill_tile_finish: function(self: PShumateMapSource; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    padding: array[0..15] of Tgpointer;
  end;
  PShumateMapSourceClass = ^TShumateMapSourceClass;

function shumate_map_source_get_type: TGType; cdecl; external libshumate;
function shumate_map_source_get_id(map_source: PShumateMapSource): pchar; cdecl; external libshumate;
procedure shumate_map_source_set_id(map_source: PShumateMapSource; id: pchar); cdecl; external libshumate;
function shumate_map_source_get_name(map_source: PShumateMapSource): pchar; cdecl; external libshumate;
procedure shumate_map_source_set_name(map_source: PShumateMapSource; name: pchar); cdecl; external libshumate;
function shumate_map_source_get_license(map_source: PShumateMapSource): pchar; cdecl; external libshumate;
procedure shumate_map_source_set_license(map_source: PShumateMapSource; license: pchar); cdecl; external libshumate;
function shumate_map_source_get_license_uri(map_source: PShumateMapSource): pchar; cdecl; external libshumate;
procedure shumate_map_source_set_license_uri(map_source: PShumateMapSource; license_uri: pchar); cdecl; external libshumate;
function shumate_map_source_get_min_zoom_level(map_source: PShumateMapSource): Tguint; cdecl; external libshumate;
procedure shumate_map_source_set_min_zoom_level(map_source: PShumateMapSource; zoom_level: Tguint); cdecl; external libshumate;
function shumate_map_source_get_max_zoom_level(map_source: PShumateMapSource): Tguint; cdecl; external libshumate;
procedure shumate_map_source_set_max_zoom_level(map_source: PShumateMapSource; zoom_level: Tguint); cdecl; external libshumate;
function shumate_map_source_get_tile_size(map_source: PShumateMapSource): Tguint; cdecl; external libshumate;
function shumate_map_source_get_tile_size_at_zoom(map_source: PShumateMapSource; zoom_level: double): double; cdecl; external libshumate;
procedure shumate_map_source_set_tile_size(map_source: PShumateMapSource; tile_size: Tguint); cdecl; external libshumate;
function shumate_map_source_get_projection(map_source: PShumateMapSource): TShumateMapProjection; cdecl; external libshumate;
procedure shumate_map_source_set_projection(map_source: PShumateMapSource; projection: TShumateMapProjection); cdecl; external libshumate;
function shumate_map_source_get_x(map_source: PShumateMapSource; zoom_level: double; longitude: double): double; cdecl; external libshumate;
function shumate_map_source_get_y(map_source: PShumateMapSource; zoom_level: double; latitude: double): double; cdecl; external libshumate;
function shumate_map_source_get_longitude(map_source: PShumateMapSource; zoom_level: double; x: double): double; cdecl; external libshumate;
function shumate_map_source_get_latitude(map_source: PShumateMapSource; zoom_level: double; y: double): double; cdecl; external libshumate;
function shumate_map_source_get_row_count(map_source: PShumateMapSource; zoom_level: Tguint): Tguint; cdecl; external libshumate;
function shumate_map_source_get_column_count(map_source: PShumateMapSource; zoom_level: Tguint): Tguint; cdecl; external libshumate;
function shumate_map_source_get_meters_per_pixel(map_source: PShumateMapSource; zoom_level: double; latitude: double; longitude: double): double; cdecl; external libshumate;
procedure shumate_map_source_fill_tile_async(self: PShumateMapSource; tile: PShumateTile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libshumate;
function shumate_map_source_fill_tile_finish(self: PShumateMapSource; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:18 ===

function SHUMATE_TYPE_MAP_SOURCE: TGType;
function SHUMATE_MAP_SOURCE(obj: Pointer): PShumateMapSource;
function SHUMATE_IS_MAP_SOURCE(obj: Pointer): Tgboolean;
function SHUMATE_MAP_SOURCE_CLASS(klass: Pointer): PShumateMapSourceClass;
function SHUMATE_IS_MAP_SOURCE_CLASS(klass: Pointer): Tgboolean;
function SHUMATE_MAP_SOURCE_GET_CLASS(obj: Pointer): PShumateMapSourceClass;

implementation

function SHUMATE_TYPE_MAP_SOURCE: TGType;
begin
  Result := shumate_map_source_get_type;
end;

function SHUMATE_MAP_SOURCE(obj: Pointer): PShumateMapSource;
begin
  Result := PShumateMapSource(g_type_check_instance_cast(obj, SHUMATE_TYPE_MAP_SOURCE));
end;

function SHUMATE_IS_MAP_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_MAP_SOURCE);
end;

function SHUMATE_MAP_SOURCE_CLASS(klass: Pointer): PShumateMapSourceClass;
begin
  Result := PShumateMapSourceClass(g_type_check_class_cast(klass, SHUMATE_TYPE_MAP_SOURCE));
end;

function SHUMATE_IS_MAP_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SHUMATE_TYPE_MAP_SOURCE);
end;

function SHUMATE_MAP_SOURCE_GET_CLASS(obj: Pointer): PShumateMapSourceClass;
begin
  Result := PShumateMapSourceClass(PGTypeInstance(obj)^.g_class);
end;


end.
