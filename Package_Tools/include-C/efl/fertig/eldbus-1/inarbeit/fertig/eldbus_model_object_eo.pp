
unit eldbus_model_object_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_object_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_object_eo.h
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
PEldbus_Model_Object  = ^Eldbus_Model_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_OBJECT_EO_H_}
{$define _ELDBUS_MODEL_OBJECT_EO_H_}
{$ifndef _ELDBUS_MODEL_OBJECT_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_OBJECT_EO_CLASS_TYPE}
type
  PEldbus_Model_Object = ^TEldbus_Model_Object;
  TEldbus_Model_Object = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_OBJECT_EO_TYPES}
{$define _ELDBUS_MODEL_OBJECT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Eldbus model object class
 *
 * @ingroup Eldbus_Model_Object
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_OBJECT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_object_class_get:PEfl_Class;cdecl;external;
{*
 * @brief DBus Name or unique-id
 *
 * @param[in] obj The object.
 * @param[in] bus DBus name
 *
 * @ingroup Eldbus_Model_Object
  }
(* Const before type ignored *)
procedure eldbus_model_object_bus_set(obj:PEo; bus:Pchar);cdecl;external;
{*
 * @brief DBus Name or unique-id
 *
 * @param[in] obj The object.
 *
 * @return DBus name
 *
 * @ingroup Eldbus_Model_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_model_object_bus_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief DBus path
 *
 * @param[in] obj The object.
 * @param[in] path DBus path
 *
 * @ingroup Eldbus_Model_Object
  }
(* Const before type ignored *)
procedure eldbus_model_object_path_set(obj:PEo; path:Pchar);cdecl;external;
{*
 * @brief DBus path
 *
 * @param[in] obj The object.
 *
 * @return DBus path
 *
 * @ingroup Eldbus_Model_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_model_object_path_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_OBJECT_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_OBJECT_CLASS:=eldbus_model_object_class_get;
  end;


end.
