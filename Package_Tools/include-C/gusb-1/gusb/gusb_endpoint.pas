unit gusb_endpoint;

interface

uses
  fp_gusb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2020 Emmanuel Pacaud <emmanuel@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gusb/gusb-device.h>}

{G_DECLARE_FINAL_TYPE(GUsbEndpoint, g_usb_endpoint, G_USB, ENDPOINT, GObject) }
function g_usb_endpoint_get_kind(self:PGUsbEndpoint):Tguint8;cdecl;external libgusb;
function g_usb_endpoint_get_maximum_packet_size(self:PGUsbEndpoint):Tguint16;cdecl;external libgusb;
function g_usb_endpoint_get_polling_interval(self:PGUsbEndpoint):Tguint8;cdecl;external libgusb;
function g_usb_endpoint_get_refresh(self:PGUsbEndpoint):Tguint8;cdecl;external libgusb;
function g_usb_endpoint_get_synch_address(self:PGUsbEndpoint):Tguint8;cdecl;external libgusb;
function g_usb_endpoint_get_address(self:PGUsbEndpoint):Tguint8;cdecl;external libgusb;
function g_usb_endpoint_get_number(self:PGUsbEndpoint):Tguint8;cdecl;external libgusb;
function g_usb_endpoint_get_direction(self:PGUsbEndpoint):TGUsbDeviceDirection;cdecl;external libgusb;
function g_usb_endpoint_get_extra(self:PGUsbEndpoint):PGBytes;cdecl;external libgusb;

// === Konventiert am: 26-8-26 19:42:33 ===

function G_USB_TYPE_ENDPOINT: TGType;
function G_USB_ENDPOINT(obj: Pointer): PGUsbEndpoint;
function G_USB_IS_ENDPOINT(obj: Pointer): Tgboolean;

implementation

function G_USB_TYPE_ENDPOINT: TGType;
begin
  Result := g_usb_endpoint_get_type;
end;

function G_USB_ENDPOINT(obj: Pointer): PGUsbEndpoint;
begin
  Result := PGUsbEndpoint(g_type_check_instance_cast(obj, G_USB_TYPE_ENDPOINT));
end;

function G_USB_IS_ENDPOINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_ENDPOINT);
end;

type 
  PGUsbEndpoint = type Pointer;

  TGUsbEndpointClass = record
    parent_class: TGObjectClass;
  end;
  PGUsbEndpointClass = ^TGUsbEndpointClass;

function g_usb_endpoint_get_type: TGType; cdecl; external libgxxxxxxx;



end.
