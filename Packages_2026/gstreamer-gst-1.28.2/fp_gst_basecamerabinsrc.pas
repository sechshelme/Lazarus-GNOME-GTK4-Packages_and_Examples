unit fp_gst_basecamerabinsrc;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/basecamerabinsrc/gstcamerabin_enum.inc}
{$include gst/basecamerabinsrc/gstcamerabinpreview.inc}
{$include gst/basecamerabinsrc/gstbasecamerasrc.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/basecamerabinsrc/gstcamerabin_enum.inc}
{$include gst/basecamerabinsrc/gstcamerabinpreview.inc}
{$include gst/basecamerabinsrc/gstbasecamerasrc.inc}
{$UNDEF read_implementation}

end.
