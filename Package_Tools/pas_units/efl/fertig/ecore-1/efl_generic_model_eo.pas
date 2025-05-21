unit efl_generic_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Generic_Model = ^TEfl_Generic_Model;
  TEfl_Generic_Model = TEo;

function EFL_GENERIC_MODEL_CLASS: PEfl_Class;

function efl_generic_model_class_get: PEfl_Class; cdecl; external libecore;

// === Konventiert am: 21-5-25 17:19:05 ===


implementation


function EFL_GENERIC_MODEL_CLASS: PEfl_Class;
begin
  EFL_GENERIC_MODEL_CLASS := efl_generic_model_class_get;
end;


end.
