unit semaphore;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSemaphoreInfo = type Pointer;
  PPSemaphoreInfo = ^PSemaphoreInfo;

procedure SemaphoreComponentTerminus; cdecl; external libmagiccore;
function SemaphoreComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function AllocateSemaphoreInfo: PSemaphoreInfo; cdecl; external libmagiccore;
procedure ActivateSemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagiccore;
procedure DestroySemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagiccore;
procedure LockSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagiccore;
procedure UnlockSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:17:31 ===


implementation



end.
