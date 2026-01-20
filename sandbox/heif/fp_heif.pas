unit fp_heif;

interface

const
  {$IFDEF Linux}
  libheif = 'heif';
  {$ENDIF}

  {$IFDEF Windows}
  libheif = 'heif.dll';  // ?????
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
