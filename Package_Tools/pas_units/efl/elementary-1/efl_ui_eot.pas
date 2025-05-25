unit efl_ui_eot;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function efl_ui_theme_apply_error_default_get: TEina_Error; cdecl; external libelementary;
function EFL_UI_THEME_APPLY_ERROR_DEFAULT: TEina_Error;

function efl_ui_theme_apply_error_generic_get: TEina_Error; cdecl; external libelementary;
function EFL_UI_THEME_APPLY_ERROR_GENERIC: TEina_Error;

function efl_ui_theme_apply_error_version_get: TEina_Error; cdecl; external libelementary;
function EFL_UI_THEME_APPLY_ERROR_VERSION: TEina_Error;

type
  PEfl_Ui_Focus_Direction = ^TEfl_Ui_Focus_Direction;
  TEfl_Ui_Focus_Direction = longint;

const
  EFL_UI_FOCUS_DIRECTION_PREVIOUS = 0;
  EFL_UI_FOCUS_DIRECTION_NEXT = 1;
  EFL_UI_FOCUS_DIRECTION_UP = 2;
  EFL_UI_FOCUS_DIRECTION_DOWN = 3;
  EFL_UI_FOCUS_DIRECTION_RIGHT = 4;
  EFL_UI_FOCUS_DIRECTION_LEFT = 5;
  EFL_UI_FOCUS_DIRECTION_LAST = 6;

type
  PEfl_Ui_Focus_Move_Policy = ^TEfl_Ui_Focus_Move_Policy;
  TEfl_Ui_Focus_Move_Policy = longint;

const
  EFL_UI_FOCUS_MOVE_POLICY_CLICK = 0;
  EFL_UI_FOCUS_MOVE_POLICY_MOVE_IN = 1;
  EFL_UI_FOCUS_MOVE_POLICY_KEY_ONLY = 2;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Focus_Autoscroll_Mode = ^TEfl_Ui_Focus_Autoscroll_Mode;
  TEfl_Ui_Focus_Autoscroll_Mode = longint;

const
  EFL_UI_FOCUS_AUTOSCROLL_MODE_SHOW = 0;
  EFL_UI_FOCUS_AUTOSCROLL_MODE_NONE = 1;
  EFL_UI_FOCUS_AUTOSCROLL_MODE_BRING_IN = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Softcursor_Mode = ^TEfl_Ui_Softcursor_Mode;
  TEfl_Ui_Softcursor_Mode = longint;

const
  EFL_UI_SOFTCURSOR_MODE_AUTO = 0;
  EFL_UI_SOFTCURSOR_MODE_ON = 1;
  EFL_UI_SOFTCURSOR_MODE_OFF = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Activate = ^TEfl_Ui_Activate;
  TEfl_Ui_Activate = longint;

const
  EFL_UI_ACTIVATE_DEFAULT = 0;
  EFL_UI_ACTIVATE_UP = 1;
  EFL_UI_ACTIVATE_DOWN = 2;
  EFL_UI_ACTIVATE_RIGHT = 3;
  EFL_UI_ACTIVATE_LEFT = 4;
  EFL_UI_ACTIVATE_BACK = 5;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Widget_Orientation_Mode = ^TEfl_Ui_Widget_Orientation_Mode;
  TEfl_Ui_Widget_Orientation_Mode = longint;

const
  EFL_UI_WIDGET_ORIENTATION_MODE_DEFAULT = 0;
  EFL_UI_WIDGET_ORIENTATION_MODE_DISABLED = 1;
  {$endif}

type
  PEfl_Ui_Select_Mode = ^TEfl_Ui_Select_Mode;
  TEfl_Ui_Select_Mode = longint;

const
  EFL_UI_SELECT_MODE_SINGLE = 0;
  EFL_UI_SELECT_MODE_MULTI = 1;
  EFL_UI_SELECT_MODE_NONE = 2;

  // === Konventiert am: 25-5-25 19:21:02 ===


implementation


function EFL_UI_THEME_APPLY_ERROR_DEFAULT: TEina_Error;
begin
  EFL_UI_THEME_APPLY_ERROR_DEFAULT := efl_ui_theme_apply_error_default_get;
end;

function EFL_UI_THEME_APPLY_ERROR_GENERIC: TEina_Error;
begin
  EFL_UI_THEME_APPLY_ERROR_GENERIC := efl_ui_theme_apply_error_generic_get;
end;

function EFL_UI_THEME_APPLY_ERROR_VERSION: TEina_Error;
begin
  EFL_UI_THEME_APPLY_ERROR_VERSION := efl_ui_theme_apply_error_version_get;
end;


end.
