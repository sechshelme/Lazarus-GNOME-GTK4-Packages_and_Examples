unit fp_gst_va;

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

type
  // /usr/include/va/va.h
  TVAGenericID = cuint;
  TVASurfaceID = TVAGenericID;


  {$DEFINE read_interface}
  {$include gst/va/gstva.inc}
  {$include gst/va/va_enumtypes.inc}
  {$include gst/va/gstvadisplay.inc}
  {$include gst/va/gstvadisplay_drm.inc}
  {$include gst/va/gstvadisplay_wrapped.inc}
  {$include gst/va/gstvaallocator.inc}
  {$include gst/va/gstvautils.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/va/gstva.inc}
{$include gst/va/va_enumtypes.inc}
{$include gst/va/gstvadisplay.inc}
{$include gst/va/gstvadisplay_drm.inc}
{$include gst/va/gstvadisplay_wrapped.inc}
{$include gst/va/gstvaallocator.inc}
{$include gst/va/gstvautils.inc}
{$UNDEF read_implementation}

end.
