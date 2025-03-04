unit threads;

interface

uses
  ctypes, xml2_common, globals;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlMutex = record
  end;
  PxmlMutex = ^TxmlMutex;

  PxmlMutexPtr = ^TxmlMutexPtr;
  TxmlMutexPtr = PxmlMutex;

  TxmlRMutex = record
  end;
  PxmlRMutex = ^TxmlRMutex;

  PxmlRMutexPtr = ^TxmlRMutexPtr;
  TxmlRMutexPtr = PxmlRMutex;

function xmlNewMutex: TxmlMutexPtr; cdecl; external libxml2;
procedure xmlMutexLock(tok: TxmlMutexPtr); cdecl; external libxml2;
procedure xmlMutexUnlock(tok: TxmlMutexPtr); cdecl; external libxml2;
procedure xmlFreeMutex(tok: TxmlMutexPtr); cdecl; external libxml2;
function xmlNewRMutex: TxmlRMutexPtr; cdecl; external libxml2;
procedure xmlRMutexLock(tok: TxmlRMutexPtr); cdecl; external libxml2;
procedure xmlRMutexUnlock(tok: TxmlRMutexPtr); cdecl; external libxml2;
procedure xmlFreeRMutex(tok: TxmlRMutexPtr); cdecl; external libxml2;
procedure xmlInitThreads; cdecl; external libxml2;
procedure xmlLockLibrary; cdecl; external libxml2;
procedure xmlUnlockLibrary; cdecl; external libxml2;
function xmlGetThreadId: longint; cdecl; external libxml2;
function xmlIsMainThread: longint; cdecl; external libxml2;
procedure xmlCleanupThreads; cdecl; external libxml2;
function xmlGetGlobalState: TxmlGlobalStatePtr; cdecl; external libxml2;
function xmlDllMain(hinstDLL: pointer; fdwReason: dword; lpvReserved: pointer): longint; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:49:48 ===


implementation



end.
