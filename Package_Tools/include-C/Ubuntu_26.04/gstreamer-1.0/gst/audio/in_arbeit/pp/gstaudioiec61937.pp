
unit gstaudioiec61937;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudioiec61937.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudioiec61937.h
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
PGstAudioRingBufferSpec  = ^GstAudioRingBufferSpec;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer audio helper functions for IEC 61937 payloading
 * (c) 2011 Intel Corporation
 *     2011 Collabora Multimedia
 *     2011 Arun Raghavan <arun.raghavan@collabora.co.uk>
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
{$ifndef __GST_AUDIO_IEC61937_H__}
{$define __GST_AUDIO_IEC61937_H__}
{$include <gst/audio/gstaudioringbuffer.h>}
(* Const before type ignored *)

function gst_audio_iec61937_frame_size(spec:PGstAudioRingBufferSpec):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_audio_iec61937_payload(src:Pguint8; src_n:Tguint; dst:Pguint8; dst_n:Tguint; spec:PGstAudioRingBufferSpec; 
           endianness:Tgint):Tgboolean;cdecl;external;
{$endif}
{ __GST_AUDIO_IEC61937_H__  }

implementation


end.
