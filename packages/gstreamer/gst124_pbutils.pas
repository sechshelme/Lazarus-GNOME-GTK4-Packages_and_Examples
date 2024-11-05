unit gst124_pbutils;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_audio,
  gst124_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$DEFINE read_interface}
  {$include gst/pbutils/pbutils.inc}                       // io.
  {$include gst/pbutils/missing_plugins.inc}               // io.
  {$include gst/pbutils/pbutils_enumtypes.inc}             // io.
  {$include gst/pbutils/codec_utils.inc}                   // io.
  {$include gst/pbutils/install_plugins.inc}               // io.
  {$include gst/pbutils/gstaudiovisualizer.inc}            // io.
  {$include gst/pbutils/gstdiscoverer.inc}                 // io.
  {$include gst/pbutils/encoding_profile.inc}              // io. -> gstdiscoverer
  {$include gst/pbutils/encoding_target.inc}               // io. -> encoding_profile
  {$include gst/pbutils/descriptions.inc}                  // io.
  {$include gst/pbutils/gstpluginsbaseversion.inc}         //  version makro !
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gst/pbutils/pbutils.inc}                       // io.
{$include gst/pbutils/missing_plugins.inc}               // io.
{$include gst/pbutils/pbutils_enumtypes.inc}             // io.
{$include gst/pbutils/codec_utils.inc}                   // io.
{$include gst/pbutils/install_plugins.inc}               // io.
{$include gst/pbutils/gstaudiovisualizer.inc}            // io.
{$include gst/pbutils/gstdiscoverer.inc}                 // io.
{$include gst/pbutils/encoding_profile.inc}              // io. -> gstdiscoverer
{$include gst/pbutils/encoding_target.inc}               // io. -> encoding_profile
{$include gst/pbutils/descriptions.inc}                  // io.
{$include gst/pbutils/gstpluginsbaseversion.inc}         //  version makro !
{$UNDEF read_implementation}

end.
