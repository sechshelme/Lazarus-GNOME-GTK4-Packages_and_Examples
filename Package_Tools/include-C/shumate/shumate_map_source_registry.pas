unit shumate_map_source_registry;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_map_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateMapSourceRegistry = record
  end;
  PShumateMapSourceRegistry = ^TShumateMapSourceRegistry;

  TShumateMapSourceRegistryClass = record
    parent_class: TGObjectClass;
  end;
  PShumateMapSourceRegistryClass = ^TShumateMapSourceRegistryClass;

function shumate_map_source_registry_get_type: TGType; cdecl; external libshumate;
function shumate_map_source_registry_new: PShumateMapSourceRegistry; cdecl; external libshumate;
function shumate_map_source_registry_new_with_defaults: PShumateMapSourceRegistry; cdecl; external libshumate;
procedure shumate_map_source_registry_populate_defaults(self: PShumateMapSourceRegistry); cdecl; external libshumate;
function shumate_map_source_registry_get_by_id(self: PShumateMapSourceRegistry; id: Pgchar): PShumateMapSource; cdecl; external libshumate;
procedure shumate_map_source_registry_add(self: PShumateMapSourceRegistry; map_source: PShumateMapSource); cdecl; external libshumate;
procedure shumate_map_source_registry_remove(self: PShumateMapSourceRegistry; id: Pgchar); cdecl; external libshumate;

const
  SHUMATE_MAP_SOURCE_OSM_MAPNIK = 'osm-mapnik';
  SHUMATE_MAP_SOURCE_OSM_CYCLE_MAP = 'osm-cyclemap';
  SHUMATE_MAP_SOURCE_OSM_TRANSPORT_MAP = 'osm-transportmap';
  SHUMATE_MAP_SOURCE_MFF_RELIEF = 'mff-relief';
  SHUMATE_MAP_SOURCE_OWM_CLOUDS = 'owm-clouds';
  SHUMATE_MAP_SOURCE_OWM_PRECIPITATION = 'owm-precipitation';
  SHUMATE_MAP_SOURCE_OWM_PRESSURE = 'owm-pressure';
  SHUMATE_MAP_SOURCE_OWM_WIND = 'owm-wind';
  SHUMATE_MAP_SOURCE_OWM_TEMPERATURE = 'owm-temperature';

  // === Konventiert am: 6-5-26 15:49:14 ===

function SHUMATE_TYPE_MAP_SOURCE_REGISTRY: TGType;
function SHUMATE_MAP_SOURCE_REGISTRY(obj: Pointer): PShumateMapSourceRegistry;
function SHUMATE_IS_MAP_SOURCE_REGISTRY(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_MAP_SOURCE_REGISTRY: TGType;
begin
  Result := shumate_map_source_registry_get_type;
end;

function SHUMATE_MAP_SOURCE_REGISTRY(obj: Pointer): PShumateMapSourceRegistry;
begin
  Result := PShumateMapSourceRegistry(g_type_check_instance_cast(obj, SHUMATE_TYPE_MAP_SOURCE_REGISTRY));
end;

function SHUMATE_IS_MAP_SOURCE_REGISTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_MAP_SOURCE_REGISTRY);
end;


end.
