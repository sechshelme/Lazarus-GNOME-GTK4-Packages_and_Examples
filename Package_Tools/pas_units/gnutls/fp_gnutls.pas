unit fp_gnutls;

interface

const
  {$IFDEF unix}
  libgnutls = 'libgnutls';
  {$ENDIF}

  {$IFDEF mswindows}
  libgnuplot_i = 'libgnutls-30.dll';
  {$ENDIF}

type
  PPdword = ^Pdword;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;
  Tssize_t = SizeInt;

  Poff_t = Pointer;
  Pmbuffer_st = Pointer;

  Ttime_t = int64;
  Ptime_t = ^Ttime_t;

  Pgiovec_t=Pointer;


implementation

end.
