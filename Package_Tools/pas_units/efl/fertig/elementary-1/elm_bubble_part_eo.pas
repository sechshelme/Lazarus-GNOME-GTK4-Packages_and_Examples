unit elm_bubble_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Bubble_Part = ^TElm_Bubble_Part;
  TElm_Bubble_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_BUBBLE_PART_CLASS: PEfl_Class;

function elm_bubble_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:52:56 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_BUBBLE_PART_CLASS: PEfl_Class;
begin
  ELM_BUBBLE_PART_CLASS := elm_bubble_part_class_get;
end;
{$endif}


end.
