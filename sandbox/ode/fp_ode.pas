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

implementation

end.

