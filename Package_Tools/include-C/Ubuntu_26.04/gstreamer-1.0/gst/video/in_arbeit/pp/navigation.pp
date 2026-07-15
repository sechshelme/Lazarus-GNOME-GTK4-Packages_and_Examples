
unit navigation;
interface

{
  Automatically converted by H2Pas 1.0.0 from navigation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    navigation.h
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
Pgint  = ^gint;
PGstEvent  = ^GstEvent;
PGstMessage  = ^GstMessage;
PGstNavigation  = ^GstNavigation;
PGstNavigationCommand  = ^GstNavigationCommand;
PGstNavigationEventType  = ^GstNavigationEventType;
PGstNavigationInterface  = ^GstNavigationInterface;
PGstNavigationMessageType  = ^GstNavigationMessageType;
PGstNavigationModifierType  = ^GstNavigationModifierType;
PGstNavigationQueryType  = ^GstNavigationQueryType;
PGstObject  = ^GstObject;
PGstQuery  = ^GstQuery;
PGstStructure  = ^GstStructure;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Navigation
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 * Copyright (C) 2003 David A. Schleef <ds@schleef.org>
 *
 * navigation.h: navigation interface design
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_NAVIGATION_H__}
{$define __GST_NAVIGATION_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_NAVIGATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NAVIGATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NAVIGATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NAVIGATION_GET_INTERFACE(obj : longint) : longint;

type
{*
 * GstNavigationModifierType:
 * @GST_NAVIGATION_MODIFIER_SHIFT_MASK: the Shift key.
 * @GST_NAVIGATION_MODIFIER_CONTROL_MASK: the Control key.
 * @GST_NAVIGATION_MODIFIER_MOD1_MASK: the third modifier key
 * @GST_NAVIGATION_MODIFIER_MOD2_MASK: the fourth modifier key
 * @GST_NAVIGATION_MODIFIER_MOD3_MASK: the fifth modifier key
 * @GST_NAVIGATION_MODIFIER_MOD4_MASK: the sixth modifier key
 * @GST_NAVIGATION_MODIFIER_MOD5_MASK: the seventh modifier key
 * @GST_NAVIGATION_MODIFIER_BUTTON1_MASK: the first mouse button (usually the left button).
 * @GST_NAVIGATION_MODIFIER_BUTTON2_MASK: the second mouse button (usually the right button).
 * @GST_NAVIGATION_MODIFIER_BUTTON3_MASK: the third mouse button (usually the mouse wheel button or middle button).
 * @GST_NAVIGATION_MODIFIER_BUTTON4_MASK: the fourth mouse button (typically the "Back" button).
 * @GST_NAVIGATION_MODIFIER_BUTTON5_MASK: the fifth mouse button (typically the "forward" button).
 * @GST_NAVIGATION_MODIFIER_SUPER_MASK: the Super modifier
 * @GST_NAVIGATION_MODIFIER_HYPER_MASK: the Hyper modifier
 * @GST_NAVIGATION_MODIFIER_META_MASK: the Meta modifier
 * @GST_NAVIGATION_MODIFIER_MASK: A mask covering all entries in #GdkModifierType.
 *
 * Flags to indicate the state of modifier keys and mouse buttons
 * in events.
 *
 * Typical modifier keys are Shift, Control, Meta, Super, Hyper, Alt, Compose,
 * Apple, CapsLock or ShiftLock.
 *
 * Since: 1.22
  }

  PGstNavigationModifierType = ^TGstNavigationModifierType;
  TGstNavigationModifierType =  Longint;
  Const
    GST_NAVIGATION_MODIFIER_NONE = 0;
    GST_NAVIGATION_MODIFIER_SHIFT_MASK = 1 shl 0;
    GST_NAVIGATION_MODIFIER_LOCK_MASK = 1 shl 1;
    GST_NAVIGATION_MODIFIER_CONTROL_MASK = 1 shl 2;
    GST_NAVIGATION_MODIFIER_MOD1_MASK = 1 shl 3;
    GST_NAVIGATION_MODIFIER_MOD2_MASK = 1 shl 4;
    GST_NAVIGATION_MODIFIER_MOD3_MASK = 1 shl 5;
    GST_NAVIGATION_MODIFIER_MOD4_MASK = 1 shl 6;
    GST_NAVIGATION_MODIFIER_MOD5_MASK = 1 shl 7;
    GST_NAVIGATION_MODIFIER_BUTTON1_MASK = 1 shl 8;
    GST_NAVIGATION_MODIFIER_BUTTON2_MASK = 1 shl 9;
    GST_NAVIGATION_MODIFIER_BUTTON3_MASK = 1 shl 10;
    GST_NAVIGATION_MODIFIER_BUTTON4_MASK = 1 shl 11;
    GST_NAVIGATION_MODIFIER_BUTTON5_MASK = 1 shl 12;
    GST_NAVIGATION_MODIFIER_SUPER_MASK = 1 shl 26;
    GST_NAVIGATION_MODIFIER_HYPER_MASK = 1 shl 27;
    GST_NAVIGATION_MODIFIER_META_MASK = 1 shl 28;
    GST_NAVIGATION_MODIFIER_MASK = (((((((((((((((GST_NAVIGATION_MODIFIER_NONE or GST_NAVIGATION_MODIFIER_SHIFT_MASK) or GST_NAVIGATION_MODIFIER_LOCK_MASK) or GST_NAVIGATION_MODIFIER_CONTROL_MASK) or GST_NAVIGATION_MODIFIER_MOD1_MASK) or GST_NAVIGATION_MODIFIER_MOD2_MASK) or GST_NAVIGATION_MODIFIER_MOD3_MASK) or GST_NAVIGATION_MODIFIER_MOD4_MASK) or GST_NAVIGATION_MODIFIER_MOD5_MASK) or GST_NAVIGATION_MODIFIER_BUTTON1_MASK) or GST_NAVIGATION_MODIFIER_BUTTON2_MASK) or GST_NAVIGATION_MODIFIER_BUTTON3_MASK) or GST_NAVIGATION_MODIFIER_BUTTON4_MASK) or GST_NAVIGATION_MODIFIER_BUTTON5_MASK) or GST_NAVIGATION_MODIFIER_SUPER_MASK) or GST_NAVIGATION_MODIFIER_HYPER_MASK) or GST_NAVIGATION_MODIFIER_META_MASK;
;
{*
 * GstNavigationInterface:
 * @iface: the parent interface
 * @send_event: sending a navigation event
 * @send_event_simple: sending a navigation event (Since: 1.22)
 *
 * Navigation interface.
  }
{ virtual functions  }
{*
   * GstNavigationInterface::send_event:
   *
   * sending a navigation event.
   *
   * Deprecated: 1.22: Use #GstNavigationInterface.send_event_simple() instead.
    }
{*
   * GstNavigationInterface::send_event_simple:
   * @navigation: The navigation interface instance
   * @event: (transfer full): The event to send
   *
   * sending a navigation event.
   *
   * Since: 1.22
    }
type
  PGstNavigationInterface = ^TGstNavigationInterface;
  TGstNavigationInterface = record
      iface : TGTypeInterface;
      send_event : procedure (navigation:PGstNavigation; structure:PGstStructure);cdecl;
      send_event_simple : procedure (navigation:PGstNavigation; event:PGstEvent);cdecl;
    end;


function gst_navigation_get_type:TGType;cdecl;external;
{ Navigation commands  }
{*
 * GstNavigationCommand:
 * @GST_NAVIGATION_COMMAND_INVALID: An invalid command entry
 * @GST_NAVIGATION_COMMAND_MENU1: Execute navigation menu command 1. For DVD,
 * this enters the DVD root menu, or exits back to the title from the menu.
 * @GST_NAVIGATION_COMMAND_MENU2: Execute navigation menu command 2. For DVD,
 * this jumps to the DVD title menu.
 * @GST_NAVIGATION_COMMAND_MENU3: Execute navigation menu command 3. For DVD,
 * this jumps into the DVD root menu.
 * @GST_NAVIGATION_COMMAND_MENU4: Execute navigation menu command 4. For DVD,
 * this jumps to the Subpicture menu.
 * @GST_NAVIGATION_COMMAND_MENU5: Execute navigation menu command 5. For DVD,
 * the jumps to the audio menu.
 * @GST_NAVIGATION_COMMAND_MENU6: Execute navigation menu command 6. For DVD,
 * this jumps to the angles menu.
 * @GST_NAVIGATION_COMMAND_MENU7: Execute navigation menu command 7. For DVD,
 * this jumps to the chapter menu.
 * @GST_NAVIGATION_COMMAND_LEFT: Select the next button to the left in a menu,
 * if such a button exists.
 * @GST_NAVIGATION_COMMAND_RIGHT: Select the next button to the right in a menu,
 * if such a button exists.
 * @GST_NAVIGATION_COMMAND_UP: Select the button above the current one in a
 * menu, if such a button exists.
 * @GST_NAVIGATION_COMMAND_DOWN: Select the button below the current one in a
 * menu, if such a button exists.
 * @GST_NAVIGATION_COMMAND_ACTIVATE: Activate (click) the currently selected
 * button in a menu, if such a button exists.
 * @GST_NAVIGATION_COMMAND_PREV_ANGLE: Switch to the previous angle in a
 * multiangle feature.
 * @GST_NAVIGATION_COMMAND_NEXT_ANGLE: Switch to the next angle in a multiangle
 * feature.
 *
 * A set of commands that may be issued to an element providing the
 * #GstNavigation interface. The available commands can be queried via
 * the gst_navigation_query_new_commands() query.
 *
 * For convenience in handling DVD navigation, the MENU commands are aliased as:
 *    GST_NAVIGATION_COMMAND_DVD_MENU            = @GST_NAVIGATION_COMMAND_MENU1
 *    GST_NAVIGATION_COMMAND_DVD_TITLE_MENU      = @GST_NAVIGATION_COMMAND_MENU2
 *    GST_NAVIGATION_COMMAND_DVD_ROOT_MENU       = @GST_NAVIGATION_COMMAND_MENU3
 *    GST_NAVIGATION_COMMAND_DVD_SUBPICTURE_MENU = @GST_NAVIGATION_COMMAND_MENU4
 *    GST_NAVIGATION_COMMAND_DVD_AUDIO_MENU      = @GST_NAVIGATION_COMMAND_MENU5
 *    GST_NAVIGATION_COMMAND_DVD_ANGLE_MENU      = @GST_NAVIGATION_COMMAND_MENU6
 *    GST_NAVIGATION_COMMAND_DVD_CHAPTER_MENU    = @GST_NAVIGATION_COMMAND_MENU7
  }
type
  PGstNavigationCommand = ^TGstNavigationCommand;
  TGstNavigationCommand =  Longint;
  Const
    GST_NAVIGATION_COMMAND_INVALID = 0;
    GST_NAVIGATION_COMMAND_MENU1 = 1;
    GST_NAVIGATION_COMMAND_MENU2 = 2;
    GST_NAVIGATION_COMMAND_MENU3 = 3;
    GST_NAVIGATION_COMMAND_MENU4 = 4;
    GST_NAVIGATION_COMMAND_MENU5 = 5;
    GST_NAVIGATION_COMMAND_MENU6 = 6;
    GST_NAVIGATION_COMMAND_MENU7 = 7;
    GST_NAVIGATION_COMMAND_LEFT = 20;
    GST_NAVIGATION_COMMAND_RIGHT = 21;
    GST_NAVIGATION_COMMAND_UP = 22;
    GST_NAVIGATION_COMMAND_DOWN = 23;
    GST_NAVIGATION_COMMAND_ACTIVATE = 24;
    GST_NAVIGATION_COMMAND_PREV_ANGLE = 30;
    GST_NAVIGATION_COMMAND_NEXT_ANGLE = 31;
;
{ Some aliases for the menu command types  }
  GST_NAVIGATION_COMMAND_DVD_MENU = GST_NAVIGATION_COMMAND_MENU1;  
  GST_NAVIGATION_COMMAND_DVD_TITLE_MENU = GST_NAVIGATION_COMMAND_MENU2;  
  GST_NAVIGATION_COMMAND_DVD_ROOT_MENU = GST_NAVIGATION_COMMAND_MENU3;  
  GST_NAVIGATION_COMMAND_DVD_SUBPICTURE_MENU = GST_NAVIGATION_COMMAND_MENU4;  
  GST_NAVIGATION_COMMAND_DVD_AUDIO_MENU = GST_NAVIGATION_COMMAND_MENU5;  
  GST_NAVIGATION_COMMAND_DVD_ANGLE_MENU = GST_NAVIGATION_COMMAND_MENU6;  
  GST_NAVIGATION_COMMAND_DVD_CHAPTER_MENU = GST_NAVIGATION_COMMAND_MENU7;  
{ Queries  }
{*
 * GstNavigationQueryType:
 * @GST_NAVIGATION_QUERY_INVALID: invalid query
 * @GST_NAVIGATION_QUERY_COMMANDS: command query
 * @GST_NAVIGATION_QUERY_ANGLES: viewing angle query
 *
 * Types of navigation interface queries.
  }
type
  PGstNavigationQueryType = ^TGstNavigationQueryType;
  TGstNavigationQueryType =  Longint;
  Const
    GST_NAVIGATION_QUERY_INVALID = 0;
    GST_NAVIGATION_QUERY_COMMANDS = 1;
    GST_NAVIGATION_QUERY_ANGLES = 2;
;

function gst_navigation_query_get_type(query:PGstQuery):TGstNavigationQueryType;cdecl;external;
function gst_navigation_query_new_commands:PGstQuery;cdecl;external;
procedure gst_navigation_query_set_commands(query:PGstQuery; n_cmds:Tgint; args:array of const);cdecl;external;
procedure gst_navigation_query_set_commands(query:PGstQuery; n_cmds:Tgint);cdecl;external;
procedure gst_navigation_query_set_commandsv(query:PGstQuery; n_cmds:Tgint; cmds:PGstNavigationCommand);cdecl;external;
function gst_navigation_query_parse_commands_length(query:PGstQuery; n_cmds:Pguint):Tgboolean;cdecl;external;
function gst_navigation_query_parse_commands_nth(query:PGstQuery; nth:Tguint; cmd:PGstNavigationCommand):Tgboolean;cdecl;external;
function gst_navigation_query_new_angles:PGstQuery;cdecl;external;
procedure gst_navigation_query_set_angles(query:PGstQuery; cur_angle:Tguint; n_angles:Tguint);cdecl;external;
function gst_navigation_query_parse_angles(query:PGstQuery; cur_angle:Pguint; n_angles:Pguint):Tgboolean;cdecl;external;
{ Element messages  }
{*
 * GstNavigationMessageType:
 * @GST_NAVIGATION_MESSAGE_INVALID: Returned from
 * gst_navigation_message_get_type() when the passed message is not a
 * navigation message.
 * @GST_NAVIGATION_MESSAGE_MOUSE_OVER: Sent when the mouse moves over or leaves a
 * clickable region of the output, such as a DVD menu button.
 * @GST_NAVIGATION_MESSAGE_COMMANDS_CHANGED: Sent when the set of available commands
 * changes and should re-queried by interested applications.
 * @GST_NAVIGATION_MESSAGE_ANGLES_CHANGED: Sent when display angles in a multi-angle
 * feature (such as a multiangle DVD) change - either angles have appeared or
 * disappeared.
 * @GST_NAVIGATION_MESSAGE_EVENT: Sent when a navigation event was not handled
 * by any element in the pipeline (Since: 1.6)
 *
 * A set of notifications that may be received on the bus when navigation
 * related status changes.
  }
type
  PGstNavigationMessageType = ^TGstNavigationMessageType;
  TGstNavigationMessageType =  Longint;
  Const
    GST_NAVIGATION_MESSAGE_INVALID = 0;
    GST_NAVIGATION_MESSAGE_MOUSE_OVER = 1;
    GST_NAVIGATION_MESSAGE_COMMANDS_CHANGED = 2;
    GST_NAVIGATION_MESSAGE_ANGLES_CHANGED = 3;
    GST_NAVIGATION_MESSAGE_EVENT = 4;
;

function gst_navigation_message_get_type(message:PGstMessage):TGstNavigationMessageType;cdecl;external;
function gst_navigation_message_new_mouse_over(src:PGstObject; active:Tgboolean):PGstMessage;cdecl;external;
function gst_navigation_message_parse_mouse_over(message:PGstMessage; active:Pgboolean):Tgboolean;cdecl;external;
function gst_navigation_message_new_commands_changed(src:PGstObject):PGstMessage;cdecl;external;
function gst_navigation_message_new_angles_changed(src:PGstObject; cur_angle:Tguint; n_angles:Tguint):PGstMessage;cdecl;external;
function gst_navigation_message_parse_angles_changed(message:PGstMessage; cur_angle:Pguint; n_angles:Pguint):Tgboolean;cdecl;external;
function gst_navigation_message_new_event(src:PGstObject; event:PGstEvent):PGstMessage;cdecl;external;
function gst_navigation_message_parse_event(message:PGstMessage; event:PPGstEvent):Tgboolean;cdecl;external;
{ event parsing functions  }
{*
 * GstNavigationEventType:
 * @GST_NAVIGATION_EVENT_INVALID: Returned from
 * gst_navigation_event_get_type() when the passed event is not a navigation event.
 * @GST_NAVIGATION_EVENT_KEY_PRESS: A key press event. Use
 * gst_navigation_event_parse_key_event() to extract the details from the event.
 * @GST_NAVIGATION_EVENT_KEY_RELEASE: A key release event. Use
 * gst_navigation_event_parse_key_event() to extract the details from the event.
 * @GST_NAVIGATION_EVENT_MOUSE_BUTTON_PRESS: A mouse button press event. Use
 * gst_navigation_event_parse_mouse_button_event() to extract the details from the
 * event.
 * @GST_NAVIGATION_EVENT_MOUSE_BUTTON_RELEASE: A mouse button release event. Use
 * gst_navigation_event_parse_mouse_button_event() to extract the details from the
 * event.
 * @GST_NAVIGATION_EVENT_MOUSE_MOVE: A mouse movement event. Use
 * gst_navigation_event_parse_mouse_move_event() to extract the details from the
 * event.
 * @GST_NAVIGATION_EVENT_COMMAND: A navigation command event. Use
 * gst_navigation_event_parse_command() to extract the details from the event.
 * @GST_NAVIGATION_EVENT_MOUSE_SCROLL: A mouse scroll event. Use
 * gst_navigation_event_parse_mouse_scroll_event() to extract the details from
 * the event. (Since: 1.18)
 * @GST_NAVIGATION_EVENT_TOUCH_DOWN: An event describing a new touch point,
 * which will be assigned an identifier that is unique to it for the duration
 * of its movement on the screen. Use gst_navigation_event_parse_touch_event()
 * to extract the details from the event. (Since: 1.22)
 * @GST_NAVIGATION_EVENT_TOUCH_MOTION: An event describing the movement of an
 * active touch point across the screen. Use
 * gst_navigation_event_parse_touch_event() to extract the details from the
 * event. (Since: 1.22)
 * @GST_NAVIGATION_EVENT_TOUCH_UP: An event describing a removed touch point.
 * After this event, its identifier may be reused for any new touch points. Use
 * gst_navigation_event_parse_touch_up_event() to extract the details from the
 * event. (Since: 1.22)
 * @GST_NAVIGATION_EVENT_TOUCH_FRAME: An event signaling the end of a sequence
 * of simultaneous touch events. (Since: 1.22)
 * @GST_NAVIGATION_EVENT_TOUCH_CANCEL: An event cancelling all currently active
 * touch points. (Since: 1.22)
 * @GST_NAVIGATION_EVENT_MOUSE_DOUBLE_CLICK: A mouse button double click event. Use
 * gst_navigation_event_parse_mouse_button_event() to extract the details from the
 * event. (Since: 1.26)
 *
 * Enum values for the various events that an element implementing the
 * GstNavigation interface might send up the pipeline. Touch events have been
 * inspired by the libinput API, and have the same meaning here.
  }
{*
   * GST_NAVIGATION_EVENT_MOUSE_SCROLL:
   *
   * A mouse scroll event. Use gst_navigation_event_parse_mouse_scroll_event()
   * to extract the details from the event.
   *
   * Since: 1.18
    }
{*
   * GST_NAVIGATION_EVENT_TOUCH_DOWN:
   *
   * An event describing a new touch point, which will be assigned an identifier
   * that is unique to it for the duration of its movement on the screen.
   * Use gst_navigation_event_parse_touch_event() to extract the details
   * from the event.
   *
   * Since: 1.22
    }
{*
   * GST_NAVIGATION_EVENT_TOUCH_MOTION:
   *
   * An event describing the movement of an active touch point across
   * the screen. Use gst_navigation_event_parse_touch_event() to extract
   * the details from the event.
   *
   * Since: 1.22
    }
{*
   * GST_NAVIGATION_EVENT_TOUCH_UP:
   *
   * An event describing a removed touch point. After this event,
   * its identifier may be reused for any new touch points.
   * Use gst_navigation_event_parse_touch_up_event() to extract the details
   * from the event.
   *
   * Since: 1.22
    }
{*
   * GST_NAVIGATION_EVENT_TOUCH_FRAME:
   *
   * An event signaling the end of a sequence of simultaneous touch events.
   *
   * Since: 1.22
    }
{*
   * GST_NAVIGATION_EVENT_TOUCH_CANCEL:
   *
   * An event cancelling all currently active touch points.
   *
   * Since: 1.22
    }
{*
   * GST_NAVIGATION_EVENT_MOUSE_DOUBLE_CLICK:
   *
   * A mouse button double click event.
   * Use gst_navigation_event_parse_mouse_button_event() to extract the details
   * from the event.
   *
   * Since: 1.26
    }
type
  PGstNavigationEventType = ^TGstNavigationEventType;
  TGstNavigationEventType =  Longint;
  Const
    GST_NAVIGATION_EVENT_INVALID = 0;
    GST_NAVIGATION_EVENT_KEY_PRESS = 1;
    GST_NAVIGATION_EVENT_KEY_RELEASE = 2;
    GST_NAVIGATION_EVENT_MOUSE_BUTTON_PRESS = 3;
    GST_NAVIGATION_EVENT_MOUSE_BUTTON_RELEASE = 4;
    GST_NAVIGATION_EVENT_MOUSE_MOVE = 5;
    GST_NAVIGATION_EVENT_COMMAND = 6;
    GST_NAVIGATION_EVENT_MOUSE_SCROLL = 7;
    GST_NAVIGATION_EVENT_TOUCH_DOWN = 8;
    GST_NAVIGATION_EVENT_TOUCH_MOTION = 9;
    GST_NAVIGATION_EVENT_TOUCH_UP = 10;
    GST_NAVIGATION_EVENT_TOUCH_FRAME = 11;
    GST_NAVIGATION_EVENT_TOUCH_CANCEL = 12;
    GST_NAVIGATION_EVENT_MOUSE_DOUBLE_CLICK = 13;
;

function gst_navigation_event_get_type(event:PGstEvent):TGstNavigationEventType;cdecl;external;
(* Const before type ignored *)
function gst_navigation_event_new_key_press(key:Pgchar; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
(* Const before type ignored *)
function gst_navigation_event_new_key_release(key:Pgchar; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_mouse_button_press(button:Tgint; x:Tgdouble; y:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_mouse_double_click(button:Tgint; x:Tgdouble; y:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_mouse_button_release(button:Tgint; x:Tgdouble; y:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_mouse_move(x:Tgdouble; y:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_mouse_scroll(x:Tgdouble; y:Tgdouble; delta_x:Tgdouble; delta_y:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_command(command:TGstNavigationCommand):PGstEvent;cdecl;external;
function gst_navigation_event_new_touch_down(identifier:Tguint; x:Tgdouble; y:Tgdouble; pressure:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_touch_motion(identifier:Tguint; x:Tgdouble; y:Tgdouble; pressure:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_touch_up(identifier:Tguint; x:Tgdouble; y:Tgdouble; state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_touch_frame(state:TGstNavigationModifierType):PGstEvent;cdecl;external;
function gst_navigation_event_new_touch_cancel(state:TGstNavigationModifierType):PGstEvent;cdecl;external;
(* Const before type ignored *)
function gst_navigation_event_parse_key_event(event:PGstEvent; key:PPgchar):Tgboolean;cdecl;external;
function gst_navigation_event_parse_mouse_button_event(event:PGstEvent; button:Pgint; x:Pgdouble; y:Pgdouble):Tgboolean;cdecl;external;
function gst_navigation_event_parse_mouse_move_event(event:PGstEvent; x:Pgdouble; y:Pgdouble):Tgboolean;cdecl;external;
function gst_navigation_event_parse_mouse_scroll_event(event:PGstEvent; x:Pgdouble; y:Pgdouble; delta_x:Pgdouble; delta_y:Pgdouble):Tgboolean;cdecl;external;
function gst_navigation_event_parse_command(event:PGstEvent; command:PGstNavigationCommand):Tgboolean;cdecl;external;
function gst_navigation_event_parse_touch_event(event:PGstEvent; identifier:Pguint; x:Pgdouble; y:Pgdouble; pressure:Pgdouble):Tgboolean;cdecl;external;
function gst_navigation_event_parse_touch_up_event(event:PGstEvent; identifier:Pguint; x:Pgdouble; y:Pgdouble):Tgboolean;cdecl;external;
function gst_navigation_event_get_coordinates(event:PGstEvent; x:Pgdouble; y:Pgdouble):Tgboolean;cdecl;external;
function gst_navigation_event_set_coordinates(event:PGstEvent; x:Tgdouble; y:Tgdouble):Tgboolean;cdecl;external;
{ interface virtual function wrappers  }
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple) }
procedure gst_navigation_send_event(navigation:PGstNavigation; structure:PGstStructure);cdecl;external;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_navigation_send_key_event(navigation:PGstNavigation; event:Pchar; key:Pchar);cdecl;external;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple) }
(* Const before type ignored *)
procedure gst_navigation_send_mouse_event(navigation:PGstNavigation; event:Pchar; button:longint; x:Tdouble; y:Tdouble);cdecl;external;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple) }
procedure gst_navigation_send_mouse_scroll_event(navigation:PGstNavigation; x:Tdouble; y:Tdouble; delta_x:Tdouble; delta_y:Tdouble);cdecl;external;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple) }
procedure gst_navigation_send_command(navigation:PGstNavigation; command:TGstNavigationCommand);cdecl;external;
procedure gst_navigation_send_event_simple(navigation:PGstNavigation; event:PGstEvent);cdecl;external;
function gst_navigation_event_parse_modifier_state(event:PGstEvent; state:PGstNavigationModifierType):Tgboolean;cdecl;external;
{$endif}
{ __GST_NAVIGATION_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_NAVIGATION : longint; { return type might be wrong }
  begin
    GST_TYPE_NAVIGATION:=gst_navigation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NAVIGATION(obj : longint) : longint;
begin
  GST_NAVIGATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_NAVIGATION,GstNavigation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NAVIGATION(obj : longint) : longint;
begin
  GST_IS_NAVIGATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_NAVIGATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NAVIGATION_GET_INTERFACE(obj : longint) : longint;
begin
  GST_NAVIGATION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GST_TYPE_NAVIGATION,GstNavigationInterface);
end;


end.
