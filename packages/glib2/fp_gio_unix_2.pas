unit fp_gio_unix_2;

interface

uses
  fp_glib2,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gio-unix-2.0/gio/gdesktopappinfo.inc}
{$include gio-unix-2.0/gio/gfiledescriptorbased.inc}
{$include gio-unix-2.0/gio/gunixfdmessage.inc}
{$include gio-unix-2.0/gio/gunixinputstream.inc}
{$include gio-unix-2.0/gio/gunixmounts.inc}
{$include gio-unix-2.0/gio/gunixoutputstream.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gio-unix-2.0/gio/gdesktopappinfo.inc}
{$include gio-unix-2.0/gio/gfiledescriptorbased.inc}
{$include gio-unix-2.0/gio/gunixfdmessage.inc}
{$include gio-unix-2.0/gio/gunixinputstream.inc}
{$include gio-unix-2.0/gio/gunixmounts.inc}
{$include gio-unix-2.0/gio/gunixoutputstream.inc}
{$UNDEF read_implementation}

end.
