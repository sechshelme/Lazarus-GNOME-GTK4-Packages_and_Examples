unit eina_lock;

interface

uses
  ctypes, efl, eina_types, eina_error;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEina_Lock_Result = ^TEina_Lock_Result;
  TEina_Lock_Result = longint;

const
  EINA_LOCK_FAIL = EINA_FALSE;
  EINA_LOCK_SUCCEED = EINA_TRUE;
  EINA_LOCK_DEADLOCK = byte(EINA_TRUE) + 1;

type

  TEina_TLS_Delete_Cb = procedure(ptr: pointer); cdecl;

var
  EINA_ERROR_NOT_MAIN_LOOP: TEina_Error; cvar;external libeina;

procedure eina_lock_debug(mutex: PEina_Lock); cdecl; external libeina;

// === Konventiert am: 16-5-25 17:19:37 ===


implementation



end.
