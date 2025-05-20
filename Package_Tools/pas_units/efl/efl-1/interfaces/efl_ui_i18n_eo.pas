unit efl_ui_i18n_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_I18n = ^TEfl_Ui_I18n;
  TEfl_Ui_I18n = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_I18N_INTERFACE: PEfl_Class;

function efl_ui_i18n_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_mirrored_set(obj: PEo; rtl: TEina_Bool); cdecl; external libefl;
function efl_ui_mirrored_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_ui_mirrored_automatic_set(obj: PEo; automatic: TEina_Bool); cdecl; external libefl;
function efl_ui_mirrored_automatic_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_ui_language_set(obj: PEo; language: pchar); cdecl; external libefl;
function efl_ui_language_get(obj: PEo): pchar; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:30:44 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_I18N_INTERFACE: PEfl_Class;
begin
  EFL_UI_I18N_INTERFACE := efl_ui_i18n_interface_get;
end;
{$endif}


end.
