{$IFDEF read_interface}



type
  TEina_Condition = record
  end;
  PEina_Condition = ^TEina_Condition;

  TEina_RWLock = record
  end;
  PEina_RWLock = ^TEina_RWLock;

  TEina_Semaphore = Tsem_t;
  PEina_Semaphore = ^TEina_Semaphore;

  TEina_Barrier = record
  end;
  PEina_Barrier = ^TEina_Barrier;

  TEina_TLS = pthread_key_t;
  PEina_TLS = ^TEina_TLS;


// Inline functions translated from C
function eina_lock_new(mutex: PEina_Lock): TEina_Bool;
function eina_lock_recursive_new(mutex: PEina_Lock): TEina_Bool;
procedure eina_lock_free(mutex: PEina_Lock);
function eina_lock_take_try(mutex: PEina_Lock): TEina_Lock_Result;
function eina_lock_take(mutex: PEina_Lock): TEina_Lock_Result;
function eina_lock_release(mutex: PEina_Lock): TEina_Lock_Result;

function eina_condition_new(cond: PEina_Condition; mutex: PEina_Lock): TEina_Bool;
procedure eina_condition_free(cond: PEina_Condition);
function eina_condition_wait(cond: PEina_Condition): TEina_Bool;
function eina_condition_timedwait(cond: PEina_Condition; t: double): TEina_Bool;
function eina_condition_broadcast(cond: PEina_Condition): TEina_Bool;
function eina_condition_signal(cond: PEina_Condition): TEina_Bool;

function eina_rwlock_new(mutex: PEina_RWLock): TEina_Bool;
procedure eina_rwlock_free(mutex: PEina_RWLock);
function eina_rwlock_take_read(mutex: PEina_RWLock): TEina_Lock_Result;
function eina_rwlock_take_write(mutex: PEina_RWLock): TEina_Lock_Result;
function eina_rwlock_release(mutex: PEina_RWLock): TEina_Lock_Result;

// TLS functions
function eina_tls_cb_new(key: PEina_TLS; delete_cb: TEina_TLS_Delete_Cb): TEina_Bool;
function eina_tls_new(key: PEina_TLS): TEina_Bool;
procedure eina_tls_free(key: TEina_TLS);
function eina_tls_get(key: TEina_TLS): Pointer;
function eina_tls_set(key: TEina_TLS; data: Pointer): TEina_Bool;

function eina_spinlock_new(spinlock: PEina_Spinlock): TEina_Bool;
procedure eina_spinlock_free(spinlock: PEina_Spinlock);
function eina_spinlock_take_try(spinlock: PEina_Spinlock): TEina_Lock_Result;
function eina_spinlock_take(spinlock: PEina_Spinlock): TEina_Lock_Result;
function eina_spinlock_release(spinlock: PEina_Spinlock): TEina_Lock_Result;

function eina_semaphore_new(sem: PEina_Semaphore; count_init: integer): TEina_Bool;
function eina_semaphore_free(sem: PEina_Semaphore): TEina_Bool;
function eina_semaphore_lock(sem: PEina_Semaphore): TEina_Bool;
function eina_semaphore_release(sem: PEina_Semaphore; count_release: integer): TEina_Bool;


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure _eina_lock_debug_abort(err: integer; const fn: pansichar; const ptr: Pointer); cdecl; external libeina;
procedure _eina_lock_debug_deadlock(const fn: pansichar; const ptr: Pointer); cdecl; external libeina;

function _eina_lock_new(mutex: PEina_Lock; recursive: TEina_Bool): TEina_Bool; external libeina;
procedure _eina_lock_free(mutex: PEina_Lock); external libeina;
function _eina_condition_new(cond: PEina_Condition; mutex: PEina_Lock): TEina_Bool; external libeina;
procedure _eina_condition_free(cond: PEina_Condition); external libeina;
function _eina_rwlock_new(mutex: PEina_RWLock): TEina_Bool; external libeina;
procedure _eina_rwlock_free(mutex: PEina_RWLock); external libeina;
function _eina_spinlock_new(spinlock: PEina_Spinlock): TEina_Bool; external libeina;
procedure _eina_spinlock_free(spinlock: PEina_Spinlock); external libeina;
function _eina_semaphore_new(sem: PEina_Semaphore; count_init: integer): TEina_Bool; external libeina;
function _eina_semaphore_free(sem: PEina_Semaphore): TEina_Bool; external libeina;


procedure EINA_LOCK_ABORT_DEBUG(err: integer; const fn: pansichar; const ptr: Pointer);
begin
  _eina_lock_debug_abort(err, fn, ptr);
end;

procedure EINA_LOCK_DEADLOCK_DEBUG(const fn: pansichar; const ptr: Pointer);
begin
  _eina_lock_debug_deadlock(fn, ptr);
end;


function eina_lock_new(mutex: PEina_Lock): TEina_Bool;
begin
  Result := _eina_lock_new(mutex, EINA_FALSE);
end;

function eina_lock_recursive_new(mutex: PEina_Lock): TEina_Bool;
begin
  Result := _eina_lock_new(mutex, EINA_TRUE);
end;

