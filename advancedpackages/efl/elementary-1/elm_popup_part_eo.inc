{$IFDEF read_interface}


type
  PElm_Popup_Part = ^TElm_Popup_Part;
  TElm_Popup_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_POPUP_PART_CLASS: PEfl_Class;

function elm_popup_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 15:00:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_POPUP_PART_CLASS: PEfl_Class;
begin
  ELM_POPUP_PART_CLASS := elm_popup_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
