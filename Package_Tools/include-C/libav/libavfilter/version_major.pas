unit version_major;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  LIBAVFILTER_VERSION_MAJOR = 9;
  FF_API_LIBPLACEBO_OPTS = LIBAVFILTER_VERSION_MAJOR < 10;

  // === Konventiert am: 21-12-25 19:36:17 ===


implementation



end.
