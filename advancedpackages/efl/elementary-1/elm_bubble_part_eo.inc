{$IFDEF read_interface}


type
  PElm_Bubble_Part = ^TElm_Bubble_Part;
  TElm_Bubble_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_BUBBLE_PART_CLASS: PEfl_Class;

function elm_bubble_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:52:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_BUBBLE_PART_CLASS: PEfl_Class;
begin
  ELM_BUBBLE_PART_CLASS := elm_bubble_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
