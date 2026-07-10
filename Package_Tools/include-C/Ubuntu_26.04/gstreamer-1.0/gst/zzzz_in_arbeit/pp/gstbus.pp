
unit gstbus;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbus
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
PGPollFD  = ^GPollFD;
PGSource  = ^GSource;
PGstBus  = ^GstBus;
PGstBusClass  = ^GstBusClass;
PGstBusFlags  = ^GstBusFlags;
PGstBusPrivate  = ^GstBusPrivate;
PGstBusSyncReply  = ^GstBusSyncReply;
PGstMessage  = ^GstMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2004 Wim Taymans <wim@fluendo.com>
 *
 * gstbus.h: Header for GstBus subsystem
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
{$ifndef __GST_BUS_H__}
{$define __GST_BUS_H__}
type
{$include <gst/gstmessage.h>}
{$include <gst/gstclock.h>}
{ --- standard type macros ---  }

{ was #define dname def_expr }
function GST_TYPE_BUS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUS(bus : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUS(bus : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUS_CLASS(bclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUS_CLASS(bclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUS_GET_CLASS(bus : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUS_CAST(bus : longint) : PGstBus;

{*
 * GstBusFlags:
 * @GST_BUS_FLUSHING: The bus is currently dropping all messages
 * @GST_BUS_FLAG_LAST: offset to define more flags
 *
 * The standard flags that a bus may have.
  }
{ padding  }
type
  PGstBusFlags = ^TGstBusFlags;
  TGstBusFlags =  Longint;
  Const
    GST_BUS_FLUSHING = GST_OBJECT_FLAG_LAST shl 0;
    GST_BUS_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 1;
;
{*
 * GstBusSyncReply:
 * @GST_BUS_DROP: drop the message
 * @GST_BUS_PASS: pass the message to the async queue
 * @GST_BUS_ASYNC: pass message to async queue, continue if message is handled
 *
 * The result values for a GstBusSyncHandler.
  }
type
  PGstBusSyncReply = ^TGstBusSyncReply;
  TGstBusSyncReply =  Longint;
  Const
    GST_BUS_DROP = 0;
    GST_BUS_PASS = 1;
    GST_BUS_ASYNC = 2;
;
{*
 * GstBusSyncHandler:
 * @bus: the #GstBus that sent the message
 * @message: the #GstMessage
 * @user_data: user data that has been given, when registering the handler
 *
 * Handler will be invoked synchronously, when a new message has been injected
 * into the bus. This function is mostly used internally. Only one sync handler
 * can be attached to a given bus.
 *
 * If the handler returns %GST_BUS_DROP, it should unref the message, else the
 * message should not be unreffed by the sync handler.
 *
 * Returns: #GstBusSyncReply stating what to do with the message
  }
type

  TGstBusSyncHandler = function (bus:PGstBus; message:PGstMessage; user_data:Tgpointer):TGstBusSyncReply;cdecl;
{*
 * GstBusFunc:
 * @bus: the #GstBus that sent the message
 * @message: the #GstMessage
 * @user_data: user data that has been given, when registering the handler
 *
 * Specifies the type of function passed to gst_bus_add_watch() or
 * gst_bus_add_watch_full(), which is called from the mainloop when a message
 * is available on the bus.
 *
 * The message passed to the function will be unreffed after execution of this
 * function so it should not be freed in the function.
 *
 * Note that this function is used as a #GSourceFunc which means that returning
 * %FALSE will remove the #GSource from the mainloop.
 *
 * Returns: %FALSE if the event source should be removed.
  }

  TGstBusFunc = function (bus:PGstBus; message:PGstMessage; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstBus:
 * @object: the parent structure
 *
 * The opaque #GstBus data structure.
  }
{< private > }
  PGstBus = ^TGstBus;
  TGstBus = record
      object : TGstObject;cdecl;
      priv : PGstBusPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstBusClass:
 * @parent_class: the parent class structure
 *
 * GStreamer bus class.
  }
{ signals  }
{*
   * GstBusClass::message:
   * @bus: the #GstBus
   * @message: the message that has been posted asynchronously
   *
   * A message has been posted on the bus.
    }
{*
   * GstBusClass::sync_message:
   * @bus: the #GstBus
   * @message: the message that has been posted synchronously
   *
   * A message has been posted on the bus.
    }
{< private > }
  PGstBusClass = ^TGstBusClass;
  TGstBusClass = record
      parent_class : TGstObjectClass;
      message : procedure (bus:PGstBus; message:PGstMessage);cdecl;
      sync_message : procedure (bus:PGstBus; message:PGstMessage);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_bus_get_type:TGType;cdecl;external;
function gst_bus_new:PGstBus;cdecl;external;
function gst_bus_post(bus:PGstBus; message:PGstMessage):Tgboolean;cdecl;external;
function gst_bus_have_pending(bus:PGstBus):Tgboolean;cdecl;external;
function gst_bus_peek(bus:PGstBus):PGstMessage;cdecl;external;
function gst_bus_pop(bus:PGstBus):PGstMessage;cdecl;external;
function gst_bus_pop_filtered(bus:PGstBus; types:TGstMessageType):PGstMessage;cdecl;external;
function gst_bus_timed_pop(bus:PGstBus; timeout:TGstClockTime):PGstMessage;cdecl;external;
function gst_bus_timed_pop_filtered(bus:PGstBus; timeout:TGstClockTime; types:TGstMessageType):PGstMessage;cdecl;external;
procedure gst_bus_set_flushing(bus:PGstBus; flushing:Tgboolean);cdecl;external;
{ synchronous dispatching  }
procedure gst_bus_set_sync_handler(bus:PGstBus; func:TGstBusSyncHandler; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{ asynchronous message notifications  }
procedure gst_bus_get_pollfd(bus:PGstBus; fd:PGPollFD);cdecl;external;
{ GSource based dispatching  }
function gst_bus_create_watch(bus:PGstBus):PGSource;cdecl;external;
function gst_bus_add_watch_full(bus:PGstBus; priority:Tgint; func:TGstBusFunc; user_data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external;
function gst_bus_add_watch(bus:PGstBus; func:TGstBusFunc; user_data:Tgpointer):Tguint;cdecl;external;
function gst_bus_remove_watch(bus:PGstBus):Tgboolean;cdecl;external;
{ polling the bus  }
function gst_bus_poll(bus:PGstBus; events:TGstMessageType; timeout:TGstClockTime):PGstMessage;cdecl;external;
{ signal based dispatching helper functions.  }
function gst_bus_async_signal_func(bus:PGstBus; message:PGstMessage; data:Tgpointer):Tgboolean;cdecl;external;
function gst_bus_sync_signal_handler(bus:PGstBus; message:PGstMessage; data:Tgpointer):TGstBusSyncReply;cdecl;external;
{ convenience api to add/remove a gsource that emits the async signals  }
procedure gst_bus_add_signal_watch(bus:PGstBus);cdecl;external;
procedure gst_bus_add_signal_watch_full(bus:PGstBus; priority:Tgint);cdecl;external;
procedure gst_bus_remove_signal_watch(bus:PGstBus);cdecl;external;
procedure gst_bus_enable_sync_message_emission(bus:PGstBus);cdecl;external;
procedure gst_bus_disable_sync_message_emission(bus:PGstBus);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstBus, gst_object_unref) }
{$endif}
{ __GST_BUS_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BUS : longint; { return type might be wrong }
  begin
    GST_TYPE_BUS:=gst_bus_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUS(bus : longint) : longint;
begin
  GST_BUS:=G_TYPE_CHECK_INSTANCE_CAST(bus,GST_TYPE_BUS,GstBus);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUS(bus : longint) : longint;
begin
  GST_IS_BUS:=G_TYPE_CHECK_INSTANCE_TYPE(bus,GST_TYPE_BUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUS_CLASS(bclass : longint) : longint;
begin
  GST_BUS_CLASS:=G_TYPE_CHECK_CLASS_CAST(bclass,GST_TYPE_BUS,GstBusClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUS_CLASS(bclass : longint) : longint;
begin
  GST_IS_BUS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(bclass,GST_TYPE_BUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUS_GET_CLASS(bus : longint) : longint;
begin
  GST_BUS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(bus,GST_TYPE_BUS,GstBusClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUS_CAST(bus : longint) : PGstBus;
begin
  GST_BUS_CAST:=PGstBus(bus);
end;


end.
