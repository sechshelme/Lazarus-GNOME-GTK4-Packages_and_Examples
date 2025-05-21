unit efl_loop_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Model = ^TEfl_Loop_Model;
  TEfl_Loop_Model = TEo;

function EFL_LOOP_MODEL_CLASS: PEfl_Class;

function efl_loop_model_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_loop_model_volatile_make(obj: PEo); cdecl; external libecore;

// === Konventiert am: 21-5-25 17:03:10 ===


implementation


function EFL_LOOP_MODEL_CLASS: PEfl_Class;
begin
  EFL_LOOP_MODEL_CLASS := efl_loop_model_class_get;
end;


end.
