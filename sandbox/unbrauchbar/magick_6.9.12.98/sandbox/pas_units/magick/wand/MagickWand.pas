unit MagickWand;

interface

uses
  fp_magiccore, fp_magicwand;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMagickWand = type Pointer;

function MagickGetException(para1: PMagickWand; para2: PExceptionType): pchar; cdecl; external libmagickwand;
function MagickGetExceptionType(para1: PMagickWand): TExceptionType; cdecl; external libmagickwand;
function IsMagickWand(para1: PMagickWand): TMagickBooleanType; cdecl; external libmagickwand;
function IsMagickWandInstantiated: TMagickBooleanType; cdecl; external libmagickwand;
function MagickClearException(para1: PMagickWand): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetIteratorIndex(para1: PMagickWand; para2: Tssize_t): TMagickBooleanType; cdecl; external libmagickwand;
function CloneMagickWand(para1: PMagickWand): PMagickWand; cdecl; external libmagickwand;
function DestroyMagickWand(para1: PMagickWand): PMagickWand; cdecl; external libmagickwand;
function NewMagickWand: PMagickWand; cdecl; external libmagickwand;
function NewMagickWandFromImage(para1: PImage): PMagickWand; cdecl; external libmagickwand;
function MagickGetIteratorIndex(para1: PMagickWand): Tssize_t; cdecl; external libmagickwand;
procedure ClearMagickWand(para1: PMagickWand); cdecl; external libmagickwand;
procedure MagickWandGenesis; cdecl; external libmagickwand;
procedure MagickWandTerminus; cdecl; external libmagickwand;
function MagickRelinquishMemory(para1: pointer): pointer; cdecl; external libmagickwand;
procedure MagickResetIterator(para1: PMagickWand); cdecl; external libmagickwand;
procedure MagickSetFirstIterator(para1: PMagickWand); cdecl; external libmagickwand;
procedure MagickSetLastIterator(para1: PMagickWand); cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:40:07 ===


implementation



end.
