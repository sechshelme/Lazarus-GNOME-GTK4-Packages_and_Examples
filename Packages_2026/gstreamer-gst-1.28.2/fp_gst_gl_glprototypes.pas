unit fp_gst_gl_glprototypes;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  fp_gst_gl,
  Strings,
  ctypes,
  gl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
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
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
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
{$UNDEF read_implementation}

end.
