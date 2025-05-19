unit efl_ui_scrollbar_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Scrollbar = ^TEfl_Ui_Scrollbar;
  TEfl_Ui_Scrollbar = TEo;

type
  PEfl_Ui_Scrollbar_Mode = ^TEfl_Ui_Scrollbar_Mode;
  TEfl_Ui_Scrollbar_Mode = longint;

const
  EFL_UI_SCROLLBAR_MODE_AUTO = 0;
  EFL_UI_SCROLLBAR_MODE_ON = 1;
  EFL_UI_SCROLLBAR_MODE_OFF = 2;
  EFL_UI_SCROLLBAR_MODE_LAST = 3;

function EFL_UI_SCROLLBAR_INTERFACE: PEfl_Class;

function efl_ui_scrollbar_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_scrollbar_bar_mode_set(obj: PEo; hbar: TEfl_Ui_Scrollbar_Mode; vbar: TEfl_Ui_Scrollbar_Mode); cdecl; external libefl;
procedure efl_ui_scrollbar_bar_mode_get(obj: PEo; hbar: PEfl_Ui_Scrollbar_Mode; vbar: PEfl_Ui_Scrollbar_Mode); cdecl; external libefl;
procedure efl_ui_scrollbar_bar_size_get(obj: PEo; width: Pdouble; height: Pdouble); cdecl; external libefl;
procedure efl_ui_scrollbar_bar_position_set(obj: PEo; posx: double; posy: double); cdecl; external libefl;
procedure efl_ui_scrollbar_bar_position_get(obj: PEo; posx: Pdouble; posy: Pdouble); cdecl; external libefl;
procedure efl_ui_scrollbar_bar_visibility_get(obj: PEo; hbar: PEina_Bool; vbar: PEina_Bool); cdecl; external libefl;
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_scrollbar_bar_visibility_update(obj: PEo); cdecl; external libefl;
{$endif}
var
  _EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_SCROLLBAR_EVENT_BAR_SHOW: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_SCROLLBAR_EVENT_BAR_HIDE: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED: PEfl_Event_Description;
function EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED: PEfl_Event_Description;
function EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED: PEfl_Event_Description;
function EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED: PEfl_Event_Description;
function EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED: PEfl_Event_Description;
function EFL_UI_SCROLLBAR_EVENT_BAR_SHOW: PEfl_Event_Description;
function EFL_UI_SCROLLBAR_EVENT_BAR_HIDE: PEfl_Event_Description;

// === Konventiert am: 19-5-25 19:23:33 ===


implementation



function EFL_UI_SCROLLBAR_INTERFACE: PEfl_Class;
begin
  EFL_UI_SCROLLBAR_INTERFACE := efl_ui_scrollbar_interface_get;
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED := @(_EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED);
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED := @(_EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED);
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED := @(_EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED);
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED := @(_EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED);
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED := @(_EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED);
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_SHOW: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_SHOW := @(_EFL_UI_SCROLLBAR_EVENT_BAR_SHOW);
end;

function EFL_UI_SCROLLBAR_EVENT_BAR_HIDE: PEfl_Event_Description;
begin
  EFL_UI_SCROLLBAR_EVENT_BAR_HIDE := @(_EFL_UI_SCROLLBAR_EVENT_BAR_HIDE);
end;


end.
