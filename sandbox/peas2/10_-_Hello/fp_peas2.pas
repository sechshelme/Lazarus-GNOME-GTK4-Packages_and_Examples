unit fp_peas2;

interface

const
  {$IFDEF linux}
  libpeas2 = 'libpeas-2';
  {$ENDIF}

  {$IFDEF windows}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {$DEFINE read_interface}

  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}

{$UNDEF read_interface}
end.
