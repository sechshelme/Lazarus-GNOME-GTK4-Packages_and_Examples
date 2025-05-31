unit efl_ui_l10n_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_L10n = ^TEfl_Ui_L10n;
  TEfl_Ui_L10n = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_L10N_INTERFACE: PEfl_Class;

function efl_ui_l10n_interface_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_l10n_text_set(obj: PEo; _label: pchar; domain: pchar); cdecl; external libelementary;
function efl_ui_l10n_text_get(obj: PEo; domain: PPchar): pchar; cdecl; external libelementary;
procedure efl_ui_l10n_translation_update(obj: PEo); cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:36:43 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_L10N_INTERFACE: PEfl_Class;
begin
  EFL_UI_L10N_INTERFACE := efl_ui_l10n_interface_get;
end;
{$endif}


end.
