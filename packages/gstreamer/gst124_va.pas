unit gst124_va;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/va/gstva.inc}                            // io.
  {$include gst/va/va_enumtypes.inc}                     // io.
  {$include gst/va/gstvadisplay.inc}                     // io.
  {$include gst/va/gstvadisplay_drm.inc}                 // io. -> gstvadisplay
  {$include gst/va/gstvadisplay_wrapped.inc}             // io. -> gstvadisplay
  {$include gst/va/gstvaallocator.inc}                   // io. -> gstva, gstvadisplay
  {$include gst/va/gstvautils.inc}                       // io. -> gstvadisplay
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/va/gstva.inc}                            // io.
{$include gst/va/va_enumtypes.inc}                     // io.
{$include gst/va/gstvadisplay.inc}                     // io.
{$include gst/va/gstvadisplay_drm.inc}                 // io. -> gstvadisplay
{$include gst/va/gstvadisplay_wrapped.inc}             // io. -> gstvadisplay
{$include gst/va/gstvaallocator.inc}                   // io. -> gstva, gstvadisplay
{$include gst/va/gstvautils.inc}                       // io. -> gstvadisplay
{$UNDEF read_implementation}

end.
