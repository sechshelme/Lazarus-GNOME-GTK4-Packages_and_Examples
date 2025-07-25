
unit ibusxevent;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusxevent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusxevent.h
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
Pgchar  = ^gchar;
PIBusExtensionEvent  = ^IBusExtensionEvent;
PIBusExtensionEventClass  = ^IBusExtensionEventClass;
PIBusExtensionEventPrivate  = ^IBusExtensionEventPrivate;
PIBusProcessKeyEventData  = ^IBusProcessKeyEventData;
PIBusXEvent  = ^IBusXEvent;
PIBusXEventClass  = ^IBusXEventClass;
PIBusXEventPrivate  = ^IBusXEventPrivate;
PIBusXEventType  = ^IBusXEventType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2018 Takao Fujiwara <takao.fujiwara1@gmail.com>
 * Copyright (C) 2018 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_X_EVENT_H_}
{$define __IBUS_X_EVENT_H_}
{*
 * SECTION: ibusxevent
 * @short_description: Extension Event wrapper object
 * @title: IBusExtensionEvent
 * @stability: Unstable
 *
 * An IBusXEvent provides a wrapper of XEvent.
 *
 * see_also: #IBusComponent, #IBusEngineDesc
  }
{$include "ibusserializable.h"}
{
 * Type macros.
  }
{ define GOBJECT macros  }

{ was #define dname def_expr }
function IBUS_TYPE_EXTENSION_EVENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_EXTENSION_EVENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_EXTENSION_EVENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_EXTENSION_EVENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_EXTENSION_EVENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_EXTENSION_EVENT_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function IBUS_TYPE_X_EVENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_X_EVENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_X_EVENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_X_EVENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_X_EVENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_X_EVENT_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusProcessKeyEventData:
 *
 * IBuProcessKeyEventData properties.
  }
{< public > }
  PIBusProcessKeyEventData = ^TIBusProcessKeyEventData;
  TIBusProcessKeyEventData = record
      keyval : Tguint;
      keycode : Tguint;
      state : Tguint;
    end;

{*
 * IBusExtensionEvent:
 *
 * IBusExtensionEvent properties.
  }
{< private > }
{ instance members  }
{< public > }
  PIBusExtensionEvent = ^TIBusExtensionEvent;
  TIBusExtensionEvent = record
      parent : TIBusSerializable;
      priv : PIBusExtensionEventPrivate;
    end;

{< private > }
{ class members  }
{< public > }
{< private > }
{ padding  }
  PIBusExtensionEventClass = ^TIBusExtensionEventClass;
  TIBusExtensionEventClass = record
      parent : TIBusSerializableClass;
      pdummy : array[0..9] of Tgpointer;
    end;


function ibus_extension_event_get_type:TGType;cdecl;external;
{*
 * ibus_extension_event_new:
 * @first_property_name: Name of the first property.
 * @...: the NULL-terminated arguments of the properties and values.
 *
 * Create a new #IBusExtensionEvent.
 *
 * Returns: A newly allocated #IBusExtensionEvent. E.g.
 * ibus_extension_event_new ("name", "emoji", "is-enabled", TRUE, NULL);
  }
(* Const before type ignored *)
function ibus_extension_event_new(first_property_name:Pgchar; args:array of const):PIBusExtensionEvent;cdecl;external;
function ibus_extension_event_new(first_property_name:Pgchar):PIBusExtensionEvent;cdecl;external;
{*
 * ibus_extension_event_get_version:
 * @event: An #IBusExtensionEvent.
 *
 * Returns: Version of #IBusExtensionEvent
  }
function ibus_extension_event_get_version(event:PIBusExtensionEvent):Tguint;cdecl;external;
{*
 * ibus_extension_event_get_purpose:
 * @event: An #IBusExtensionEvent.
 *
 * Returns: name of the extension for #IBusXEvent
  }
(* Const before type ignored *)
function ibus_extension_event_get_name(event:PIBusExtensionEvent):Pgchar;cdecl;external;
{*
 * ibus_extension_event_is_enabled:
 * @event: An #IBusExtensionEvent.
 *
 * Returns: %TRUE if the extension is enabled for #IBusExtensionEvent
  }
function ibus_extension_event_is_enabled(event:PIBusExtensionEvent):Tgboolean;cdecl;external;
{*
 * ibus_extension_event_is_extension:
 * @event: An #IBusExtensionEvent.
 *
 * Returns: %TRUE if the #IBusExtensionEvent is called by an extension.
 * %FALSE if the #IBusExtensionEvent is called by an active engine or
 * panel.
 * If this value is %TRUE, the event is send to ibus-daemon, an active
 * engine. If it's %FALSE, the event is sned to ibus-daemon, panels.
  }
