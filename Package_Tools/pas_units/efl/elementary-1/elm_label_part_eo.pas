unit elm_label_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Label_Part = ^TElm_Label_Part;
  TElm_Label_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_LABEL_PART_CLASS: PEfl_Class;

function elm_label_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 13:41:33 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_LABEL_PART_CLASS: PEfl_Class;
begin
  ELM_LABEL_PART_CLASS := elm_label_part_class_get;
end;
{$endif}


end.
