unit Efl_MVVM_Common;

interface

uses
  ctypes, efl, fp_eina, efl_model_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  EFL_MODEL_ERROR_UNKNOWN: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_NOT_SUPPORTED: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_NOT_FOUND: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_READ_ONLY: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_INIT_FAILED: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_INCORRECT_VALUE: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_PERMISSION_DENIED: TEina_Error; cvar;external libefl;
  EFL_MODEL_ERROR_INVALID_OBJECT: TEina_Error; cvar;external libefl;
  EFL_PROPERTY_ERROR_INVALID_KEY: TEina_Error; cvar;external libefl;
  EFL_FACTORY_ERROR_NOT_SUPPORTED: TEina_Error; cvar;external libefl;

function efl_model_init: longint; cdecl; external libefl;

procedure _efl_model_properties_changed_internal(model: PEfl_Model; args: array of const); cdecl; external libefl;
procedure _efl_model_properties_changed_internal(model: PEfl_Model); cdecl; external libefl;
procedure efl_model_property_invalidated_notify(model: PEfl_Model; _property: pchar); cdecl; external libefl;

type
  TEfl_Model_Value_Struct_Member_Setup_Cb = procedure(data: pointer; index: longint; member: PEina_Value_Struct_Member); cdecl;

function efl_model_value_struct_description_new(member_count: dword; setup_cb: TEfl_Model_Value_Struct_Member_Setup_Cb; data: pointer): PEina_Value_Struct_Desc; cdecl; external libefl;
procedure efl_model_value_struct_description_free(desc: PEina_Value_Struct_Desc); cdecl; external libefl;

// === Konventiert am: 18-5-25 17:38:53 ===


implementation



end.
