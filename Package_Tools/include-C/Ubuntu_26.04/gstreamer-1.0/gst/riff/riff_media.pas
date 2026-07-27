unit riff_media;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer RIFF I/O
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 *
 * riff-media.h: RIFF-id to/from caps routines
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
{$ifndef __GST_RIFF_MEDIA_H__}
{$define __GST_RIFF_MEDIA_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include "riff-ids.h"}
{
 * Create caos. strh/strf, strf/strd_data and codec_name can be NULL.
  }

function gst_riff_create_video_caps(codec_fcc:Tguint32; strh:Pgst_riff_strh; strf:Pgst_riff_strf_vids; strf_data:PGstBuffer; strd_data:PGstBuffer; 
           codec_name:PPchar):PGstCaps;cdecl;external libgstriff;
function gst_riff_create_audio_caps(codec_id:Tguint16; strh:Pgst_riff_strh; strf:Pgst_riff_strf_auds; strf_data:PGstBuffer; strd_data:PGstBuffer; 
           codec_name:PPchar; channel_reorder_map:array[0..17] of Tgint):PGstCaps;cdecl;external libgstriff;
function gst_riff_create_iavs_caps(codec_fcc:Tguint32; strh:Pgst_riff_strh; strf:Pgst_riff_strf_iavs; strf_data:PGstBuffer; strd_data:PGstBuffer; 
           codec_name:PPchar):PGstCaps;cdecl;external libgstriff;
{
 * Create template caps (includes all known types).
  }
function gst_riff_create_video_template_caps:PGstCaps;cdecl;external libgstriff;
function gst_riff_create_audio_template_caps:PGstCaps;cdecl;external libgstriff;
function gst_riff_create_iavs_template_caps:PGstCaps;cdecl;external libgstriff;
{$endif}
{ __GST_RIFF_READ_H__  }

// === Konventiert am: 27-7-26 13:25:22 ===


implementation



end.
