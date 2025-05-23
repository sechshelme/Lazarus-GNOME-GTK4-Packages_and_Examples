
unit elm_map_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_map_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_map_common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdouble  = ^double;
PEina_List  = ^Eina_List;
PElm_Map_Group_Icon_Get_Func  = ^Elm_Map_Group_Icon_Get_Func;
PElm_Map_Marker  = ^Elm_Map_Marker;
PElm_Map_Marker_Get_Func  = ^Elm_Map_Marker_Get_Func;
PElm_Map_Marker_Icon_Get_Func  = ^Elm_Map_Marker_Icon_Get_Func;
PElm_Map_Name  = ^Elm_Map_Name;
PElm_Map_Name_Method  = ^Elm_Map_Name_Method;
PElm_Map_Overlay  = ^Elm_Map_Overlay;
PElm_Map_Overlay_Type  = ^Elm_Map_Overlay_Type;
PElm_Map_Route  = ^Elm_Map_Route;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Map_Group
 *
 * @
  }
{*
 * Widget is broken due to on-line service API breaks
  }
type
  PElm_Map_Name_Method = ^TElm_Map_Name_Method;
  TElm_Map_Name_Method =  Longint;
  Const
    ELM_MAP_NAME_METHOD_SEARCH = 0;
    ELM_MAP_NAME_METHOD_REVERSE = 1;
    ELM_MAP_NAME_METHOD_LAST = 2;
;
{*
 * Widget is broken due to on-line service API breaks
  }
type
  PElm_Map_Overlay_Type = ^TElm_Map_Overlay_Type;
  TElm_Map_Overlay_Type =  Longint;
  Const
    ELM_MAP_OVERLAY_TYPE_NONE = 0;
    ELM_MAP_OVERLAY_TYPE_DEFAULT = 1;
    ELM_MAP_OVERLAY_TYPE_CLASS = 2;
    ELM_MAP_OVERLAY_TYPE_GROUP = 3;
    ELM_MAP_OVERLAY_TYPE_BUBBLE = 4;
    ELM_MAP_OVERLAY_TYPE_ROUTE = 5;
    ELM_MAP_OVERLAY_TYPE_LINE = 6;
    ELM_MAP_OVERLAY_TYPE_POLYGON = 7;
    ELM_MAP_OVERLAY_TYPE_CIRCLE = 8;
    ELM_MAP_OVERLAY_TYPE_SCALE = 9;
