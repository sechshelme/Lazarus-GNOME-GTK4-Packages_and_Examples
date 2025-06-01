{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_L10N_INTERFACE: PEfl_Class;
begin
  EFL_UI_L10N_INTERFACE := efl_ui_l10n_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
