unit eina_inline_lock_barrier;

interface

uses
  efl,
  fp_eina,
  eina_inline_lock_posix,
  SysUtils, Classes, SyncObjs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEinaBarrier = ^TEinaBarrier;

  TEinaBarrier = record
    needed: integer;
    called: integer;
    cond_lock: TEina_Lock;
    cond: TEina_Condition; // ?????????
  end;

function eina_barrier_wait(barrier: PEinaBarrier): TEina_Bool;

implementation

function eina_barrier_wait(barrier: PEinaBarrier): TEina_Bool;
begin
  eina_lock_take(@barrier^.cond_lock);
  Inc(barrier^.called);
  if barrier^.called = barrier^.needed then begin
    barrier^.called := 0;
    eina_condition_broadcast(@barrier^.cond);
  end else begin
    eina_condition_wait(@barrier^.cond);
  end;
  eina_lock_release(@barrier^.cond_lock);
  Result := EINA_TRUE;
end;

end.
