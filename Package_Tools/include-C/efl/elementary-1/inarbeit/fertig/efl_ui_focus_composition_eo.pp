
unit efl_ui_focus_composition_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_composition_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_composition_eo.h
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
PEfl_Ui_Focus_Composition  = ^Efl_Ui_Focus_Composition;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_COMPOSITION_EO_H_}
{$define _EFL_UI_FOCUS_COMPOSITION_EO_H_}
{$ifndef _EFL_UI_FOCUS_COMPOSITION_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_COMPOSITION_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Composition = ^TEfl_Ui_Focus_Composition;
  TEfl_Ui_Focus_Composition = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_COMPOSITION_EO_TYPES}
{$define _EFL_UI_FOCUS_COMPOSITION_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This defines the inheriting widget as Composition widget.
 *
 * A composition widget is a widget that's the logical parent of another set of
 * widgets which can be used for interaction.
 *
 * @ingroup Efl_Ui_Focus_Composition
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_COMPOSITION_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_composition_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_UI_FOCUS_COMPOSITION_PROTECTED}
{*
 * @brief Set the order of elements that will be used for composition
 *
 * Elements of the list can be either an @ref Efl_Ui_Widget, an
 * @ref Efl_Ui_Focus_Object or an @ref Efl_Gfx_Entity.
 *
 * If the element is an @ref Efl_Ui_Widget nothing is done and the widget is
 * simply part of the order.
 *
 * If the element is an @ref Efl_Ui_Focus_Object, then the mixin will take care
 * of registering the element.
 *
 * If the element is an @ref Efl_Gfx_Entity, then the geometry is used as focus
 * geometry, the focus property is redirected to the evas focus property. The
 * mixin will take care of registration.
 *
 * @param[in] obj The object.
 * @param[in] logical_order The order to use
 *
 * @ingroup Efl_Ui_Focus_Composition
  }
procedure efl_ui_focus_composition_elements_set(obj:PEo; logical_order:PEina_List);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_COMPOSITION_PROTECTED}
{*
 * @brief Set the order of elements that will be used for composition
 *
 * Elements of the list can be either an @ref Efl_Ui_Widget, an
 * @ref Efl_Ui_Focus_Object or an @ref Efl_Gfx_Entity.
 *
 * If the element is an @ref Efl_Ui_Widget nothing is done and the widget is
 * simply part of the order.
 *
 * If the element is an @ref Efl_Ui_Focus_Object, then the mixin will take care
 * of registering the element.
 *
 * If the element is an @ref Efl_Gfx_Entity, then the geometry is used as focus
 * geometry, the focus property is redirected to the evas focus property. The
 * mixin will take care of registration.
 *
 * @param[in] obj The object.
 *
 * @return The order to use
 *
 * @ingroup Efl_Ui_Focus_Composition
  }
(* Const before type ignored *)

function efl_ui_focus_composition_elements_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_COMPOSITION_PROTECTED}
{* Mark this widget as dirty, the children can be considered to be changed
 * after that call
 *
 * @ingroup Efl_Ui_Focus_Composition
  }

procedure efl_ui_focus_composition_dirty(obj:PEo);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_COMPOSITION_PROTECTED}
{*
 * @brief A call to prepare the children of this element, called if marked as
 * dirty
 *
 * You can use this function to call composition_elements.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Ui_Focus_Composition
  }

procedure efl_ui_focus_composition_prepare(obj:PEo);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_COMPOSITION_PROTECTED}
{*
 * @brief Set to true if all children should be registered as logicals
 *
 * @param[in] obj The object.
 * @param[in] logical_mode @c true or @c false
 *
 * @ingroup Efl_Ui_Focus_Composition
  }

procedure efl_ui_focus_composition_logical_mode_set(obj:PEo; logical_mode:TEina_Bool);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_COMPOSITION_PROTECTED}
{*
 * @brief Set to true if all children should be registered as logicals
 *
 * @param[in] obj The object.
 *
 * @return @c true or @c false
 *
 * @ingroup Efl_Ui_Focus_Composition
  }
(* Const before type ignored *)

function efl_ui_focus_composition_logical_mode_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_COMPOSITION_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_COMPOSITION_MIXIN:=efl_ui_focus_composition_mixin_get;
  end;


end.
