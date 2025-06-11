
unit eldbus_model_proxy_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_proxy_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_proxy_eo.h
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
PEfl_Class  = ^Efl_Class;
PEldbus_Introspection_Interface  = ^Eldbus_Introspection_Interface;
PEldbus_Model_Proxy  = ^Eldbus_Model_Proxy;
PEldbus_Object  = ^Eldbus_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_PROXY_EO_H_}
{$define _ELDBUS_MODEL_PROXY_EO_H_}
{$ifndef _ELDBUS_MODEL_PROXY_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_PROXY_EO_CLASS_TYPE}
type
  PEldbus_Model_Proxy = ^TEldbus_Model_Proxy;
  TEldbus_Model_Proxy = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_PROXY_EO_TYPES}
{$define _ELDBUS_MODEL_PROXY_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Eldbus model proxy class
 *
 * @ingroup Eldbus_Model_Proxy
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_PROXY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_proxy_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Object
 *
 * @param[in] obj The object.
 * @param[in] object Eldbus object
 *
 * @ingroup Eldbus_Model_Proxy
  }
procedure eldbus_model_proxy_object_set(obj:PEo; object:PEldbus_Object);cdecl;external;
{*
 * @brief Object
 *
 * @param[in] obj The object.
 * @param[in] interface The introspected interface
 *
 * @ingroup Eldbus_Model_Proxy
  }
(* Const before type ignored *)
procedure eldbus_model_proxy_interface_set(obj:PEo; interface:PEldbus_Introspection_Interface);cdecl;external;
{*
 * @brief Proxy name
 *
 * @param[in] obj The object.
 *
 * @return Proxy name
 *
 * @ingroup Eldbus_Model_Proxy
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_model_proxy_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_PROXY_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_PROXY_CLASS:=eldbus_model_proxy_class_get;
  end;


end.
