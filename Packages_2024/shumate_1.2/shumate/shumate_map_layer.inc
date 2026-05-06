{$IFDEF read_interface}


type
  TShumateMapLayer = record
  end;
  PShumateMapLayer = ^TShumateMapLayer;

  TShumateMapLayerClass = record
    parent_class: TShumateLayerClass;
  end;
  PShumateMapLayerClass = ^TShumateMapLayerClass;

function shumate_map_layer_get_type: TGType; cdecl; external libshumate;
function shumate_map_layer_new(map_source: PShumateMapSource; viewport: PShumateViewport): PShumateMapLayer; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:21 ===

function SHUMATE_TYPE_MAP_LAYER: TGType;
function SHUMATE_MAP_LAYER(obj: Pointer): PShumateMapLayer;
function SHUMATE_IS_MAP_LAYER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_MAP_LAYER: TGType;
begin
  Result := shumate_map_layer_get_type;
end;

function SHUMATE_MAP_LAYER(obj: Pointer): PShumateMapLayer;
begin
  Result := PShumateMapLayer(g_type_check_instance_cast(obj, SHUMATE_TYPE_MAP_LAYER));
end;

function SHUMATE_IS_MAP_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_MAP_LAYER);
end;


{$ENDIF read_implementation}
