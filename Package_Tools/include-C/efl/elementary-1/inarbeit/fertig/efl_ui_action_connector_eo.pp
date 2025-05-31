
unit efl_ui_action_connector_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_action_connector_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_action_connector_eo.h
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
PEfl_Canvas_Layout  = ^Efl_Canvas_Layout;
PEfl_Class  = ^Efl_Class;
PEfl_Input_Clickable  = ^Efl_Input_Clickable;
PEfl_Input_Interface  = ^Efl_Input_Interface;
PEfl_Ui_Action_Connector  = ^Efl_Ui_Action_Connector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_ACTION_CONNECTOR_EO_H_}
{$define _EFL_UI_ACTION_CONNECTOR_EO_H_}
{$ifndef _EFL_UI_ACTION_CONNECTOR_EO_CLASS_TYPE}
{$define _EFL_UI_ACTION_CONNECTOR_EO_CLASS_TYPE}
type
  PEfl_Ui_Action_Connector = ^TEfl_Ui_Action_Connector;
  TEfl_Ui_Action_Connector = TEo;
{$endif}
{$ifndef _EFL_UI_ACTION_CONNECTOR_EO_TYPES}
{$define _EFL_UI_ACTION_CONNECTOR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Helper class that connects theme signals or object events to the
 * interfaces which are for actions.
 *
 * For example, this simplifies creating widgets that implement the
 * @ref Efl_Input_Clickable interface.
 *
 * @ingroup Efl_Ui_Action_Connector
  }

{ was #define dname def_expr }
function EFL_UI_ACTION_CONNECTOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_action_connector_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This will listen to the standard "click" events on a theme and emit
 * the appropriate events through the @ref Efl_Input_Clickable interface.
 *
 * Using these methods widgets do not need to listen to the theme signals. This
 * class does it and calls the correct clickable functions.
 *
 * This handles theme signals "efl,action,press", "efl,action,unpress" and
 * "efl,action,mouse_out", and the @[Efl.Input.Interface.pointer,move] event.
 *
 * @param[in] object The object to listen on.
 * @param[in] clickable The object to call the clickable methods on.
 *
 * @ingroup Efl_Ui_Action_Connector
  }
procedure efl_ui_action_connector_bind_clickable_to_theme(object:PEfl_Canvas_Layout; clickable:PEfl_Input_Clickable);cdecl;external;
{*
 * @brief This will listen to the standard "click" events on an object, and
 * emit the appropriate events through the @ref Efl_Input_Clickable interface.
 *
 * Using these methods widgets do not need to listen to the object events. This
 * class does it and calls the correct clickable functions.
 *
 * The handled events are @[Efl.Input.Interface.pointer,up] and
 * @[Efl.Input.Interface.pointer,down].
 *
 * @param[in] object The object to listen on.
 * @param[in] clickable The object to call the clickable methods on.
 *
 * @ingroup Efl_Ui_Action_Connector
  }
procedure efl_ui_action_connector_bind_clickable_to_object(object:PEfl_Input_Interface; clickable:PEfl_Input_Clickable);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_ACTION_CONNECTOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_ACTION_CONNECTOR_CLASS:=efl_ui_action_connector_class_get;
  end;


end.
