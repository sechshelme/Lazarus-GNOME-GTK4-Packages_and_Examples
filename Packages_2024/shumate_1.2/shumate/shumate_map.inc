{$IFDEF read_interface}


type
  TShumateMap = record
  end;
  PShumateMap = ^TShumateMap;

  TShumateMapClass = record
    parent_class: TGtkWidgetClass;
  end;
  PShumateMapClass = ^TShumateMapClass;

function shumate_map_get_type: TGType; cdecl; external libshumate;
function shumate_map_new:PShumateMap;cdecl;external libshumate;
function shumate_map_new_simple:PShumateMap;cdecl;external libshumate;
function shumate_map_get_viewport(self:PShumateMap):PShumateViewport;cdecl;external libshumate;
procedure shumate_map_center_on(self:PShumateMap; latitude:double; longitude:double);cdecl;external libshumate;
procedure shumate_map_go_to(self:PShumateMap; latitude:double; longitude:double);cdecl;external libshumate;
procedure shumate_map_go_to_full(self:PShumateMap; latitude:double; longitude:double; zoom_level:double);cdecl;external libshumate;
procedure shumate_map_go_to_full_with_duration(self:PShumateMap; latitude:double; longitude:double; zoom_level:double; duration_ms:Tguint);cdecl;external libshumate;
procedure shumate_map_zoom_in(self:PShumateMap);cdecl;external libshumate;
procedure shumate_map_zoom_out(self:PShumateMap);cdecl;external libshumate;
procedure shumate_map_stop_go_to(self:PShumateMap);cdecl;external libshumate;
function shumate_map_get_go_to_duration(self:PShumateMap):Tguint;cdecl;external libshumate;
procedure shumate_map_set_go_to_duration(self:PShumateMap; duration:Tguint);cdecl;external libshumate;
procedure shumate_map_set_map_source(self:PShumateMap; map_source:PShumateMapSource);cdecl;external libshumate;
procedure shumate_map_set_zoom_on_double_click(self:PShumateMap; value:Tgboolean);cdecl;external libshumate;
procedure shumate_map_set_animate_zoom(self:PShumateMap; value:Tgboolean);cdecl;external libshumate;
procedure shumate_map_add_layer(self:PShumateMap; layer:PShumateLayer);cdecl;external libshumate;
procedure shumate_map_remove_layer(self:PShumateMap; layer:PShumateLayer);cdecl;external libshumate;
procedure shumate_map_insert_layer_behind(self:PShumateMap; layer:PShumateLayer; next_sibling:PShumateLayer);cdecl;external libshumate;
procedure shumate_map_insert_layer_above(self:PShumateMap; layer:PShumateLayer; next_sibling:PShumateLayer);cdecl;external libshumate;
function shumate_map_get_zoom_on_double_click(self:PShumateMap):Tgboolean;cdecl;external libshumate;
function shumate_map_get_animate_zoom(self:PShumateMap):Tgboolean;cdecl;external libshumate;
function shumate_map_get_state(self:PShumateMap):TShumateState;cdecl;external libshumate;

// === Konventiert am: 6-5-26 15:49:25 ===

function SHUMATE_TYPE_MAP: TGType;
function SHUMATE_MAP(obj: Pointer): PShumateMap;
function SHUMATE_IS_MAP(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_MAP: TGType;
begin
  Result := shumate_map_get_type;
end;

function SHUMATE_MAP(obj: Pointer): PShumateMap;
begin
  Result := PShumateMap(g_type_check_instance_cast(obj, SHUMATE_TYPE_MAP));
end;

function SHUMATE_IS_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_MAP);
end;


{$ENDIF read_implementation}
