
unit efl_ui_bg_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_bg_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_bg_eo.h
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
PEfl_Ui_Bg  = ^Efl_Ui_Bg;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_BG_EO_H_}
{$define _EFL_UI_BG_EO_H_}
{$ifndef _EFL_UI_BG_EO_CLASS_TYPE}
{$define _EFL_UI_BG_EO_CLASS_TYPE}
type
  PEfl_Ui_Bg = ^TEfl_Ui_Bg;
  TEfl_Ui_Bg = TEo;
{$endif}
{$ifndef _EFL_UI_BG_EO_TYPES}
{$define _EFL_UI_BG_EO_TYPES}
{$endif}
{* The bg (background) widget is used for setting (solid) background
 * decorations for a window (unless it has transparency enabled) or for any
 * container object. It works just like an image, but has some properties
 * useful for backgrounds, such as setting it to tiled, centered, scaled or
 * stretched.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Bg
  }

{ was #define dname def_expr }
function EFL_UI_BG_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_bg_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_BG_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_BG_CLASS:=efl_ui_bg_class_get;
  end;


end.
