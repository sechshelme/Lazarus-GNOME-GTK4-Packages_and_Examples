
unit fwupd_request;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_request.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_request.h
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
PFwupdRequest  = ^FwupdRequest;
PFwupdRequestClass  = ^FwupdRequestClass;
PFwupdRequestFlags  = ^FwupdRequestFlags;
PFwupdRequestKind  = ^FwupdRequestKind;
Pgchar  = ^gchar;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}

{ was #define dname def_expr }
function FWUPD_TYPE_REQUEST : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdRequest, fwupd_request, FWUPD, REQUEST, GObject) }
{< private > }
type
  PFwupdRequestClass = ^TFwupdRequestClass;
  TFwupdRequestClass = record
      parent_class : TGObjectClass;
      invalidate : procedure (client:PFwupdRequest);cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;

{*
 * FwupdRequestKind:
 * @FWUPD_REQUEST_KIND_UNKNOWN:		Unknown kind
 * @FWUPD_REQUEST_KIND_POST:		After the update
 * @FWUPD_REQUEST_KIND_IMMEDIATE:	Immediately
 *
 * The kind of request we are asking of the user.
 * }
{ Since: 1.6.2  }
{ Since: 1.6.2  }
{ Since: 1.6.2  }
{< private > }

  PFwupdRequestKind = ^TFwupdRequestKind;
  TFwupdRequestKind =  Longint;
  Const
    FWUPD_REQUEST_KIND_UNKNOWN = 0;
    FWUPD_REQUEST_KIND_POST = 1;
    FWUPD_REQUEST_KIND_IMMEDIATE = 2;
    FWUPD_REQUEST_KIND_LAST = 3;
;
{*
 * FWUPD_REQUEST_ID_REMOVE_REPLUG:
 *
 * The user needs to remove and reinsert the device to complete the update, e.g.
 * "The update will continue when the device USB cable has been unplugged and then re-inserted."
 *
 * Since 1.6.2
  }
  FWUPD_REQUEST_ID_REMOVE_REPLUG = 'org.freedesktop.fwupd.request.remove-replug';  
{*
 * FWUPD_REQUEST_ID_PRESS_UNLOCK:
 *
 * The user needs to press unlock on the device to continue, e.g.
 * "Press unlock on the device to continue the update process."
 *
 * Since 1.6.2
  }
  FWUPD_REQUEST_ID_PRESS_UNLOCK = 'org.freedesktop.fwupd.request.press-unlock';  
{*
 * FWUPD_REQUEST_ID_REMOVE_USB_CABLE:
 *
 * The user needs to remove the device to complete the update, e.g.
 * "The update will continue when the device USB cable has been unplugged."
 *
 * Since 1.8.6
  }
  FWUPD_REQUEST_ID_REMOVE_USB_CABLE = 'org.freedesktop.fwupd.request.remove-usb-cable';  
{*
 * FWUPD_REQUEST_ID_INSERT_USB_CABLE:
 *
 * The user needs to insert the cable to complete the update, e.g.
 * "The update will continue when the device USB cable has been re-inserted."
 *
 * Since 1.8.9
  }
  FWUPD_REQUEST_ID_INSERT_USB_CABLE = 'org.freedesktop.fwupd.request.insert-usb-cable';  
{*
 * FWUPD_REQUEST_ID_DO_NOT_POWER_OFF:
 *
 * Show the user a message not to unplug the machine from the AC power, e.g.
 * "Do not turn off your computer or remove the AC adaptor until you are sure the update has
 * completed."
 *
 * Since 1.8.6
  }
  FWUPD_REQUEST_ID_DO_NOT_POWER_OFF = 'org.freedesktop.fwupd.request.do-not-power-off';  
{*
 * FWUPD_REQUEST_ID_REPLUG_INSTALL:
 *
 * Show the user a message to replug the device and then install the firmware, e.g.
 * "Unplug and replug the device, to continue the update process."
 *
 * Since 1.8.11
  }
  FWUPD_REQUEST_ID_REPLUG_INSTALL = 'org.freedesktop.fwupd.replug-install';  
{*
 * FWUPD_REQUEST_ID_REPLUG_POWER:
 *
 * Show the user a message to replug the power connector, e.g.
 * "The update will continue when the device power cable has been unplugged and then re-inserted."
 *
 * Since 1.9.9
  }
  FWUPD_REQUEST_ID_REPLUG_POWER = 'org.freedesktop.fwupd.replug-power';  
{*
 * FWUPD_REQUEST_FLAG_NONE:
 *
 * No flags are set.
 *
 * Since: 1.8.6
  }
  FWUPD_REQUEST_FLAG_NONE = 0;  
{*
 * FWUPD_REQUEST_FLAG_ALLOW_GENERIC_MESSAGE:
 *
 * Use a generic (translated) request message.
 *
 * Since: 1.8.6
  }
  FWUPD_REQUEST_FLAG_ALLOW_GENERIC_MESSAGE = 1 shl 0;  
{*
 * FWUPD_REQUEST_FLAG_ALLOW_GENERIC_IMAGE:
 *
 * Use a generic (translated) request image.
 *
 * Since: 1.8.6
  }
  FWUPD_REQUEST_FLAG_ALLOW_GENERIC_IMAGE = 1 shl 1;  
{*
 * FWUPD_REQUEST_FLAG_NON_GENERIC_MESSAGE:
 *
 * Device requires a non-generic interaction with custom non-translatable text.
 *
 * Since: 1.9.10
  }
  FWUPD_REQUEST_FLAG_NON_GENERIC_MESSAGE = 1 shl 2;  
{*
 * FWUPD_REQUEST_FLAG_NON_GENERIC_IMAGE:
 *
 * Device requires to show the user a custom image for the action to make sense.
 *
 * Since: 1.9.10
  }
  FWUPD_REQUEST_FLAG_NON_GENERIC_IMAGE = 1 shl 3;  
{*
 * FWUPD_REQUEST_FLAG_UNKNOWN:
 *
 * The request flag is unknown, typically caused by using mismatched client and daemon.
 *
 * Since: 1.8.6
  }
  FWUPD_REQUEST_FLAG_UNKNOWN = G_MAXUINT64;  
{*
 * FwupdRequestFlags:
 *
 * Flags used to represent request attributes
  }
