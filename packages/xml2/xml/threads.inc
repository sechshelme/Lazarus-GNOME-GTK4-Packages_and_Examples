{$IFDEF read_interface}

type
  TxmlMutex = record
  end;
  PxmlMutex = ^TxmlMutex;

  TxmlRMutex = record
  end;
  PxmlRMutex = ^TxmlRMutex;

function xmlNewMutex: PxmlMutex; cdecl; external libxml2;
procedure xmlMutexLock(tok: PxmlMutex); cdecl; external libxml2;
procedure xmlMutexUnlock(tok: PxmlMutex); cdecl; external libxml2;
procedure xmlFreeMutex(tok: PxmlMutex); cdecl; external libxml2;
function xmlNewRMutex: PxmlRMutex; cdecl; external libxml2;
procedure xmlRMutexLock(tok: PxmlRMutex); cdecl; external libxml2;
procedure xmlRMutexUnlock(tok: PxmlRMutex); cdecl; external libxml2;
procedure xmlFreeRMutex(tok: PxmlRMutex); cdecl; external libxml2;
procedure xmlInitThreads; cdecl; external libxml2;
procedure xmlLockLibrary; cdecl; external libxml2;
procedure xmlUnlockLibrary; cdecl; external libxml2;
function xmlGetThreadId: longint; cdecl; external libxml2;
function xmlIsMainThread: longint; cdecl; external libxml2;
procedure xmlCleanupThreads; cdecl; external libxml2;
function xmlGetGlobalState: PxmlGlobalState; cdecl; external libxml2;
function xmlDllMain(hinstDLL: pointer; fdwReason: dword; lpvReserved: pointer): longint; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:49:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
