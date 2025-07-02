unit fp_libssh;


interface

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

implementation

end.
