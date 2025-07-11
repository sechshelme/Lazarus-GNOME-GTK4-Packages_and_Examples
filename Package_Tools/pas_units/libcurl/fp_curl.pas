unit fp_curl;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}
const
  {$IFDEF unix}
  libcurl = 'libcurl';
  {$ENDIF}

  {$IFDEF mswindows}
  libcurl = 'libcurl.dll'; // ????
  {$ENDIF}



type
  Tsize_t = SizeUInt;
  Ttime_t = uint64;
  Ptime_t=^Ttime_t;

type                // curl/system.h
  Tcurl_off_t = longint;

implementation

end.
