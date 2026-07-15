
{$include gst/gl/gl_enumtypes.inc}
{$include gst/gl/gstgl_enums.inc}
{$include gst/gl/gstglapi.inc}
{$include gst/gl/gstglfuncs.inc}
{$include gst/gl/gstglwindow.inc}
{$include gst/gl/gstgldisplay.inc}
{$include gst/gl/gstglcontext.inc}
{$include gst/gl/gstglbasefilter.inc}
{$include gst/gl/gstgldebug.inc}
{$include gst/gl/gstglquery.inc}
{$include gst/gl/gstglbasemixer.inc}
{$include gst/gl/gstglformat.inc}
{$include gst/gl/gstglbasememory.inc}
{$include gst/gl/gstglbuffer.inc}
{$include gst/gl/gstglbufferpool.inc}
{$include gst/gl/gstglmemory.inc}
{$include gst/gl/gstglmemorypbo.inc}
{$include gst/gl/gstglbasesrc.inc}
{$include gst/gl/gstglframebuffer.inc}
{$include gst/gl/gstglsl.inc}
{$include gst/gl/gstglslstage.inc}
{$include gst/gl/gstglshader.inc}
{$include gst/gl/gstglshaderstrings.inc}
{$include gst/gl/gstglcolorconvert.inc}
{$include gst/gl/gstglcontextconfig.inc}
{$include gst/gl/gstglfeature.inc}
{$include gst/gl/gstglfilter.inc}
{$include gst/gl/gstglmixer.inc}
{$include gst/gl/gstgloverlaycompositor.inc}
{$include gst/gl/gstglrenderbuffer.inc}
{$include gst/gl/gstglsyncmeta.inc}
{$include gst/gl/gstglupload.inc}
{$include gst/gl/gstglutils.inc}
{$include gst/gl/gstglviewconvert.inc}

// glprototypes
{$include gst/gl/glprototypes/base.inc}
{$include gst/gl/glprototypes/blending.inc}
{$include gst/gl/glprototypes/buffers.inc}
{$include gst/gl/glprototypes/buffer_storage.inc}
{$include gst/gl/glprototypes/debug.inc}
{$include gst/gl/glprototypes/eglimage.inc}
{$include gst/gl/glprototypes/fbo.inc}
{$include gst/gl/glprototypes/fixedfunction.inc}
{$include gst/gl/glprototypes/gles.inc}
{$include gst/gl/glprototypes/opengl.inc}
{$include gst/gl/glprototypes/query.inc}
{$include gst/gl/glprototypes/shaders.inc}
{$include gst/gl/glprototypes/sync.inc}
{$include gst/gl/glprototypes/vao.inc}
{$include gst/gl/glprototypes/invalidate_subdata.inc}

// egl
{$include gst/gl/egl/gstegl.inc}
{$include gst/gl/egl/gsteglimage.inc}
{$include gst/gl/egl/gstgldisplay_egl.inc}
{$include gst/gl/egl/gstgldisplay_egl_device.inc}
{$include gst/gl/egl/gstglmemoryegl.inc}

// wayland
{$ifdef Linux}
{$include gst/gl/wayland/gstgldisplay_wayland.inc}
{$endif}

// x11
{$ifdef Linux}
{$include gst/gl/x11/gstgldisplay_x11.inc}
{$endif}

