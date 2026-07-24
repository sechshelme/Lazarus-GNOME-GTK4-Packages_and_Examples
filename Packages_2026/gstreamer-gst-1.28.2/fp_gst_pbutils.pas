unit fp_gst_pbutils;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_audio,
  fp_gst_video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$DEFINE read_interface}
  {$include gst/pbutils/pbutils.inc}
  {$include gst/pbutils/missing_plugins.inc}
  {$include gst/pbutils/pbutils_enumtypes.inc}
  {$include gst/pbutils/codec_utils.inc}
  {$include gst/pbutils/install_plugins.inc}
  {$include gst/pbutils/gstaudiovisualizer.inc}
  {$include gst/pbutils/gstdiscoverer.inc}
  {$include gst/pbutils/encoding_profile.inc}
  {$include gst/pbutils/encoding_target.inc}
  {$include gst/pbutils/descriptions.inc}
  {$include gst/pbutils/gstpluginsbaseversion.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gst/pbutils/pbutils.inc}
{$include gst/pbutils/missing_plugins.inc}
{$include gst/pbutils/pbutils_enumtypes.inc}
{$include gst/pbutils/codec_utils.inc}
{$include gst/pbutils/install_plugins.inc}
{$include gst/pbutils/gstaudiovisualizer.inc}
{$include gst/pbutils/gstdiscoverer.inc}
{$include gst/pbutils/encoding_profile.inc}
{$include gst/pbutils/encoding_target.inc}
{$include gst/pbutils/descriptions.inc}
{$include gst/pbutils/gstpluginsbaseversion.inc}
{$UNDEF read_implementation}

end.
