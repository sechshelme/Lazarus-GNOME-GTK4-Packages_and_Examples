
unit eldbus_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_eo.h
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
PEldbus_Connection  = ^Eldbus_Connection;
PEldbus_Model  = ^Eldbus_Model;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_EO_H_}
{$define _ELDBUS_MODEL_EO_H_}
{$ifndef _ELDBUS_MODEL_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_EO_CLASS_TYPE}
type
  PEldbus_Model = ^TEldbus_Model;
  TEldbus_Model = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_EO_TYPES}
{$define _ELDBUS_MODEL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}

{ was #define dname def_expr }
function ELDBUS_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Define connection parameters.
 *
 * @param[in] obj The object.
 * @param[in] type The connection type
 * @param[in] address Remote address of DBus
 * @param[in] priv Non shared dbus connection
 *
 * @since 1.21
 *
 * @ingroup Eldbus_Model
  }
(* Const before type ignored *)
procedure eldbus_model_connect(obj:PEo; _type:TEldbus_Connection_Type; address:Pchar; priv:TEina_Bool);cdecl;external;
{*
 * @brief Define the connection.
 *
 * @param[in] obj The object.
 * @param[in] dbus The connection
 *
 * @since 1.21
 *
 * @ingroup Eldbus_Model
  }
procedure eldbus_model_connection_set(obj:PEo; dbus:PEldbus_Connection);cdecl;external;
{*
 * @brief Define the connection.
 *
 * @param[in] obj The object.
 *
 * @return The connection
 *
 * @since 1.21
 *
 * @ingroup Eldbus_Model
  }
(* Const before type ignored *)
function eldbus_model_connection_get(obj:PEo):PEldbus_Connection;cdecl;external;
{*
 * @brief Connection type
 *
 * @param[in] obj The object.
 *
 * @return Connection type
 *
 * @ingroup Eldbus_Model
  }
(* Const before type ignored *)
function eldbus_model_type_get(obj:PEo):TEldbus_Connection_Type;cdecl;external;
{*
 * @brief Remote DBus address
 *
 * @param[in] obj The object.
 *
 * @return Address
 *
 * @ingroup Eldbus_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_model_address_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Indicate if the DBus connection is shared or private
 *
 * @param[in] obj The object.
 *
 * @return Private DBus connection
 *
 * @ingroup Eldbus_Model
  }
(* Const before type ignored *)
function eldbus_model_private_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_CLASS:=eldbus_model_class_get;
  end;


end.
