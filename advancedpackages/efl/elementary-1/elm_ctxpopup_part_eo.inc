{$IFDEF read_interface}


type
  PElm_Ctxpopup_Part = ^TElm_Ctxpopup_Part;
  TElm_Ctxpopup_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_CTXPOPUP_PART_CLASS: PEfl_Class;

function elm_ctxpopup_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 16:37:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_CTXPOPUP_PART_CLASS: PEfl_Class;
begin
  ELM_CTXPOPUP_PART_CLASS := elm_ctxpopup_part_class_get;
end;


{$ENDIF read_implementation}
