
unit eldbus_model_method_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_method_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_method_eo.h
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
PEfl_Class  = ^Efl_Class;
PEldbus_Introspection_Method  = ^Eldbus_Introspection_Method;
PEldbus_Model_Method  = ^Eldbus_Model_Method;
PEldbus_Proxy  = ^Eldbus_Proxy;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_METHOD_EO_H_}
{$define _ELDBUS_MODEL_METHOD_EO_H_}
{$ifndef _ELDBUS_MODEL_METHOD_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_METHOD_EO_CLASS_TYPE}
type
  PEldbus_Model_Method = ^TEldbus_Model_Method;
  TEldbus_Model_Method = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_METHOD_EO_TYPES}
{$define _ELDBUS_MODEL_METHOD_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Eldbus model method class
 *
 * @ingroup Eldbus_Model_Method
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_METHOD_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_method_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Custom Eldbus_Model_Method constructor.
 *
 * @param[in] obj The object.
 * @param[in] proxy Eldbus proxy
 *
 * @since 1.21
 *
 * @ingroup Eldbus_Model_Method
  }
procedure eldbus_model_method_proxy_set(obj:PEo; proxy:PEldbus_Proxy);cdecl;external;
{*
 * @brief Object
 *
 * @param[in] obj The object.
 * @param[in] method The introspected interface
 *
 * @ingroup Eldbus_Model_Method
  }
(* Const before type ignored *)
procedure eldbus_model_method_set(obj:PEo; method:PEldbus_Introspection_Method);cdecl;external;
{*
 * @brief Calls the method. The properties must have been set.
 *
 * The event EMODEL_EVENT_PROPERTIES_CHANGED is raised for output arguments
 * (properties).
 *
 * The event ELDBUS_MODEL_METHOD_EVENT_METHOD_CALLED is raised for a successful
 * call. Otherwise
 *
 * @param[in] obj The object.
 *
 * @since 1.16
 *
 * @ingroup Eldbus_Model_Method
  }
procedure eldbus_model_method_call(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL : TEfl_Event_Description;cvar;external;
{* Event dispatched for a successful method call.
 *
 * @ingroup Eldbus_Model_Method
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_METHOD_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_METHOD_CLASS:=eldbus_model_method_class_get;
  end;

{ was #define dname def_expr }
function ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL:=@(_ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL);
  end;


end.
