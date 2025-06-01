unit efl_ui_layout_base_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Layout_Base = ^TEfl_Ui_Layout_Base;
  TEfl_Ui_Layout_Base = TEo;

function EFL_UI_LAYOUT_BASE_CLASS: PEfl_Config;

function efl_ui_layout_base_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_layout_finger_size_multiplier_set(obj: PEo; multiplier_x: dword; multiplier_y: dword); cdecl; external libelementary;
procedure efl_ui_layout_finger_size_multiplier_get(obj: PEo; multiplier_x: Pdword; multiplier_y: Pdword); cdecl; external libelementary;
function efl_ui_layout_theme_set(obj: PEo; klass: pchar; group: pchar; style: pchar): TEina_Error; cdecl; external libelementary;
procedure efl_ui_layout_theme_get(obj: PEo; klass: PPchar; group: PPchar; style: PPchar); cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_layout_automatic_theme_rotation_set(obj: PEo; automatic: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_layout_automatic_theme_rotation_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_layout_theme_rotation_apply(obj: PEo; orientation: longint); cdecl; external libelementary;
{$endif}

function efl_ui_layout_theme_version_get(obj: PEo): longint; cdecl; external libelementary;

var
  _EFL_UI_LAYOUT_EVENT_THEME_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_LAYOUT_EVENT_THEME_CHANGED: PEfl_Event_Description;


// === Konventiert am: 28-5-25 17:40:19 ===


implementation


function EFL_UI_LAYOUT_BASE_CLASS: PEfl_Config;
begin
  EFL_UI_LAYOUT_BASE_CLASS := efl_ui_layout_base_class_get;
end;

function EFL_UI_LAYOUT_EVENT_THEME_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_LAYOUT_EVENT_THEME_CHANGED := @(_EFL_UI_LAYOUT_EVENT_THEME_CHANGED);
end;


end.
