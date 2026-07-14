unit gstgldisplay_egl_device;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstgldisplay;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstGLDisplayEGLDevice = ^TGstGLDisplayEGLDevice;
  TGstGLDisplayEGLDevice = record
    parent: TGstGLDisplay;
    device: Tgpointer;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLDisplayEGLDeviceClass = ^TGstGLDisplayEGLDeviceClass;
  TGstGLDisplayEGLDeviceClass = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_display_egl_device_get_type: TGType; cdecl; external libgstgl;
function gst_gl_display_egl_device_new(device_index: Tguint): PGstGLDisplayEGLDevice; cdecl; external libgstgl;
function gst_gl_display_egl_device_new_with_egl_device(device: Tgpointer): PGstGLDisplayEGLDevice; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 19:31:44 ===

function GST_TYPE_GL_DISPLAY_EGL_DEVICE: TGType;
function GST_GL_DISPLAY_EGL_DEVICE(obj: Pointer): PGstGLDisplayEGLDevice;
function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass: Pointer): PGstGLDisplayEGLDeviceClass;
function GST_IS_GL_DISPLAY_EGL_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj: Pointer): PGstGLDisplayEGLDevice;
{$ENDIF read_function}


implementation

function GST_TYPE_GL_DISPLAY_EGL_DEVICE: TGType;
begin
  GST_TYPE_GL_DISPLAY_EGL_DEVICE := gst_gl_display_egl_device_get_type;
end;

function GST_GL_DISPLAY_EGL_DEVICE(obj: Pointer): PGstGLDisplayEGLDevice;
begin
  Result := PGstGLDisplayEGLDevice(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_EGL_DEVICE));
end;

function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass: Pointer): PGstGLDisplayEGLDeviceClass;
begin
  Result := PGstGLDisplayEGLDeviceClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_EGL_DEVICE));
end;

function GST_IS_GL_DISPLAY_EGL_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_DISPLAY_EGL_DEVICE);
end;

function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_DISPLAY_EGL_DEVICE);
end;

function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj: Pointer): PGstGLDisplayEGLDevice;
begin
  GST_GL_DISPLAY_EGL_DEVICE_CAST := PGstGLDisplayEGLDevice(obj);
end;

end.
