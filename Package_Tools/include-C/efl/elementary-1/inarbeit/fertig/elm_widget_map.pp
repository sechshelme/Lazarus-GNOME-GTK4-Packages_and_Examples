
unit elm_widget_map;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_map.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_map.h
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
PCalc_Job  = ^Calc_Job;
Pchar  = ^char;
PColor  = ^Color;
Pdouble  = ^double;
PEcore_File_Download_Job  = ^Ecore_File_Download_Job;
PEcore_Idler  = ^Ecore_Idler;
PEcore_Timer  = ^Ecore_Timer;
PEina_Array  = ^Eina_Array;
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
PEina_Matrixsparse  = ^Eina_Matrixsparse;
PEina_Stringshare  = ^Eina_Stringshare;
PElm_Map_Data  = ^Elm_Map_Data;
PElm_Map_Module_Name_Url_Func  = ^Elm_Map_Module_Name_Url_Func;
PElm_Map_Module_Route_Url_Func  = ^Elm_Map_Module_Route_Url_Func;
PElm_Map_Module_Source_Name_Func  = ^Elm_Map_Module_Source_Name_Func;
PElm_Map_Module_Tile_Copyright_Func  = ^Elm_Map_Module_Tile_Copyright_Func;
PElm_Map_Module_Tile_Url_Func  = ^Elm_Map_Module_Tile_Url_Func;
PElm_Map_Name  = ^Elm_Map_Name;
PElm_Map_Name_List  = ^Elm_Map_Name_List;
PElm_Map_Overlay  = ^Elm_Map_Overlay;
PElm_Map_Pan_Data  = ^Elm_Map_Pan_Data;
PElm_Map_Route  = ^Elm_Map_Route;
PEvas_Map  = ^Evas_Map;
PEvas_Object  = ^Evas_Object;
PGrid  = ^Grid;
PGrid_Item  = ^Grid_Item;
Plongint  = ^longint;
PName_Dump  = ^Name_Dump;
PName_Xml_Attibute  = ^Name_Xml_Attibute;
PName_Xml_Attribute  = ^Name_Xml_Attribute;
POverlay_Bubble  = ^Overlay_Bubble;
POverlay_Circle  = ^Overlay_Circle;
POverlay_Class  = ^Overlay_Class;
POverlay_Default  = ^Overlay_Default;
POverlay_Group  = ^Overlay_Group;
POverlay_Line  = ^Overlay_Line;
POverlay_Polygon  = ^Overlay_Polygon;
POverlay_Route  = ^Overlay_Route;
POverlay_Scale  = ^Overlay_Scale;
PPath  = ^Path;
PPath_Node  = ^Path_Node;
PPath_Waypoint  = ^Path_Waypoint;
PRegion  = ^Region;
PRoute_Dump  = ^Route_Dump;
PRoute_Xml_Attibute  = ^Route_Xml_Attibute;
PRoute_Xml_Attribute  = ^Route_Xml_Attribute;
PSource_Name  = ^Source_Name;
PSource_Route  = ^Source_Route;
PSource_Tile  = ^Source_Tile;
PTrack_Xml_Attibute  = ^Track_Xml_Attibute;
PTrack_Xml_Attribute  = ^Track_Xml_Attribute;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_MAP_H}
{$define ELM_WIDGET_MAP_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-map-class The Elementary Map Class
 *
 * Elementary, besides having the @ref Map widget, exposes its
 * foundation -- the Elementary Map Class -- in order to create
 * other widgets which are a map with some more logic on top.
  }
{*
 * Base widget smart data extended with map instance data.
  }
type

  PElm_Map_Module_Source_Name_Func = ^TElm_Map_Module_Source_Name_Func;
  TElm_Map_Module_Source_Name_Func = function :PEina_Stringshare;cdecl;

  TElm_Map_Module_Tile_Zoom_Min_Func = function (para1:pointer):longint;cdecl;

  TElm_Map_Module_Tile_Zoom_Max_Func = function (para1:pointer):longint;cdecl;
(* Const before type ignored *)

  PElm_Map_Module_Tile_Url_Func = ^TElm_Map_Module_Tile_Url_Func;
  TElm_Map_Module_Tile_Url_Func = function (para1:PEvas_Object; para2:longint; para3:longint; para4:longint):Pchar;cdecl;
(* Const before type ignored *)

  TElm_Map_Module_Tile_Geo_to_Coord_Func = function (para1:PEvas_Object; para2:longint; para3:Tdouble; para4:Tdouble; para5:longint; 
               para6:Plongint; para7:Plongint):TEina_Bool;cdecl;
