{$IFDEF read_interface}


type
  PElm_Naviframe_Part = ^TElm_Naviframe_Part;
  TElm_Naviframe_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_NAVIFRAME_PART_CLASS: PEfl_Class;

function elm_naviframe_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 19:36:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_NAVIFRAME_PART_CLASS: PEfl_Class;
begin
  ELM_NAVIFRAME_PART_CLASS := elm_naviframe_part_class_get;
end;


{$ENDIF read_implementation}
