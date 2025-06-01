{$IFDEF read_interface}


type
  PElm_Hover_Part = ^TElm_Hover_Part;
  TElm_Hover_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_HOVER_PART_CLASS: PEfl_Class;

function elm_hover_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 13:32:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_HOVER_PART_CLASS: PEfl_Class;
begin
  ELM_HOVER_PART_CLASS := elm_hover_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