(* Const before type ignored *)

  TElm_Map_Module_Tile_Coord_to_Geo_Func = function (para1:PEvas_Object; para2:longint; para3:longint; para4:longint; para5:longint; 
               para6:Pdouble; para7:Pdouble):TEina_Bool;cdecl;
(* Const before type ignored *)

  TElm_Map_Module_Tile_Scale_Func = function (para1:PEvas_Object; para2:Tdouble; para3:Tdouble; para4:longint):Tdouble;cdecl;

  PElm_Map_Module_Tile_Copyright_Func = ^TElm_Map_Module_Tile_Copyright_Func;
  TElm_Map_Module_Tile_Copyright_Func = function (para1:PEvas_Object):PEvas_Object;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  PElm_Map_Module_Route_Url_Func = ^TElm_Map_Module_Route_Url_Func;
  TElm_Map_Module_Route_Url_Func = function (para1:PEvas_Object; para2:Pchar; para3:longint; para4:Tdouble; para5:Tdouble; 
               para6:Tdouble; para7:Tdouble):Pchar;cdecl;

  TElm_Map_Module_Route_Parse_Func = procedure (para1:PElm_Map_Route);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  PElm_Map_Module_Name_Url_Func = ^TElm_Map_Module_Name_Url_Func;
  TElm_Map_Module_Name_Url_Func = function (para1:PEvas_Object; para2:longint; para3:Pchar; para4:Tdouble; para5:Tdouble):Pchar;cdecl;

  TElm_Map_Module_Name_Parse_Func = procedure (n:PElm_Map_Name);cdecl;

  TElm_Map_Module_Name_List_Parse_Func = procedure (nl:PElm_Map_Name_List);cdecl;
{ FIXME: Currently tile size must be 256*256 }
{ and the map size is pow(2.0, z) * (tile size) }
  PSource_Tile = ^TSource_Tile;
  TSource_Tile = record
      name : PEina_Stringshare;cdecl;
      zoom_min : longint;
      zoom_max : longint;
      url_cb : TElm_Map_Module_Tile_Url_Func;
      geo_to_coord : TElm_Map_Module_Tile_Geo_to_Coord_Func;
      coord_to_geo : TElm_Map_Module_Tile_Coord_to_Geo_Func;
      scale_cb : TElm_Map_Module_Tile_Scale_Func;
      copyright_cb : TElm_Map_Module_Tile_Copyright_Func;
    end;

  PSource_Route = ^TSource_Route;
  TSource_Route = record
      name : PEina_Stringshare;
      url_cb : TElm_Map_Module_Route_Url_Func;
      route_parse_cb : TElm_Map_Module_Route_Parse_Func;
    end;

  PSource_Name = ^TSource_Name;
  TSource_Name = record
      name : PEina_Stringshare;
      url_cb : TElm_Map_Module_Name_Url_Func;
      name_parse_cb : TElm_Map_Module_Name_Parse_Func;
      name_list_parse_cb : TElm_Map_Module_Name_List_Parse_Func;
    end;


  PRoute_Xml_Attribute = ^TRoute_Xml_Attribute;
  TRoute_Xml_Attribute =  Longint;
  Const
    ROUTE_XML_NONE = 0;
    ROUTE_XML_DISTANCE = 1;
    ROUTE_XML_DESCRIPTION = 2;
    ROUTE_XML_COORDINATES = 3;
    ROUTE_XML_LAST = 4;
;
  TRoute_Xml_Attibute = TRoute_Xml_Attribute;
  PRoute_Xml_Attibute = ^TRoute_Xml_Attibute;
type
  PName_Xml_Attribute = ^TName_Xml_Attribute;
  TName_Xml_Attribute =  Longint;
  Const
    NAME_XML_NONE = 0;
    NAME_XML_NAME = 1;
    NAME_XML_LON = 2;
    NAME_XML_LAT = 3;
    NAME_XML_LAST = 4;
;
  TName_Xml_Attibute = TName_Xml_Attribute;
  PName_Xml_Attibute = ^TName_Xml_Attibute;
type
  PTrack_Xml_Attribute = ^TTrack_Xml_Attribute;
  TTrack_Xml_Attribute =  Longint;
  Const
    TRACK_XML_NONE = 0;
    TRACK_XML_COORDINATES = 1;
    TRACK_XML_LAST = 2;
