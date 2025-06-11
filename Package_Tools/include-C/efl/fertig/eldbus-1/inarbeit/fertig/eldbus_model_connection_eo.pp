
unit eldbus_model_connection_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_model_connection_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_model_connection_eo.h
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
PEldbus_Model_Connection  = ^Eldbus_Model_Connection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_MODEL_CONNECTION_EO_H_}
{$define _ELDBUS_MODEL_CONNECTION_EO_H_}
{$ifndef _ELDBUS_MODEL_CONNECTION_EO_CLASS_TYPE}
{$define _ELDBUS_MODEL_CONNECTION_EO_CLASS_TYPE}
type
  PEldbus_Model_Connection = ^TEldbus_Model_Connection;
  TEldbus_Model_Connection = TEo;
{$endif}
{$ifndef _ELDBUS_MODEL_CONNECTION_EO_TYPES}
{$define _ELDBUS_MODEL_CONNECTION_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Eldbus model connection class
 *
 * @ingroup Eldbus_Model_Connection
  }

{ was #define dname def_expr }
function ELDBUS_MODEL_CONNECTION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eldbus_model_connection_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_MODEL_CONNECTION_CLASS : longint; { return type might be wrong }
  begin
    ELDBUS_MODEL_CONNECTION_CLASS:=eldbus_model_connection_class_get;
  end;


end.
