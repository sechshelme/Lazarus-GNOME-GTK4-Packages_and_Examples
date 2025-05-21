unit Ecore_Eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, efl_loop_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function efl_loop_register(obj: PEfl_Loop; klass: PEfl_Class; provider: PEfl_Object): TEina_Bool; cdecl; external libecore;
function efl_loop_unregister(obj: PEfl_Loop; klass: PEfl_Class; provider: PEfl_Object): TEina_Bool; cdecl; external libecore;
procedure efl_exit(exit_code: longint); cdecl; external libecore;
function efl_loop_exit_code_process(value: PEina_Value): longint; cdecl; external libecore;
function efl_loop_future_scheduler_get(obj: PEo): PEina_Future_Scheduler; cdecl; external libecore;
function efl_main_loop_get: PEo; cdecl; external libecore;

// === Konventiert am: 21-5-25 15:43:41 ===


implementation



end.
