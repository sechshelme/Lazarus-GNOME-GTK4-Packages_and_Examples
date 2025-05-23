{$IFDEF read_interface}


type
  PEcore_Exe = ^TEcore_Exe;
  TEcore_Exe = TEo;

type
  TEcore_Exe_Event_Data_Line = record
    line: pchar;
    size: longint;
  end;
  PEcore_Exe_Event_Data_Line = ^TEcore_Exe_Event_Data_Line;

  TEcore_Exe_Event_Data = record
    exe: PEfl_Object;
    data: pointer;
    size: longint;
    lines: PEcore_Exe_Event_Data_Line;
  end;
  PEcore_Exe_Event_Data = ^TEcore_Exe_Event_Data;

  PEcore_Exe_Flags = ^TEcore_Exe_Flags;
  TEcore_Exe_Flags = longint;

const
  ECORE_EXE_NONE = 0;
  ECORE_EXE_PIPE_READ = 1;
  ECORE_EXE_PIPE_WRITE = 2;
  ECORE_EXE_PIPE_ERROR = 4;
  ECORE_EXE_PIPE_READ_LINE_BUFFERED = 8;
  ECORE_EXE_PIPE_ERROR_LINE_BUFFERED = 16;
  ECORE_EXE_PIPE_AUTO = 32;
  ECORE_EXE_RESPAWN = 64;
  ECORE_EXE_USE_SH = 128;
  ECORE_EXE_NOT_LEADER = 256;
  ECORE_EXE_TERM_WITH_PARENT = 512;
  ECORE_EXE_ISOLATE_IO = 1024;

  // === Konventiert am: 20-5-25 20:16:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
