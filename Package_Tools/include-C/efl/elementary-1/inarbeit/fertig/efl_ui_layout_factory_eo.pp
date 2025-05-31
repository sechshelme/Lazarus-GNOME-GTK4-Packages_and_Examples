
unit efl_ui_layout_factory_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_factory_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_factory_eo.h
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
PEfl_Ui_Layout_Factory  = ^Efl_Ui_Layout_Factory;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_FACTORY_EO_H_}
{$define _EFL_UI_LAYOUT_FACTORY_EO_H_}
{$ifndef _EFL_UI_LAYOUT_FACTORY_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_FACTORY_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout_Factory = ^TEfl_Ui_Layout_Factory;
  TEfl_Ui_Layout_Factory = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_FACTORY_EO_TYPES}
{$define _EFL_UI_LAYOUT_FACTORY_EO_TYPES}
{$endif}
{*
 * @brief @ref Efl_Ui_Factory that creates @ref Efl_Ui_Layout objects with
 * caching.
 *
 * This factory is meant to be used by @ref Efl_Ui_View objects that use items
 * with Layout and need the items to be created, updated, their model set and
 * connected automatically before the @ref Efl_Ui_View receives the item
 * instance.
 *
 * This class inherits from @ref Efl_Ui_Caching_Factory and inherits all its
 * properties.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Layout_Factory
  }

{ was #define dname def_expr }
function EFL_UI_LAYOUT_FACTORY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_factory_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set the theme that will be applied to the created @ref Efl_Ui_Layout
 * objects. See @ref efl_ui_layout_theme_get for more details.
 *
 * @param[in] obj The object.
 * @param[in] klass The class of the group.
 * @param[in] group The group.
 * @param[in] style The style to use.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Layout_Factory
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_ui_layout_factory_theme_config(obj:PEo; klass:Pchar; group:Pchar; style:Pchar);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_FACTORY_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_FACTORY_CLASS:=efl_ui_layout_factory_class_get;
  end;


end.
