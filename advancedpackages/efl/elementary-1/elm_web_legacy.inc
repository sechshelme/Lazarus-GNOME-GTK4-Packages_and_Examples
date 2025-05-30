{$IFDEF read_interface}


type
  PElm_Web_Zoom_Mode = ^TElm_Web_Zoom_Mode;
  TElm_Web_Zoom_Mode = longint;

const
  ELM_WEB_ZOOM_MODE_MANUAL = 0;
  ELM_WEB_ZOOM_MODE_AUTO_FIT = 1;
  ELM_WEB_ZOOM_MODE_AUTO_FILL = 2;
  ELM_WEB_ZOOM_MODE_LAST = 3;

function elm_web_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_web_uri_set(obj: PEvas_Object; uri: pchar): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_web_uri_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_web_zoom_mode_set(obj: PEvas_Object; mode: TElm_Web_Zoom_Mode); cdecl; external libelementary;
function elm_web_zoom_mode_get(obj: PEvas_Object): TElm_Web_Zoom_Mode; cdecl; external libelementary;
procedure elm_web_zoom_set(obj: PEvas_Object; zoom: double); cdecl; external libelementary;
function elm_web_zoom_get(obj: PEvas_Object): double; cdecl; external libelementary;

// === Konventiert am: 30-5-25 14:00:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
