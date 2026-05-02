{$IFDEF read_interface}


type
  TdInitODEFlags = longint;

const
  dInitFlagManualThreadCleanup = $00000001;

procedure dInitODE; cdecl; external libodes;
function dInitODE2(uiInitFlags: dword): longint; cdecl; external libodes;

type
  TdAllocateODEDataFlags = longint;

const
  dAllocateFlagBasicData = 0;
  dAllocateFlagCollisionData = $00000001;
  dAllocateMaskAll = not (0);

function dAllocateODEDataForThread(uiAllocateFlags: dword): longint; cdecl; external libodes;
procedure dCleanupODEAllDataForThread; cdecl; external libodes;
procedure dCloseODE; cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
