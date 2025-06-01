unit elm_flip_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Flip_Part = ^TElm_Flip_Part;
  TElm_Flip_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FLIP_PART_CLASS: PEfl_Class;

function elm_flip_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 12:57:30 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FLIP_PART_CLASS: PEfl_Class;
begin
  // Nicht in *.so Aufindbar.
//  ELM_FLIP_PART_CLASS := elm_flip_part_class_get;
end;
{$endif}


end.
