{$IFDEF read_interface}


type
  PElm_Scroller_Part = ^TElm_Scroller_Part;
  TElm_Scroller_Part = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function ELM_SCROLLER_PART_CLASS: PEfl_Class;

function elm_scroller_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 15:10:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_SCROLLER_PART_CLASS: PEfl_Class;
begin
  ELM_SCROLLER_PART_CLASS := elm_scroller_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
