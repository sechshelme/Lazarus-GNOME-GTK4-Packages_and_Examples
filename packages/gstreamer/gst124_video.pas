unit gst124_video;

interface

uses
  glib280,
  gst124,
  gst124_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // === GST_video



  {$DEFINE read_interface}
  {$include gst124_video_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gst124_video_includes.inc}
{$UNDEF read_implementation}

end.
