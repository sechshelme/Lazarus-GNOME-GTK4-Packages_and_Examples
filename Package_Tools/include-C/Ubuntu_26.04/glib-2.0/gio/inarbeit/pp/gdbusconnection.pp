
unit gdbusconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusconnection.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGClosure  = ^GClosure;
PGCredentials  = ^GCredentials;
PGDBusAuthObserver  = ^GDBusAuthObserver;
PGDBusConnection  = ^GDBusConnection;
PGDBusInterfaceGetPropertyFunc  = ^GDBusInterfaceGetPropertyFunc;
PGDBusInterfaceInfo  = ^GDBusInterfaceInfo;
PGDBusInterfaceVTable  = ^GDBusInterfaceVTable;
PGDBusMessage  = ^GDBusMessage;
PGDBusMessageFilterFunction  = ^GDBusMessageFilterFunction;
PGDBusMethodInvocation  = ^GDBusMethodInvocation;
PGDBusSubtreeDispatchFunc  = ^GDBusSubtreeDispatchFunc;
PGDBusSubtreeEnumerateFunc  = ^GDBusSubtreeEnumerateFunc;
PGDBusSubtreeIntrospectFunc  = ^GDBusSubtreeIntrospectFunc;
PGDBusSubtreeVTable  = ^GDBusSubtreeVTable;
PGError  = ^GError;
PGIOStream  = ^GIOStream;
Pgpointer  = ^gpointer;
Pguint32  = ^guint32;
PGUnixFDList  = ^GUnixFDList;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_DBUS_CONNECTION_H__}
{$define __G_DBUS_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_CONNECTION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_CONNECTION(o : longint) : longint;

function g_dbus_connection_get_type:TGType;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
procedure g_bus_get(bus_type:TGBusType; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_bus_get_finish(res:PGAsyncResult; error:PPGError):PGDBusConnection;cdecl;external;
function g_bus_get_sync(bus_type:TGBusType; cancellable:PGCancellable; error:PPGError):PGDBusConnection;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
(* Const before type ignored *)
procedure g_dbus_connection_new(stream:PGIOStream; guid:Pgchar; flags:TGDBusConnectionFlags; observer:PGDBusAuthObserver; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_connection_new_finish(res:PGAsyncResult; error:PPGError):PGDBusConnection;cdecl;external;
(* Const before type ignored *)
function g_dbus_connection_new_sync(stream:PGIOStream; guid:Pgchar; flags:TGDBusConnectionFlags; observer:PGDBusAuthObserver; cancellable:PGCancellable; 
           error:PPGError):PGDBusConnection;cdecl;external;
(* Const before type ignored *)
procedure g_dbus_connection_new_for_address(address:Pgchar; flags:TGDBusConnectionFlags; observer:PGDBusAuthObserver; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_dbus_connection_new_for_address_finish(res:PGAsyncResult; error:PPGError):PGDBusConnection;cdecl;external;
(* Const before type ignored *)
function g_dbus_connection_new_for_address_sync(address:Pgchar; flags:TGDBusConnectionFlags; observer:PGDBusAuthObserver; cancellable:PGCancellable; error:PPGError):PGDBusConnection;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
procedure g_dbus_connection_start_message_processing(connection:PGDBusConnection);cdecl;external;
function g_dbus_connection_is_closed(connection:PGDBusConnection):Tgboolean;cdecl;external;
function g_dbus_connection_get_stream(connection:PGDBusConnection):PGIOStream;cdecl;external;
(* Const before type ignored *)
function g_dbus_connection_get_guid(connection:PGDBusConnection):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_dbus_connection_get_unique_name(connection:PGDBusConnection):Pgchar;cdecl;external;
function g_dbus_connection_get_peer_credentials(connection:PGDBusConnection):PGCredentials;cdecl;external;
function g_dbus_connection_get_last_serial(connection:PGDBusConnection):Tguint32;cdecl;external;
function g_dbus_connection_get_exit_on_close(connection:PGDBusConnection):Tgboolean;cdecl;external;
procedure g_dbus_connection_set_exit_on_close(connection:PGDBusConnection; exit_on_close:Tgboolean);cdecl;external;
function g_dbus_connection_get_capabilities(connection:PGDBusConnection):TGDBusCapabilityFlags;cdecl;external;
function g_dbus_connection_get_flags(connection:PGDBusConnection):TGDBusConnectionFlags;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
procedure g_dbus_connection_close(connection:PGDBusConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_connection_close_finish(connection:PGDBusConnection; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_dbus_connection_close_sync(connection:PGDBusConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
procedure g_dbus_connection_flush(connection:PGDBusConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_connection_flush_finish(connection:PGDBusConnection; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_dbus_connection_flush_sync(connection:PGDBusConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
function g_dbus_connection_send_message(connection:PGDBusConnection; message:PGDBusMessage; flags:TGDBusSendMessageFlags; out_serial:Pguint32; error:PPGError):Tgboolean;cdecl;external;
procedure g_dbus_connection_send_message_with_reply(connection:PGDBusConnection; message:PGDBusMessage; flags:TGDBusSendMessageFlags; timeout_msec:Tgint; out_serial:Pguint32; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_connection_send_message_with_reply_finish(connection:PGDBusConnection; res:PGAsyncResult; error:PPGError):PGDBusMessage;cdecl;external;
function g_dbus_connection_send_message_with_reply_sync(connection:PGDBusConnection; message:PGDBusMessage; flags:TGDBusSendMessageFlags; timeout_msec:Tgint; out_serial:Pguint32; 
           cancellable:PGCancellable; error:PPGError):PGDBusMessage;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_connection_emit_signal(connection:PGDBusConnection; destination_bus_name:Pgchar; object_path:Pgchar; interface_name:Pgchar; signal_name:Pgchar; 
           parameters:PGVariant; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_dbus_connection_call(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar; interface_name:Pgchar; method_name:Pgchar; 
            parameters:PGVariant; reply_type:PGVariantType; flags:TGDBusCallFlags; timeout_msec:Tgint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_connection_call_finish(connection:PGDBusConnection; res:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_connection_call_sync(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar; interface_name:Pgchar; method_name:Pgchar; 
           parameters:PGVariant; reply_type:PGVariantType; flags:TGDBusCallFlags; timeout_msec:Tgint; cancellable:PGCancellable; 
           error:PPGError):PGVariant;cdecl;external;
{$ifdef G_OS_UNIX}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_dbus_connection_call_with_unix_fd_list(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar; interface_name:Pgchar; method_name:Pgchar; 
            parameters:PGVariant; reply_type:PGVariantType; flags:TGDBusCallFlags; timeout_msec:Tgint; fd_list:PGUnixFDList; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dbus_connection_call_with_unix_fd_list_finish(connection:PGDBusConnection; out_fd_list:PPGUnixFDList; res:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_connection_call_with_unix_fd_list_sync(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar; interface_name:Pgchar; method_name:Pgchar; 
           parameters:PGVariant; reply_type:PGVariantType; flags:TGDBusCallFlags; timeout_msec:Tgint; fd_list:PGUnixFDList; 
           out_fd_list:PPGUnixFDList; cancellable:PGCancellable; error:PPGError):PGVariant;cdecl;external;
{$endif}
{ G_OS_UNIX  }
{ ----------------------------------------------------------------------------------------------------  }
{*
 * GDBusInterfaceMethodCallFunc:
 * @connection: A #GDBusConnection.
 * @sender: (nullable): The unique bus name of the remote caller, or `NULL` if
 *     not specified by the caller, e.g. on peer-to-peer connections.
 * @object_path: The object path that the method was invoked on.
 * @interface_name: (nullable): The D-Bus interface name the method was invoked on,
 *     or `NULL` if not specified by the sender.
 * @method_name: The name of the method that was invoked.
 * @parameters: A #GVariant tuple with parameters.
 * @invocation: (transfer full): A #GDBusMethodInvocation object that must be used to return a value or error.
 * @user_data: The @user_data #gpointer passed to g_dbus_connection_register_object().
 *
 * The type of the @method_call function in #GDBusInterfaceVTable.
 *
 * @interface_name may be `NULL` if not specified by the sender, although it’s
 * encouraged for the sender to set it. If unset, and the object has only one
 * method (across all interfaces) matching @method_name, that method is invoked.
 * Otherwise, behaviour is implementation defined. See the
 * [D-Bus specification](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-types-method).
 * It is recommended to return [error@Gio.DBusError.UNKNOWN_METHOD].
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGDBusInterfaceMethodCallFunc = procedure (connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; method_name:Pgchar; 
                parameters:PGVariant; invocation:PGDBusMethodInvocation; user_data:Tgpointer);cdecl;
{*
 * GDBusInterfaceGetPropertyFunc:
 * @connection: A #GDBusConnection.
 * @sender: (nullable): The unique bus name of the remote caller or %NULL if
 *     not specified by the caller, e.g. on peer-to-peer connections.
 * @object_path: The object path that the method was invoked on.
 * @interface_name: The D-Bus interface name for the property.
 * @property_name: The name of the property to get the value of.
 * @error: Return location for error.
 * @user_data: The @user_data #gpointer passed to g_dbus_connection_register_object().
 *
 * The type of the @get_property function in #GDBusInterfaceVTable.
 *
 * Returns: A #GVariant with the value for @property_name or %NULL if
 *     @error is set. If the returned #GVariant is floating, it is
 *     consumed - otherwise its reference count is decreased by one.
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PGDBusInterfaceGetPropertyFunc = ^TGDBusInterfaceGetPropertyFunc;
  TGDBusInterfaceGetPropertyFunc = function (connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; property_name:Pgchar; 
               error:PPGError; user_data:Tgpointer):PGVariant;cdecl;
{*
 * GDBusInterfaceSetPropertyFunc:
 * @connection: A #GDBusConnection.
 * @sender: (nullable): The unique bus name of the remote caller or %NULL if
 *     not specified by the caller, e.g. on peer-to-peer connections.
 * @object_path: The object path that the method was invoked on.
 * @interface_name: The D-Bus interface name for the property.
 * @property_name: The name of the property to get the value of.
 * @value: The value to set the property to.
 * @error: Return location for error.
 * @user_data: The @user_data #gpointer passed to g_dbus_connection_register_object().
 *
 * The type of the @set_property function in #GDBusInterfaceVTable.
 *
 * Returns: %TRUE if the property was set to @value, %FALSE if @error is set.
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TGDBusInterfaceSetPropertyFunc = function (connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; property_name:Pgchar; 
               value:PGVariant; error:PPGError; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GDBusInterfaceVTable:
 * @method_call: Function for handling incoming method calls.
 * @get_property: Function for getting a property.
 * @set_property: Function for setting a property.
 *
 * Virtual table for handling properties and method calls for a D-Bus
 * interface.
 *
 * Since 2.38, if you want to handle getting/setting D-Bus properties
 * asynchronously, give %NULL as your get_property() or set_property()
 * function. The D-Bus call will be directed to your @method_call function,
 * with the provided @interface_name set to "org.freedesktop.DBus.Properties".
 *
 * Ownership of the #GDBusMethodInvocation object passed to the
 * method_call() function is transferred to your handler; you must
 * call one of the methods of #GDBusMethodInvocation to return a reply
 * (possibly empty), or an error. These functions also take ownership
 * of the passed-in invocation object, so unless the invocation
 * object has otherwise been referenced, it will be then be freed.
 * Calling one of these functions may be done within your
 * method_call() implementation but it also can be done at a later
 * point to handle the method asynchronously.
 *
 * The usual checks on the validity of the calls is performed. For
 * `Get` calls, an error is automatically returned if the property does
 * not exist or the permissions do not allow access. The same checks are
 * performed for `Set` calls, and the provided value is also checked for
 * being the correct type.
 *
 * For both `Get` and `Set` calls, the #GDBusMethodInvocation
 * passed to the @method_call handler can be queried with
 * g_dbus_method_invocation_get_property_info() to get a pointer
 * to the #GDBusPropertyInfo of the property.
 *
 * If you have readable properties specified in your interface info,
 * you must ensure that you either provide a non-%NULL @get_property()
 * function or provide implementations of both the `Get` and `GetAll`
 * methods on org.freedesktop.DBus.Properties interface in your @method_call
 * function. Note that the required return type of the `Get` call is
 * `(v)`, not the type of the property. `GetAll` expects a return value
 * of type `asv`.
 *
 * If you have writable properties specified in your interface info,
 * you must ensure that you either provide a non-%NULL @set_property()
 * function or provide an implementation of the `Set` call. If implementing
 * the call, you must return the value of type %G_VARIANT_TYPE_UNIT.
 *
 * Since: 2.26
  }
{< private > }
{ Padding for future expansion - also remember to update
   * gdbusconnection.c:_g_dbus_interface_vtable_copy() when
   * changing this.
    }
  PGDBusInterfaceVTable = ^TGDBusInterfaceVTable;
  TGDBusInterfaceVTable = record
      method_call : TGDBusInterfaceMethodCallFunc;cdecl;
      get_property : TGDBusInterfaceGetPropertyFunc;
      set_property : TGDBusInterfaceSetPropertyFunc;
      padding : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function g_dbus_connection_register_object(connection:PGDBusConnection; object_path:Pgchar; interface_info:PGDBusInterfaceInfo; vtable:PGDBusInterfaceVTable; user_data:Tgpointer; 
           user_data_free_func:TGDestroyNotify; error:PPGError):Tguint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_84_FOR(g_dbus_connection_register_object_with_closures2) }
(* Const before type ignored *)
function g_dbus_connection_register_object_with_closures(connection:PGDBusConnection; object_path:Pgchar; interface_info:PGDBusInterfaceInfo; method_call_closure:PGClosure; get_property_closure:PGClosure; 
           set_property_closure:PGClosure; error:PPGError):Tguint;cdecl;external;
(* Const before type ignored *)
function g_dbus_connection_register_object_with_closures2(connection:PGDBusConnection; object_path:Pgchar; interface_info:PGDBusInterfaceInfo; method_call_closure:PGClosure; get_property_closure:PGClosure; 
           set_property_closure:PGClosure; error:PPGError):Tguint;cdecl;external;
function g_dbus_connection_unregister_object(connection:PGDBusConnection; registration_id:Tguint):Tgboolean;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
{*
 * GDBusSubtreeEnumerateFunc:
 * @connection: A #GDBusConnection.
 * @sender: The unique bus name of the remote caller.
 * @object_path: The object path that was registered with g_dbus_connection_register_subtree().
 * @user_data: The @user_data #gpointer passed to g_dbus_connection_register_subtree().
 *
 * The type of the @enumerate function in #GDBusSubtreeVTable.
 *
 * This function is called when generating introspection data and also
 * when preparing to dispatch incoming messages in the event that the
 * %G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES flag is not
 * specified (ie: to verify that the object path is valid).
 *
 * Hierarchies are not supported; the items that you return should not
 * contain the `/` character.
 *
 * The return value will be freed with g_strfreev().
 *
 * Returns: (array zero-terminated=1) (transfer full): A newly allocated array of strings for node names that are children of @object_path.
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGDBusSubtreeEnumerateFunc = ^TGDBusSubtreeEnumerateFunc;
  TGDBusSubtreeEnumerateFunc = function (connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; user_data:Tgpointer):PPgchar;cdecl;
{*
 * GDBusSubtreeIntrospectFunc:
 * @connection: A #GDBusConnection.
 * @sender: The unique bus name of the remote caller.
 * @object_path: The object path that was registered with g_dbus_connection_register_subtree().
 * @node: A node that is a child of @object_path (relative to @object_path) or %NULL for the root of the subtree.
 * @user_data: The @user_data #gpointer passed to g_dbus_connection_register_subtree().
 *
 * The type of the @introspect function in #GDBusSubtreeVTable.
 *
 * Subtrees are flat.  @node, if non-%NULL, is always exactly one
 * segment of the object path (ie: it never contains a slash).
 *
 * This function should return %NULL to indicate that there is no object
 * at this node.
 *
 * If this function returns non-%NULL, the return value is expected to
 * be a %NULL-terminated array of pointers to #GDBusInterfaceInfo
 * structures describing the interfaces implemented by @node.  This
 * array will have g_dbus_interface_info_unref() called on each item
 * before being freed with g_free().
 *
 * The difference between returning %NULL and an array containing zero
 * items is that the standard DBus interfaces will returned to the
 * remote introspector in the empty array case, but not in the %NULL
 * case.
 *
 * Returns: (array zero-terminated=1) (nullable) (transfer full): A %NULL-terminated array of pointers to #GDBusInterfaceInfo, or %NULL.
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PGDBusSubtreeIntrospectFunc = ^TGDBusSubtreeIntrospectFunc;
  TGDBusSubtreeIntrospectFunc = function (connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; node:Pgchar; user_data:Tgpointer):PPGDBusInterfaceInfo;cdecl;
{*
 * GDBusSubtreeDispatchFunc:
 * @connection: A #GDBusConnection.
 * @sender: The unique bus name of the remote caller.
 * @object_path: The object path that was registered with g_dbus_connection_register_subtree().
 * @interface_name: The D-Bus interface name that the method call or property access is for.
 * @node: A node that is a child of @object_path (relative to @object_path) or %NULL for the root of the subtree.
 * @out_user_data: (nullable) (not optional): Return location for user data to pass to functions in the returned #GDBusInterfaceVTable.
 * @user_data: The @user_data #gpointer passed to g_dbus_connection_register_subtree().
 *
 * The type of the @dispatch function in #GDBusSubtreeVTable.
 *
 * Subtrees are flat.  @node, if non-%NULL, is always exactly one
 * segment of the object path (ie: it never contains a slash).
 *
 * Returns: (nullable): A #GDBusInterfaceVTable or %NULL if you don't want to handle the methods.
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PGDBusSubtreeDispatchFunc = ^TGDBusSubtreeDispatchFunc;
  TGDBusSubtreeDispatchFunc = function (connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; node:Pgchar; 
               out_user_data:Pgpointer; user_data:Tgpointer):PGDBusInterfaceVTable;cdecl;
{*
 * GDBusSubtreeVTable:
 * @enumerate: Function for enumerating child nodes.
 * @introspect: Function for introspecting a child node.
 * @dispatch: Function for dispatching a remote call on a child node.
 *
 * Virtual table for handling subtrees registered with g_dbus_connection_register_subtree().
 *
 * Since: 2.26
  }
{< private > }
{ Padding for future expansion - also remember to update
   * gdbusconnection.c:_g_dbus_subtree_vtable_copy() when
   * changing this.
    }
  PGDBusSubtreeVTable = ^TGDBusSubtreeVTable;
  TGDBusSubtreeVTable = record
      enumerate : TGDBusSubtreeEnumerateFunc;cdecl;
      introspect : TGDBusSubtreeIntrospectFunc;
      dispatch : TGDBusSubtreeDispatchFunc;
      padding : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function g_dbus_connection_register_subtree(connection:PGDBusConnection; object_path:Pgchar; vtable:PGDBusSubtreeVTable; flags:TGDBusSubtreeFlags; user_data:Tgpointer; 
           user_data_free_func:TGDestroyNotify; error:PPGError):Tguint;cdecl;external;
function g_dbus_connection_unregister_subtree(connection:PGDBusConnection; registration_id:Tguint):Tgboolean;cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
{*
 * GDBusSignalCallback:
 * @connection: A #GDBusConnection.
 * @sender_name: (nullable): The unique bus name of the sender of the signal,
   or %NULL on a peer-to-peer D-Bus connection.
 * @object_path: The object path that the signal was emitted on.
 * @interface_name: The name of the interface.
 * @signal_name: The name of the signal.
 * @parameters: A #GVariant tuple with parameters for the signal.
 * @user_data: User data passed when subscribing to the signal.
 *
 * Signature for callback function used in g_dbus_connection_signal_subscribe().
 *
 * Since: 2.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGDBusSignalCallback = procedure (connection:PGDBusConnection; sender_name:Pgchar; object_path:Pgchar; interface_name:Pgchar; signal_name:Pgchar; 
                parameters:PGVariant; user_data:Tgpointer);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function g_dbus_connection_signal_subscribe(connection:PGDBusConnection; sender:Pgchar; interface_name:Pgchar; member:Pgchar; object_path:Pgchar; 
           arg0:Pgchar; flags:TGDBusSignalFlags; callback:TGDBusSignalCallback; user_data:Tgpointer; user_data_free_func:TGDestroyNotify):Tguint;cdecl;external;
procedure g_dbus_connection_signal_unsubscribe(connection:PGDBusConnection; subscription_id:Tguint);cdecl;external;
{*xxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_84
static inline void g_clear_dbus_signal_subscription           (guint               *subscription_id_pointer,
                                                               GDBusConnection     *connection);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_84
static inline void
g_clear_dbus_signal_subscription (guint           *subscription_id_pointer,
                                  GDBusConnection *connection)

  guint subscription_id;

  
  subscription_id = g_steal_handle_id (subscription_id_pointer);
  

  if (subscription_id > 0)
    g_dbus_connection_signal_unsubscribe (connection, subscription_id);


 }
{*
 * GDBusMessageFilterFunction:
 * @connection: (transfer none): A #GDBusConnection.
 * @message: (transfer full): A locked #GDBusMessage that the filter function takes ownership of.
 * @incoming: %TRUE if it is a message received from the other peer, %FALSE if it is
 * a message to be sent to the other peer.
 * @user_data: User data passed when adding the filter.
 *
 * Signature for function used in g_dbus_connection_add_filter().
 *
 * A filter function is passed a #GDBusMessage and expected to return
 * a #GDBusMessage too. Passive filter functions that don't modify the
 * message can simply return the @message object:
 * |[
 * static GDBusMessage *
 * passive_filter (GDBusConnection *connection
 *                 GDBusMessage    *message,
 *                 gboolean         incoming,
 *                 gpointer         user_data)
 * 
 *   // inspect @message
 *   return message;
 * 
 * ]|
 * Filter functions that wants to drop a message can simply return %NULL:
 * |[
 * static GDBusMessage *
 * drop_filter (GDBusConnection *connection
 *              GDBusMessage    *message,
 *              gboolean         incoming,
 *              gpointer         user_data)
 * 
 *   if (should_drop_message)
 *     
 *       g_object_unref (message);
 *       message = NULL;
 *     
 *   return message;
 * 
 * ]|
 * Finally, a filter function may modify a message by copying it:
 * |[
 * static GDBusMessage *
 * modifying_filter (GDBusConnection *connection
 *                   GDBusMessage    *message,
 *                   gboolean         incoming,
 *                   gpointer         user_data)
 * 
 *   GDBusMessage *copy;
 *   GError *error;
 *
 *   error = NULL;
 *   copy = g_dbus_message_copy (message, &error);
 *   // handle @error being set
 *   g_object_unref (message);
 *
 *   // modify @copy
 *
 *   return copy;
 * 
 * ]|
 * If the returned #GDBusMessage is different from @message and cannot
 * be sent on @connection (it could use features, such as file
 * descriptors, not compatible with @connection), then a warning is
 * logged to standard error. Applications can
 * check this ahead of time using g_dbus_message_to_blob() passing a
 * #GDBusCapabilityFlags value obtained from @connection.
 *
 * Returns: (transfer full) (nullable): A #GDBusMessage that will be freed with
 * g_object_unref() or %NULL to drop the message. Passive filter
 * functions can simply return the passed @message object.
 *
 * Since: 2.26
  }
type
  PGDBusMessageFilterFunction = ^TGDBusMessageFilterFunction;
  TGDBusMessageFilterFunction = function (connection:PGDBusConnection; message:PGDBusMessage; incoming:Tgboolean; user_data:Tgpointer):PGDBusMessage;cdecl;

function g_dbus_connection_add_filter(connection:PGDBusConnection; filter_function:TGDBusMessageFilterFunction; user_data:Tgpointer; user_data_free_func:TGDestroyNotify):Tguint;cdecl;external;
procedure g_dbus_connection_remove_filter(connection:PGDBusConnection; filter_id:Tguint);cdecl;external;
{ ----------------------------------------------------------------------------------------------------  }
{$endif}
{ __G_DBUS_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_CONNECTION:=g_dbus_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_CONNECTION(o : longint) : longint;
begin
  G_DBUS_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_CONNECTION,GDBusConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_CONNECTION(o : longint) : longint;
begin
  G_IS_DBUS_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_CONNECTION);
end;


end.
