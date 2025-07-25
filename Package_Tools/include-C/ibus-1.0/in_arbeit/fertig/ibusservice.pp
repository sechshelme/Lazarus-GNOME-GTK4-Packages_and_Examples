
unit ibusservice;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusservice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusservice.h
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
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGDBusConnection  = ^GDBusConnection;
PGDBusMethodInvocation  = ^GDBusMethodInvocation;
PGError  = ^GError;
PGVariant  = ^GVariant;
PIBusService  = ^IBusService;
PIBusServiceClass  = ^IBusServiceClass;
PIBusServicePrivate  = ^IBusServicePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2015 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2011-2023 Takao Fujiwara <takao.fujiwara1@gmail.com>
 * Copyright (C) 2008-2015 Red Hat, Inc.
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
{$ifndef __IBUS_SERVICE_H_}
{$define __IBUS_SERVICE_H_}
{*
 * SECTION: ibusservice
 * @short_description: IBus service back-end.
 * @stability: Stable
 *
 * An IBusService is a base class for services.
  }
{$include <gio/gio.h>}
{$include "ibusobject.h"}
{
 * Type macros.
  }
{ define GOBJECT macros  }

{ was #define dname def_expr }
function IBUS_TYPE_SERVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERVICE_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusService:
 *
 * An opaque data type representing an IBusService.
  }
{< private > }
  PIBusService = ^TIBusService;
  TIBusService = record
      parent : TIBusObject;
      priv : PIBusServicePrivate;
    end;

{< private > }
{< public > }
{ virtual functions  }
{*
     * IBusServiceClass::service_method_call:
     * @service: An #IBusService.
     * @connection: A dbus connection.
     * @sender: A sender.
     * @object_path: An object path.
     * @interface_name: An interface name.
     * @method_name: A method name.
     * @parameters: A parameters.
     * @invocation: A dbus method invocation.
     *
     * The ::service_method_call class method is to connect
     * GDBusInterfaceMethodCallFunc().
      }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*
     * IBusServiceClass::service_get_property:
     * @service: An #IBusService.
     * @connection: A dbus connection.
     * @sender: A sender.
     * @object_path: An object path.
     * @interface_name: An interface name.
     * @property_name: A property name.
     * @error: Return location for error or %NULL.
     *
     * The ::service_get_property class method is to connect
     * GDBusInterfaceGetPropertyFunc().
     *
     * Returns: (nullable) (transfer full): A variant.
      }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*
     * IBusServiceClass::service_set_property:
     * @service: An #IBusService.
     * @connection: A dbus connection.
     * @sender: A sender.
     * @object_path: An object path.
     * @interface_name: An interface name.
     * @property_name: An property name.
     * @value: An property value.
     * @error: Return location for error or %NULL.
     *
     * The ::service_set_property class method is to connect
     * GDBusInterfaceSetPropertyFunc().
     *
     * Returns: %TRUE if set the value else %FALSE.
      }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ padding  }
  PIBusServiceClass = ^TIBusServiceClass;
  TIBusServiceClass = record
      parent : TIBusObjectClass;
      service_method_call : procedure (service:PIBusService; connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; 
                    method_name:Pgchar; parameters:PGVariant; invocation:PGDBusMethodInvocation);cdecl;
      service_get_property : function (service:PIBusService; connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; 
                   property_name:Pgchar; error:PPGError):PGVariant;cdecl;
      service_set_property : function (service:PIBusService; connection:PGDBusConnection; sender:Pgchar; object_path:Pgchar; interface_name:Pgchar; 
                   property_name:Pgchar; value:PGVariant; error:PPGError):Tgboolean;cdecl;
      interfaces : PGArray;
      pdummy : array[0..3] of Tgpointer;
    end;


function ibus_service_get_type:TGType;cdecl;external;
{*
 * ibus_service_new:
 * @connection: A GDBusConnection.
 * @path: Object path.
 *
 * Creantes a new #IBusService.
 *
 * Returns: A newly allocated #IBusService
  }
