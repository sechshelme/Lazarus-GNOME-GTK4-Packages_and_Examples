unit efl_container_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Container_Model = ^TEfl_Container_Model;
  TEfl_Container_Model = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CONTAINER_MODEL_CLASS: PEfl_Class;

function efl_container_model_class_get: PEfl_Class; cdecl; external libecore;
function efl_container_model_child_property_value_type_get(obj: PEo; name: pchar): PEina_Value_Type; cdecl; external libecore;
function efl_container_model_child_property_add(obj: PEo; name: pchar; _type: PEina_Value_Type; values: PEina_Iterator): TEina_Bool; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 16:49:07 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CONTAINER_MODEL_CLASS: PEfl_Class;
begin
  EFL_CONTAINER_MODEL_CLASS := efl_container_model_class_get;
end;
{$endif}


end.
