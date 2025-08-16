unit fp_lept;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libleptb = 'libleptb';
  {$ENDIF}

  {$IFDEF msWindows}
  libleptb = 'libleptonica-6.dll';
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_poppler_glib_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include fp_poppler_glib_includes.inc}
{$UNDEF read_implementation}

end.