function ibus_extension_event_is_extension(event:PIBusExtensionEvent):Tgboolean;cdecl;external;
{*
 * ibus_extension_event_get_params:
 * @event: An #IBusExtensionEvent.
 *
 * Returns: Parameters to enable the extension for #IBusXEvent
  }
(* Const before type ignored *)
function ibus_extension_event_get_params(event:PIBusExtensionEvent):Pgchar;cdecl;external;
{ helper variable for decls  }
type
  PIBusXEventType = ^TIBusXEventType;
  TIBusXEventType =  Longint;
  Const
    IBUS_X_EVENT_NOTHING = -(1);
    IBUS_X_EVENT_KEY_PRESS = 0;
    IBUS_X_EVENT_KEY_RELEASE = 1;
    IBUS_X_EVENT_OTHER = 2;
    IBUS_X_EVENT_EVENT_LAST = 3;
;
{*
 * IBusXEvent:
 * @type: event type
 *
 * IBusXEvent properties.
  }
{< private > }
{ instance members  }
{< public > }
type
  PIBusXEvent = ^TIBusXEvent;
  TIBusXEvent = record
      parent : TIBusSerializable;
      priv : PIBusXEventPrivate;
      event_type : TIBusXEventType;
      window : Tguint;
      send_event : Tgint8;
      serial : Tgulong;
    end;

{< private > }
{ class members  }
{< public > }
{< private > }
{ padding  }
  PIBusXEventClass = ^TIBusXEventClass;
  TIBusXEventClass = record
      parent : TIBusSerializableClass;
      pdummy : array[0..9] of Tgpointer;
    end;


function ibus_x_event_get_type:TGType;cdecl;external;
{*
 * ibus_x_event_new:
 * @first_property_name: Name of the first property.
 * @...: the NULL-terminated arguments of the properties and values.
 *
 * Create a new #IBusXEvent.
 *
 * Returns: A newly allocated #IBusXEvent. E.g.
 * ibus_x_event_new ("event-type", IBUS_X_EVENT_KEY_PRESS, NULL);
  }
(* Const before type ignored *)
function ibus_x_event_new(first_property_name:Pgchar; args:array of const):PIBusXEvent;cdecl;external;
function ibus_x_event_new(first_property_name:Pgchar):PIBusXEvent;cdecl;external;
{*
 * ibus_x_event_get_version:
 * @event: An #IBusXEvent.
 *
 * Returns: Version of #IBusXEvent
  }
function ibus_x_event_get_version(event:PIBusXEvent):Tguint;cdecl;external;
{*
 * ibus_x_event_get_event_type:
 * @event: An #IBusXEvent.
 *
 * Returns: IBusXEventType of #IBusXEvent
  }
function ibus_x_event_get_event_type(event:PIBusXEvent):TIBusXEventType;cdecl;external;
{*
 * ibus_x_event_get_window:
 * @event: An #IBusXEvent.
 *
 * Returns: XID of #IBusXEvent
  }
function ibus_x_event_get_window(event:PIBusXEvent):Tguint32;cdecl;external;
{*
 * ibus_x_event_get_send_event:
 * @event: An #IBusXEvent.
 *
 * Returns: send_event of #IBusXEvent
  }
function ibus_x_event_get_send_event(event:PIBusXEvent):Tgint8;cdecl;external;
{*
 * ibus_x_event_get_serial:
 * @event: An #IBusXEvent.
 *
 * Returns: serial of #IBusXEvent
  }
function ibus_x_event_get_serial(event:PIBusXEvent):Tgulong;cdecl;external;
{*
 * ibus_x_event_get_time:
 * @event: An #IBusXEvent.
 *
 * Returns: time of #IBusXEvent
  }
function ibus_x_event_get_time(event:PIBusXEvent):Tguint32;cdecl;external;
{*
 * ibus_x_event_get_state:
 * @event: An #IBusXEvent.
 *
 * Returns: state of #IBusXEvent
  }
function ibus_x_event_get_state(event:PIBusXEvent):Tguint;cdecl;external;
{*
 * ibus_x_event_get_keyval:
 * @event: An #IBusXEvent.
 *
 * Returns: keyval of #IBusXEvent
  }
function ibus_x_event_get_keyval(event:PIBusXEvent):Tguint;cdecl;external;
{*
 * ibus_x_event_get_length:
 * @event: An #IBusXEvent.
 *
 * Returns: length of #IBusXEvent
  }
function ibus_x_event_get_length(event:PIBusXEvent):Tgint;cdecl;external;
{*
 * ibus_x_event_get_string:
 * @event: An #IBusXEvent.
 *
 * Returns: string of #IBusXEvent
  }
