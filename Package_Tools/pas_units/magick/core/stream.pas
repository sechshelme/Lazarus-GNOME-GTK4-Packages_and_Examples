unit stream;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TStreamHandler = function(para1: PImage; para2: pointer; para3: Tsize_t): Tsize_t; cdecl;

function ReadStream(para1: PImageInfo; para2: TStreamHandler; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WriteStream(para1: PImageInfo; para2: PImage; para3: TStreamHandler): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:36 ===


implementation



end.
