unit fp_gst_rtsp_server;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_net,
  fp_gst_rtsp,
  fp_gst_sdp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_enum}
  {$include fp_gst_rtsp_server_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_gst_rtsp_server_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_gst_rtsp_server_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_gst_rtsp_server_includes.inc}
{$UNDEF read_implementation}

end.