(* Const before type ignored *)
function ibus_service_new(connection:PGDBusConnection; path:Pgchar):PIBusService;cdecl;external;
{*
 * ibus_service_get_object_path:
 * @service: An IBusService.
 *
 * Gets the object path of an IBusService.
 *
 * Returns: The object path of @service
  }
(* Const before type ignored *)
function ibus_service_get_object_path(service:PIBusService):Pgchar;cdecl;external;
{*
 * ibus_service_get_connection:
 * @service: An IBusService.
 *
 * Gets a connections.
 *
 * Returns: (transfer none): A #GDBusConnection of an #IBusService instance.
  }
function ibus_service_get_connection(service:PIBusService):PGDBusConnection;cdecl;external;
{*
 * ibus_service_register:
 * @service: An IBusService.
 * @connection: A GDBusConnection the service will be registered to.
 * @error: Return location for error or NULL.
 *
 * Registers service to a connection.
 *
 * Returns: %TRUE if the service was registered, %FALSE otherwise.
  }
function ibus_service_register(service:PIBusService; connection:PGDBusConnection; error:PPGError):Tgboolean;cdecl;external;
{*
 * ibus_service_unregister:
 * @service: An IBusService.
 * @connection: A GDBusConnection the service was registered with.
 *
 * Unregisters service from a connection.
  }
procedure ibus_service_unregister(service:PIBusService; connection:PGDBusConnection);cdecl;external;
{*
 * ibus_service_send_signal:
 * @service: An IBusService.
 * @interface: The interface the signal is emitted from.
 * @name: Name of the signal.
 * @first_arg_type: Type of first argument.
 * @...: Rest of arguments, NULL to mark the end.
 *
 * Sends signal to all the #IBusConnections of an #IBusService.
 *
 * Returns: %TRUE if succeed; %FALSE otherwise.
 *
 * see_also: g_dbus_connection_emit_signal()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ibus_service_emit_signal(service:PIBusService; dest_bus_name:Pgchar; interface_name:Pgchar; signal_name:Pgchar; parameters:PGVariant; 
           error:PPGError):Tgboolean;cdecl;external;
{*
 * ibus_service_class_add_interfaces:
 * @klass: An IBusServiceClass.
 * @xml_data: The introspection xml data.
 *
 * Set the interface introspection information with the service class.
 *
 * Returns: %TRUE if @xml_data is valid and succeeded to be added;
 *          %FALSE otherwise.
  }
(* Const before type ignored *)
function ibus_service_class_add_interfaces(klass:PIBusServiceClass; xml_data:Pgchar):Tgboolean;cdecl;external;
{*
 * ibus_service_class_free_interfaces:
 * @klass: An IBusServiceClass.
 * @depth: The number of D-Bus introspection interfaces.
 *
 * Free the first @depth interfaces if @depth is positive. Free the last
 * -@depth interfaces if @depth is negative.
 *
 * Returns: The actual freed number of the introspection interfaces
 * if @depth is not 0.
 * If @depth is 0, the total number of the introspection interfaces is
 * returned but any interfaces are not freed.
  }
function ibus_service_class_free_interfaces(klass:PIBusServiceClass; depth:longint):longint;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_SERVICE : longint; { return type might be wrong }
  begin
    IBUS_TYPE_SERVICE:=ibus_service_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERVICE(obj : longint) : longint;
begin
  IBUS_SERVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_SERVICE,IBusService);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERVICE_CLASS(klass : longint) : longint;
begin
  IBUS_SERVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_SERVICE,IBusServiceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERVICE(obj : longint) : longint;
begin
  IBUS_IS_SERVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_SERVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_SERVICE_CLASS(klass : longint) : longint;
begin
  IBUS_IS_SERVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_SERVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_SERVICE_GET_CLASS(obj : longint) : longint;
begin
  IBUS_SERVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_SERVICE,IBusServiceClass);
end;


end.
