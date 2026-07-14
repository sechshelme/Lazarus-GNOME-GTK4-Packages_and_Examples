unit gsteglimage;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstglformat, gstglmemory, gstgl_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstEGLImage = ^TGstEGLImage;

  TGstEGLImageDestroyNotify = procedure(image: PGstEGLImage; data: Tgpointer); cdecl;

  TGstEGLImage = record
    parent: TGstMiniObject;
    context: PGstGLContext;
    image: Tgpointer;
    format: TGstGLFormat;
    destroy_data: Tgpointer;
    destroy_notify: TGstEGLImageDestroyNotify;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_egl_image_get_type: TGType; cdecl; external libgstgl;

function gst_egl_image_new_wrapped(context: PGstGLContext; image: Tgpointer; format: TGstGLFormat; user_data: Tgpointer; user_data_destroy: TGstEGLImageDestroyNotify): PGstEGLImage; cdecl; external libgstgl;
function gst_egl_image_get_image(image: PGstEGLImage): Tgpointer; cdecl; external libgstgl;
function gst_egl_image_from_texture(context: PGstGLContext; gl_mem: PGstGLMemory; attribs: Pguintptr): PGstEGLImage; cdecl; external libgstgl;

function gst_egl_image_from_dmabuf(context: PGstGLContext; dmabuf: Tgint; in_info: PGstVideoInfo; plane: Tgint; offset: Tgsize): PGstEGLImage; cdecl; external libgstgl;
function gst_egl_image_from_dmabuf_direct(context: PGstGLContext; fd: Pgint; offset: Pgsize; in_info: PGstVideoInfo): PGstEGLImage; cdecl; external libgstgl;
function gst_egl_image_from_dmabuf_direct_target(context: PGstGLContext; fd: Pgint; offset: Pgsize; in_info: PGstVideoInfo; target: TGstGLTextureTarget): PGstEGLImage; cdecl; external libgstgl;
function gst_egl_image_from_dmabuf_direct_target_with_dma_drm(context: PGstGLContext; n_planes: Tguint; fd: Pgint; offset: Pgsize; in_info_dma: PGstVideoInfoDmaDrm;
  target: TGstGLTextureTarget): PGstEGLImage; cdecl; external libgstgl;
function gst_egl_image_export_dmabuf(image: PGstEGLImage; fd: Plongint; stride: Pgint; offset: Pgsize): Tgboolean; cdecl; external libgstgl;
function gst_egl_image_can_emulate(context: PGstGLContext; format: TGstVideoFormat): Tgboolean; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 19:32:20 ===

function gst_egl_image_ref(image: PGstEGLImage): PGstEGLImage;
procedure gst_egl_image_unref(image: PGstEGLImage);

function GST_EGL_IMAGE(obj: Pointer): PGstEGLImage;
function GST_IS_EGL_IMAGE(obj: Pointer): Tgboolean;
function GST_EGL_IMAGE_CAST(obj: Pointer): PGstEGLImage;
function GST_TYPE_EGL_IMAGE: TGType;
{$ENDIF read_function}

implementation

function gst_egl_image_ref(image: PGstEGLImage): PGstEGLImage;
begin
  Result := PGstEGLImage(gst_mini_object_ref(GST_MINI_OBJECT_CAST(image)));
end;

procedure gst_egl_image_unref(image: PGstEGLImage);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(image));
end;


function GST_TYPE_EGL_IMAGE: TGType;
begin
  GST_TYPE_EGL_IMAGE := gst_egl_image_get_type;
end;

function GST_EGL_IMAGE(obj: Pointer): PGstEGLImage;
begin
  GST_EGL_IMAGE := GST_EGL_IMAGE_CAST(obj);
end;

function GST_IS_EGL_IMAGE(obj: Pointer): Tgboolean;
begin
  GST_IS_EGL_IMAGE := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_EGL_IMAGE);
end;

function GST_EGL_IMAGE_CAST(obj: Pointer): PGstEGLImage;
begin
  GST_EGL_IMAGE_CAST := PGstEGLImage(obj);
end;

end.
