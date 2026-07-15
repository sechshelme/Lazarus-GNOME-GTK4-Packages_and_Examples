unit video_event;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_EVENT_H__}
{$define __GST_VIDEO_EVENT_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
{ video still frame event creation and parsing  }

function gst_video_event_new_still_frame(in_still:Tgboolean):PGstEvent;cdecl;external libgstvideo;
function gst_video_event_parse_still_frame(event:PGstEvent; in_still:Pgboolean):Tgboolean;cdecl;external libgstvideo;
{ video force key unit event creation and parsing  }
function gst_video_event_new_downstream_force_key_unit(timestamp:TGstClockTime; stream_time:TGstClockTime; running_time:TGstClockTime; all_headers:Tgboolean; count:Tguint):PGstEvent;cdecl;external libgstvideo;
function gst_video_event_parse_downstream_force_key_unit(event:PGstEvent; timestamp:PGstClockTime; stream_time:PGstClockTime; running_time:PGstClockTime; all_headers:Pgboolean; 
           count:Pguint):Tgboolean;cdecl;external libgstvideo;
function gst_video_event_new_upstream_force_key_unit(running_time:TGstClockTime; all_headers:Tgboolean; count:Tguint):PGstEvent;cdecl;external libgstvideo;
function gst_video_event_parse_upstream_force_key_unit(event:PGstEvent; running_time:PGstClockTime; all_headers:Pgboolean; count:Pguint):Tgboolean;cdecl;external libgstvideo;
function gst_video_event_is_force_key_unit(event:PGstEvent):Tgboolean;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_EVENT_H__  }

// === Konventiert am: 15-7-26 13:36:02 ===


implementation



end.
