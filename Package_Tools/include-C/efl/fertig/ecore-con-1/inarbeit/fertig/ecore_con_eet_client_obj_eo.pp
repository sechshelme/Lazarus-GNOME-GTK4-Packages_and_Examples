
unit ecore_con_eet_client_obj_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_con_eet_client_obj_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_con_eet_client_obj_eo.h
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
PEcore_Con_Eet_Client_Obj  = ^Ecore_Con_Eet_Client_Obj;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_CON_EET_CLIENT_OBJ_EO_H_}
{$define _ECORE_CON_EET_CLIENT_OBJ_EO_H_}
{$ifndef _ECORE_CON_EET_CLIENT_OBJ_EO_CLASS_TYPE}
{$define _ECORE_CON_EET_CLIENT_OBJ_EO_CLASS_TYPE}
type
  PEcore_Con_Eet_Client_Obj = ^TEcore_Con_Eet_Client_Obj;
  TEcore_Con_Eet_Client_Obj = TEo;
{$endif}
{$ifndef _ECORE_CON_EET_CLIENT_OBJ_EO_TYPES}
{$define _ECORE_CON_EET_CLIENT_OBJ_EO_TYPES}
{$endif}
{* Ecore Connection Eet Client class.
 *
 * @ingroup Ecore_Con_Eet_Client_Obj
  }

{ was #define dname def_expr }
function ECORE_CON_EET_CLIENT_OBJ_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_con_eet_client_obj_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_CON_EET_CLIENT_OBJ_CLASS : longint; { return type might be wrong }
  begin
    ECORE_CON_EET_CLIENT_OBJ_CLASS:=ecore_con_eet_client_obj_class_get;
  end;


end.
