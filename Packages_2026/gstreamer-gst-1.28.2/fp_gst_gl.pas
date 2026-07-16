unit fp_gst_gl;

interface

uses
  {$ifdef Linux}
  xlib,
  {$endif}
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_enum}
  {$include fp_gst_gl_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_gst_gl_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_gst_gl_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_gst_gl_includes.inc}
{$UNDEF read_implementation}

end.
