unit gstsample;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstsample.h: Header for GstSample object
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
{$ifndef __GST_SAMPLE_H__}
{$define __GST_SAMPLE_H__}
{$include <gst/gstbuffer.h>}
{$include <gst/gstbufferlist.h>}
{$include <gst/gstcaps.h>}
{$include <gst/gstsegment.h>}
  var
    _gst_sample_type : TGType;cvar;external libgstreamer;

const
  GST_TYPE_SAMPLE = _gst_sample_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_SAMPLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SAMPLE_CAST(obj : longint) : PGstSample;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SAMPLE(obj : longint) : longint;

{*
 * GstSample:
 *
 * The opaque structure of a #GstSample. A sample contains a typed memory
 * block and the associated timing information. It is mainly used to
 * exchange buffers with an application.
  }
type

function gst_sample_get_type:TGType;cdecl;external libgstreamer;
{ allocation  }
function gst_sample_new(buffer:PGstBuffer; caps:PGstCaps; segment:PGstSegment; info:PGstStructure):PGstSample;cdecl;external libgstreamer;
function gst_sample_get_buffer(sample:PGstSample):PGstBuffer;cdecl;external libgstreamer;
function gst_sample_get_caps(sample:PGstSample):PGstCaps;cdecl;external libgstreamer;
function gst_sample_get_segment(sample:PGstSample):PGstSegment;cdecl;external libgstreamer;
function gst_sample_get_info(sample:PGstSample):PGstStructure;cdecl;external libgstreamer;
function gst_sample_get_buffer_list(sample:PGstSample):PGstBufferList;cdecl;external libgstreamer;
procedure gst_sample_set_buffer_list(sample:PGstSample; buffer_list:PGstBufferList);cdecl;external libgstreamer;
procedure gst_sample_set_buffer(sample:PGstSample; buffer:PGstBuffer);cdecl;external libgstreamer;
procedure gst_sample_set_caps(sample:PGstSample; caps:PGstCaps);cdecl;external libgstreamer;
procedure gst_sample_set_segment(sample:PGstSample; segment:PGstSegment);cdecl;external libgstreamer;
function gst_sample_set_info(sample:PGstSample; info:PGstStructure):Tgboolean;cdecl;external libgstreamer;
function gst_sample_ref(sample:PGstSample):PGstSample;cdecl;external libgstreamer;
procedure gst_sample_unref(sample:PGstSample);cdecl;external libgstreamer;
function gst_sample_copy(sample:PGstSample):PGstSample;cdecl;external libgstreamer;
procedure gst_clear_sample(sample_ptr:PPGstSample);cdecl;external libgstreamer;
function gst_sample_make_writable(sample:PGstSample):PGstSample;cdecl;external libgstreamer;
function gst_sample_is_writable(sample:PGstSample):Tgboolean;cdecl;external libgstreamer;

// === Konventiert am: 11-7-26 15:24:32 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SAMPLE(obj : longint) : longint;
begin
  GST_IS_SAMPLE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_SAMPLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SAMPLE_CAST(obj : longint) : PGstSample;
begin
  GST_SAMPLE_CAST:=PGstSample(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SAMPLE(obj : longint) : longint;
begin
  GST_SAMPLE:=GST_SAMPLE_CAST(obj);
end;


end.
