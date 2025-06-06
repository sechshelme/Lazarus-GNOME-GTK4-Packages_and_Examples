unit efl_composite_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Composite_Model = ^TEfl_Composite_Model;
  TEfl_Composite_Model = TEo;

function EFL_COMPOSITE_MODEL_CLASS: PEfl_Class;

function efl_composite_model_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_composite_model_index_set(obj: PEo; index: dword); cdecl; external libecore;
function efl_composite_model_index_get(obj: PEo): dword; cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:04 ===


implementation


function EFL_COMPOSITE_MODEL_CLASS: PEfl_Class;
begin
  EFL_COMPOSITE_MODEL_CLASS := efl_composite_model_class_get;
end;


end.
