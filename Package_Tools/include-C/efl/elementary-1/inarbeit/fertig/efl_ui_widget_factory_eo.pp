
unit efl_ui_widget_factory_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_factory_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_factory_eo.h
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
PEfl_Ui_Widget_Factory  = ^Efl_Ui_Widget_Factory;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIDGET_FACTORY_EO_H_}
{$define _EFL_UI_WIDGET_FACTORY_EO_H_}
{$ifndef _EFL_UI_WIDGET_FACTORY_EO_CLASS_TYPE}
{$define _EFL_UI_WIDGET_FACTORY_EO_CLASS_TYPE}
type
  PEfl_Ui_Widget_Factory = ^TEfl_Ui_Widget_Factory;
  TEfl_Ui_Widget_Factory = TEo;
{$endif}
{$ifndef _EFL_UI_WIDGET_FACTORY_EO_TYPES}
{$define _EFL_UI_WIDGET_FACTORY_EO_TYPES}
{$endif}
{*
 * @brief Efl Ui Factory that provides @ref Efl_Ui_Widget.
 *
 * This factory is designed to build @ref Efl_Ui_Widget and optionally set
 * their @ref efl_ui_widget_style_get if it was connected with
 * @ref efl_ui_property_bind "$style".
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Factory
  }

{ was #define dname def_expr }
function EFL_UI_WIDGET_FACTORY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_widget_factory_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Define the class of the item returned by this factory.
 *
 * @param[in] obj The object.
 * @param[in] klass The class identifier to create item from.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Factory
  }
(* Const before type ignored *)
procedure efl_ui_widget_factory_item_class_set(obj:PEo; klass:PEfl_Class);cdecl;external;
{*
 * @brief Define the class of the item returned by this factory.
 *
 * @param[in] obj The object.
 *
 * @return The class identifier to create item from.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Factory
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_widget_factory_item_class_get(obj:PEo):PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIDGET_FACTORY_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_WIDGET_FACTORY_CLASS:=efl_ui_widget_factory_class_get;
  end;


end.
