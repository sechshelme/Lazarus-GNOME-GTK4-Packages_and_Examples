{$IFDEF read_interface}


type
  TElm_Pan_Smart_Data = record
    self: PEvas_Object;
    content: PEvas_Object;
    interface_object: PEvas_Object;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    content_w: TEvas_Coord;
    content_h: TEvas_Coord;
    px: TEvas_Coord;
    py: TEvas_Coord;
  end;
  PElm_Pan_Smart_Data = ^TElm_Pan_Smart_Data;

  TElm_Interface_Scrollable_Cb = procedure(para1: PEvas_Object; data: pointer); cdecl;
  TElm_Interface_Scrollable_Min_Limit_Cb = procedure(obj: PEvas_Object; w: TEina_Bool; h: TEina_Bool); cdecl;
  TElm_Interface_Scrollable_Resize_Cb = procedure(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl;

type
  TElm_Scrollable_Smart_Interface_Data = record
  end;
  PElm_Scrollable_Smart_Interface_Data = ^TElm_Scrollable_Smart_Interface_Data;


{$ifdef EFL_BETA_API_SUPPORT}
procedure elm_pan_gravity_set(para1: PElm_Pan; x: double; para3: double); cdecl; external libelementary; deprecated;
procedure elm_pan_gravity_get(para1: PElm_Pan; para2: Pdouble; para3: Pdouble); cdecl; external libelementary; deprecated;
{$endif}

// === Konventiert am: 25-5-25 19:56:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
