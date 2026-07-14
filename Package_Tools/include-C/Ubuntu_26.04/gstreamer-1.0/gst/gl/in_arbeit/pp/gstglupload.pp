
unit gstglupload;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglupload.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglupload.h
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
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstGLContext  = ^GstGLContext;
PGstGLUpload  = ^GstGLUpload;
PGstGLUploadClass  = ^GstGLUploadClass;
PGstGLUploadPrivate  = ^GstGLUploadPrivate;
PGstGLUploadReturn  = ^GstGLUploadReturn;
PGstQuery  = ^GstQuery;
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

function gst_gl_upload_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_UPLOAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_UPLOAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_UPLOAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_UPLOAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_UPLOAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_UPLOAD_CAST(obj : longint) : PGstGLUpload;

{*
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


function gst_gl_upload_get_input_template_caps:PGstCaps;cdecl;external;
function gst_gl_upload_new(context:PGstGLContext):PGstGLUpload;cdecl;external;
procedure gst_gl_upload_set_context(upload:PGstGLUpload; context:PGstGLContext);cdecl;external;
function gst_gl_upload_transform_caps(upload:PGstGLUpload; context:PGstGLContext; direction:TGstPadDirection; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external;
function gst_gl_upload_set_caps(upload:PGstGLUpload; in_caps:PGstCaps; out_caps:PGstCaps):Tgboolean;cdecl;external;
procedure gst_gl_upload_get_caps(upload:PGstGLUpload; in_caps:PPGstCaps; out_caps:PPGstCaps);cdecl;external;
procedure gst_gl_upload_propose_allocation(upload:PGstGLUpload; decide_query:PGstQuery; query:PGstQuery);cdecl;external;
function gst_gl_upload_perform_with_buffer(upload:PGstGLUpload; buffer:PGstBuffer; outbuf_ptr:PPGstBuffer):TGstGLUploadReturn;cdecl;external;
function gst_gl_upload_fixate_caps(upload:PGstGLUpload; direction:TGstPadDirection; caps:PGstCaps; othercaps:PGstCaps):PGstCaps;cdecl;external;
{$endif}
{ __GST_GL_UPLOAD_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_UPLOAD : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_UPLOAD:=gst_gl_upload_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_UPLOAD(obj : longint) : longint;
begin
  GST_GL_UPLOAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_UPLOAD,GstGLUpload);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_UPLOAD_CLASS(klass : longint) : longint;
begin
  GST_GL_UPLOAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_UPLOAD,GstGLUploadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_UPLOAD(obj : longint) : longint;
begin
  GST_IS_GL_UPLOAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_UPLOAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_UPLOAD_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_UPLOAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_UPLOAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_UPLOAD_CAST(obj : longint) : PGstGLUpload;
begin
  GST_GL_UPLOAD_CAST:=PGstGLUpload(obj);
end;


end.
