unit fp_gst_basecamerabinsrc;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/basecamerabinsrc/gstcamerabinpreview.inc}
{$include gst/basecamerabinsrc/gstbasecamerasrc.inc}      // io. -> gstcamerabinpreview
{$include gst/basecamerabinsrc/gstcamerabin_enum.inc}     // io. -> gstbasecamerasrc
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/basecamerabinsrc/gstcamerabinpreview.inc}
{$include gst/basecamerabinsrc/gstbasecamerasrc.inc}      // io. -> gstcamerabinpreview
{$include gst/basecamerabinsrc/gstcamerabin_enum.inc}     // io. -> gstbasecamerasrc
{$UNDEF read_implementation}

end.
