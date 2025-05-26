
unit elm_code_diff_widget;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_diff_widget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_diff_widget.h
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
PElm_Code  = ^Elm_Code;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_DIFF_WIDGET_H_}
{$define ELM_CODE_DIFF_WIDGET_H_}
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for rendering diff instances of Elm Code.
  }
{*
 * @brief UI Loading functions.
 * @defgroup Elm_Code_Diff_Init  Creating a diff widget to render an Elm Code backend
 *  when it's referencing a diff file
 *
 * @
 *
 * Functions for Diff UI loading.
 *
  }

function elm_code_diff_widget_add(parent:PEvas_Object; code:PElm_Code):PEvas_Object;cdecl;external;
(* Const before type ignored *)
procedure elm_code_diff_widget_font_set(widget:PEvas_Object; name:Pchar; size:longint);cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_DIFF_WIDGET_H_  }

implementation


end.
