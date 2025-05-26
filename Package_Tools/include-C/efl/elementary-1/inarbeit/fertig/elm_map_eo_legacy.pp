
unit elm_map_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_map_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_map_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEina_List  = ^Eina_List;
PElm_Map  = ^Elm_Map;
PElm_Map_Name  = ^Elm_Map_Name;
PElm_Map_Overlay  = ^Elm_Map_Overlay;
PElm_Map_Route  = ^Elm_Map_Route;
PElm_Map_Route_Method  = ^Elm_Map_Route_Method;
PElm_Map_Route_Type  = ^Elm_Map_Route_Type;
PElm_Map_Source_Type  = ^Elm_Map_Source_Type;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MAP_EO_LEGACY_H_}
{$define _ELM_MAP_EO_LEGACY_H_}
{$ifndef _ELM_MAP_EO_CLASS_TYPE}
{$define _ELM_MAP_EO_CLASS_TYPE}
type
  PElm_Map = ^TElm_Map;
  TElm_Map = TEo;
{$endif}
{$ifndef _ELM_MAP_EO_TYPES}
{$define _ELM_MAP_EO_TYPES}
{*
 * @brief Widget is broken due to on-line service API breaks
 *
 * Widget is broken due to on-line service API breaks
 *
 * @ingroup Elm_Map_Group
  }
{*< Map tile provider.  }
{*< Route service provider.  }
{*< Name service provider.  }
{*< Sentinel value to indicate last enum field
                            * during iteration  }
type
  PElm_Map_Source_Type = ^TElm_Map_Source_Type;
  TElm_Map_Source_Type =  Longint;
  Const
    ELM_MAP_SOURCE_TYPE_TILE = 0;
    ELM_MAP_SOURCE_TYPE_ROUTE = 1;
    ELM_MAP_SOURCE_TYPE_NAME = 2;
    ELM_MAP_SOURCE_TYPE_LAST = 3;
;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
{*< Route should consider an automobile will
                                   * be used.  }
{*< Route should consider a bicycle will be used
                               * by the user.  }
{*< Route should consider user will be walking.  }
{*< Sentinel value to indicate last enum field during
                           * iteration  }
type
  PElm_Map_Route_Type = ^TElm_Map_Route_Type;
  TElm_Map_Route_Type =  Longint;
  Const
    ELM_MAP_ROUTE_TYPE_MOTOCAR = 0;
    ELM_MAP_ROUTE_TYPE_BICYCLE = 1;
    ELM_MAP_ROUTE_TYPE_FOOT = 2;
    ELM_MAP_ROUTE_TYPE_LAST = 3;
;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
{*< Route should prioritize time.  }
{*< Route should prioritize distance.  }
{*< Sentinel value to indicate last enum field
                             * during iteration  }
type
  PElm_Map_Route_Method = ^TElm_Map_Route_Method;
  TElm_Map_Route_Method =  Longint;
  Const
    ELM_MAP_ROUTE_METHOD_FASTEST = 0;
    ELM_MAP_ROUTE_METHOD_SHORTEST = 1;
    ELM_MAP_ROUTE_METHOD_LAST = 2;
;
{$endif}
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }

procedure elm_map_zoom_min_set(obj:PElm_Map; zoom:longint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_zoom_min_get(obj:PElm_Map):longint;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
procedure elm_map_rotate_set(obj:PElm_Map; degree:Tdouble; cx:longint; cy:longint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_rotate_get(obj:PElm_Map; degree:Pdouble; cx:Plongint; cy:Plongint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_user_agent_set(obj:PElm_Map; user_agent:Pchar);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_user_agent_get(obj:PElm_Map):Pchar;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
procedure elm_map_zoom_max_set(obj:PElm_Map; zoom:longint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_zoom_max_get(obj:PElm_Map):longint;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_region_get(obj:PElm_Map; lon:Pdouble; lat:Pdouble);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_overlays_get(obj:PElm_Map):PEina_List;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_tile_load_status_get(obj:PElm_Map; try_num:Plongint; finish_num:Plongint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_source_set(obj:PElm_Map; _type:TElm_Map_Source_Type; source_name:Pchar);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_source_get(obj:PElm_Map; _type:TElm_Map_Source_Type):Pchar;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_route_add(obj:PElm_Map; _type:TElm_Map_Route_Type; method:TElm_Map_Route_Method; flon:Tdouble; flat:Tdouble; 
           tlon:Tdouble; tlat:Tdouble; route_cb:TElm_Map_Route_Cb; data:pointer):PElm_Map_Route;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_track_add(obj:PElm_Map; emap:pointer):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_region_to_canvas_convert(obj:PElm_Map; lon:Tdouble; lat:Tdouble; x:Plongint; y:Plongint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_circle_add(obj:PElm_Map; lon:Tdouble; lat:Tdouble; radius:Tdouble):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_class_add(obj:PElm_Map):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_bubble_add(obj:PElm_Map):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_sources_get(obj:PElm_Map; _type:TElm_Map_Source_Type):^Pchar;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_polygon_add(obj:PElm_Map):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_line_add(obj:PElm_Map; flon:Tdouble; flat:Tdouble; tlon:Tdouble; tlat:Tdouble):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
procedure elm_map_region_show(obj:PElm_Map; lon:Tdouble; lat:Tdouble);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_map_name_add(obj:PElm_Map; address:Pchar; lon:Tdouble; lat:Tdouble; name_cb:TElm_Map_Name_Cb; 
           data:pointer):PElm_Map_Name;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_map_name_search(obj:PElm_Map; address:Pchar; name_cb:TElm_Map_Name_List_Cb; data:pointer);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
procedure elm_map_region_bring_in(obj:PElm_Map; lon:Tdouble; lat:Tdouble);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
procedure elm_map_region_zoom_bring_in(obj:PElm_Map; zoom:longint; lon:Tdouble; lat:Tdouble);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
procedure elm_map_track_remove(obj:PElm_Map; route:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_overlay_route_add(obj:PElm_Map; route:PElm_Map_Route):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_scale_add(obj:PElm_Map; x:longint; y:longint):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
function elm_map_overlay_add(obj:PElm_Map; lon:Tdouble; lat:Tdouble):PElm_Map_Overlay;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * 
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
procedure elm_map_canvas_to_region_convert(obj:PElm_Map; x:longint; y:longint; lon:Pdouble; lat:Pdouble);cdecl;external;
{$endif}

implementation


end.
