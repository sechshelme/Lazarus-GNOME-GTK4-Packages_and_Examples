
unit rtsp_params;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_params.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_params.h
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
PGstRTSPClient  = ^GstRTSPClient;
PGstRTSPContext  = ^GstRTSPContext;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/gst.h>}
{$include <gst/rtsp/gstrtspurl.h>}
{$include <gst/rtsp/gstrtspmessage.h>}
{$ifndef __GST_RTSP_PARAMS_H__}
{$define __GST_RTSP_PARAMS_H__}
{$include "rtsp-client.h"}
{$include "rtsp-session.h"}

function gst_rtsp_params_set(client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPResult;cdecl;external;
function gst_rtsp_params_get(client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPResult;cdecl;external;
{$endif}
{ __GST_RTSP_PARAMS_H__  }

implementation


end.
