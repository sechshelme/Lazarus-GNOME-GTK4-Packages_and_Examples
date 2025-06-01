
unit efl_ui_navigation_bar_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_navigation_bar_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_navigation_bar_eo.h
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
PEfl_Ui_Navigation_Bar  = ^Efl_Ui_Navigation_Bar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_NAVIGATION_BAR_EO_H_}
{$define _EFL_UI_NAVIGATION_BAR_EO_H_}
{$ifndef _EFL_UI_NAVIGATION_BAR_EO_CLASS_TYPE}
{$define _EFL_UI_NAVIGATION_BAR_EO_CLASS_TYPE}
type
  PEfl_Ui_Navigation_Bar = ^TEfl_Ui_Navigation_Bar;
  TEfl_Ui_Navigation_Bar = TEo;
{$endif}
{$ifndef _EFL_UI_NAVIGATION_BAR_EO_TYPES}
{$define _EFL_UI_NAVIGATION_BAR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Navigation_Bar widget.
 *
 * Navigation_Bar widget provides a bar form useful for navigation.
 * Navigation_Bar has a back button which is used to navigate to the previous
 * content in the stack.
 *
 * @ingroup Efl_Ui_Navigation_Bar
  }

{ was #define dname def_expr }
function EFL_UI_NAVIGATION_BAR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_navigation_bar_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_NAVIGATION_BAR_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_NAVIGATION_BAR_CLASS:=efl_ui_navigation_bar_class_get;
  end;


end.
