
unit efl_ui_navigation_layout_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_navigation_layout_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_navigation_layout_eo.h
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
PEfl_Ui_Layout_Base  = ^Efl_Ui_Layout_Base;
PEfl_Ui_Navigation_Layout  = ^Efl_Ui_Navigation_Layout;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_NAVIGATION_LAYOUT_EO_H_}
{$define _EFL_UI_NAVIGATION_LAYOUT_EO_H_}
{$ifndef _EFL_UI_NAVIGATION_LAYOUT_EO_CLASS_TYPE}
{$define _EFL_UI_NAVIGATION_LAYOUT_EO_CLASS_TYPE}
type
  PEfl_Ui_Navigation_Layout = ^TEfl_Ui_Navigation_Layout;
  TEfl_Ui_Navigation_Layout = TEo;
{$endif}
{$ifndef _EFL_UI_NAVIGATION_LAYOUT_EO_TYPES}
{$define _EFL_UI_NAVIGATION_LAYOUT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Navigation_Layout widget.
 *
 * Navigation_Layout widget provides a layout form useful for navigation.
 * Navigation_Layout widget is used to be pushed to or popped from Stack
 * widget(Efl.Ui.Stack class) as a content.
 *
 * @ingroup Efl_Ui_Navigation_Layout
  }

{ was #define dname def_expr }
function EFL_UI_NAVIGATION_LAYOUT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_navigation_layout_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The bar object which is located at the top area as a title. e.g.
 * Navigation_Bar widget(Efl.Ui.Navigation_Bar) can be used as @c bar.
 *
 * @param[in] obj The object.
 * @param[in] value The bar object located at the top area of the Navigation
 * Layout.
 *
 * @ingroup Efl_Ui_Navigation_Layout
  }
procedure efl_ui_navigation_layout_bar_set(obj:PEo; value:PEfl_Ui_Layout_Base);cdecl;external;
{*
 * @brief The bar object which is located at the top area as a title. e.g.
 * Navigation_Bar widget(Efl.Ui.Navigation_Bar) can be used as @c bar.
 *
 * @param[in] obj The object.
 *
 * @return The bar object located at the top area of the Navigation Layout.
 *
 * @ingroup Efl_Ui_Navigation_Layout
  }
(* Const before type ignored *)
function efl_ui_navigation_layout_bar_get(obj:PEo):PEfl_Ui_Layout_Base;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_NAVIGATION_LAYOUT_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_NAVIGATION_LAYOUT_CLASS:=efl_ui_navigation_layout_class_get;
  end;


end.