;
  TTrack_Xml_Attibute = TTrack_Xml_Attribute;
  PTrack_Xml_Attibute = ^TTrack_Xml_Attibute;
type
  PPath = ^TPath;
  TPath = record
      x : TEvas_Coord;
      y : TEvas_Coord;
    end;

  PRegion = ^TRegion;
  TRegion = record
      lon : Tdouble;
      lat : Tdouble;
    end;

  PColor = ^TColor;
  TColor = record
      r : longint;
      g : longint;
      b : longint;
      a : longint;
    end;

{ virtual group type overlay }
{ class overlay for this virtual group }
{ rendered overlay }
  POverlay_Group = ^TOverlay_Group;
  TOverlay_Group = record
      wsd : PElm_Map_Data;
      lon : Tdouble;
      lat : Tdouble;
      overlay : PElm_Map_Overlay;
      klass : PElm_Map_Overlay;
      ovl : POverlay_Default;
      members : PEina_List;
      flag0 : word;
    end;


const
  bm_TOverlay_Group_in = $1;
  bp_TOverlay_Group_in = 0;
  bm_TOverlay_Group_boss = $2;
  bp_TOverlay_Group_boss = 1;

function in(var a : TOverlay_Group) : TEina_Bool;
procedure set_in(var a : TOverlay_Group; __in : TEina_Bool);
function boss(var a : TOverlay_Group) : TEina_Bool;
procedure set_boss(var a : TOverlay_Group; __boss : TEina_Bool);
{ Display priority is content > icon > clas_obj > clas_icon > layout }
{ if clas_content or icon exists, do not inherit from class }
{ Duplicated from class content }
{ Duplicated from class icon }
type
  POverlay_Default = ^TOverlay_Default;
  TOverlay_Default = record
      wsd : PElm_Map_Data;
      w : TEvas_Coord;
      h : TEvas_Coord;
      lon : Tdouble;
      lat : Tdouble;
      x : TEvas_Coord;
      y : TEvas_Coord;
      content : PEvas_Object;
      icon : PEvas_Object;
      c : TColor;
      clas_content : PEvas_Object;
      clas_icon : PEvas_Object;
      layout : PEvas_Object;
    end;

  POverlay_Class = ^TOverlay_Class;
  TOverlay_Class = record
      wsd : PElm_Map_Data;
      members : PEina_List;
      zoom_max : longint;
      content : PEvas_Object;
      icon : PEvas_Object;
    end;

  POverlay_Bubble = ^TOverlay_Bubble;
  TOverlay_Bubble = record
      wsd : PElm_Map_Data;
      pobj : PEvas_Object;
      obj : PEvas_Object;
      sc : PEvas_Object;
      bx : PEvas_Object;
      lon : Tdouble;
      lat : Tdouble;
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
    end;

  POverlay_Route = ^TOverlay_Route;
  TOverlay_Route = record
      wsd : PElm_Map_Data;
      obj : PEvas_Object;
      paths : PEina_List;
      nodes : PEina_List;
    end;

  POverlay_Line = ^TOverlay_Line;
  TOverlay_Line = record
      wsd : PElm_Map_Data;
      flon : Tdouble;
      flat : Tdouble;
      tlon : Tdouble;
      tlat : Tdouble;
      obj : PEvas_Object;
    end;

{ list of Regions }
  POverlay_Polygon = ^TOverlay_Polygon;
  TOverlay_Polygon = record
      wsd : PElm_Map_Data;
      regions : PEina_List;
      obj : PEvas_Object;
    end;

{ Initial pixel in initial view }
{ initial-radius/map-size }
  POverlay_Circle = ^TOverlay_Circle;
  TOverlay_Circle = record
      wsd : PElm_Map_Data;
      lon : Tdouble;
      lat : Tdouble;
      radius : Tdouble;
      ratio : Tdouble;
      obj : PEvas_Object;
    end;

  POverlay_Scale = ^TOverlay_Scale;
  TOverlay_Scale = record
      wsd : PElm_Map_Data;
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      obj : PEvas_Object;
    end;

{ user set data }
{ Overlay Data for each type }
{ These are not used if overlay type is class or group }
  PElm_Map_Overlay = ^TElm_Map_Overlay;
  TElm_Map_Overlay = record
      wsd : PElm_Map_Data;
      zoom_min : TEvas_Coord;
      c : TColor;
      data : pointer;
      _type : TElm_Map_Overlay_Type;
      ovl : pointer;
      cb : TElm_Map_Overlay_Get_Cb;
      cb_data : pointer;
      del_cb : TElm_Map_Overlay_Del_Cb;
      del_cb_data : pointer;
      grp : POverlay_Group;
      flag0 : word;
    end;


