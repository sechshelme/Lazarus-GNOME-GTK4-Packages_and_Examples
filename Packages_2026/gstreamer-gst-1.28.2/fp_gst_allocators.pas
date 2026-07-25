unit fp_gst_allocators;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/allocators/gstfdmemory.inc}
  {$include gst/allocators/gstdmabuf.inc}
  {$include gst/allocators/gstdrmdumb.inc}
  {$include gst/allocators/gstphysmemory.inc}
  {$include gst/allocators/gstshmallocator.inc}
  {$include gst/allocators/gstudmabufallocator.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/allocators/gstfdmemory.inc}
{$include gst/allocators/gstdmabuf.inc}
{$include gst/allocators/gstdrmdumb.inc}
{$include gst/allocators/gstphysmemory.inc}
{$include gst/allocators/gstshmallocator.inc}
{$include gst/allocators/gstudmabufallocator.inc}
{$UNDEF read_implementation}

end.
