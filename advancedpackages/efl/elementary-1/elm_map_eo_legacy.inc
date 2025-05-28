{$IFDEF read_interface}


type
  PElm_Map = ^TElm_Map;
  TElm_Map = TEo;

type
  PElm_Map_Source_Type = ^TElm_Map_Source_Type;
  TElm_Map_Source_Type = longint;

const
  ELM_MAP_SOURCE_TYPE_TILE = 0;
  ELM_MAP_SOURCE_TYPE_ROUTE = 1;
  ELM_MAP_SOURCE_TYPE_NAME = 2;
  ELM_MAP_SOURCE_TYPE_LAST = 3;

procedure elm_map_zoom_min_set(obj: PElm_Map; zoom: longint); cdecl; external libelementary;
function elm_map_zoom_min_get(obj: PElm_Map): longint; cdecl; external libelementary;
procedure elm_map_rotate_set(obj: PElm_Map; degree: double; cx: longint; cy: longint); cdecl; external libelementary;
procedure elm_map_rotate_get(obj: PElm_Map; degree: Pdouble; cx: Plongint; cy: Plongint); cdecl; external libelementary;
procedure elm_map_user_agent_set(obj: PElm_Map; user_agent: pchar); cdecl; external libelementary;
function elm_map_user_agent_get(obj: PElm_Map): pchar; cdecl; external libelementary;
procedure elm_map_zoom_max_set(obj: PElm_Map; zoom: longint); cdecl; external libelementary;
function elm_map_zoom_max_get(obj: PElm_Map): longint; cdecl; external libelementary;
procedure elm_map_region_get(obj: PElm_Map; lon: Pdouble; lat: Pdouble); cdecl; external libelementary;
function elm_map_overlays_get(obj: PElm_Map): PEina_List; cdecl; external libelementary;
procedure elm_map_tile_load_status_get(obj: PElm_Map; try_num: Plongint; finish_num: Plongint); cdecl; external libelementary;
procedure elm_map_source_set(obj: PElm_Map; _type: TElm_Map_Source_Type; source_name: pchar); cdecl; external libelementary;
function elm_map_source_get(obj: PElm_Map; _type: TElm_Map_Source_Type): pchar; cdecl; external libelementary;
function elm_map_route_add(obj: PElm_Map; _type: TElm_Map_Route_Type; method: TElm_Map_Route_Method; flon: double; flat: double;
  tlon: double; tlat: double; route_cb: TElm_Map_Route_Cb; data: pointer): PElm_Map_Route; cdecl; external libelementary;
function elm_map_track_add(obj: PElm_Map; emap: pointer): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_map_region_to_canvas_convert(obj: PElm_Map; lon: double; lat: double; x: Plongint; y: Plongint); cdecl; external libelementary;
function elm_map_overlay_circle_add(obj: PElm_Map; lon: double; lat: double; radius: double): PElm_Map_Overlay; cdecl; external libelementary;
function elm_map_overlay_class_add(obj: PElm_Map): PElm_Map_Overlay; cdecl; external libelementary;
function elm_map_overlay_bubble_add(obj: PElm_Map): PElm_Map_Overlay; cdecl; external libelementary;
function elm_map_sources_get(obj: PElm_Map; _type: TElm_Map_Source_Type): PPchar; cdecl; external libelementary;
function elm_map_overlay_polygon_add(obj: PElm_Map): PElm_Map_Overlay; cdecl; external libelementary;
function elm_map_overlay_line_add(obj: PElm_Map; flon: double; flat: double; tlon: double; tlat: double): PElm_Map_Overlay; cdecl; external libelementary;
procedure elm_map_region_show(obj: PElm_Map; lon: double; lat: double); cdecl; external libelementary;
function elm_map_name_add(obj: PElm_Map; address: pchar; lon: double; lat: double; name_cb: TElm_Map_Name_Cb;
  data: pointer): PElm_Map_Name; cdecl; external libelementary;
procedure elm_map_name_search(obj: PElm_Map; address: pchar; name_cb: TElm_Map_Name_List_Cb; data: pointer); cdecl; external libelementary;
procedure elm_map_region_bring_in(obj: PElm_Map; lon: double; lat: double); cdecl; external libelementary;
procedure elm_map_region_zoom_bring_in(obj: PElm_Map; zoom: longint; lon: double; lat: double); cdecl; external libelementary;
procedure elm_map_track_remove(obj: PElm_Map; route: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_map_overlay_route_add(obj: PElm_Map; route: PElm_Map_Route): PElm_Map_Overlay; cdecl; external libelementary;
function elm_map_overlay_scale_add(obj: PElm_Map; x: longint; y: longint): PElm_Map_Overlay; cdecl; external libelementary;
function elm_map_overlay_add(obj: PElm_Map; lon: double; lat: double): PElm_Map_Overlay; cdecl; external libelementary;
procedure elm_map_canvas_to_region_convert(obj: PElm_Map; x: longint; y: longint; lon: Pdouble; lat: Pdouble); cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:45:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
