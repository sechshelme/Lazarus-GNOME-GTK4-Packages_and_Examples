unit gstgl_enums;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstGLTextureTarget = ^TGstGLTextureTarget;
  TGstGLTextureTarget = longint;
const
  GST_GL_TEXTURE_TARGET_NONE = 0;
  GST_GL_TEXTURE_TARGET_2D = 1;
  GST_GL_TEXTURE_TARGET_RECTANGLE = 2;
  GST_GL_TEXTURE_TARGET_EXTERNAL_OES = 3;
  {$ENDIF read_enum}

  // === Konventiert am: 14-7-26 13:02:20 ===


implementation



end.
