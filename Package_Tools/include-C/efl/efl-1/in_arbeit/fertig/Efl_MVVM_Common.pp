
unit Efl_MVVM_Common;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efl_MVVM_Common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efl_MVVM_Common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEfl_Model  = ^Efl_Model;
PEina_Value_Struct_Desc  = ^Eina_Value_Struct_Desc;
PEina_Value_Struct_Member  = ^Eina_Value_Struct_Member;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_MODEL_COMMON_H__}
{$define EFL_MODEL_COMMON_H__}
{$include <Eina.h>}
  var
    EFL_MODEL_ERROR_UNKNOWN : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_NOT_SUPPORTED : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_NOT_FOUND : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_READ_ONLY : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_INIT_FAILED : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_INCORRECT_VALUE : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_PERMISSION_DENIED : TEina_Error;cvar;external;
    EFL_MODEL_ERROR_INVALID_OBJECT : TEina_Error;cvar;external;
{*< @since 1.19  }
    EFL_PROPERTY_ERROR_INVALID_KEY : TEina_Error;cvar;external;
{*< Returned when the given key during a efl_ui_property_bind does not exist on the object.  }
    EFL_FACTORY_ERROR_NOT_SUPPORTED : TEina_Error;cvar;external;
{*< Returned error when factory got a request that it can't fullfil due to a set of unsupported parameters @since 1.22  }
{$include "interfaces/efl_model.eo.h"}

function efl_model_init:longint;cdecl;external;
{*
 * @brief Notifies a property changed event with an @c EFL_MODEL_EVENT_PROPERTIES_CHANGED
 *
 * @param model The model to be notified
 * @param property The changed property
 *
 * @since 1.17
  }
(* Const before type ignored *)
procedure _efl_model_properties_changed_internal(model:PEfl_Model; args:array of const);cdecl;external;
procedure _efl_model_properties_changed_internal(model:PEfl_Model);cdecl;external;
{*
 * @brief Notifies a property invalidated event with an @c EFL_MODEL_EVENT_PROPERTIES_CHANGED
 *
 * @param model The model to be notified
 * @param property The invalidated property
 *
 * @since 1.17
  }
(* Const before type ignored *)
procedure efl_model_property_invalidated_notify(model:PEfl_Model; _property:Pchar);cdecl;external;
{*
 * @brief Callback to setup a member of @c Eina_Value_Struct
 *
 * @param data The user data
 * @param index The member index
 * @param member The member to fill its name and type. Must use @c Eina_Stringshare for name.
  }
type

  TEfl_Model_Value_Struct_Member_Setup_Cb = procedure (data:pointer; index:longint; member:PEina_Value_Struct_Member);cdecl;
{*
 * @brief Creates a new struct description
 *
 * @param member_count The number of struct members
 * @param setup_cb The callback to setup struct members
 * @param data The user data
 * @return Returns the struct description
 *
 * @since 1.17
  }

function efl_model_value_struct_description_new(member_count:dword; setup_cb:TEfl_Model_Value_Struct_Member_Setup_Cb; data:pointer):PEina_Value_Struct_Desc;cdecl;external;
{*
 * @brief Frees the memory allocated to the struct description.
 *
 * @param desc The struct description. If @c NULL, the function returns immediately.
 *
 * @since 1.17
  }
procedure efl_model_value_struct_description_free(desc:PEina_Value_Struct_Desc);cdecl;external;
{$endif}

implementation


end.
