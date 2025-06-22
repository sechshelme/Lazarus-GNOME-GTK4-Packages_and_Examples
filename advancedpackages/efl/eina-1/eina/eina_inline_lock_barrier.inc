{$IFDEF read_interface}


function eina_barrier_wait(Barrier: PEina_Barrier): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

type
  TPrivEinaBarrier = record
    needed: integer;
    called: integer;
    cond_lock: TEina_Lock;
    cond: TEina_Condition; // ?????????
  end;
  PPrivEinaBarrier = ^TPrivEinaBarrier;

function eina_barrier_wait(Barrier: PEina_Barrier): TEina_Bool;
var
  privBarrier:PPrivEinaBarrier absolute Barrier;
begin
  eina_lock_take(@privBarrier^.cond_lock);
  Inc(privBarrier^.called);
  if privBarrier^.called = privBarrier^.needed then begin
    privBarrier^.called := 0;
    eina_condition_broadcast(@privBarrier^.cond);
  end else begin
    eina_condition_wait(@privBarrier^.cond);
  end;
  eina_lock_release(@privBarrier^.cond_lock);
  Result := EINA_TRUE;
end;

{$ENDIF read_implementation}
