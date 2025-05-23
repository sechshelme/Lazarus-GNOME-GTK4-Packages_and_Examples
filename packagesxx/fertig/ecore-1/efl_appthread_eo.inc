{$IFDEF read_interface}


type
  PEfl_Appthread = ^TEfl_Appthread;
  TEfl_Appthread = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_APPTHREAD_CLASS: PEfl_Class;

function efl_appthread_class_get: PEfl_Class; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:18:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_APPTHREAD_CLASS: PEfl_Class;
begin
  EFL_APPTHREAD_CLASS := efl_appthread_class_get;
end;
{$endif}


{$ENDIF read_implementation}
