
unit efl_ui_focus_layer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_layer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_layer_eo.h
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
PEfl_Ui_Focus_Layer  = ^Efl_Ui_Focus_Layer;
PEina_Bool  = ^Eina_Bool;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_LAYER_EO_H_}
{$define _EFL_UI_FOCUS_LAYER_EO_H_}
{$ifndef _EFL_UI_FOCUS_LAYER_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_LAYER_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Layer = ^TEfl_Ui_Focus_Layer;
  TEfl_Ui_Focus_Layer = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_LAYER_EO_TYPES}
{$define _EFL_UI_FOCUS_LAYER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This defines the widget as a focus layer.
 *
 * A focus layer is the uppermost widget which receives input and handles all
 * focus related events for as long as it exists and is visible. It's not
 * possible to escape this layer with focus movements.
 *
 * Once the object is hidden or destroyed the focus will go back to the main
 * window, where it was before.
 *
 * @ingroup Efl_Ui_Focus_Layer
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_LAYER_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_layer_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_UI_FOCUS_LAYER_PROTECTED}
{*
 * @brief Whether the focus layer is enabled. This can be handled automatically
 * through @ref efl_gfx_entity_visible_get and
 * @ref efl_ui_focus_layer_behaviour_get.
 *
 * @param[in] obj The object.
 * @param[in] v @c true to set enable.
 *
 * @ingroup Efl_Ui_Focus_Layer
  }
procedure efl_ui_focus_layer_enable_set(obj:PEo; v:TEina_Bool);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_LAYER_PROTECTED}
{*
 * @brief Whether the focus layer is enabled. This can be handled automatically
 * through @ref efl_gfx_entity_visible_get and
 * @ref efl_ui_focus_layer_behaviour_get.
 *
 * @param[in] obj The object.
 *
 * @return @c true to set enable.
 *
 * @ingroup Efl_Ui_Focus_Layer
  }
(* Const before type ignored *)

function efl_ui_focus_layer_enable_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_LAYER_PROTECTED}
{*
 * @brief Sets the behaviour of the focus layer.
 *
 * @param[in] obj The object.
 * @param[in] enable_on_visible @c true means layer will enable itself once the
 * widget becomes visible
 * @param[in] cycle If @c true the focus will cycle (from last object to first,
 * and vice versa) in the layer.
 *
 * @ingroup Efl_Ui_Focus_Layer
  }

procedure efl_ui_focus_layer_behaviour_set(obj:PEo; enable_on_visible:TEina_Bool; cycle:TEina_Bool);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_LAYER_PROTECTED}
{*
 * @brief Sets the behaviour of the focus layer.
 *
 * @param[in] obj The object.
 * @param[out] enable_on_visible @c true means layer will enable itself once
 * the widget becomes visible
 * @param[out] cycle If @c true the focus will cycle (from last object to
 * first, and vice versa) in the layer.
 *
 * @ingroup Efl_Ui_Focus_Layer
  }
(* Const before type ignored *)

procedure efl_ui_focus_layer_behaviour_get(obj:PEo; enable_on_visible:PEina_Bool; cycle:PEina_Bool);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_LAYER_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_LAYER_MIXIN:=efl_ui_focus_layer_mixin_get;
  end;


end.
