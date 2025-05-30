{$IFDEF read_interface}


type
  PElm_Popup = ^TElm_Popup;
  TElm_Popup = TEo;

type
  PElm_Popup_Orient = ^TElm_Popup_Orient;
  TElm_Popup_Orient = longint;

const
  ELM_POPUP_ORIENT_TOP = 0;
  ELM_POPUP_ORIENT_CENTER = 1;
  ELM_POPUP_ORIENT_BOTTOM = 2;
  ELM_POPUP_ORIENT_LEFT = 3;
  ELM_POPUP_ORIENT_RIGHT = 4;
  ELM_POPUP_ORIENT_TOP_LEFT = 5;
  ELM_POPUP_ORIENT_TOP_RIGHT = 6;
  ELM_POPUP_ORIENT_BOTTOM_LEFT = 7;
  ELM_POPUP_ORIENT_BOTTOM_RIGHT = 8;
  ELM_POPUP_ORIENT_LAST = 9;

procedure elm_popup_align_set(obj: PElm_Popup; horizontal: double; vertical: double); cdecl; external libelementary;
procedure elm_popup_align_get(obj: PElm_Popup; horizontal: Pdouble; vertical: Pdouble); cdecl; external libelementary;
procedure elm_popup_allow_events_set(obj: PElm_Popup; allow: TEina_Bool); cdecl; external libelementary;
function elm_popup_allow_events_get(obj: PElm_Popup): TEina_Bool; cdecl; external libelementary;
procedure elm_popup_content_text_wrap_type_set(obj: PElm_Popup; wrap: TElm_Wrap_Type); cdecl; external libelementary;
function elm_popup_content_text_wrap_type_get(obj: PElm_Popup): TElm_Wrap_Type; cdecl; external libelementary;
procedure elm_popup_orient_set(obj: PElm_Popup; orient: TElm_Popup_Orient); cdecl; external libelementary;
function elm_popup_orient_get(obj: PElm_Popup): TElm_Popup_Orient; cdecl; external libelementary;
procedure elm_popup_timeout_set(obj: PElm_Popup; timeout: double); cdecl; external libelementary;
function elm_popup_timeout_get(obj: PElm_Popup): double; cdecl; external libelementary;
procedure elm_popup_scrollable_set(obj: PElm_Popup; scroll: TEina_Bool); cdecl; external libelementary;
function elm_popup_scrollable_get(obj: PElm_Popup): TEina_Bool; cdecl; external libelementary;
function elm_popup_item_append(obj: PElm_Popup; _label: pchar; icon: PEfl_Canvas_Object; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_popup_dismiss(obj: PElm_Popup); cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:59:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