const
  bm_TElm_Map_Overlay_visible = $1;
  bp_TElm_Map_Overlay_visible = 0;
  bm_TElm_Map_Overlay_paused = $2;
  bp_TElm_Map_Overlay_paused = 1;
  bm_TElm_Map_Overlay_hide = $4;
  bp_TElm_Map_Overlay_hide = 2;

function visible(var a : TElm_Map_Overlay) : TEina_Bool;
procedure set_visible(var a : TElm_Map_Overlay; __visible : TEina_Bool);
function paused(var a : TElm_Map_Overlay) : TEina_Bool;
procedure set_paused(var a : TElm_Map_Overlay; __paused : TEina_Bool);
function hide(var a : TElm_Map_Overlay) : TEina_Bool;
procedure set_hide(var a : TElm_Map_Overlay; __hide : TEina_Bool);
(* Const before type ignored *)
(* Const before type ignored *)
{ unit : km  }
type
  PElm_Map_Route = ^TElm_Map_Route;
  TElm_Map_Route = record
      wsd : PElm_Map_Data;
      fname : Pchar;
      _type : TElm_Map_Route_Type;
      method : TElm_Map_Route_Method;
      flon : Tdouble;
      flat : Tdouble;
      tlon : Tdouble;
      tlat : Tdouble;
      cb : TElm_Map_Route_Cb;
      data : pointer;
      job : PEcore_File_Download_Job;
      nodes : PEina_List;
      waypoint : PEina_List;
      info : record
          node_count : longint;
          waypoint_count : longint;
          nodes : Pchar;
          waypoints : Pchar;
          distance : Tdouble;
        end;
      n : PPath_Node;
      w : PPath_Waypoint;
    end;

  PPath_Node = ^TPath_Node;
  TPath_Node = record
      wsd : PElm_Map_Data;
      idx : longint;
      pos : record
          lon : Tdouble;
          lat : Tdouble;
          address : Pchar;
        end;
    end;

(* Const before type ignored *)
  PPath_Waypoint = ^TPath_Waypoint;
  TPath_Waypoint = record
      wsd : PElm_Map_Data;
      point : Pchar;
    end;

  PElm_Map_Name = ^TElm_Map_Name;
  TElm_Map_Name = record
      wsd : PElm_Map_Data;
      method : longint;
      address : Pchar;
      lon : Tdouble;
      lat : Tdouble;
      fname : Pchar;
      job : PEcore_File_Download_Job;
      cb : TElm_Map_Name_Cb;
      data : pointer;
    end;

  PElm_Map_Name_List = ^TElm_Map_Name_List;
  TElm_Map_Name_List = record
      wsd : PElm_Map_Data;
      names : PEina_List;
      lon : Tdouble;
      lat : Tdouble;
      fname : Pchar;
      job : PEcore_File_Download_Job;
      cb : TElm_Map_Name_List_Cb;
      data : pointer;
    end;

  PRoute_Dump = ^TRoute_Dump;
  TRoute_Dump = record
      id : longint;
      fname : Pchar;
      distance : Tdouble;
      description : Pchar;
      coordinates : Pchar;
    end;

  PName_Dump = ^TName_Dump;
  TName_Dump = record
      id : longint;
      address : Pchar;
      lon : Tdouble;
      lat : Tdouble;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
{ Tile coordinate }
  PGrid_Item = ^TGrid_Item;
  TGrid_Item = record
      g : PGrid;
      wsd : PElm_Map_Data;
      img : PEvas_Object;
      file : Pchar;
      url : Pchar;
      x : longint;
      y : longint;
      job : PEcore_File_Download_Job;
      flag0 : word;
    end;


const
  bm_TGrid_Item_file_have = $1;
  bp_TGrid_Item_file_have = 0;

function file_have(var a : TGrid_Item) : TEina_Bool;
procedure set_file_have(var a : TGrid_Item; __file_have : TEina_Bool);
{ zoom level tiles want for optimal
                               * display (1, 2, 4, 8)  }
{ size of grid in tiles }
type
  PGrid = ^TGrid;
  TGrid = record
      wsd : PElm_Map_Data;
      zoom : longint;
      tw : longint;
      th : longint;
      grid : PEina_Matrixsparse;
    end;

  PCalc_Job = ^TCalc_Job;
  TCalc_Job = record
      zoom : Tdouble;
      zoom_mode_set : procedure (sd:PElm_Map_Data; zoom:Tdouble);cdecl;
      flag0 : word;
      lon : Tdouble;
      lat : Tdouble;
      region_show_bring_in : procedure (sd:PElm_Map_Data; lon:Tdouble; lat:Tdouble; bring_in:TEina_Bool);cdecl;
      overlays : PEina_List;
      overlays_show : procedure (sd:PElm_Map_Data; overlays:PEina_List);cdecl;
    end;


