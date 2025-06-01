
unit efl_ui_alert_popup_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_alert_popup_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_alert_popup_eo.h
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
PEfl_Ui_Alert_Popup  = ^Efl_Ui_Alert_Popup;
PEfl_Ui_Alert_Popup_Button  = ^Efl_Ui_Alert_Popup_Button;
PEfl_Ui_Alert_Popup_Button_Clicked_Event  = ^Efl_Ui_Alert_Popup_Button_Clicked_Event;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_ALERT_POPUP_EO_H_}
{$define _EFL_UI_ALERT_POPUP_EO_H_}
{$ifndef _EFL_UI_ALERT_POPUP_EO_CLASS_TYPE}
{$define _EFL_UI_ALERT_POPUP_EO_CLASS_TYPE}
type
  PEfl_Ui_Alert_Popup = ^TEfl_Ui_Alert_Popup;
  TEfl_Ui_Alert_Popup = TEo;
{$endif}
{$ifndef _EFL_UI_ALERT_POPUP_EO_TYPES}
{$define _EFL_UI_ALERT_POPUP_EO_TYPES}
{* Defines the type of the alert button.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Alert_Popup_Button
  }
{*< Button having positive meaning.
                                           * E.g. "Yes".
                                           *
                                           * @since 1.23  }
{*< Button having negative meaning. E.g.
                                       * "No".
                                       *
                                       * @since 1.23  }
{*< Button having user-defined meaning. E.g.
                                  * "More information".
                                  *
                                  * @since 1.23  }
type
  PEfl_Ui_Alert_Popup_Button = ^TEfl_Ui_Alert_Popup_Button;
  TEfl_Ui_Alert_Popup_Button =  Longint;
  Const
    EFL_UI_ALERT_POPUP_BUTTON_POSITIVE = 0;
    EFL_UI_ALERT_POPUP_BUTTON_NEGATIVE = 1;
    EFL_UI_ALERT_POPUP_BUTTON_USER = 2;
;
{* Information for @[Efl.Ui.Alert_Popup.button,clicked] event.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Alert_Popup_Button_Clicked_Event
  }
{*< Clicked button type.
                                          *
                                          * @since 1.23  }
type
  PEfl_Ui_Alert_Popup_Button_Clicked_Event = ^TEfl_Ui_Alert_Popup_Button_Clicked_Event;
  TEfl_Ui_Alert_Popup_Button_Clicked_Event = record
      button_type : TEfl_Ui_Alert_Popup_Button;
    end;
{$endif}
{*
 * @brief A variant of @ref Efl_Ui_Popup which uses a layout containing a
 * content object and a variable number of buttons (up to 3 total).
 *
 * An Alert_Popup is a popup which can be used when an application requires
 * user interaction. It provides functionality for easily creating button
 * objects on the popup and passing information about which button has been
 * pressed to the button event callback.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Alert_Popup
  }

{ was #define dname def_expr }
function EFL_UI_ALERT_POPUP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_alert_popup_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This property changes the text and icon for the specified button
 * object.
 *
 * When set, the Alert_Popup will create a button for the specified type if it
 * does not yet exist. The button's content and text will be set using the
 * passed values.
 *
 * Exactly one button may exist for each @ref Efl_Ui_Alert_Popup_Button type.
 * Repeated calls to set values for the same button type will overwrite
 * previous values.
 *
 * By default, no buttons are created. Once a button is added to the Popup
 * using this property it cannot be removed.
 *
 * @param[in] obj The object.
 * @param[in] type Alert_Popup button type.
 * @param[in] text Text of the specified button type.
 * @param[in] icon Visual to use as an icon for the specified button type.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Alert_Popup
  }
(* Const before type ignored *)
procedure efl_ui_alert_popup_button_set(obj:PEo; _type:TEfl_Ui_Alert_Popup_Button; text:Pchar; icon:PEfl_Canvas_Object);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED : TEfl_Event_Description;cvar;external;
{* Called when an Alert_Popup button was clicked.
 * @return Efl_Ui_Alert_Popup_Button_Clicked_Event
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Alert_Popup
  }

{ was #define dname def_expr }
function EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_ALERT_POPUP_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_ALERT_POPUP_CLASS:=efl_ui_alert_popup_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED : longint; { return type might be wrong }
  begin
    EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED:=@(_EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED);
  end;


end.
