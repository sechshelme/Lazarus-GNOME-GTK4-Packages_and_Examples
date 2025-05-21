unit efl_boolean_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Boolean_Model = ^TEfl_Boolean_Model;
  TEfl_Boolean_Model = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_BOOLEAN_MODEL_CLASS: PEfl_Class;

function efl_boolean_model_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_boolean_model_boolean_add(obj: PEo; name: pchar; default_value: TEina_Bool); cdecl; external libecore;
procedure efl_boolean_model_boolean_del(obj: PEo; name: pchar); cdecl; external libecore;
function efl_boolean_model_boolean_iterator_get(obj: PEo; name: pchar; request: TEina_Bool): PEina_Iterator; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 16:48:57 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_BOOLEAN_MODEL_CLASS: PEfl_Class;
begin
  EFL_BOOLEAN_MODEL_CLASS := efl_boolean_model_class_get;
end;
{$endif}


end.
