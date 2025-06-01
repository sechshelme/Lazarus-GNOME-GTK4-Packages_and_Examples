{$IFDEF read_interface}


type
  PElm_Actionslider_Part = ^TElm_Actionslider_Part;
  TElm_Actionslider_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_ACTIONSLIDER_PART_CLASS: PEfl_Class;

function elm_actionslider_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:53:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_ACTIONSLIDER_PART_CLASS: PEfl_Class;
begin
  ELM_ACTIONSLIDER_PART_CLASS := elm_actionslider_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
