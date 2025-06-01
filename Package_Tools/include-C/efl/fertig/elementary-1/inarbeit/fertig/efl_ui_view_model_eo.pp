
unit efl_ui_view_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_view_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_view_model_eo.h
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
PEfl_Ui_View_Model  = ^Efl_Ui_View_Model;
PEflUiViewModelPropertyGet  = ^EflUiViewModelPropertyGet;
PEflUiViewModelPropertySet  = ^EflUiViewModelPropertySet;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
PEina_Stringshare  = ^Eina_Stringshare;
PEina_Value  = ^Eina_Value;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_VIEW_MODEL_EO_H_}
{$define _EFL_UI_VIEW_MODEL_EO_H_}
{$ifndef _EFL_UI_VIEW_MODEL_EO_CLASS_TYPE}
{$define _EFL_UI_VIEW_MODEL_EO_CLASS_TYPE}
type
  PEfl_Ui_View_Model = ^TEfl_Ui_View_Model;
  TEfl_Ui_View_Model = TEo;
{$endif}
{$ifndef _EFL_UI_VIEW_MODEL_EO_TYPES}
{$define _EFL_UI_VIEW_MODEL_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Function called when a property is get.
 *
 * @ingroup EflUiViewModelPropertyGet
  }
(* Const before type ignored *)
type
  PEflUiViewModelPropertyGet = ^TEflUiViewModelPropertyGet;
  TEflUiViewModelPropertyGet = function (data:pointer; view_model:PEfl_Ui_View_Model; _property:PEina_Stringshare):PEina_Value;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Function called when a property is set.
 *
 * @ingroup EflUiViewModelPropertySet
  }
type
  PEflUiViewModelPropertySet = ^TEflUiViewModelPropertySet;
  TEflUiViewModelPropertySet = function (data:pointer; view_model:PEfl_Ui_View_Model; _property:PEina_Stringshare; value:PEina_Value):PEina_Future;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{*
 * @brief Efl model providing helpers for custom properties used when linking a
 * model to a view and you need to generate/adapt values for display.
 *
 * There is two ways to use this class, you can either inherit from it and have
 * a custom constructor for example. Or you can just instantiate it and
 * manually define your property on it via callbacks.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }

{ was #define dname def_expr }
function EFL_UI_VIEW_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_view_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Adds a synthetic string property, generated from a @c definition
 * string and other properties in the model.
 *
 * The @c definition string, similar to how @c printf works, contains $
 * placeholders that are replaced by the actual value of the property inside
 * the placeholder tags when the synthetic property is retrieved. For example,
 * a numeric property @c length might be strange to use as a label, since it
 * will only display a number. However, a synthetic string can be generated
 * with the definition "Length $length." which renders more nicely and does
 * not require any more code by the user of the property.
 *
 * @c not_ready and @c on_error strings can be given to be used when the data
 * is not ready or there is some error, respectively. These strings do accept
 * placeholder tags.
 *
 * See @ref efl_ui_view_model_property_string_del
 *
 * @param[in] obj The object.
 * @param[in] name The name for the new synthetic property.
 * @param[in] definition The definition string for the new synthetic property.
 * @param[in] not_ready The text to be used if any of the properties used in
 * @c definition is not ready yet. If set to @c null, no check against EAGAIN
 * will be done.
 * @param[in] on_error The text to be used if any of the properties used in
 * @c definition is in error. It takes precedence over @c not_ready. If set to
 * @c null, no error checks are performed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_view_model_property_string_add(obj:PEo; name:Pchar; definition:Pchar; not_ready:Pchar; on_error:Pchar):TEina_Error;cdecl;external;
{*
 * @brief Delete a synthetic property previously defined by
 * @ref efl_ui_view_model_property_string_add.
 *
 * See @ref efl_ui_view_model_property_string_add
 *
 * @param[in] obj The object.
 * @param[in] name The name of the synthetic property to delete.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)
function efl_ui_view_model_property_string_del(obj:PEo; name:Pchar):TEina_Error;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Add callbacks that will be triggered when someone ask for the
 * specified property name when getting or setting a property.
 *
 * A get or set should at least be provided for this call to succeed.
 *
 * See @ref efl_ui_view_model_property_logic_del
 *
 * @param[in] obj The object.
 * @param[in] property The property to bind on to.
 * @param[in] get Define the get callback called when the
 * @ref efl_model_property_get is called with the above property name.
 * @param[in] set Define the set callback called when the
 * @ref efl_model_property_set is called with the above property name.
 * @param[in] bound Iterator of property name to bind with this defined
 * property see @ref efl_ui_view_model_property_bind.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)
function efl_ui_view_model_property_logic_add(obj:PEo; _property:Pchar; get_data:pointer; get:TEflUiViewModelPropertyGet; get_free_cb:TEina_Free_Cb; 
           set_data:pointer; set:TEflUiViewModelPropertySet; set_free_cb:TEina_Free_Cb; bound:PEina_Iterator):TEina_Error;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Delete previously added callbacks that were triggered when someone
 * asked for the specified property name when getting or setting a property.
 *
 * A get or set should at least be provided for this call to succeed.
 *
 * See @ref efl_ui_view_model_property_logic_add
 *
 * @param[in] obj The object.
 * @param[in] property The property to bind on to.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)

function efl_ui_view_model_property_logic_del(obj:PEo; _property:Pchar):TEina_Error;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Automatically update the field for the event
 * @[Efl.Model.properties,changed] to include property that are impacted with
 * change in a property from the composited model.
 *
 * The source doesn't have to be provided at this point by the composited
 * model.
 *
 * @param[in] obj The object.
 * @param[in] source Property name in the composited model.
 * @param[in] destination Property name in the @ref Efl_Ui_View_Model
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure efl_ui_view_model_property_bind(obj:PEo; source:Pchar; destination:Pchar);cdecl;external;
{*
 * @brief Stop automatically updating the field for the event
 * @[Efl.Model.properties,changed] to include property that are impacted with
 * change in a property from the composited model.
 *
 * @param[in] obj The object.
 * @param[in] source Property name in the composited model.
 * @param[in] destination Property name in the @ref Efl_Ui_View_Model
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_ui_view_model_property_unbind(obj:PEo; source:Pchar; destination:Pchar);cdecl;external;
{*
 * @brief Define if we will intercept all children object reference and bind
 * them through the ViewModel with the same property logic as this one. Be
 * careful of recursivity.
 *
 * This can only be applied at construction time.
 *
 * @param[in] obj The object.
 * @param[in] enable Do you automatically bind children. Default to true.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
procedure efl_ui_view_model_children_bind_set(obj:PEo; enable:TEina_Bool);cdecl;external;
{*
 * @brief Define if we will intercept all children object reference and bind
 * them through the ViewModel with the same property logic as this one. Be
 * careful of recursivity.
 *
 * This can only be applied at construction time.
 *
 * @param[in] obj The object.
 *
 * @return Do you automatically bind children. Default to true.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View_Model
  }
(* Const before type ignored *)
function efl_ui_view_model_children_bind_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_VIEW_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_VIEW_MODEL_CLASS:=efl_ui_view_model_class_get;
  end;


end.
