unit efl_loop_consumer_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, efl_loop_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Consumer = ^TEfl_Loop_Consumer;
  TEfl_Loop_Consumer = TEo;

function EFL_LOOP_CONSUMER_CLASS: PEfl_Class;

function efl_loop_consumer_class_get: PEfl_Class; cdecl; external libecore;
function efl_loop_get(obj: PEo): PEfl_Loop; cdecl; external libecore;
function efl_loop_future_resolved(obj: PEo; result: TEina_Value): PEina_Future; cdecl; external libecore;
function efl_loop_future_rejected(obj: PEo; error: TEina_Error): PEina_Future; cdecl; external libecore;
function efl_loop_promise_new(obj: PEo): PEina_Promise; cdecl; external libecore;

// === Konventiert am: 21-5-25 15:43:56 ===


implementation


function EFL_LOOP_CONSUMER_CLASS: PEfl_Class;
begin
  EFL_LOOP_CONSUMER_CLASS := efl_loop_consumer_class_get;
end;


end.
