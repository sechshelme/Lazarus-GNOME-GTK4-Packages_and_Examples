unit fp_gst_video;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // === GST_video



  {$DEFINE read_enum}
  {$include fp_gst_video_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_gst_video_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_gst_video_includes.inc}
  {$UNDEF read_function}


implementation

{$DEFINE read_implementation}
{$include fp_gst_video_includes.inc}
{$UNDEF read_implementation}

end.
