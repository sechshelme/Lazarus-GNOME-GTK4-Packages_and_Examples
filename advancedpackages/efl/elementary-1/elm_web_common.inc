{$IFDEF read_interface}


type
  TElm_Web_Frame_Load_Error = record
    code: longint;
    is_cancellation: TEina_Bool;
    domain: pchar;
    description: pchar;
    failing_url: pchar;
    frame: PEvas_Object;
  end;
  PElm_Web_Frame_Load_Error = ^TElm_Web_Frame_Load_Error;

type
  PElm_Web_Menu_Item_Type = ^TElm_Web_Menu_Item_Type;
  TElm_Web_Menu_Item_Type = longint;

const
  ELM_WEB_MENU_SEPARATOR = 0;
  ELM_WEB_MENU_GROUP = 1;
  ELM_WEB_MENU_OPTION = 2;

type
  TElm_Web_Menu_Item = record
    text: pchar;
    _type: TElm_Web_Menu_Item_Type;
  end;
  PElm_Web_Menu_Item = ^TElm_Web_Menu_Item;

  TElm_Web_Menu = bitpacked record
    items: PEina_List;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    handled: 0..1;
  end;
  PElm_Web_Menu = ^TElm_Web_Menu;

type
  TElm_Web_Download = record
    url: pchar;
  end;
  PElm_Web_Download = ^TElm_Web_Download;

  TElm_Web_Window_Features = record
  end;
  PElm_Web_Window_Features = ^TElm_Web_Window_Features;

type
  PElm_Web_Window_Feature_Flag = ^TElm_Web_Window_Feature_Flag;
  TElm_Web_Window_Feature_Flag = longint;

const
  ELM_WEB_WINDOW_FEATURE_TOOLBAR = 0;
  ELM_WEB_WINDOW_FEATURE_STATUSBAR = 1;
  ELM_WEB_WINDOW_FEATURE_SCROLLBARS = 2;
  ELM_WEB_WINDOW_FEATURE_MENUBAR = 3;
  ELM_WEB_WINDOW_FEATURE_LOCATIONBAR = 4;
  ELM_WEB_WINDOW_FEATURE_FULLSCREEN = 5;

type
  PElm_Web_Window_Open = ^TElm_Web_Window_Open;
  TElm_Web_Window_Open = function(data: pointer; obj: PEvas_Object; js: TEina_Bool; window_features: PElm_Web_Window_Features): PEvas_Object; cdecl;

  PElm_Web_Dialog_Alert = ^TElm_Web_Dialog_Alert;
  TElm_Web_Dialog_Alert = function(data: pointer; obj: PEvas_Object; message: pchar): PEvas_Object; cdecl;

  PElm_Web_Dialog_Confirm = ^TElm_Web_Dialog_Confirm;
  TElm_Web_Dialog_Confirm = function(data: pointer; obj: PEvas_Object; message: pchar; ret: PEina_Bool): PEvas_Object; cdecl;

  PElm_Web_Dialog_Prompt = ^TElm_Web_Dialog_Prompt;
  TElm_Web_Dialog_Prompt = function(data: pointer; obj: PEvas_Object; message: pchar; def_value: pchar; value: PPchar;
    ret: PEina_Bool): PEvas_Object; cdecl;

  PElm_Web_Dialog_File_Selector = ^TElm_Web_Dialog_File_Selector;
  TElm_Web_Dialog_File_Selector = function(data: pointer; obj: PEvas_Object; allows_multiple: TEina_Bool; accept_types: PEina_List; selected: PPEina_List;
    ret: PEina_Bool): PEvas_Object; cdecl;

  TElm_Web_Console_Message = procedure(data: pointer; obj: PEvas_Object; message: pchar; line_number: dword; source_id: pchar); cdecl;

function elm_web_window_features_property_get(wf: PElm_Web_Window_Features; flag: TElm_Web_Window_Feature_Flag): TEina_Bool; cdecl; external libelementary;
procedure elm_web_window_features_region_get(wf: PElm_Web_Window_Features; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;
procedure elm_web_window_features_ref(wf: PElm_Web_Window_Features); cdecl; external libelementary;
procedure elm_web_window_features_unref(wf: PElm_Web_Window_Features); cdecl; external libelementary;

// === Konventiert am: 26-5-25 15:28:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
