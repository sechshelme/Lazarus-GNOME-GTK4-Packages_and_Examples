
unit efl_ui_widget_scrollable_content_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_scrollable_content_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_scrollable_content_eo.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Widget_Scrollable_Content  = ^Efl_Ui_Widget_Scrollable_Content;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EO_H_}
{$define _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EO_H_}
{$ifndef _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EO_CLASS_TYPE}
{$define _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EO_CLASS_TYPE}
type
  PEfl_Ui_Widget_Scrollable_Content = ^TEfl_Ui_Widget_Scrollable_Content;
  TEfl_Ui_Widget_Scrollable_Content = TEo;
{$endif}
{$ifndef _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EO_TYPES}
{$define _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EO_TYPES}
{$endif}
{*
 * @brief Mixin helper to add scrollable content to widgets.
 *
 * This can be used to provide scrollable contents and text for widgets. When
 * @ref efl_ui_widget_scrollable_content_get or
 * @ref efl_ui_widget_scrollable_text_get is set, this mixin will create and
 * manage an internal scroller object which will be the container of that text
 * or content.
 *
 * Only a single content or text can be set at any given time. Setting
 * @ref efl_ui_widget_scrollable_text_get will unset
 * @ref efl_ui_widget_scrollable_content_get.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }

{ was #define dname def_expr }
function EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_widget_scrollable_content_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_UI_WIDGET_SCROLLABLE_CONTENT_PROTECTED}
{*
 * @brief Widgets can call this function during their
 * @ref efl_canvas_group_calculate implementation after the super call to
 * determine whether the internal scroller has already performed sizing
 * calculations.
 *
 * If this property is @c true, the
 * @[Efl.Ui.Widget_Scrollable_Content.optimal_size,calc] event will have been
 * emitted during the super call. In this case it's likely that the widget
 * should be completing its internal sizing calculations from that event using:
 *
 * efl_canvas_group_calculate(efl_super(ev->object,
 * EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN));
 *
 * in order to skip the scrollable sizing calculation.
 *
 * @param[in] obj The object.
 *
 * @return Whether the internal scroller has already done sizing calculations.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }
(* Const before type ignored *)
function efl_ui_widget_scrollable_content_did_group_calc_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief This is the content which will be placed in the internal scroller.
 *
 * If a @ref efl_ui_widget_scrollable_text_get string is set, this property
 * will be @c NULL.
 *
 * @param[in] obj The object.
 * @param[in] content The content object.
 *
 * @return @c true on success.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }

function efl_ui_widget_scrollable_content_set(obj:PEo; content:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief This is the content which will be placed in the internal scroller.
 *
 * If a @ref efl_ui_widget_scrollable_text_get string is set, this property
 * will be @c NULL.
 *
 * @param[in] obj The object.
 *
 * @return The content object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }
(* Const before type ignored *)
function efl_ui_widget_scrollable_content_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief The text string to be displayed by the given text object. The text
 * will use @ref EFL_TEXT_FORMAT_WRAP_MIXED wrapping, and it will be scrollable
 * depending on its size relative to the object's geometry.
 *
 * When reading, do not free the return value.
 *
 * @param[in] obj The object.
 * @param[in] text Text string to display on it.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }
(* Const before type ignored *)
procedure efl_ui_widget_scrollable_text_set(obj:PEo; text:Pchar);cdecl;external;
{*
 * @brief The text string to be displayed by the given text object. The text
 * will use @ref EFL_TEXT_FORMAT_WRAP_MIXED wrapping, and it will be scrollable
 * depending on its size relative to the object's geometry.
 *
 * When reading, do not free the return value.
 *
 * @param[in] obj The object.
 *
 * @return Text string to display on it.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_widget_scrollable_text_get(obj:PEo):Pchar;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC : TEfl_Event_Description;cvar;external;
{* The optimal size for the widget based on scrollable content.
 * @return Eina_Size2D
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Widget_Scrollable_Content
  }

{ was #define dname def_expr }
function EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN:=efl_ui_widget_scrollable_content_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC : longint; { return type might be wrong }
  begin
    EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC:=@(_EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC);
  end;


end.
