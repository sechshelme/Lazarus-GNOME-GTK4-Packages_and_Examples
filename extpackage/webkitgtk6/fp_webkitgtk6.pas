unit fp_webkitgtk6;

interface

uses
  ctypes, fp_gtk4, fp_glib2, fp_soup3, fp_JSC;

const
  {$IFDEF Linux}
  libwebkit = 'webkitgtk-6.0';
  {$ENDIF}

  {$IFDEF Windows}
  libwebkit = 'webkitgtk-6.0.0.dll'; // ????????
  {$ENDIF}

  // ==== System
  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_webkitgtk6_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_webkitgtk6_includes.inc}
{$UNDEF read_implementation}

end.
