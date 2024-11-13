unit fp_gst_check;

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
  {$include gst/check/internal_check.inc}                      // io.                      // viele Makros entfernt   lib CK_DLL_EXP  ?????
  {$include gst/check/gstcheck.inc}                            // io. -> internal_check    // viele Makros entfernt
  {$include gst/check/gstbufferstraw.inc}                      // io.
  {$include gst/check/gstconsistencychecker.inc}               // io.
  {$include gst/check/gsttestclock.inc}                        // io.
  {$include gst/check/gstharness.inc}                          // io. -> gsttestclock
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/check/internal_check.inc}                      // io.                      // viele Makros entfernt   lib CK_DLL_EXP  ?????
{$include gst/check/gstcheck.inc}                            // io. -> internal_check    // viele Makros entfernt
{$include gst/check/gstbufferstraw.inc}                      // io.
{$include gst/check/gstconsistencychecker.inc}               // io.
{$include gst/check/gsttestclock.inc}                        // io.
{$include gst/check/gstharness.inc}                          // io. -> gsttestclock
{$UNDEF read_interface}
{$UNDEF read_implementation}

end.