(* Const before type ignored *)
function ibus_x_event_get_string(event:PIBusXEvent):Pgchar;cdecl;external;
{*
 * ibus_x_event_get_hardware_keycode:
 * @event: An #IBusXEvent.
 *
 * Returns: hardware keycode of #IBusXEvent
  }
function ibus_x_event_get_hardware_keycode(event:PIBusXEvent):Tguint16;cdecl;external;
{*
 * ibus_x_event_get_group:
 * @event: An #IBusXEvent.
 *
 * Returns: group of #IBusXEvent
  }
function ibus_x_event_get_group(event:PIBusXEvent):Tguint8;cdecl;external;
{*
 * ibus_x_event_get_is_modifier:
 * @event: An #IBusXEvent.
 *
 * Returns: is_modifier of #IBusXEvent
  }
function ibus_x_event_get_is_modifier(event:PIBusXEvent):Tgboolean;cdecl;external;
{*
 * ibus_x_event_get_subwindow:
 * @event: An #IBusXEvent.
 *
 * Returns: subwindow of #IBusXEvent
  }
function ibus_x_event_get_subwindow(event:PIBusXEvent):Tguint32;cdecl;external;
{*
 * ibus_x_event_get_root:
 * @event: An #IBusXEvent.
 *
 * Returns: root window of #IBusXEvent
  }
function ibus_x_event_get_root(event:PIBusXEvent):Tguint32;cdecl;external;
{*
 * ibus_x_event_get_x:
 * @event: An #IBusXEvent.
 *
 * Returns: x of #IBusXEvent
  }
function ibus_x_event_get_x(event:PIBusXEvent):Tgint;cdecl;external;
{*
 * ibus_x_event_get_y:
 * @event: An #IBusXEvent.
 *
 * Returns: y of #IBusXEvent
  }
function ibus_x_event_get_y(event:PIBusXEvent):Tgint;cdecl;external;
{*
 * ibus_x_event_get_x_root:
 * @event: An #IBusXEvent.
 *
 * Returns: x-root of #IBusXEvent
  }
function ibus_x_event_get_x_root(event:PIBusXEvent):Tgint;cdecl;external;
{*
 * ibus_x_event_get_y_root:
 * @event: An #IBusXEvent.
 *
 * Returns: y-root of #IBusXEvent
  }
function ibus_x_event_get_y_root(event:PIBusXEvent):Tgint;cdecl;external;
{*
 * ibus_x_event_get_same_screen:
 * @event: An #IBusXEvent.
 *
 * Returns: same_screen of #IBusXEvent
  }
function ibus_x_event_get_same_screen(event:PIBusXEvent):Tgboolean;cdecl;external;
{*
 * ibus_x_event_get_purpose:
 * @event: An #IBusXEvent.
 *
 * Returns: purpose of #IBusXEvent
  }
(* Const before type ignored *)
function ibus_x_event_get_purpose(event:PIBusXEvent):Pgchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_EXTENSION_EVENT : longint; { return type might be wrong }
  begin
    IBUS_TYPE_EXTENSION_EVENT:=ibus_extension_event_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_EXTENSION_EVENT(obj : longint) : longint;
begin
  IBUS_EXTENSION_EVENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_EXTENSION_EVENT,IBusExtensionEvent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_EXTENSION_EVENT_CLASS(klass : longint) : longint;
begin
  IBUS_EXTENSION_EVENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_EXTENSION_EVENT,IBusExtensionEventClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_EXTENSION_EVENT(obj : longint) : longint;
begin
  IBUS_IS_EXTENSION_EVENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_EXTENSION_EVENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_EXTENSION_EVENT_CLASS(klass : longint) : longint;
begin
  IBUS_IS_EXTENSION_EVENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_EXTENSION_EVENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_EXTENSION_EVENT_GET_CLASS(obj : longint) : longint;
begin
  IBUS_EXTENSION_EVENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_EXTENSION_EVENT,IBusExtensionEventClass);
end;

{ was #define dname def_expr }
function IBUS_TYPE_X_EVENT : longint; { return type might be wrong }
  begin
    IBUS_TYPE_X_EVENT:=ibus_x_event_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_X_EVENT(obj : longint) : longint;
begin
  IBUS_X_EVENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_X_EVENT,IBusXEvent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_X_EVENT_CLASS(klass : longint) : longint;
begin
  IBUS_X_EVENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_X_EVENT,IBusXEventClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_X_EVENT(obj : longint) : longint;
begin
  IBUS_IS_X_EVENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_X_EVENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_X_EVENT_CLASS(klass : longint) : longint;
begin
  IBUS_IS_X_EVENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_X_EVENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_X_EVENT_GET_CLASS(obj : longint) : longint;
begin
  IBUS_X_EVENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_X_EVENT,IBusXEventClass);
end;


end.
