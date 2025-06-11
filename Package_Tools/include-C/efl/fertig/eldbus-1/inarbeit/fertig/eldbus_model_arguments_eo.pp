
unit eldbus_model_arguments_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_arguments_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_arguments_eo.h
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
PEina_List  = ^Eina_List;
PEldbus_Model_Arguments  = ^Eldbus_Model_Arguments;
PEldbus_Proxy  = ^Eldbus_Proxy;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_ARGUMENTS_EO_H_}
{$define _ELDBUS_MODEL_ARGUMENTS_EO_H_}
{$ifndef _ELDBUS_MODEL_ARGUMENTS_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_ARGUMENTS_EO_CLASS_TYPE}
type
  PEldbus_Model_Arguments = ^TEldbus_Model_Arguments;
  TEldbus_Model_Arguments = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_ARGUMENTS_EO_TYPES}
{$define _ELDBUS_MODEL_ARGUMENTS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Eldbus model arguments class
 *
 * @ingroup Eldbus_Model_Arguments
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_ARGUMENTS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_arguments_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Custom Eldbus_Model_Arguments constructor.
 *
 * @param[in] obj The object.
 * @param[in] proxy Eldbus proxy
 * @param[in] name Name
 * @param[in] arguments The introspected arguments
 *
 * @since 1.16
 *
 * @ingroup Eldbus_Model_Arguments
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eldbus_model_arguments_custom_constructor(obj:PEo; proxy:PEldbus_Proxy; name:Pchar; arguments:PEina_List);cdecl;external;
{*
 * @brief Name of the argument
 *
 * @param[in] obj The object.
 *
 * @return Argument name
 *
 * @ingroup Eldbus_Model_Arguments
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_model_arguments_arg_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_ARGUMENTS_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_ARGUMENTS_CLASS:=eldbus_model_arguments_class_get;
  end;


end.
