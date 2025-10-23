
{$IFDEF read_interface}

function gst_gl_display_egl_device_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLDisplayEGLDevice = record
    parent: TGstGLDisplay;
    device: Tgpointer;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayEGLDevice = ^TGstGLDisplayEGLDevice;

  TGstGLDisplayEGLDeviceClass = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayEGLDeviceClass = ^TGstGLDisplayEGLDeviceClass;


function gst_gl_display_egl_device_new(device_index: Tguint): PGstGLDisplayEGLDevice; cdecl; external libgstgl;
function gst_gl_display_egl_device_new_with_egl_device(device: Tgpointer): PGstGLDisplayEGLDevice; cdecl; external libgstgl;

function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj: Pointer): PGstGLDisplayEGLDevice;

// === Konventiert am: 9-10-24 09:01:17 ===

function GST_TYPE_GL_DISPLAY_EGL_DEVICE: TGType;
function GST_GL_DISPLAY_EGL_DEVICE(obj: Pointer): PGstGLDisplayEGLDevice;
function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass: Pointer): PGstGLDisplayEGLDeviceClass;
function GST_IS_GL_DISPLAY_EGL_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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

// ====

function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj: Pointer): PGstGLDisplayEGLDevice;
begin
  GST_GL_DISPLAY_EGL_DEVICE_CAST := PGstGLDisplayEGLDevice(obj);
end;


{$ENDIF read_implementation}