procedure eina_lock_free(mutex: PEina_Lock);
begin
  _eina_lock_free(mutex);
end;

function eina_lock_take_try(mutex: PEina_Lock): TEina_Lock_Result;
var
  ok: integer;
begin
  Result := EINA_LOCK_FAIL; // Default value
  // ok := PosixMutexTrylock(mutex^.mutex_handle); // Placeholder for actual call
  ok := 0; // Dummy value for compilation
  if ok = 0 then begin
    Result := EINA_LOCK_SUCCEED;
  end else if ok = EDEADLK then // EDEADLK is typically 35
  begin
    // eina_lock_debug(mutex); // Assuming this function is defined
    Result := EINA_LOCK_DEADLOCK;
  end else if ok <> EBUSY then // EBUSY is typically 16
  begin
    EINA_LOCK_ABORT_DEBUG(ok, 'trylock', mutex);
  end;

end;

function eina_lock_take(mutex: PEina_Lock): TEina_Lock_Result;
var
  ok: integer;
begin
  Result := EINA_LOCK_FAIL;

  begin
    // ok := PosixMutexLock(mutex^.mutex_handle); // Placeholder
    ok := 0; // Dummy for compilation
  end;

  if ok = 0 then begin
    Result := EINA_LOCK_SUCCEED;
  end else if ok = EDEADLK then begin
    // eina_lock_debug(mutex);
    Result := EINA_LOCK_DEADLOCK;
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'lock', mutex);
  end;

end;

function eina_lock_release(mutex: PEina_Lock): TEina_Lock_Result;
var
  ok: integer;
begin
  Result := EINA_LOCK_FAIL;

  // ok := PosixMutexUnlock(mutex^.mutex_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_LOCK_SUCCEED;
  end else if ok = EPERM then // EPERM is typically 1
  begin
    Result := EINA_LOCK_FAIL;
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'unlock', mutex);
  end;
end;

function eina_condition_new(cond: PEina_Condition; mutex: PEina_Lock): TEina_Bool;
begin
  Result := _eina_condition_new(cond, mutex);
end;

procedure eina_condition_free(cond: PEina_Condition);
begin
  _eina_condition_free(cond);
end;

function eina_condition_wait(cond: PEina_Condition): TEina_Bool;
var
  ok: integer;
begin
  Result := EINA_FALSE;

  // ok := PosixCondWait(cond^.condition_handle, cond^.lock^.mutex_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_TRUE;
  end else if ok = EPERM then begin
    Result := EINA_FALSE;
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'cond_wait', cond);
  end;

end;

function eina_condition_timedwait(cond: PEina_Condition; t: double): TEina_Bool;
var
  ts_sec, ts_nsec: int64;
  err: integer;
begin
  Result := EINA_FALSE;

  if t >= 0.0 then begin
    ts_sec := ts_sec + Trunc(t);
    ts_nsec := ts_nsec + Trunc((t - Trunc(t)) * 1000000000.0);

    if ts_nsec >= 1000000000 then begin
      ts_sec := ts_sec + 1;
      ts_nsec := ts_nsec - 1000000000;
    end;

    // This call to pthread_cond_timedwait needs to be via a binding.
    // err := PosixCondTimedwait(cond^.condition_handle, cond^.lock^.mutex_handle, ts_sec, ts_nsec); // Placeholder
    err := 0; // Dummy for compilation

    if err = 0 then begin
      Result := EINA_TRUE;
    end else if err = EPERM then // EPERM is typically 1
    begin
      eina_error_set(EPERM);
    end // Assuming eina_error_set exists
    else if err = ETIMEDOUT then // ETIMEDOUT is typically 110
    begin
      eina_error_set(ETIMEDOUT);
    end // Assuming eina_error_set exists
    else begin
      EINA_LOCK_ABORT_DEBUG(err, 'cond_timedwait', cond);
    end;

  end;
  // errno := EINVAL; // Not directly applicable in Pascal this way
end;

function eina_condition_broadcast(cond: PEina_Condition): TEina_Bool;
var
  ok: integer;
begin
  // ok := PosixCondBroadcast(cond^.condition_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_TRUE;
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'cond_broadcast', cond);
  end;
end;

function eina_condition_signal(cond: PEina_Condition): TEina_Bool;
var
  ok: integer;
begin
  // ok := PosixCondSignal(cond^.condition_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_TRUE;
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'cond_signal', cond);
  end;
end;

function eina_rwlock_new(mutex: PEina_RWLock): TEina_Bool;
begin
  Result := _eina_rwlock_new(mutex);
end;

procedure eina_rwlock_free(mutex: PEina_RWLock);
begin
  _eina_rwlock_free(mutex);
end;

function eina_rwlock_take_read(mutex: PEina_RWLock): TEina_Lock_Result;
var
  ok: integer;
begin
  Result := EINA_LOCK_FAIL;
  // ok := PosixRWLockRdlock(mutex^.mutex_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_LOCK_SUCCEED;
  end else if (ok = EAGAIN) or (ok = ENOMEM) then // EAGAIN is typically 11, ENOMEM is typically 12
  begin
    Result := EINA_LOCK_FAIL;
  end else if ok = EDEADLK then begin
    EINA_LOCK_DEADLOCK_DEBUG('rwlock_rdlock', mutex);
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'rwlock_rdlock', mutex);
  end;
