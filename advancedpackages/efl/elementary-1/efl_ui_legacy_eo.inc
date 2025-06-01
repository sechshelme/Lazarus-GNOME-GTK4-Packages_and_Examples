{$IFDEF read_interface}


type
  PEfl_Ui_Legacy = ^TEfl_Ui_Legacy;
  TEfl_Ui_Legacy = TEo;


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LEGACY_INTERFACE: PEfl_Class;

function efl_ui_legacy_interface_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LEGACY_INTERFACE: PEfl_Class;
begin
  EFL_UI_LEGACY_INTERFACE := efl_ui_legacy_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