const
  bm_TCalc_Job_bring_in = $1;
  bp_TCalc_Job_bring_in = 0;

function bring_in(var a : TCalc_Job) : TEina_Bool;
procedure set_bring_in(var a : TCalc_Job; __bring_in : TEina_Bool);
{ The object itself }
{ Tiles are below this and overlays are on top  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ Current pixel width, heigth of a grid }
{ Current pixel size of a grid item }
(* Const before type ignored *)
type
  PElm_Map_Data = ^TElm_Map_Data;
  TElm_Map_Data = record
      hit_rect : PEvas_Object;
      pan_obj : PEvas_Object;
      g_layer : PEvas_Object;
      obj : PEvas_Object;
      sep_maps_overlays : PEvas_Object;
      map : PEvas_Map;
      src_mods : PEina_Array;
      src_tile : PSource_Tile;
      src_tiles : PEina_List;
      src_tile_names : ^Pchar;
      src_route : PSource_Route;
      src_routes : PEina_List;
      src_route_names : ^Pchar;
      src_name : PSource_Name;
      src_names : PEina_List;
      src_name_names : ^Pchar;
      grids : PEina_List;
      zoom_min : longint;
      zoom_max : longint;
      tsize : longint;
      id : longint;
      zoom : longint;
      zoom_detail : Tdouble;
      size : record
          w : longint;
          h : longint;
          tile : longint;
        end;
      mode : TEfl_Ui_Zoom_Mode;
      ani : record
          zoom : Tdouble;
          zoom_diff : Tdouble;
          lon : Tdouble;
          lat : Tdouble;
          lon_diff : Tdouble;
          lat_diff : Tdouble;
          zoom_cnt : longint;
          region_cnt : longint;
        end;
      zoom_timer : PEcore_Timer;
      loaded_timer : PEcore_Timer;
      try_num : longint;
      finish_num : longint;
      download_num : longint;
      download_list : PEina_List;
      download_idler : PEcore_Idler;
      ua : PEina_Hash;
      user_agent : Pchar;
      pan_x : TEvas_Coord;
      pan_y : TEvas_Coord;
      scr_timer : PEcore_Timer;
      long_timer : PEcore_Timer;
      ev : TEvas_Event_Mouse_Down;
      pinch_zoom : Tdouble;
      rotate : record
          cx : TEvas_Coord;
          cy : TEvas_Coord;
          a : Tdouble;
          d : Tdouble;
        end;
      routes : PEina_List;
      track : PEina_List;
      names : PEina_List;
      overlays : PEina_List;
      group_overlays : PEina_List;
      all_overlays : PEina_List;
      flag0 : word;
      calc_job : TCalc_Job;
      copyright : PEvas_Object;
    end;


const
  bm_TElm_Map_Data_wheel_disabled = $1;
  bp_TElm_Map_Data_wheel_disabled = 0;
  bm_TElm_Map_Data_on_hold = $2;
  bp_TElm_Map_Data_on_hold = 1;
  bm_TElm_Map_Data_paused = $4;
  bp_TElm_Map_Data_paused = 2;
  bm_TElm_Map_Data_zoom_animator = $8;
  bp_TElm_Map_Data_zoom_animator = 3;

function wheel_disabled(var a : TElm_Map_Data) : TEina_Bool;
procedure set_wheel_disabled(var a : TElm_Map_Data; __wheel_disabled : TEina_Bool);
function on_hold(var a : TElm_Map_Data) : TEina_Bool;
procedure set_on_hold(var a : TElm_Map_Data; __on_hold : TEina_Bool);
function paused(var a : TElm_Map_Data) : TEina_Bool;
procedure set_paused(var a : TElm_Map_Data; __paused : TEina_Bool);
function zoom_animator(var a : TElm_Map_Data) : TEina_Bool;
procedure set_zoom_animator(var a : TElm_Map_Data; __zoom_animator : TEina_Bool);
type
  PElm_Map_Pan_Data = ^TElm_Map_Pan_Data;
  TElm_Map_Pan_Data = record
      wobj : PEvas_Object;
      wsd : PElm_Map_Data;
    end;

