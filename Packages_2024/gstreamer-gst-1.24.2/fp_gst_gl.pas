unit fp_gst_gl;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_gst_gl_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_gst_gl_includes.inc}
{$UNDEF read_implementation}

end.
