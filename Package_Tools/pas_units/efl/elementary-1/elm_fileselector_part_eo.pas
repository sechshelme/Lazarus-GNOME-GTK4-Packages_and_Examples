unit elm_fileselector_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Fileselector_Part = ^TElm_Fileselector_Part;
  TElm_Fileselector_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FILESELECTOR_PART_CLASS: PEfl_Class;

function elm_fileselector_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:01:56 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FILESELECTOR_PART_CLASS: PEfl_Class;
begin
  ELM_FILESELECTOR_PART_CLASS := elm_fileselector_part_class_get;
end;
{$endif}


end.
