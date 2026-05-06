unit fp_shumate;

interface

const
  {$IFDEF Linux}
  libshumate = 'shumate-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libshumate = 'libshumate-1.0-1.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_chafa_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_chafa_includes.inc}
{$UNDEF read_implementation}

end.