{*
 * @
  }
{$endif}

implementation

function in(var a : TOverlay_Group) : TEina_Bool;
begin
  in:=(a.flag0 and bm_TOverlay_Group_in) shr bp_TOverlay_Group_in;
end;

procedure set_in(var a : TOverlay_Group; __in : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__in shl bp_TOverlay_Group_in) and bm_TOverlay_Group_in);
end;

function boss(var a : TOverlay_Group) : TEina_Bool;
begin
  boss:=(a.flag0 and bm_TOverlay_Group_boss) shr bp_TOverlay_Group_boss;
end;

procedure set_boss(var a : TOverlay_Group; __boss : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__boss shl bp_TOverlay_Group_boss) and bm_TOverlay_Group_boss);
end;

function visible(var a : TElm_Map_Overlay) : TEina_Bool;
begin
  visible:=(a.flag0 and bm_TElm_Map_Overlay_visible) shr bp_TElm_Map_Overlay_visible;
end;

procedure set_visible(var a : TElm_Map_Overlay; __visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__visible shl bp_TElm_Map_Overlay_visible) and bm_TElm_Map_Overlay_visible);
end;

function paused(var a : TElm_Map_Overlay) : TEina_Bool;
begin
  paused:=(a.flag0 and bm_TElm_Map_Overlay_paused) shr bp_TElm_Map_Overlay_paused;
end;

procedure set_paused(var a : TElm_Map_Overlay; __paused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__paused shl bp_TElm_Map_Overlay_paused) and bm_TElm_Map_Overlay_paused);
end;

function hide(var a : TElm_Map_Overlay) : TEina_Bool;
begin
  hide:=(a.flag0 and bm_TElm_Map_Overlay_hide) shr bp_TElm_Map_Overlay_hide;
end;

procedure set_hide(var a : TElm_Map_Overlay; __hide : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hide shl bp_TElm_Map_Overlay_hide) and bm_TElm_Map_Overlay_hide);
end;

function file_have(var a : TGrid_Item) : TEina_Bool;
begin
  file_have:=(a.flag0 and bm_TGrid_Item_file_have) shr bp_TGrid_Item_file_have;
end;

procedure set_file_have(var a : TGrid_Item; __file_have : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__file_have shl bp_TGrid_Item_file_have) and bm_TGrid_Item_file_have);
end;

function bring_in(var a : TCalc_Job) : TEina_Bool;
begin
  bring_in:=(a.flag0 and bm_TCalc_Job_bring_in) shr bp_TCalc_Job_bring_in;
end;

procedure set_bring_in(var a : TCalc_Job; __bring_in : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bring_in shl bp_TCalc_Job_bring_in) and bm_TCalc_Job_bring_in);
end;

function wheel_disabled(var a : TElm_Map_Data) : TEina_Bool;
begin
  wheel_disabled:=(a.flag0 and bm_TElm_Map_Data_wheel_disabled) shr bp_TElm_Map_Data_wheel_disabled;
end;

procedure set_wheel_disabled(var a : TElm_Map_Data; __wheel_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__wheel_disabled shl bp_TElm_Map_Data_wheel_disabled) and bm_TElm_Map_Data_wheel_disabled);
end;

function on_hold(var a : TElm_Map_Data) : TEina_Bool;
begin
  on_hold:=(a.flag0 and bm_TElm_Map_Data_on_hold) shr bp_TElm_Map_Data_on_hold;
end;

procedure set_on_hold(var a : TElm_Map_Data; __on_hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_hold shl bp_TElm_Map_Data_on_hold) and bm_TElm_Map_Data_on_hold);
end;

function paused(var a : TElm_Map_Data) : TEina_Bool;
begin
  paused:=(a.flag0 and bm_TElm_Map_Data_paused) shr bp_TElm_Map_Data_paused;
end;

procedure set_paused(var a : TElm_Map_Data; __paused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__paused shl bp_TElm_Map_Data_paused) and bm_TElm_Map_Data_paused);
end;

function zoom_animator(var a : TElm_Map_Data) : TEina_Bool;
begin
  zoom_animator:=(a.flag0 and bm_TElm_Map_Data_zoom_animator) shr bp_TElm_Map_Data_zoom_animator;
end;

procedure set_zoom_animator(var a : TElm_Map_Data; __zoom_animator : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__zoom_animator shl bp_TElm_Map_Data_zoom_animator) and bm_TElm_Map_Data_zoom_animator);
end;


end.
