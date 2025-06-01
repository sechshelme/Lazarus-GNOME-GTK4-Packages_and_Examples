{$IFDEF read_interface}


type
  PElm_Dayselector_Part = ^TElm_Dayselector_Part;
  TElm_Dayselector_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_DAYSELECTOR_PART_CLASS: PEfl_Class;

function elm_dayselector_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:59:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_DAYSELECTOR_PART_CLASS: PEfl_Class;
begin
  ELM_DAYSELECTOR_PART_CLASS := elm_dayselector_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
