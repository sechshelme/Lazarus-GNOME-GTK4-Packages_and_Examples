
unit efl_ui_separator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_separator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_separator_eo.h
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
PEfl_Ui_Separator  = ^Efl_Ui_Separator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SEPARATOR_EO_H_}
{$define _EFL_UI_SEPARATOR_EO_H_}
{$ifndef _EFL_UI_SEPARATOR_EO_CLASS_TYPE}
{$define _EFL_UI_SEPARATOR_EO_CLASS_TYPE}
type
  PEfl_Ui_Separator = ^TEfl_Ui_Separator;
  TEfl_Ui_Separator = TEo;
{$endif}
{$ifndef _EFL_UI_SEPARATOR_EO_TYPES}
{$define _EFL_UI_SEPARATOR_EO_TYPES}
{$endif}
{*
 * @brief Vertical or horizontal separator line.
 *
 * Use it to separate groups of buttons in a toolbar, for example, or items on
 * a list. The length of the line adapts to the size of the container, and its
 * width is controlled by the theme.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Separator
  }

{ was #define dname def_expr }
function EFL_UI_SEPARATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_separator_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SEPARATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SEPARATOR_CLASS:=efl_ui_separator_class_get;
  end;


end.
