unit fp_chafa;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libchafa = 'libchafa';
  {$ENDIF}

  {$IFDEF Windows}
  libchafa = 'libchafa-0.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_chafa_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_chafa_includes.inc}
{$UNDEF read_implementation}

end.
