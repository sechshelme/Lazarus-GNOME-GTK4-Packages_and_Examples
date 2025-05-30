{$IFDEF read_interface}


type
  PEfl_Ui_Panel = ^TEfl_Ui_Panel;
  TEfl_Ui_Panel = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Panel_Orient = ^TEfl_Ui_Panel_Orient;
  TEfl_Ui_Panel_Orient = longint;

const
  EFL_UI_PANEL_ORIENT_TOP = 0;
  EFL_UI_PANEL_ORIENT_BOTTOM = 1;
  EFL_UI_PANEL_ORIENT_LEFT = 2;
  EFL_UI_PANEL_ORIENT_RIGHT = 3;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Panel_Scroll_Info = record
    rel_x: double;
    rel_y: double;
  end;
  PEfl_Ui_Panel_Scroll_Info = ^TEfl_Ui_Panel_Scroll_Info;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PANEL_CLASS: PEfl_Config;

function efl_ui_panel_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_panel_orient_set(obj: PEo; orient: TEfl_Ui_Panel_Orient); cdecl; external libelementary;
function efl_ui_panel_orient_get(obj: PEo): TEfl_Ui_Panel_Orient; cdecl; external libelementary;
procedure efl_ui_panel_hidden_set(obj: PEo; hidden: TEina_Bool); cdecl; external libelementary;
function efl_ui_panel_hidden_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_panel_scrollable_set(obj: PEo; scrollable: TEina_Bool); cdecl; external libelementary;
function efl_ui_panel_scrollable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_panel_scrollable_content_size_set(obj: PEo; ratio: double); cdecl; external libelementary;
function efl_ui_panel_scrollable_content_size_get(obj: PEo): double; cdecl; external libelementary;
procedure efl_ui_panel_toggle(obj: PEo); cdecl; external libelementary;

var
  _EFL_UI_PANEL_EVENT_TOGGLED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_PANEL_EVENT_TOGGLED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 30-5-25 15:25:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PANEL_CLASS: PEfl_Config;
begin
  EFL_UI_PANEL_CLASS := efl_ui_panel_class_get;
end;

function EFL_UI_PANEL_EVENT_TOGGLED: PEfl_Event_Description;
begin
  EFL_UI_PANEL_EVENT_TOGGLED := @(_EFL_UI_PANEL_EVENT_TOGGLED);
end;
{$endif}


{$ENDIF read_implementation}
