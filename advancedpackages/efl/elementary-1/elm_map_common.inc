{$IFDEF read_interface}


type
  PElm_Map_Name_Method = ^TElm_Map_Name_Method;
  TElm_Map_Name_Method = longint;

const
  ELM_MAP_NAME_METHOD_SEARCH = 0;
  ELM_MAP_NAME_METHOD_REVERSE = 1;
  ELM_MAP_NAME_METHOD_LAST = 2;

procedure elm_map_overlay_del(overlay: PElm_Map_Overlay); cdecl; external libelementary;
function elm_map_overlay_type_get(overlay: PElm_Map_Overlay): TElm_Map_Overlay_Type; cdecl; external libelementary;
procedure elm_map_overlay_data_set(overlay: PElm_Map_Overlay; data: pointer); cdecl; external libelementary;
function elm_map_overlay_data_get(overlay: PElm_Map_Overlay): pointer; cdecl; external libelementary;
procedure elm_map_overlay_hide_set(overlay: PElm_Map_Overlay; hide: TEina_Bool); cdecl; external libelementary;
function elm_map_overlay_hide_get(overlay: PElm_Map_Overlay): TEina_Bool; cdecl; external libelementary;
procedure elm_map_overlay_displayed_zoom_min_set(overlay: PElm_Map_Overlay; zoom: longint); cdecl; external libelementary;
function elm_map_overlay_displayed_zoom_min_get(overlay: PElm_Map_Overlay): longint; cdecl; external libelementary;
procedure elm_map_overlay_paused_set(overlay: PElm_Map_Overlay; paused: TEina_Bool); cdecl; external libelementary;
function elm_map_overlay_paused_get(overlay: PElm_Map_Overlay): TEina_Bool; cdecl; external libelementary;
function elm_map_overlay_visible_get(overlay: PElm_Map_Overlay): TEina_Bool; cdecl; external libelementary;
procedure elm_map_overlay_content_set(overlay: PElm_Map_Overlay; obj: PEvas_Object); cdecl; external libelementary;
function elm_map_overlay_content_get(overlay: PElm_Map_Overlay): PEvas_Object; cdecl; external libelementary;
procedure elm_map_overlay_icon_set(overlay: PElm_Map_Overlay; icon: PEvas_Object); cdecl; external libelementary;
function elm_map_overlay_icon_get(overlay: PElm_Map_Overlay): PEvas_Object; cdecl; external libelementary;
procedure elm_map_overlay_region_set(overlay: PElm_Map_Overlay; lon: double; lat: double); cdecl; external libelementary;
procedure elm_map_overlay_region_get(overlay: PElm_Map_Overlay; lon: Pdouble; lat: Pdouble); cdecl; external libelementary;
procedure elm_map_overlay_color_set(overlay: PElm_Map_Overlay; r: longint; g: longint; b: longint; a: longint); cdecl; external libelementary;
procedure elm_map_overlay_color_get(overlay: PElm_Map_Overlay; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libelementary;
procedure elm_map_overlay_show(overlay: PElm_Map_Overlay); cdecl; external libelementary;
procedure elm_map_overlays_show(overlays: PEina_List); cdecl; external libelementary;
procedure elm_map_overlay_get_cb_set(overlay: PElm_Map_Overlay; get_cb: TElm_Map_Overlay_Get_Cb; data: pointer); cdecl; external libelementary;
procedure elm_map_overlay_del_cb_set(overlay: PElm_Map_Overlay; del_cb: TElm_Map_Overlay_Del_Cb; data: pointer); cdecl; external libelementary;
procedure elm_map_overlay_class_append(clas: PElm_Map_Overlay; overlay: PElm_Map_Overlay); cdecl; external libelementary;
procedure elm_map_overlay_class_remove(clas: PElm_Map_Overlay; overlay: PElm_Map_Overlay); cdecl; external libelementary;
procedure elm_map_overlay_class_zoom_max_set(clas: PElm_Map_Overlay; zoom: longint); cdecl; external libelementary;
function elm_map_overlay_class_zoom_max_get(clas: PElm_Map_Overlay): longint; cdecl; external libelementary;
function elm_map_overlay_group_members_get(grp: PElm_Map_Overlay): PEina_List; cdecl; external libelementary;
procedure elm_map_overlay_bubble_follow(bubble: PElm_Map_Overlay; parent: PElm_Map_Overlay); cdecl; external libelementary;
procedure elm_map_overlay_bubble_content_append(bubble: PElm_Map_Overlay; content: PEvas_Object); cdecl; external libelementary;
procedure elm_map_overlay_bubble_content_clear(bubble: PElm_Map_Overlay); cdecl; external libelementary;
procedure elm_map_overlay_polygon_region_add(overlay: PElm_Map_Overlay; lon: double; lat: double); cdecl; external libelementary;
procedure elm_map_route_del(route: PElm_Map_Route); cdecl; external libelementary;
function elm_map_route_distance_get(route: PElm_Map_Route): double; cdecl; external libelementary;
function elm_map_route_node_get(route: PElm_Map_Route): pchar; cdecl; external libelementary;
function elm_map_route_waypoint_get(route: PElm_Map_Route): pchar; cdecl; external libelementary;
function elm_map_name_address_get(name: PElm_Map_Name): pchar; cdecl; external libelementary;
procedure elm_map_name_region_get(name: PElm_Map_Name; lon: Pdouble; lat: Pdouble); cdecl; external libelementary;
procedure elm_map_name_del(name: PElm_Map_Name); cdecl; external libelementary;

// === Konventiert am: 23-5-25 17:40:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
