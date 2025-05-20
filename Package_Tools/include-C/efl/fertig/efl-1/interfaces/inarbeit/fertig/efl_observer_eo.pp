
unit efl_observer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_observer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_observer_eo.h
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
PEfl_Object  = ^Efl_Object;
PEfl_Observer  = ^Efl_Observer;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_OBSERVER_EO_H_}
{$define _EFL_OBSERVER_EO_H_}
{$ifndef _EFL_OBSERVER_EO_CLASS_TYPE}
{$define _EFL_OBSERVER_EO_CLASS_TYPE}
type
  PEfl_Observer = ^TEfl_Observer;
  TEfl_Observer = TEo;
{$endif}
{$ifndef _EFL_OBSERVER_EO_TYPES}
{$define _EFL_OBSERVER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl observer interface
 *
 * @ingroup Efl_Observer
  }

{ was #define dname def_expr }
function EFL_OBSERVER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_observer_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Update observer according to the changes of observable object.
 *
 * @param[in] obj The object.
 * @param[in] obs An observable object
 * @param[in] key A key to classify observer groups
 * @param[in] data Required data to update the observer, usually passed by
 * observable object
 *
 * @ingroup Efl_Observer
  }
(* Const before type ignored *)
procedure efl_observer_update(obj:PEo; obs:PEfl_Object; key:Pchar; data:pointer);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_OBSERVER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_OBSERVER_INTERFACE:=efl_observer_interface_get;
  end;


end.
