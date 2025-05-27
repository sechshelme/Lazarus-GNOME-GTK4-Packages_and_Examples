unit elm_widget_map;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_Ecore_File, fp_edje, elm_map_common, elm_map_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PRoute_Xml_Attribute = ^TRoute_Xml_Attribute;
  TRoute_Xml_Attribute = longint;

const
  ROUTE_XML_NONE = 0;
  ROUTE_XML_DISTANCE = 1;
  ROUTE_XML_DESCRIPTION = 2;
  ROUTE_XML_COORDINATES = 3;
  ROUTE_XML_LAST = 4;

type
  TRoute_Xml_Attibute = TRoute_Xml_Attribute;
  PRoute_Xml_Attibute = ^TRoute_Xml_Attibute;

type
  PName_Xml_Attribute = ^TName_Xml_Attribute;
  TName_Xml_Attribute = longint;

const
  NAME_XML_NONE = 0;
  NAME_XML_NAME = 1;
  NAME_XML_LON = 2;
  NAME_XML_LAT = 3;
  NAME_XML_LAST = 4;

type
  TName_Xml_Attibute = TName_Xml_Attribute;
  PName_Xml_Attibute = ^TName_Xml_Attibute;

type
  PTrack_Xml_Attribute = ^TTrack_Xml_Attribute;
  TTrack_Xml_Attribute = longint;

const
  TRACK_XML_NONE = 0;
  TRACK_XML_COORDINATES = 1;
  TRACK_XML_LAST = 2;

type
  TTrack_Xml_Attibute = TTrack_Xml_Attribute;
  PTrack_Xml_Attibute = ^TTrack_Xml_Attibute;

type
  TPath = record
    x: TEvas_Coord;
    y: TEvas_Coord;
  end;
  PPath = ^TPath;

  TRegion = record
    lon: double;
    lat: double;
  end;
  PRegion = ^TRegion;

  TColor = record
    r: longint;
    g: longint;
    b: longint;
    a: longint;
  end;
  PColor = ^TColor;

