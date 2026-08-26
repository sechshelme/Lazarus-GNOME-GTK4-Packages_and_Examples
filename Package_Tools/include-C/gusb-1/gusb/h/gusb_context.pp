
unit gusb_context;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_context
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
PGError  = ^GError;
PGMainContext  = ^GMainContext;
PGPtrArray  = ^GPtrArray;
PGUsbContext  = ^GUsbContext;
PGUsbContextClass  = ^GUsbContextClass;
PGUsbContextError  = ^GUsbContextError;
PGUsbContextFlags  = ^GUsbContextFlags;
PGUsbDevice  = ^GUsbDevice;
PGUsbSource  = ^GUsbSource;
PJsonBuilder  = ^JsonBuilder;
PJsonObject  = ^JsonObject;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2011 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2011 Hans de Goede <hdegoede@redhat.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gusb/gusb-device.h>}
{$include <gusb/gusb-source.h>}

{ was #define dname def_expr }
function G_USB_TYPE_CONTEXT : longint; { return type might be wrong }

{ was #define dname def_expr }
function G_USB_CONTEXT_ERROR : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(GUsbContext, g_usb_context, G_USB, CONTEXT, GObject) }
{< private > }
{
	 * If adding fields to this struct, remove corresponding
	 * amount of padding to avoid changing overall struct size
	  }
type
  PGUsbContextClass = ^TGUsbContextClass;
  TGUsbContextClass = record
      parent_class : TGObjectClass;
      device_added : procedure (self:PGUsbContext; device:PGUsbDevice);cdecl;
      device_removed : procedure (self:PGUsbContext; device:PGUsbDevice);cdecl;
      device_changed : procedure (self:PGUsbContext; device:PGUsbDevice);cdecl;
      _gusb_reserved : array[0..60] of Tgchar;
    end;


  PGUsbContextError = ^TGUsbContextError;
  TGUsbContextError =  Longint;
  Const
    G_USB_CONTEXT_ERROR_INTERNAL = 0;
;
{*
 * GUsbContextFlags:
 *
 * The flags to use for the context.
 * }
{< private > }
type
  PGUsbContextFlags = ^TGUsbContextFlags;
  TGUsbContextFlags =  Longint;
  Const
    G_USB_CONTEXT_FLAGS_NONE = 0;
    G_USB_CONTEXT_FLAGS_AUTO_OPEN_DEVICES = 1 shl 0;
    G_USB_CONTEXT_FLAGS_SAVE_EVENTS = 1 shl 1;
    G_USB_CONTEXT_FLAGS_SAVE_REMOVED_DEVICES = 1 shl 2;
    G_USB_CONTEXT_FLAGS_DEBUG = 1 shl 3;
    G_USB_CONTEXT_FLAGS_LAST = (1 shl 3)+1;
;

function g_usb_context_error_quark:TGQuark;cdecl;external;
function g_usb_context_new(error:PPGError):PGUsbContext;cdecl;external;
procedure g_usb_context_set_flags(self:PGUsbContext; flags:TGUsbContextFlags);cdecl;external;
function g_usb_context_get_flags(self:PGUsbContext):TGUsbContextFlags;cdecl;external;
{xxxxxxG_DEPRECATED }
function g_usb_context_get_source(self:PGUsbContext; main_ctx:PGMainContext):PGUsbSource;cdecl;external;
function g_usb_context_get_main_context(self:PGUsbContext):PGMainContext;cdecl;external;
procedure g_usb_context_set_main_context(self:PGUsbContext; main_ctx:PGMainContext);cdecl;external;
function g_usb_context_get_hotplug_poll_interval(self:PGUsbContext):Tguint;cdecl;external;
procedure g_usb_context_set_hotplug_poll_interval(self:PGUsbContext; hotplug_poll_interval:Tguint);cdecl;external;
procedure g_usb_context_enumerate(self:PGUsbContext);cdecl;external;
function g_usb_context_load(self:PGUsbContext; json_object:PJsonObject; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_usb_context_load_with_tag(self:PGUsbContext; json_object:PJsonObject; tag:Pgchar; error:PPGError):Tgboolean;cdecl;external;
function g_usb_context_save(self:PGUsbContext; json_builder:PJsonBuilder; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_usb_context_save_with_tag(self:PGUsbContext; json_builder:PJsonBuilder; tag:Pgchar; error:PPGError):Tgboolean;cdecl;external;
procedure g_usb_context_set_debug(self:PGUsbContext; flags:TGLogLevelFlags);cdecl;external;
function g_usb_context_get_devices(self:PGUsbContext):PGPtrArray;cdecl;external;
function g_usb_context_find_by_bus_address(self:PGUsbContext; bus:Tguint8; address:Tguint8; error:PPGError):PGUsbDevice;cdecl;external;
function g_usb_context_find_by_vid_pid(self:PGUsbContext; vid:Tguint16; pid:Tguint16; error:PPGError):PGUsbDevice;cdecl;external;
(* Const before type ignored *)
function g_usb_context_find_by_platform_id(self:PGUsbContext; platform_id:Pgchar; error:PPGError):PGUsbDevice;cdecl;external;
function g_usb_context_wait_for_replug(self:PGUsbContext; device:PGUsbDevice; timeout_ms:Tguint; error:PPGError):PGUsbDevice;cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_CONTEXT : longint; { return type might be wrong }
  begin
    G_USB_TYPE_CONTEXT:=g_usb_context_get_type;
  end;

{ was #define dname def_expr }
function G_USB_CONTEXT_ERROR : longint; { return type might be wrong }
  begin
    G_USB_CONTEXT_ERROR:=g_usb_context_error_quark;
  end;


end.
