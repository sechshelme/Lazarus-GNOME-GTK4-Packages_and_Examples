unit fp_ibus;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF linux}
  libibus = 'libibus-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_ibus_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_ibus_includes.inc}
{$UNDEF read_implementation}

end.
