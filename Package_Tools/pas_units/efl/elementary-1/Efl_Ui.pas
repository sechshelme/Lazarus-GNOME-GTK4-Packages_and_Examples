unit Efl_Ui;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, efl_ui_focus_manager_eo, efl_ui_win_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  _efl_startup_time: double; cvar;external libelementary;
  EFL_UI_THEME_APPLY_ERROR_NONE: TEina_Error; cvar;external libelementary;

type
  PEfl_Ui_Focus_Manager = ^TEfl_Ui_Focus_Manager;
  TEfl_Ui_Focus_Manager = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_focus_relation_free(rel: PEfl_Ui_Focus_Relations); cdecl; external libelementary;
procedure efl_ui_win_autodel_set(obj: PEfl_Ui_Win; autodel: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_autodel_get(obj: PEfl_Ui_Win): TEina_Bool; cdecl; external libelementary;
{$endif}

type
  TContext_Item_Clicked_Cb = procedure(data: pointer; obj: PEo; event_info: pointer); cdecl;

type
  PEfl_Ui_Spotlight_Manager = ^TEfl_Ui_Spotlight_Manager;
  TEfl_Ui_Spotlight_Manager = TEo;

  PEfl_Ui_Spotlight_Indicator = ^TEfl_Ui_Spotlight_Indicator;
  TEfl_Ui_Spotlight_Indicator = TEo;

function elm_init(argc: longint; argv: PPchar): longint; cdecl; external libelementary;
function elm_shutdown: longint; cdecl; external libelementary;

// === Konventiert am: 27-5-25 19:20:59 ===


implementation



end.
