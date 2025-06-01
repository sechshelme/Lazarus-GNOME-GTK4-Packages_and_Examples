
unit efl_access_widget_action;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_widget_action.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_widget_action.h
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
PEfl_Access_Action_Data  = ^Efl_Access_Action_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_INTERFACE_ATSPI_WIDGET_ACTION_H}
{$define ELM_INTERFACE_ATSPI_WIDGET_ACTION_H}
{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PEfl_Access_Action_Data = ^TEfl_Access_Action_Data;
  TEfl_Access_Action_Data = record
      name : Pchar;
      action : Pchar;
      param : Pchar;
      func : function (obj:PEvas_Object; params:Pchar):TEina_Bool;cdecl;
    end;

{$include "efl_access_widget_action.eo.h"}
{$endif}
{$endif}

implementation


end.