end;

function eina_rwlock_take_write(mutex: PEina_RWLock): TEina_Lock_Result;
var
  ok: integer;
begin
  Result := EINA_LOCK_FAIL;
  // ok := PosixRWLockWrlock(mutex^.mutex_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_LOCK_SUCCEED;
  end else if ok = ENOMEM then begin
    Result := EINA_LOCK_FAIL;
  end else if ok = EDEADLK then begin
    EINA_LOCK_DEADLOCK_DEBUG('rwlock_wrlock', mutex);
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'rwlock_wrlock', mutex);
  end;
end;

function eina_rwlock_release(mutex: PEina_RWLock): TEina_Lock_Result;
var
  ok: integer;
begin
  Result := EINA_LOCK_FAIL;
  // ok := PosixRWLockUnlock(mutex^.mutex_handle); // Placeholder
  ok := 0; // Dummy for compilation

  if ok = 0 then begin
    Result := EINA_LOCK_SUCCEED;
  end else if ok = EPERM then begin
    Result := EINA_LOCK_FAIL;
  end else begin
    EINA_LOCK_ABORT_DEBUG(ok, 'rwlock_unlock', mutex);
  end;
end;

function eina_tls_cb_new(key: PEina_TLS; delete_cb: TEina_TLS_Delete_Cb): TEina_Bool;
begin
  // This calls pthread_key_create, which needs a binding.
  // Result := (PosixTLSKeyCreate(key, delete_cb) = 0); // Placeholder
  Result := EINA_TRUE; // Dummy for compilation
end;

function eina_tls_new(key: PEina_TLS): TEina_Bool;
begin
  Result := eina_tls_cb_new(key, nil);
end;

procedure eina_tls_free(key: TEina_TLS);
begin
  // This calls pthread_key_delete, which needs a binding.
  // PosixTLSKeyDelete(key); // Placeholder
end;

function eina_tls_get(key: TEina_TLS): Pointer;
begin
  // This calls pthread_getspecific, which needs a binding.
  // Result := PosixTLSGetSpecific(key); // Placeholder
  Result := nil; // Dummy for compilation
end;

function eina_tls_set(key: TEina_TLS; data: Pointer): TEina_Bool;
begin
  // This calls pthread_setspecific, which needs a binding.
  // Result := (PosixTLSSetSpecific(key, data) = 0); // Placeholder
  Result := EINA_TRUE; // Dummy for compilation
end;


function eina_spinlock_new(spinlock: PEina_Spinlock): TEina_Bool;
begin
  Result := _eina_spinlock_new(spinlock);
end;

procedure eina_spinlock_free(spinlock: PEina_Spinlock);
begin
  _eina_spinlock_free(spinlock);
end;

function eina_spinlock_take_try(spinlock: PEina_Spinlock): TEina_Lock_Result;
begin
  Result := eina_lock_take_try(spinlock);
end;

function eina_spinlock_take(spinlock: PEina_Spinlock): TEina_Lock_Result;
begin
  Result := eina_lock_take(spinlock);
end;

function eina_spinlock_release(spinlock: PEina_Spinlock): TEina_Lock_Result;
begin
  Result := eina_lock_release(spinlock);
end;

function eina_semaphore_new(sem: PEina_Semaphore; count_init: integer): TEina_Bool;
begin
  Result := _eina_semaphore_new(sem, count_init);
end;

function eina_semaphore_free(sem: PEina_Semaphore): TEina_Bool;
begin
  Result := _eina_semaphore_free(sem);
end;

function eina_semaphore_lock(sem: PEina_Semaphore): TEina_Bool;
var
  res: integer;
label
  ErrHandler;
begin
  Result := EINA_FALSE;
  if Assigned(sem) then begin
    repeat
      // res := PosixSemWait(sem^.handle); // Placeholder
      res := 0; // Dummy for compilation
      if res = 0 then begin
        Result := EINA_TRUE;
        Exit;
      end // On POSIX, sem_wait can be interrupted by a signal (EINTR), retry then.
      // errno value in C is accessed via SysUtils.GetLastError in Delphi/Free Pascal.
      else if errno <> EINTR then // EINTR is typically 4
      begin
        goto ErrHandler;
      end; // Use a labeled block for error handling
    until False; // Loop forever until success or non-EINTR error
  end;
  Exit; // Exit normally if sem is nil
  ErrHandler: // Label for error handling
    if errno = EDEADLK then // EDEADLK is typically 35
    begin
      EINA_LOCK_DEADLOCK_DEBUG('sem_wait', sem);
    end;
  Result := EINA_FALSE;
end;

function eina_semaphore_release(sem: PEina_Semaphore; count_release: integer): TEina_Bool;
begin
  Result := EINA_FALSE;
  if Assigned(sem) then begin
    // Result := (PosixSemPost(sem^.handle) = 0); // Placeholder
    Result := EINA_TRUE; // Dummy for compilation
  end;
end;

{$ENDIF read_implementation}
