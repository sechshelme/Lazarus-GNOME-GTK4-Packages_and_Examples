unit gstglupload;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {$IFDEF read_enum}
type
  PGstGLUploadReturn = ^TGstGLUploadReturn;
  TGstGLUploadReturn = longint;
const
  GST_GL_UPLOAD_DONE = 1;
  GST_GL_UPLOAD_ERROR = -(1);
  GST_GL_UPLOAD_UNSUPPORTED = -(2);
  GST_GL_UPLOAD_RECONFIGURE = -(3);
  GST_GL_UPLOAD_UNSHARED_GL_CONTEXT = -(100);
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLUploadPrivate = type Pointer;

  PGstGLUpload = ^TGstGLUpload;
  TGstGLUpload = record
    parent: TGstObject;
    context: PGstGLContext;
    priv: PGstGLUploadPrivate;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLUploadClass = ^TGstGLUploadClass;
  TGstGLUploadClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_upload_get_type: TGType; cdecl; external libgstgl;
function gst_gl_upload_get_input_template_caps: PGstCaps; cdecl; external libgstgl;
function gst_gl_upload_new(context: PGstGLContext): PGstGLUpload; cdecl; external libgstgl;
procedure gst_gl_upload_set_context(upload: PGstGLUpload; context: PGstGLContext); cdecl; external libgstgl;
function gst_gl_upload_transform_caps(upload: PGstGLUpload; context: PGstGLContext; direction: TGstPadDirection; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_upload_set_caps(upload: PGstGLUpload; in_caps: PGstCaps; out_caps: PGstCaps): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_upload_get_caps(upload: PGstGLUpload; in_caps: PPGstCaps; out_caps: PPGstCaps); cdecl; external libgstgl;
procedure gst_gl_upload_propose_allocation(upload: PGstGLUpload; decide_query: PGstQuery; query: PGstQuery); cdecl; external libgstgl;
function gst_gl_upload_perform_with_buffer(upload: PGstGLUpload; buffer: PGstBuffer; outbuf_ptr: PPGstBuffer): TGstGLUploadReturn; cdecl; external libgstgl;
function gst_gl_upload_fixate_caps(upload: PGstGLUpload; direction: TGstPadDirection; caps: PGstCaps; othercaps: PGstCaps): PGstCaps; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:09:33 ===

function GST_TYPE_GL_UPLOAD: TGType;
function GST_GL_UPLOAD(obj: Pointer): PGstGLUpload;
function GST_GL_UPLOAD_CLASS(klass: Pointer): PGstGLUploadClass;
function GST_IS_GL_UPLOAD(obj: Pointer): Tgboolean;
function GST_IS_GL_UPLOAD_CLASS(klass: Pointer): Tgboolean;
function GST_GL_UPLOAD_CAST(obj: Pointer): PGstGLUpload;
{$ENDIF read_function}

implementation


function GST_TYPE_GL_UPLOAD: TGType;
begin
  GST_TYPE_GL_UPLOAD := gst_gl_upload_get_type;
end;

function GST_GL_UPLOAD(obj: Pointer): PGstGLUpload;
begin
  Result := PGstGLUpload(g_type_check_instance_cast(obj, GST_TYPE_GL_UPLOAD));
end;

function GST_GL_UPLOAD_CLASS(klass: Pointer): PGstGLUploadClass;
begin
  Result := PGstGLUploadClass(g_type_check_class_cast(klass, GST_TYPE_GL_UPLOAD));
end;

function GST_IS_GL_UPLOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_UPLOAD);
end;

function GST_IS_GL_UPLOAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_UPLOAD);
end;

function GST_GL_UPLOAD_CAST(obj: Pointer): PGstGLUpload;
begin
  GST_GL_UPLOAD_CAST := PGstGLUpload(obj);
end;

end.
