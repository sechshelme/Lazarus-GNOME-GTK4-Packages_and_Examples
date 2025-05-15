unit eina_promise;

interface

uses
  ctypes, efl, eina_value, eina_error, eina_log, eina_iterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Promise = record
  end;
  PEina_Promise = ^TEina_Promise;

  TEina_Future = record
  end;
  PEina_Future = ^TEina_Future;
  PPEina_Future = ^PEina_Future;

  PEina_Future_Scheduler = ^TEina_Future_Scheduler;

  TEina_Future_Cb = function(data: pointer; value: TEina_Value; dead_future: PEina_Future): TEina_Value; cdecl;

  TEina_Future_Schedule_Entry = record
    scheduler: PEina_Future_Scheduler;
  end;
  PEina_Future_Schedule_Entry = ^TEina_Future_Schedule_Entry;

  TEina_Future_Scheduler_Cb = procedure(f: PEina_Future; value: TEina_Value); cdecl;

  TEina_Future_Scheduler = record
    schedule: function(scheduler: PEina_Future_Scheduler; cb: TEina_Future_Scheduler_Cb; f: PEina_Future; value: TEina_Value): PEina_Future_Schedule_Entry; cdecl;
    recall: procedure(entry: PEina_Future_Schedule_Entry); cdecl;
  end;

  TEina_Promise_Cancel_Cb = procedure(data: pointer; dead_promise: PEina_Promise); cdecl;
  TEina_Future_Success_Cb = function(data: pointer; value: TEina_Value): TEina_Value; cdecl;
  TEina_Future_Error_Cb = function(data: pointer; error: TEina_Error): TEina_Value; cdecl;
  TEina_Future_Free_Cb = procedure(data: pointer; dead_future: PEina_Future); cdecl;

  TEina_Future_Cb_Easy_Desc = record
    success: TEina_Future_Success_Cb;
    error: TEina_Future_Error_Cb;
    free: TEina_Future_Free_Cb;
    success_type: PEina_Value_Type;
    data: pointer;
  end;
  PEina_Future_Cb_Easy_Desc = ^TEina_Future_Cb_Easy_Desc;

  TEina_Future_Cb_Console_Desc = record
    prefix: pchar;
    suffix: pchar;
  end;
  PEina_Future_Cb_Console_Desc = ^TEina_Future_Cb_Console_Desc;

  TEina_Future_Cb_Log_Desc = record
    prefix: pchar;
    suffix: pchar;
    file_: pchar;
    func: pchar;
    level: TEina_Log_Level;
    domain: longint;
    line: longint;
  end;
  PEina_Future_Cb_Log_Desc = ^TEina_Future_Cb_Log_Desc;

  TEina_Future_Desc = record
    cb: TEina_Future_Cb;
    data: pointer;
    storage: ^PEina_Future;
  end;
  PEina_Future_Desc = ^TEina_Future_Desc;

var
  EINA_VALUE_TYPE_PROMISE: TEina_Value_Type; cvar;external libeina;

function eina_promise_new(scheduler: PEina_Future_Scheduler; cancel_cb: TEina_Promise_Cancel_Cb; data: pointer): PEina_Promise; cdecl; external libeina;
function eina_promise_continue_new(dead_future: PEina_Future; cancel_cb: TEina_Promise_Cancel_Cb; data: pointer): PEina_Promise; cdecl; external libeina;
procedure eina_promise_resolve(p: PEina_Promise; value: TEina_Value); cdecl; external libeina;
procedure eina_promise_reject(p: PEina_Promise; err: TEina_Error); cdecl; external libeina;
procedure eina_future_cancel(f: PEina_Future); cdecl; external libeina;
procedure eina_future_desc_flush(desc: PEina_Future_Desc); cdecl; external libeina;
procedure eina_future_cb_easy_desc_flush(desc: PEina_Future_Cb_Easy_Desc); cdecl; external libeina;
function eina_promise_as_value(p: PEina_Promise): TEina_Value; cdecl; external libeina;
function eina_future_as_value(f: PEina_Future): TEina_Value; cdecl; external libeina;
function eina_future_new(p: PEina_Promise): PEina_Future; cdecl; external libeina;
function eina_future_resolved(scheduler: PEina_Future_Scheduler; value: TEina_Value): PEina_Future; cdecl; external libeina;
function eina_future_rejected(scheduler: PEina_Future_Scheduler; err: TEina_Error): PEina_Future; cdecl; external libeina;
function eina_future_then_from_desc(prev: PEina_Future; desc: TEina_Future_Desc): PEina_Future; cdecl; external libeina;
function eina_future_cb_log_from_desc(desc: TEina_Future_Cb_Log_Desc): TEina_Future_Desc; cdecl; external libeina;
function eina_future_chain_array(prev: PEina_Future; descs: PEina_Future_Desc): PEina_Future; cdecl; external libeina;
function eina_future_chain_easy_array(prev: PEina_Future; descs: PEina_Future_Cb_Easy_Desc): PEina_Future; cdecl; external libeina;
function eina_future_cb_console_from_desc(desc: TEina_Future_Cb_Console_Desc): TEina_Future_Desc; cdecl; external libeina;
function eina_future_cb_ignore_error(err: TEina_Error): TEina_Future_Desc; cdecl; external libeina;
function eina_future_cb_convert_to(_type: PEina_Value_Type): TEina_Future_Desc; cdecl; external libeina;
function eina_future_cb_easy_from_desc(desc: TEina_Future_Cb_Easy_Desc): TEina_Future_Desc; cdecl; external libeina;
function eina_promise_all_array(arr: PPEina_Future): PEina_Promise; cdecl; external libeina;
function eina_promise_all_iterator(iterator: PEina_Iterator): PEina_Promise; cdecl; external libeina;
function eina_promise_race_array(arr: PPEina_Future): PEina_Promise; cdecl; external libeina;

type
  TEina_Future_Race_Result = record
    value: TEina_Value;
    index: dword;
  end;
  PEina_Future_Race_Result = ^TEina_Future_Race_Result;

var
  EINA_PROMISE_RACE_STRUCT_DESC: PEina_Value_Struct_Desc; cvar;external libeina;

const
  EINA_FUTURE_SENTINEL = pointer(dword(-(1)));

  // === Konventiert am: 15-5-25 17:13:01 ===


implementation


end.
