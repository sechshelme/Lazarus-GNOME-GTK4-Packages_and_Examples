unit fp_gnutls;

interface

uses
  fp_socket;

const
  {$IFDEF unix}
  libgnutls = 'libgnutls';
  {$ENDIF}

  {$IFDEF mswindows}
  libgnuplot_i = 'libgnutls-30.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
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

  Pgiovec_t = Pointer;

  PMD5_CTX = Pointer;  // openssl/md5h.h
  PRIPEMD160_CTX = Pointer;  // openssl/ripemd.h

  {$DEFINE read_interface}
  {$include fp_gnutls_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_gnutls_includes.inc}
{$UNDEF read_interface}

end.
