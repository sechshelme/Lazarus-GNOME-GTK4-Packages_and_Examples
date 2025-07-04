unit fp_libssh;


interface

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  {$IFDEF unix}
  libssh = 'libssh';
  {$ENDIF}

  {$IFDEF mswindows}
  libssh = 'libssh.dll';  // ??????
  {$ENDIF}

  {$IFDEF darwin}
  libssh = 'libssh.dynlib'; // ??????
  {$ENDIF}

type
  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeUInt;

  Ptimeval = Pointer; // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
  Pfd_set = Pointer; // /usr/include/x86_64-linux-gnu/sys/select.h

  Pva_list = Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_libssh_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_libssh_includes.inc}
{$UNDEF read_implementation}

end.
