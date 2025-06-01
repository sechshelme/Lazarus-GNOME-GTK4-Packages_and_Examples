unit elm_multibuttonentry_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Multibuttonentry_Part = ^TElm_Multibuttonentry_Part;
  TElm_Multibuttonentry_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_MULTIBUTTONENTRY_PART_CLASS: PEfl_Class;

function elm_multibuttonentry_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 17:00:04 ===


implementation


function ELM_MULTIBUTTONENTRY_PART_CLASS: PEfl_Class;
begin
  ELM_MULTIBUTTONENTRY_PART_CLASS := elm_multibuttonentry_part_class_get;
end;


end.
