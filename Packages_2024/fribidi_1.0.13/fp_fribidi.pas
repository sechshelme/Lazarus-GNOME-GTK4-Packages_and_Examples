unit fp_fribidi;

interface

const
  {$IFDEF Linux}
  libfribidi = 'fribidi';
  {$ENDIF}

  {$IFDEF Windows}
  libfribidi = 'libfribidi-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
    Tuint8_t=UInt8;
    Tuint32_t=UInt32;

    {$DEFINE read_interface}
    {$include fp_fribidi_includes.inc}
    {$UNDEF read_interface}


  implementation

  {$DEFINE read_implementation}
  {$include fp_fribidi_includes.inc}
  {$UNDEF read_implementation}

end.

