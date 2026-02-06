unit fp_polylib64;

interface

const
  {$IFDEF Linux}
  libpolylib = 'polylib64';
  {$ENDIF}

  {$IFDEF Windows}
  libpolylib = 'libpolylib64.dll'; // ????
  {$ENDIF}

  type
  PPdword=^PWord;

  Tsize_t=SizeUInt;

  PFILE=type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



implementation

end.

