unit elm_dayselector_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Dayselector_Part = ^TElm_Dayselector_Part;
  TElm_Dayselector_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_DAYSELECTOR_PART_CLASS: PEfl_Class;

function elm_dayselector_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:59:27 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_DAYSELECTOR_PART_CLASS: PEfl_Class;
begin
  ELM_DAYSELECTOR_PART_CLASS := elm_dayselector_part_class_get;
end;
{$endif}


end.
