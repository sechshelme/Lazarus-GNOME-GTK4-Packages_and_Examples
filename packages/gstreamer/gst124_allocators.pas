unit gst124_allocators;

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

  {$DEFINE read_interface}
  {$include gst/allocators/gstdrmdumb}                      // io.
  {$include gst/allocators/gstphysmemory}                   // io.
  {$include gst/allocators/gstfdmemory}                     // io.
  {$include gst/allocators/gstshmallocator}                 // io. -> gstfdmemory
  {$include gst/allocators/gstdmabuf}                       // io. -> gstfdmemory
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/allocators/gstdrmdumb}                      // io.
{$include gst/allocators/gstphysmemory}                   // io.
{$include gst/allocators/gstfdmemory}                     // io.
{$include gst/allocators/gstshmallocator}                 // io. -> gstfdmemory
{$include gst/allocators/gstdmabuf}                       // io. -> gstfdmemory
{$UNDEF read_implementation}

end.