type
  PElm_Map_Data = ^TElm_Map_Data;
  PElm_Map_Name_List = ^TElm_Map_Name_List;
  POverlay_Default = ^TOverlay_Default;

  PElm_Map_Module_Source_Name_Func = ^TElm_Map_Module_Source_Name_Func;
  TElm_Map_Module_Source_Name_Func = function: PEina_Stringshare; cdecl;

  TElm_Map_Module_Tile_Zoom_Min_Func = function(para1: pointer): longint; cdecl;

  TElm_Map_Module_Tile_Zoom_Max_Func = function(para1: pointer): longint; cdecl;

  PElm_Map_Module_Tile_Url_Func = ^TElm_Map_Module_Tile_Url_Func;
  TElm_Map_Module_Tile_Url_Func = function(para1: PEvas_Object; para2: longint; para3: longint; para4: longint): pchar; cdecl;

  TElm_Map_Module_Tile_Geo_to_Coord_Func = function(para1: PEvas_Object; para2: longint; para3: double; para4: double; para5: longint;
    para6: Plongint; para7: Plongint): TEina_Bool; cdecl;

  TElm_Map_Module_Tile_Coord_to_Geo_Func = function(para1: PEvas_Object; para2: longint; para3: longint; para4: longint; para5: longint;
    para6: Pdouble; para7: Pdouble): TEina_Bool; cdecl;

  TElm_Map_Module_Tile_Scale_Func = function(para1: PEvas_Object; para2: double; para3: double; para4: longint): double; cdecl;

  PElm_Map_Module_Tile_Copyright_Func = ^TElm_Map_Module_Tile_Copyright_Func;
  TElm_Map_Module_Tile_Copyright_Func = function(para1: PEvas_Object): PEvas_Object; cdecl;

  PElm_Map_Module_Route_Url_Func = ^TElm_Map_Module_Route_Url_Func;
  TElm_Map_Module_Route_Url_Func = function(para1: PEvas_Object; para2: pchar; para3: longint; para4: double; para5: double;
    para6: double; para7: double): pchar; cdecl;

  TElm_Map_Module_Route_Parse_Func = procedure(para1: PElm_Map_Route); cdecl;

  PElm_Map_Module_Name_Url_Func = ^TElm_Map_Module_Name_Url_Func;
  TElm_Map_Module_Name_Url_Func = function(para1: PEvas_Object; para2: longint; para3: pchar; para4: double; para5: double): pchar; cdecl;

  TElm_Map_Module_Name_Parse_Func = procedure(n: PElm_Map_Name); cdecl;

  TElm_Map_Module_Name_List_Parse_Func = procedure(nl: PElm_Map_Name_List); cdecl;

  TSource_Tile = record
    name: PEina_Stringshare;
    zoom_min: longint;
    zoom_max: longint;
    url_cb: TElm_Map_Module_Tile_Url_Func;
    geo_to_coord: TElm_Map_Module_Tile_Geo_to_Coord_Func;
    coord_to_geo: TElm_Map_Module_Tile_Coord_to_Geo_Func;
    scale_cb: TElm_Map_Module_Tile_Scale_Func;
    copyright_cb: TElm_Map_Module_Tile_Copyright_Func;
  end;
  PSource_Tile = ^TSource_Tile;

  TSource_Route = record
    name: PEina_Stringshare;
    url_cb: TElm_Map_Module_Route_Url_Func;
    route_parse_cb: TElm_Map_Module_Route_Parse_Func;
  end;
  PSource_Route = ^TSource_Route;

  TSource_Name = record
    name: PEina_Stringshare;
    url_cb: TElm_Map_Module_Name_Url_Func;
    name_parse_cb: TElm_Map_Module_Name_Parse_Func;
    name_list_parse_cb: TElm_Map_Module_Name_List_Parse_Func;
  end;
  PSource_Name = ^TSource_Name;

  TOverlay_Group = bitpacked record
    wsd: PElm_Map_Data;
    lon: double;
    lat: double;
    overlay: PElm_Map_Overlay;
    klass: PElm_Map_Overlay;
    ovl: POverlay_Default;
    members: PEina_List;
    in_: 0..1;
    boss: 0..1;
  end;
  POverlay_Group = ^TOverlay_Group;

  TOverlay_Default = record
    wsd: PElm_Map_Data;
    w: TEvas_Coord;
    h: TEvas_Coord;
    lon: double;
    lat: double;
    x: TEvas_Coord;
    y: TEvas_Coord;
    content: PEvas_Object;
    icon: PEvas_Object;
    c: TColor;
    clas_content: PEvas_Object;
    clas_icon: PEvas_Object;
    layout: PEvas_Object;
  end;

  TOverlay_Class = record
    wsd: PElm_Map_Data;
    members: PEina_List;
    zoom_max: longint;
    content: PEvas_Object;
    icon: PEvas_Object;
  end;
  POverlay_Class = ^TOverlay_Class;

  TOverlay_Bubble = record
    wsd: PElm_Map_Data;
    pobj: PEvas_Object;
    obj: PEvas_Object;
    sc: PEvas_Object;
    bx: PEvas_Object;
    lon: double;
    lat: double;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
  end;
  POverlay_Bubble = ^TOverlay_Bubble;

  TOverlay_Route = record
    wsd: PElm_Map_Data;
    obj: PEvas_Object;
    paths: PEina_List;
    nodes: PEina_List;
  end;
  POverlay_Route = ^TOverlay_Route;

  TOverlay_Line = record
    wsd: PElm_Map_Data;
    flon: double;
    flat: double;
    tlon: double;
    tlat: double;
    obj: PEvas_Object;
  end;
  POverlay_Line = ^TOverlay_Line;

  TOverlay_Polygon = record
    wsd: PElm_Map_Data;
    regions: PEina_List;
    obj: PEvas_Object;
  end;
  POverlay_Polygon = ^TOverlay_Polygon;

  TOverlay_Circle = record
    wsd: PElm_Map_Data;
    lon: double;
    lat: double;
    radius: double;
    ratio: double;
    obj: PEvas_Object;
  end;
  POverlay_Circle = ^TOverlay_Circle;

  TOverlay_Scale = record
    wsd: PElm_Map_Data;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    obj: PEvas_Object;
  end;
  POverlay_Scale = ^TOverlay_Scale;

  TElm_Map_Overlay = bitpacked record
    wsd: PElm_Map_Data;
    zoom_min: TEvas_Coord;
    c: TColor;
    data: pointer;
    _type: TElm_Map_Overlay_Type;
    ovl: pointer;
    cb: TElm_Map_Overlay_Get_Cb;
    cb_data: pointer;
    del_cb: TElm_Map_Overlay_Del_Cb;
    del_cb_data: pointer;
    grp: POverlay_Group;
    visible: 0..1;
    paused: 0..1;
    hide: 0..1;
  end;
  PElm_Map_Overlay = ^TElm_Map_Overlay;

  PPath_Node = ^TPath_Node;
  PPath_Waypoint = ^TPath_Waypoint;

  TElm_Map_Route = record
    wsd: PElm_Map_Data;
    fname: pchar;
    _type: TElm_Map_Route_Type;
    method: TElm_Map_Route_Method;
    flon: double;
    flat: double;
    tlon: double;
    tlat: double;
    cb: TElm_Map_Route_Cb;
    data: pointer;
    job: PEcore_File_Download_Job;
    nodes: PEina_List;
    waypoint: PEina_List;
    info: record
      node_count: longint;
      waypoint_count: longint;
      nodes: pchar;
      waypoints: pchar;
      distance: double;
    end;
    n: PPath_Node;
    w: PPath_Waypoint;
  end;
  PElm_Map_Route = ^TElm_Map_Route;

  TPath_Node = record
    wsd: PElm_Map_Data;
    idx: longint;
    pos: record
      lon: double;
      lat: double;
      address: pchar;
    end;
  end;

  TPath_Waypoint = record
    wsd: PElm_Map_Data;
    point: pchar;
  end;

  TElm_Map_Name = record
    wsd: PElm_Map_Data;
    method: longint;
    address: pchar;
    lon: double;
    lat: double;
    fname: pchar;
    job: PEcore_File_Download_Job;
    cb: TElm_Map_Name_Cb;
    data: pointer;
  end;
  PElm_Map_Name = ^TElm_Map_Name;

  TElm_Map_Name_List = record
    wsd: PElm_Map_Data;
    names: PEina_List;
    lon: double;
    lat: double;
    fname: pchar;
    job: PEcore_File_Download_Job;
    cb: TElm_Map_Name_List_Cb;
    data: pointer;
  end;

  TRoute_Dump = record
    id: longint;
    fname: pchar;
    distance: double;
    description: pchar;
    coordinates: pchar;
  end;
  PRoute_Dump = ^TRoute_Dump;

  TName_Dump = record
    id: longint;
    address: pchar;
    lon: double;
    lat: double;
  end;
  PName_Dump = ^TName_Dump;

  TGrid = record
    wsd: PElm_Map_Data;
    zoom: longint;
    tw: longint;
    th: longint;
    grid: PEina_Matrixsparse;
  end;
  PGrid = ^TGrid;

  TGrid_Item = bitpacked record
    g: PGrid;
    wsd: PElm_Map_Data;
    img: PEvas_Object;
    file_: pchar;
    url: pchar;
    x: longint;
    y: longint;
    job: PEcore_File_Download_Job;
    file_have: 0..1;
  end;
  PGrid_Item = ^TGrid_Item;

  TCalc_Job = bitpacked record
    zoom: double;
    zoom_mode_set: procedure(sd: PElm_Map_Data; zoom: double); cdecl;
    bring_in: 0..1;
    lon: double;
    lat: double;
    region_show_bring_in: procedure(sd: PElm_Map_Data; lon: double; lat: double; bring_in: TEina_Bool); cdecl;
    overlays: PEina_List;
    overlays_show: procedure(sd: PElm_Map_Data; overlays: PEina_List); cdecl;
  end;
  PCalc_Job = ^TCalc_Job;

  TElm_Map_Data = bitpacked record
    hit_rect: PEvas_Object;
    pan_obj: PEvas_Object;
    g_layer: PEvas_Object;
    obj: PEvas_Object;
    sep_maps_overlays: PEvas_Object;
    map: PEvas_Map;
    src_mods: PEina_Array;
    src_tile: PSource_Tile;
    src_tiles: PEina_List;
    src_tile_names: ^pchar;
    src_route: PSource_Route;
    src_routes: PEina_List;
    src_route_names: ^pchar;
    src_name: PSource_Name;
    src_names: PEina_List;
    src_name_names: ^pchar;
    grids: PEina_List;
    zoom_min: longint;
    zoom_max: longint;
    tsize: longint;
    id: longint;
    zoom: longint;
    zoom_detail: double;
    size: record
      w: longint;
      h: longint;
      tile: longint;
    end;
    mode: TEfl_Ui_Zoom_Mode;
    ani: record
      zoom: double;
      zoom_diff: double;
      lon: double;
      lat: double;
      lon_diff: double;
      lat_diff: double;
      zoom_cnt: longint;
      region_cnt: longint;
    end;
    zoom_timer: PEcore_Timer;
    loaded_timer: PEcore_Timer;
    try_num: longint;
    finish_num: longint;
    download_num: longint;
    download_list: PEina_List;
    download_idler: PEcore_Idler;
    ua: PEina_Hash;
    user_agent: pchar;
    pan_x: TEvas_Coord;
    pan_y: TEvas_Coord;
    scr_timer: PEcore_Timer;
    long_timer: PEcore_Timer;
    ev: TEvas_Event_Mouse_Down;
    pinch_zoom: double;
    rotate: record
      cx: TEvas_Coord;
      cy: TEvas_Coord;
      a: double;
      d: double;
    end;
    routes: PEina_List;
    track: PEina_List;
    names: PEina_List;
    overlays: PEina_List;
    group_overlays: PEina_List;
    all_overlays: PEina_List;
    wheel_disabled: 0..1;
    on_hold: 0..1;
    paused: 0..1;
    zoom_animator: 0..1;
    calc_job: TCalc_Job;
    copyright: PEvas_Object;
  end;


  // === Konventiert am: 26-5-25 17:32:04 ===


implementation


end.
