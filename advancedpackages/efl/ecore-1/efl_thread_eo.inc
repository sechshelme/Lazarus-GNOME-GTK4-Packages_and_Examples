{$IFDEF read_interface}


type
  PEfl_Thread = ^TEfl_Thread;
  TEfl_Thread = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_THREAD_CLASS: PEfl_Class;

function efl_thread_class_get: PEfl_Class; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:19:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_THREAD_CLASS: PEfl_Class;
begin
  EFL_THREAD_CLASS := efl_thread_class_get;
end;
{$endif}


{$ENDIF read_implementation}
