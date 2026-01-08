{$IFDEF read_interface}


type
  PSemaphoreInfo = type Pointer;
  PPSemaphoreInfo = ^PSemaphoreInfo;

procedure SemaphoreComponentTerminus; cdecl; external libmagickcore;
function SemaphoreComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function AllocateSemaphoreInfo: PSemaphoreInfo; cdecl; external libmagickcore;
procedure ActivateSemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagickcore;
procedure DestroySemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagickcore;
procedure LockSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagickcore;
procedure UnlockSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
