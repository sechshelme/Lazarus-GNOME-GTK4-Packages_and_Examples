unit gstglupload;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystree00@gmail.com>
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
{$ifndef __GST_GL_UPLOAD_H__}
{$define __GST_GL_UPLOAD_H__}
{$include <gst/video/video.h>}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_upload_get_type:TGType;cdecl;external libgstgl;
 * GstGLUploadReturn:
 * @GST_GL_UPLOAD_DONE: No further processing required
 * @GST_GL_UPLOAD_ERROR: An unspecified error occurred
 * @GST_GL_UPLOAD_UNSUPPORTED: The configuration is unsupported.
 * @GST_GL_UPLOAD_RECONFIGURE: This element requires a reconfiguration.
 * @GST_GL_UPLOAD_UNSHARED_GL_CONTEXT: private return value.
  }
type
  PGstGLUploadReturn = ^TGstGLUploadReturn;
  TGstGLUploadReturn =  Longint;
  Const
    GST_GL_UPLOAD_DONE = 1;
    GST_GL_UPLOAD_ERROR = -(1);
    GST_GL_UPLOAD_UNSUPPORTED = -(2);
    GST_GL_UPLOAD_RECONFIGURE = -(3);
    GST_GL_UPLOAD_UNSHARED_GL_CONTEXT = -(100);
;
{*
 * GstGLUpload
 *
 * Opaque #GstGLUpload object
  }
{< private > }
type
  PGstGLUpload = ^TGstGLUpload;
  TGstGLUpload = record
      parent : TGstObject;
      context : PGstGLContext;
      priv : PGstGLUploadPrivate;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLUploadClass:
 *
 * The #GstGLUploadClass struct only contains private data
  }
{< private > }
  PGstGLUploadClass = ^TGstGLUploadClass;
  TGstGLUploadClass = record
      object_class : TGstObjectClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_upload_get_input_template_caps:PGstCaps;cdecl;external libgstgl;
function gst_gl_upload_new(context:PGstGLContext):PGstGLUpload;cdecl;external libgstgl;
procedure gst_gl_upload_set_context(upload:PGstGLUpload; context:PGstGLContext);cdecl;external libgstgl;
function gst_gl_upload_transform_caps(upload:PGstGLUpload; context:PGstGLContext; direction:TGstPadDirection; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external libgstgl;
function gst_gl_upload_set_caps(upload:PGstGLUpload; in_caps:PGstCaps; out_caps:PGstCaps):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_upload_get_caps(upload:PGstGLUpload; in_caps:PPGstCaps; out_caps:PPGstCaps);cdecl;external libgstgl;
procedure gst_gl_upload_propose_allocation(upload:PGstGLUpload; decide_query:PGstQuery; query:PGstQuery);cdecl;external libgstgl;
function gst_gl_upload_perform_with_buffer(upload:PGstGLUpload; buffer:PGstBuffer; outbuf_ptr:PPGstBuffer):TGstGLUploadReturn;cdecl;external libgstgl;
function gst_gl_upload_fixate_caps(upload:PGstGLUpload; direction:TGstPadDirection; caps:PGstCaps; othercaps:PGstCaps):PGstCaps;cdecl;external libgstgl;
{$endif}
{ __GST_GL_UPLOAD_H__  }

// === Konventiert am: 14-7-26 13:09:33 ===

function GST_TYPE_GL_UPLOAD : TGType;
function GST_GL_UPLOAD(obj : Pointer) : PGstGLUpload;
function GST_GL_UPLOAD_CLASS(klass : Pointer) : PGstGLUploadClass;
function GST_IS_GL_UPLOAD(obj : Pointer) : Tgboolean;
function GST_IS_GL_UPLOAD_CLASS(klass : Pointer) : Tgboolean;
begin

implementation

function GST_TYPE_GL_UPLOAD : TGType;
  begin
    GST_TYPE_GL_UPLOAD:=gst_gl_upload_get_type;
  end;

function GST_GL_UPLOAD(obj : Pointer) : PGstGLUpload;
begin
  Result := PGstGLUpload(g_type_check_instance_cast(obj, GST_TYPE_GL_UPLOAD));
end;

function GST_GL_UPLOAD_CLASS(klass : Pointer) : PGstGLUploadClass;
begin
  Result := PGstGLUploadClass(g_type_check_class_cast(klass, GST_TYPE_GL_UPLOAD));
end;

function GST_IS_GL_UPLOAD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_UPLOAD);
end;

function GST_IS_GL_UPLOAD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_UPLOAD);
end;

begin
  GST_GL_UPLOAD_CAST:=PGstGLUpload(obj);
  Result := PGstGLUploadClass(PGTypeInstance(obj)^.g_class);



end.
