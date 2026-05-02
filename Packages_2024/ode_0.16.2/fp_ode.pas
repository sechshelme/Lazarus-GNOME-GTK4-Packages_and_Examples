unit fp_ode;

interface

const
  {$IFDEF Linux}
  libodes = 'ode';
  {$ENDIF}

  {$IFDEF msWindows}
  libode = 'libode-double.dll';
  {$ENDIF}

  type
    Ttime_t=uint64;
    PFILE=type Pointer;

    Tva_list=Pointer; // ????

    {$IFDEF FPC}
    {$PACKRECORDS C}
    {$ENDIF}

    {$DEFINE read_interface}
    {$include fp_ode_includes.inc}
    {$UNDEF read_interface}

  implementation

  {$DEFINE read_implementation}
  {$include fp_ode_includes.inc}
  {$UNDEF read_implementation}

end.

