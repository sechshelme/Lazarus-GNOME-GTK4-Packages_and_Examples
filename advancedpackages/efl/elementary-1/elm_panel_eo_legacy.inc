{$IFDEF read_interface}


type
  PElm_Panel = ^TElm_Panel;
  TElm_Panel = TEo;

type
  PElm_Panel_Orient = ^TElm_Panel_Orient;
  TElm_Panel_Orient = longint;

const
  ELM_PANEL_ORIENT_TOP = 0;
  ELM_PANEL_ORIENT_BOTTOM = 1;
  ELM_PANEL_ORIENT_LEFT = 2;
  ELM_PANEL_ORIENT_RIGHT = 3;

procedure elm_panel_orient_set(obj: PElm_Panel; orient: TElm_Panel_Orient); cdecl; external libelementary;
function elm_panel_orient_get(obj: PElm_Panel): TElm_Panel_Orient; cdecl; external libelementary;
procedure elm_panel_hidden_set(obj: PElm_Panel; hidden: TEina_Bool); cdecl; external libelementary;
function elm_panel_hidden_get(obj: PElm_Panel): TEina_Bool; cdecl; external libelementary;
procedure elm_panel_scrollable_set(obj: PElm_Panel; scrollable: TEina_Bool); cdecl; external libelementary;
function elm_panel_scrollable_get(obj: PElm_Panel): TEina_Bool; cdecl; external libelementary;
procedure elm_panel_scrollable_content_size_set(obj: PElm_Panel; ratio: double); cdecl; external libelementary;
function elm_panel_scrollable_content_size_get(obj: PElm_Panel): double; cdecl; external libelementary;
procedure elm_panel_toggle(obj: PElm_Panel); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:54:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
