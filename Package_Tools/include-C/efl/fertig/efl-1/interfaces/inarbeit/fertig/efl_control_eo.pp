
unit efl_control_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_control_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_control_eo.h
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
PEfl_Control  = ^Efl_Control;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CONTROL_EO_H_}
{$define _EFL_CONTROL_EO_H_}
{$ifndef _EFL_CONTROL_EO_CLASS_TYPE}
{$define _EFL_CONTROL_EO_CLASS_TYPE}
type
  PEfl_Control = ^TEfl_Control;
  TEfl_Control = TEo;
{$endif}
{$ifndef _EFL_CONTROL_EO_TYPES}
{$define _EFL_CONTROL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl control interface
 *
 * @ingroup Efl_Control
  }

{ was #define dname def_expr }
function EFL_CONTROL_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_control_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control the priority of the object.
 *
 * @param[in] obj The object.
 * @param[in] priority The priority of the object
 *
 * @ingroup Efl_Control
  }
procedure efl_control_priority_set(obj:PEo; priority:longint);cdecl;external;
{*
 * @brief Control the priority of the object.
 *
 * @param[in] obj The object.
 *
 * @return The priority of the object
 *
 * @ingroup Efl_Control
  }
(* Const before type ignored *)
function efl_control_priority_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Controls whether the object is suspended or not.
 *
 * @param[in] obj The object.
 * @param[in] suspend Controls whether the object is suspended or not.
 *
 * @ingroup Efl_Control
  }
procedure efl_control_suspend_set(obj:PEo; suspend:TEina_Bool);cdecl;external;
{*
 * @brief Controls whether the object is suspended or not.
 *
 * @param[in] obj The object.
 *
 * @return Controls whether the object is suspended or not.
 *
 * @ingroup Efl_Control
  }
(* Const before type ignored *)
function efl_control_suspend_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CONTROL_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CONTROL_INTERFACE:=efl_control_interface_get;
  end;


end.