;
type
{*< A marker to be shown in a specific point of the map. Can be created with elm_map_marker_add() and deleted with elm_map_marker_remove().  }
{*< Each marker must be associated to a class. It's required to add a mark. The class defines the style of the marker when a marker is displayed alone (not grouped). A new class can be created with elm_map_marker_class_new().  }
{*< Each marker must be associated to a group class. It's required to add a mark. The group class defines the style of the marker when a marker is grouped to other markers. Markers with the same group are grouped if they are close. A new group class can be created with elm_map_marker_group_class_new().  }
{*< A route to be shown in the map. Can be created with elm_map_route_add() and deleted with elm_map_route_del().  }
{*< A handle for specific coordinates.  }
{*< A overlay to be shown in a specific point of the map. This can be created by elm_map_overlay_add() and similar functions and deleted by elm_map_overlay_del().  }

  PElm_Map_Marker_Get_Func = ^TElm_Map_Marker_Get_Func;
  TElm_Map_Marker_Get_Func = function (obj:PEvas_Object; marker:PElm_Map_Marker; data:pointer):PEvas_Object;cdecl;
{*< Bubble content fetching class function for marker classes. When the user click on a marker, a bubble is displayed with a content.  }

  TElm_Map_Marker_Del_Func = procedure (obj:PEvas_Object; marker:PElm_Map_Marker; data:pointer; o:PEvas_Object);cdecl;
{*< Function to delete bubble content for marker classes.  }

  PElm_Map_Marker_Icon_Get_Func = ^TElm_Map_Marker_Icon_Get_Func;
  TElm_Map_Marker_Icon_Get_Func = function (obj:PEvas_Object; marker:PElm_Map_Marker; data:pointer):PEvas_Object;cdecl;
{*< Icon fetching class function for marker classes.  }

  PElm_Map_Group_Icon_Get_Func = ^TElm_Map_Group_Icon_Get_Func;
  TElm_Map_Group_Icon_Get_Func = function (obj:PEvas_Object; data:pointer):PEvas_Object;cdecl;
{*< Icon fetching class function for markers group classes.  }

  TElm_Map_Overlay_Get_Cb = procedure (data:pointer; map:PEvas_Object; overlay:PElm_Map_Overlay);cdecl;
{*< Get callback function for the overlay.  }

  TElm_Map_Overlay_Del_Cb = procedure (data:pointer; map:PEvas_Object; overlay:PElm_Map_Overlay);cdecl;
{*< Det callback function for the overlay. @since 1.7  }

  TElm_Map_Name_Cb = procedure (data:pointer; map:PEvas_Object; name:PElm_Map_Name);cdecl;
{*< Async-callback function for the name request.  }

  TElm_Map_Name_List_Cb = procedure (data:pointer; map:PEvas_Object; name_list:PEina_List);cdecl;
{*< Async-callback function for the name list request.  }

  TElm_Map_Route_Cb = procedure (data:pointer; map:PEvas_Object; route:PElm_Map_Route);cdecl;
{*< Async-callback function for the route request.  }
{*
 * Widget is broken due to on-line service API breaks
  }

procedure elm_map_overlay_del(overlay:PElm_Map_Overlay);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_type_get(overlay:PElm_Map_Overlay):TElm_Map_Overlay_Type;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_data_set(overlay:PElm_Map_Overlay; data:pointer);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_data_get(overlay:PElm_Map_Overlay):pointer;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_hide_set(overlay:PElm_Map_Overlay; hide:TEina_Bool);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_hide_get(overlay:PElm_Map_Overlay):TEina_Bool;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_displayed_zoom_min_set(overlay:PElm_Map_Overlay; zoom:longint);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_displayed_zoom_min_get(overlay:PElm_Map_Overlay):longint;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_paused_set(overlay:PElm_Map_Overlay; paused:TEina_Bool);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_paused_get(overlay:PElm_Map_Overlay):TEina_Bool;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_visible_get(overlay:PElm_Map_Overlay):TEina_Bool;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_content_set(overlay:PElm_Map_Overlay; obj:PEvas_Object);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_overlay_content_get(overlay:PElm_Map_Overlay):PEvas_Object;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_icon_set(overlay:PElm_Map_Overlay; icon:PEvas_Object);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_overlay_icon_get(overlay:PElm_Map_Overlay):PEvas_Object;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_region_set(overlay:PElm_Map_Overlay; lon:Tdouble; lat:Tdouble);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
procedure elm_map_overlay_region_get(overlay:PElm_Map_Overlay; lon:Pdouble; lat:Pdouble);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_color_set(overlay:PElm_Map_Overlay; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
procedure elm_map_overlay_color_get(overlay:PElm_Map_Overlay; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_show(overlay:PElm_Map_Overlay);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlays_show(overlays:PEina_List);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_get_cb_set(overlay:PElm_Map_Overlay; get_cb:TElm_Map_Overlay_Get_Cb; data:pointer);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_del_cb_set(overlay:PElm_Map_Overlay; del_cb:TElm_Map_Overlay_Del_Cb; data:pointer);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_class_append(clas:PElm_Map_Overlay; overlay:PElm_Map_Overlay);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_class_remove(clas:PElm_Map_Overlay; overlay:PElm_Map_Overlay);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_class_zoom_max_set(clas:PElm_Map_Overlay; zoom:longint);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_class_zoom_max_get(clas:PElm_Map_Overlay):longint;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_overlay_group_members_get(grp:PElm_Map_Overlay):PEina_List;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
procedure elm_map_overlay_bubble_follow(bubble:PElm_Map_Overlay; parent:PElm_Map_Overlay);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_bubble_content_append(bubble:PElm_Map_Overlay; content:PEvas_Object);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_bubble_content_clear(bubble:PElm_Map_Overlay);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_overlay_polygon_region_add(overlay:PElm_Map_Overlay; lon:Tdouble; lat:Tdouble);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_route_del(route:PElm_Map_Route);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
function elm_map_route_distance_get(route:PElm_Map_Route):Tdouble;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_route_node_get(route:PElm_Map_Route):Pchar;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_route_waypoint_get(route:PElm_Map_Route):Pchar;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_name_address_get(name:PElm_Map_Name):Pchar;cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
(* Const before type ignored *)
procedure elm_map_name_region_get(name:PElm_Map_Name; lon:Pdouble; lat:Pdouble);cdecl;external;
{*
 * Widget is broken due to on-line service API breaks
  }
procedure elm_map_name_del(name:PElm_Map_Name);cdecl;external;
{*
 * @
  }

implementation


end.
