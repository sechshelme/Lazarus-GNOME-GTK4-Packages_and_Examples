
{$IFDEF read_interface}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *                    2005 Andy Wingo <wingo@pobox.com>
 * Copyright (C) 2012 Collabora Ltd. <tim.muller@collabora.co.uk>
 *
 * gstnetclientclock.h: clock that synchronizes itself to a time provider over
 * the network
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
{$ifndef __GST_NET_CLIENT_CLOCK_H__}
{$define __GST_NET_CLIENT_CLOCK_H__}
{$include <gst/gst.h>}
{$include <gst/gstsystemclock.h>}
{$include <gst/net/net-prelude.h>}

type
  TGstNetClientClock = TGstNtpClock;
  TGstNetClientClockClass = TGstNtpClockClass;

function gst_ntp_clock_get_type:TGType;cdecl;external libgstnet;
function gst_ntp_clock_new(name:Pgchar; remote_address:Pgchar; remote_port:Tgint; base_time:TGstClockTime):PGstClock;cdecl;external libgstnet;
{$endif}
{ __GST_NET_CLIENT_CLOCK_H__  }

// === Konventiert am: 11-10-24 14:27:36 ===

function GST_TYPE_NTP_CLOCK : TGType;
function GST_NTP_CLOCK(obj : Pointer) : PGstNtpClock;
function GST_NTP_CLOCK_CLASS(klass : Pointer) : PGstNtpClockClass;
function GST_IS_NTP_CLOCK(obj : Pointer) : Tgboolean;
function GST_IS_NTP_CLOCK_CLASS(klass : Pointer) : Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_NTP_CLOCK : TGType;
  begin
    GST_TYPE_NTP_CLOCK:=gst_ntp_clock_get_type;
  end;

function GST_NTP_CLOCK(obj : Pointer) : PGstNtpClock;
begin
  Result := PGstNtpClock(g_type_check_instance_cast(obj, GST_TYPE_NTP_CLOCK));
end;

function GST_NTP_CLOCK_CLASS(klass : Pointer) : PGstNtpClockClass;
begin
  Result := PGstNtpClockClass(g_type_check_class_cast(klass, GST_TYPE_NTP_CLOCK));
end;

function GST_IS_NTP_CLOCK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_NTP_CLOCK);
end;

function GST_IS_NTP_CLOCK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_NTP_CLOCK);
end;



{$ENDIF read_implementation}
