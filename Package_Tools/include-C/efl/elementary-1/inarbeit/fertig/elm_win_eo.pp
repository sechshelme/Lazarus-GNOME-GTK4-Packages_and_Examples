
unit elm_win_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_win_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_win_eo.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIN_EO_H}
{$define ELM_WIN_EO_H}
{*
 * @ingroup Elm_Win_Group
 *
 * @
  }
{$include "efl_ui_win.eo.h"}

procedure elm_win_autodel_set(obj:PEvas_Object; autodel:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_win_autodel_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
