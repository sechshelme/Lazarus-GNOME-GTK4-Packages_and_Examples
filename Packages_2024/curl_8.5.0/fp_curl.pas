unit fp_curl;

interface

const
  {$IFDEF unix}
  libcurl = 'libcurl';
  {$ENDIF}

  {$IFDEF mswindows}
  libcurl = 'libcurl.dll'; // ????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF unix}
  Tclong = int64;
  Tculong = uint64;
  {$ENDIF}

  {$IFDEF mswindows}
  Tclong = int32;
  Tculong = uint32;
  {$ENDIF}
  Pclong = ^Tclong;
  Pculong = ^Tculong;


type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Ttime_t = uint64;
  Ptime_t = ^Ttime_t;

  PFILE = Pointer;
  Tva_list = Pointer;

type  // curl/system.h
  Tcurl_off_t = longint;

type // /usr/include/x86_64-linux-gnu/sys/select.h
  Pfd_set = Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_curl_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_curl_includes.inc}
{$UNDEF read_implementation}

end.
