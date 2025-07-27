unit fp_graphite2;

interface

const
  {$IFDEF Linux}
  libgraphite2 = 'libgraphite2';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

implementation

end.
