{$IFDEF read_interface}


type
  PElm_Multibuttonentry_Part = ^TElm_Multibuttonentry_Part;
  TElm_Multibuttonentry_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_MULTIBUTTONENTRY_PART_CLASS: PEfl_Class;

function elm_multibuttonentry_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 17:00:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_MULTIBUTTONENTRY_PART_CLASS: PEfl_Class;
begin
  ELM_MULTIBUTTONENTRY_PART_CLASS := elm_multibuttonentry_part_class_get;
end;


{$ENDIF read_implementation}
