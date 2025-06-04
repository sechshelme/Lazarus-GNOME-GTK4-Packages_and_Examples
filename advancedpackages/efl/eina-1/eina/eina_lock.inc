{$IFDEF read_interface}


type
  PEina_Lock_Result = ^TEina_Lock_Result;
  TEina_Lock_Result = longint;

const
  EINA_LOCK_FAIL = LongInt(EINA_FALSE);
  EINA_LOCK_SUCCEED = LongInt(EINA_TRUE);
  EINA_LOCK_DEADLOCK = LongInt(EINA_TRUE) + 1;

type

  TEina_TLS_Delete_Cb = procedure(ptr: pointer); cdecl;

var
  EINA_ERROR_NOT_MAIN_LOOP: TEina_Error; cvar;external libeina;

procedure eina_lock_debug(mutex: PEina_Lock); cdecl; external libeina;

// === Konventiert am: 16-5-25 17:19:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
