unit fp_spelling;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libspelling = 'spelling-1';
  {$ENDIF}

  {$IFDEF Windows}
  libspelling = 'libspelling-1-2.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_spelling_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
///{$include fp_spelling_includes.inc}
{$UNDEF read_implementation}

end.
