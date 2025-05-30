{$IFDEF read_interface}


type
  PElm_Actionslider = ^TElm_Actionslider;
  TElm_Actionslider = TEo;

type
  PElm_Actionslider_Pos = ^TElm_Actionslider_Pos;
  TElm_Actionslider_Pos = longint;

const
  ELM_ACTIONSLIDER_NONE = 0;
  ELM_ACTIONSLIDER_LEFT = 1;
  ELM_ACTIONSLIDER_CENTER = 2;
  ELM_ACTIONSLIDER_RIGHT = 4;
  ELM_ACTIONSLIDER_ALL = 7;

procedure elm_actionslider_indicator_pos_set(obj: PElm_Actionslider; pos: TElm_Actionslider_Pos); cdecl; external libelementary;
function elm_actionslider_indicator_pos_get(obj: PElm_Actionslider): TElm_Actionslider_Pos; cdecl; external libelementary;
procedure elm_actionslider_magnet_pos_set(obj: PElm_Actionslider; pos: TElm_Actionslider_Pos); cdecl; external libelementary;
function elm_actionslider_magnet_pos_get(obj: PElm_Actionslider): TElm_Actionslider_Pos; cdecl; external libelementary;
procedure elm_actionslider_enabled_pos_set(obj: PElm_Actionslider; pos: TElm_Actionslider_Pos); cdecl; external libelementary;
function elm_actionslider_enabled_pos_get(obj: PElm_Actionslider): TElm_Actionslider_Pos; cdecl; external libelementary;
function elm_actionslider_selected_label_get(obj: PElm_Actionslider): pchar; cdecl; external libelementary;

// === Konventiert am: 30-5-25 19:28:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