type
  PFwupdRequestFlags = ^TFwupdRequestFlags;
  TFwupdRequestFlags = Tguint64;
(* Const before type ignored *)

function fwupd_request_kind_to_string(kind:TFwupdRequestKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_request_kind_from_string(kind:Pgchar):TFwupdRequestKind;cdecl;external;
(* Const before type ignored *)
function fwupd_request_flag_to_string(flag:TFwupdRequestFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_request_flag_from_string(flag:Pgchar):TFwupdRequestFlags;cdecl;external;
function fwupd_request_new:PFwupdRequest;cdecl;external;
function fwupd_request_to_string(self:PFwupdRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_request_get_id(self:PFwupdRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_request_set_id(self:PFwupdRequest; id:Pgchar);cdecl;external;
function fwupd_request_get_created(self:PFwupdRequest):Tguint64;cdecl;external;
procedure fwupd_request_set_created(self:PFwupdRequest; created:Tguint64);cdecl;external;
(* Const before type ignored *)
function fwupd_request_get_device_id(self:PFwupdRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_request_set_device_id(self:PFwupdRequest; device_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_request_get_message(self:PFwupdRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_request_set_message(self:PFwupdRequest; message:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_request_get_image(self:PFwupdRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_request_set_image(self:PFwupdRequest; image:Pgchar);cdecl;external;
function fwupd_request_get_kind(self:PFwupdRequest):TFwupdRequestKind;cdecl;external;
procedure fwupd_request_set_kind(self:PFwupdRequest; kind:TFwupdRequestKind);cdecl;external;
function fwupd_request_get_flags(self:PFwupdRequest):TFwupdRequestFlags;cdecl;external;
procedure fwupd_request_set_flags(self:PFwupdRequest; flags:TFwupdRequestFlags);cdecl;external;
procedure fwupd_request_add_flag(self:PFwupdRequest; flag:TFwupdRequestFlags);cdecl;external;
procedure fwupd_request_remove_flag(self:PFwupdRequest; flag:TFwupdRequestFlags);cdecl;external;
function fwupd_request_has_flag(self:PFwupdRequest; flag:TFwupdRequestFlags):Tgboolean;cdecl;external;
function fwupd_request_from_variant(value:PGVariant):PFwupdRequest;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_REQUEST : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_REQUEST:=fwupd_request_get_type;
  end;


end.
