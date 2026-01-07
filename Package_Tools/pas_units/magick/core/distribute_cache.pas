unit distribute_cache;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure DistributePixelCacheServer(para1: longint; para2: PExceptionInfo); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:23:07 ===


implementation



end.
