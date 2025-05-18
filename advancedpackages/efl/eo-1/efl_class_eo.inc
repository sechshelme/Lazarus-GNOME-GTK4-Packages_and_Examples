{$IFDEF read_interface}


// doppelt in C-Header
//type
//  PEfl_Class = ^TEfl_Class;
//  TEfl_Class = TEo;

function EFL_CLASS_CLASS: PEfl_Class;

function efl_class_class_get: PEfl_Class; cdecl; external libeo;

// === Konventiert am: 18-5-25 13:19:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CLASS_CLASS: PEfl_Class;
begin
  EFL_CLASS_CLASS := efl_class_class_get;
end;


{$ENDIF read_implementation}
