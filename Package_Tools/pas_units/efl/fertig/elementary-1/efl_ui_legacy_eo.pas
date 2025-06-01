unit efl_ui_legacy_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Legacy = ^TEfl_Ui_Legacy;
  TEfl_Ui_Legacy = TEo;


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LEGACY_INTERFACE: PEfl_Class;

function efl_ui_legacy_interface_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:03 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LEGACY_INTERFACE: PEfl_Class;
begin
  EFL_UI_LEGACY_INTERFACE := efl_ui_legacy_interface_get;
end;
{$endif}


end.
