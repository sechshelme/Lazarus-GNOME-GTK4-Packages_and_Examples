{$IFDEF read_interface}


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
  PElm_Map_Overlay_Type = ^TElm_Map_Overlay_Type;
  TElm_Map_Overlay_Type = longint;

const
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

type
  PElm_Map_Route_Type = ^TElm_Map_Route_Type;
  TElm_Map_Route_Type = longint;

const
  ELM_MAP_ROUTE_TYPE_MOTOCAR = 0;
  ELM_MAP_ROUTE_TYPE_BICYCLE = 1;
  ELM_MAP_ROUTE_TYPE_FOOT = 2;
  ELM_MAP_ROUTE_TYPE_LAST = 3;

type
  PElm_Map_Route_Method = ^TElm_Map_Route_Method;
  TElm_Map_Route_Method = longint;

const
  ELM_MAP_ROUTE_METHOD_FASTEST = 0;
  ELM_MAP_ROUTE_METHOD_SHORTEST = 1;
  ELM_MAP_ROUTE_METHOD_LAST = 2;

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
  PElm_Map_Overlay = ^TElm_Map_Overlay;
  PElm_Map_Route = ^TElm_Map_Route;
  PElm_Map_Data = ^TElm_Map_Data;
  PElm_Map_Name_List = ^TElm_Map_Name_List;
  POverlay_Default = ^TOverlay_Default;
  PElm_Map_Name = ^TElm_Map_Name;

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

  TElm_Map_Marker = record
  end;
  PElm_Map_Marker = ^TElm_Map_Marker;

  TElm_Map_Marker_Class = record
  end;
  PElm_Map_Marker_Class = ^TElm_Map_Marker_Class;

  TElm_Map_Group_Class = record
  end;
  PElm_Map_Group_Class = ^TElm_Map_Group_Class;

  PElm_Map_Marker_Get_Func = ^TElm_Map_Marker_Get_Func;
  TElm_Map_Marker_Get_Func = function(obj: PEvas_Object; marker: PElm_Map_Marker; data: pointer): PEvas_Object; cdecl;
  TElm_Map_Marker_Del_Func = procedure(obj: PEvas_Object; marker: PElm_Map_Marker; data: pointer; o: PEvas_Object); cdecl;
  PElm_Map_Marker_Icon_Get_Func = ^TElm_Map_Marker_Icon_Get_Func;
  TElm_Map_Marker_Icon_Get_Func = function(obj: PEvas_Object; marker: PElm_Map_Marker; data: pointer): PEvas_Object; cdecl;
  PElm_Map_Group_Icon_Get_Func = ^TElm_Map_Group_Icon_Get_Func;
  TElm_Map_Group_Icon_Get_Func = function(obj: PEvas_Object; data: pointer): PEvas_Object; cdecl;
  TElm_Map_Overlay_Get_Cb = procedure(data: pointer; map: PEvas_Object; overlay: PElm_Map_Overlay); cdecl;
  PElm_Map_Overlay_Get_Cb=^TElm_Map_Overlay_Get_Cb;
  TElm_Map_Overlay_Del_Cb = procedure(data: pointer; map: PEvas_Object; overlay: PElm_Map_Overlay); cdecl;
  TElm_Map_Name_Cb = procedure(data: pointer; map: PEvas_Object; name: PElm_Map_Name); cdecl;
  TElm_Map_Name_List_Cb = procedure(data: pointer; map: PEvas_Object; name_list: PEina_List); cdecl;
  TElm_Map_Route_Cb = procedure(data: pointer; map: PEvas_Object; route: PElm_Map_Route); cdecl;


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

  TOverlay_Group = record
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

  TElm_Map_Overlay = record
  end;

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

  TGrid_Item = record
  end;
  PGrid_Item = ^TGrid_Item;

  TCalc_Job = record
  end;
  PCalc_Job = ^TCalc_Job;

  TElm_Map_Data = record
  end;


  // === Konventiert am: 26-5-25 17:32:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
