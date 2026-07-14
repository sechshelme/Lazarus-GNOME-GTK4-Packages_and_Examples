unit gstglquery;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_GL_QUERY_H__}
{$define __GST_GL_QUERY_H__}
{$include <gst/gl/gstgl_fwd.h>}
{$include <gst/gl/gstgldebug.h>}
{*
 * GstGLQueryType:
 * @GST_GL_QUERY_NONE: no query
 * @GST_GL_QUERY_TIME_ELAPSED: query the time elapsed
 * @GST_GL_QUERY_TIMESTAMP: query the current time
  }
type
  PGstGLQueryType = ^TGstGLQueryType;
  TGstGLQueryType =  Longint;
  Const
    GST_GL_QUERY_NONE = 0;
    GST_GL_QUERY_TIME_ELAPSED = 1;
    GST_GL_QUERY_TIMESTAMP = 2;
;
{*
 * GstGLQuery:
 *
 * Opaque #GstGLQuery struct
  }
{< private > }
type
  PGstGLQuery = ^TGstGLQuery;
  TGstGLQuery = record
      context : PGstGLContext;
      query_type : Tguint;
      query_id : Tguint;
      supported : Tgboolean;
      start_called : Tgboolean;
      debug : TGstGLAsyncDebug;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_gl_query_init(query:PGstGLQuery; context:PGstGLContext; query_type:TGstGLQueryType);cdecl;external libgstgl;
procedure gst_gl_query_unset(query:PGstGLQuery);cdecl;external libgstgl;
function gst_gl_query_new(context:PGstGLContext; query_type:TGstGLQueryType):PGstGLQuery;cdecl;external libgstgl;
procedure gst_gl_query_free(query:PGstGLQuery);cdecl;external libgstgl;
procedure gst_gl_query_start(query:PGstGLQuery);cdecl;external libgstgl;
procedure gst_gl_query_end(query:PGstGLQuery);cdecl;external libgstgl;
procedure gst_gl_query_counter(query:PGstGLQuery);cdecl;external libgstgl;
function gst_gl_query_result(query:PGstGLQuery):Tguint64;cdecl;external libgstgl;
{$endif}
{ __GST_GL_QUERY_H__  }

// === Konventiert am: 14-7-26 13:06:45 ===


implementation



end.
