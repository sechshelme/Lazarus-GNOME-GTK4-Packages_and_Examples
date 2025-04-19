unit tcl;

interface

uses
  tk_tcl_common,
  //  tclDecls,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TCL_ALPHA_RELEASE = 0;
  TCL_BETA_RELEASE = 1;
  TCL_FINAL_RELEASE = 2;

const
  TCL_MAJOR_VERSION = 8;

const
  TCL_MINOR_VERSION = 6;
  TCL_RELEASE_LEVEL = TCL_FINAL_RELEASE;
  TCL_RELEASE_SERIAL = 14;
  TCL_VERSION = '8.6';
  TCL_PATCH_LEVEL = '8.6.14';

type
  PSHORT = ^TSHORT;
  TSHORT = smallint;

  PLONG = ^TLONG;
  TLONG = longint;

type
  PClientData = ^TClientData;
  TClientData = pointer;

type
  PTcl_WideInt = ^TTcl_WideInt;
  TTcl_WideInt = int64;

  PTcl_WideUInt = ^TTcl_WideUInt;
  TTcl_WideUInt = qword;

type
  TTcl_StatBuf = record
    st_dev: dword;
    st_ino: word;
    st_mode: word;
    st_nlink: smallint;
    st_uid: smallint;
    st_gid: smallint;
    st_rdev: dword;
    st_size: int64;
    st_atim: record
      tv_sec: longint;
      end;
    st_mtim: record
      tv_sec: longint;
      end;
    st_ctim: record
      tv_sec: longint;
      end;
  end;
  PTcl_StatBuf = ^TTcl_StatBuf;

  Tstati64 = TTcl_StatBuf;
  Tstat32i64 = TTcl_StatBuf;

  Tstat = TTcl_StatBuf;

type
  TTcl_Interp = record
    Result: pchar;
    freeProc: procedure(blockPtr: pchar); cdecl;
    resultDontUse: pchar;
    freeProcDontUse: procedure(para1: pchar); cdecl;
    errorLine: longint;
    errorLineDontUse: longint;
  end;
  PTcl_Interp = ^TTcl_Interp;
  PPTcl_Interp = ^PTcl_Interp;

  TTcl_AsyncHandler = Pointer;
  PTcl_AsyncHandler = ^TTcl_AsyncHandler;

  TTcl_Channel = Pointer;
  PTcl_Channel = ^TTcl_Channel;

  TTcl_ChannelTypeVersion = Pointer;
  PTcl_ChannelTypeVersion = ^TTcl_ChannelTypeVersion;

  TTcl_Command = Pointer;
  PTcl_Command = ^TTcl_Command;

  TTcl_Condition = Pointer;
  PTcl_Condition = ^TTcl_Condition;

  TTcl_Dict = Pointer;
  PTcl_Dict = ^TTcl_Dict;

  TTcl_EncodingState = Pointer;
  PTcl_EncodingState = ^TTcl_EncodingState;

  TTcl_Encoding = Pointer;
  PTcl_Encoding = ^TTcl_Encoding;

  TTcl_InterpState = Pointer;
  PTcl_InterpState = ^TTcl_InterpState;

  TTcl_LoadHandle = Pointer;
  PTcl_LoadHandle = ^TTcl_LoadHandle;

  TTcl_Mutex = Pointer;
  PTcl_Mutex = ^TTcl_Mutex;

  TTcl_Pid = Pointer;
  PTcl_Pid = ^TTcl_Pid;

  TTcl_RegExp = Pointer;
  PTcl_RegExp = ^TTcl_RegExp;

  TTcl_ThreadDataKey = Pointer;
  PTcl_ThreadDataKey = ^TTcl_ThreadDataKey;

  TTcl_ThreadId = Pointer;
  PTcl_ThreadId = ^TTcl_ThreadId;

  TTcl_TimerToken = Pointer;
  PTcl_TimerToken = ^TTcl_TimerToken;

  TTcl_Trace = Pointer;
  PTcl_Trace = ^TTcl_Trace;

  TTcl_Var = Pointer;
  PTcl_Var = ^TTcl_Var;

  TTcl_ZlibStream = Pointer;
  PTcl_ZlibStream = ^TTcl_ZlibStream;

type
  {$IFDEF WIN32}
  TTcl_ThreadCreateProc = function(clientData: TClientData): dword; cdecl;
  {$else}
  TTcl_ThreadCreateProc = procedure(clientData: TClientData); cdecl;
  {$endif}

const
  TCL_THREAD_STACK_DEFAULT = 0;
  TCL_THREAD_NOFLAGS = 0000;
  TCL_THREAD_JOINABLE = 0001;
  TCL_MATCH_NOCASE = 1 shl 0;
  TCL_REG_BASIC = 000000;
  TCL_REG_EXTENDED = 000001;
  TCL_REG_ADVF = 000002;
  TCL_REG_ADVANCED = 000003;
  TCL_REG_QUOTE = 000004;
  TCL_REG_NOCASE = 000010;
  TCL_REG_NOSUB = 000020;
  TCL_REG_EXPANDED = 000040;
  TCL_REG_NLSTOP = 000100;
  TCL_REG_NLANCH = 000200;
  TCL_REG_NEWLINE = 000300;
  TCL_REG_CANMATCH = 001000;
  TCL_REG_NOTBOL = 0001;
  TCL_REG_NOTEOL = 0002;

type
  TTcl_RegExpIndices = record
    start: longint;
    end_: longint;
  end;
  PTcl_RegExpIndices = ^TTcl_RegExpIndices;

  TTcl_RegExpInfo = record
    nsubs: longint;
    matches: PTcl_RegExpIndices;
    extendStart: longint;
    reserved: longint;
  end;
  PTcl_RegExpInfo = ^TTcl_RegExpInfo;

  TTcl_Stat_ = PTcl_StatBuf;
  PTcl_Stat_ = ^TTcl_Stat_;

  TTcl_OldStat_ = Pstat;
  PTcl_OldStat_ = ^TTcl_OldStat_;

const
  TCL_OK = 0;
  TCL_ERROR = 1;
  TCL_RETURN = 2;
  TCL_BREAK = 3;
  TCL_CONTINUE = 4;
  TCL_RESULT_SIZE = 200;

  TCL_SUBST_COMMANDS = 001;
  TCL_SUBST_VARIABLES = 002;
  TCL_SUBST_BACKSLASHES = 004;
  TCL_SUBST_ALL = 007;

type
  PPTcl_ValueType = ^PTcl_ValueType;
  PTcl_ValueType = ^TTcl_ValueType;
  TTcl_ValueType = longint;

const
  TCL_INT = 0;
  TCL_DOUBLE = 1;
  TCL_EITHER = 2;
  TCL_WIDE_INT = 3;

type
  TTcl_Value = record
    _type: TTcl_ValueType;
    intValue: longint;
    doubleValue: double;
    wideValue: TTcl_WideInt;
  end;
  PTcl_Value = ^TTcl_Value;

  PTcl_Obj = ^TTcl_Obj;
  PPTcl_Obj = ^PTcl_Obj;
  PPPTcl_Obj = ^PPTcl_Obj;

  PTcl_Event = ^TTcl_Event;

  TTcl_AppInitProc = function(interp: PTcl_Interp): longint; cdecl;
  TTcl_AsyncProc = function(clientData: TClientData; interp: PTcl_Interp; code: longint): longint; cdecl;
  TTcl_ChannelProc = procedure(clientData: TClientData; mask: longint); cdecl;
  TTcl_CloseProc = procedure(Data: TClientData); cdecl;
  TTcl_CmdDeleteProc = procedure(clientData: TClientData); cdecl;
  TTcl_CmdProc = function(clientData: TClientData; interp: PTcl_Interp; argc: longint; argv: PPchar): longint; cdecl;
  TTcl_CmdTraceProc = procedure(clientData: TClientData; interp: PTcl_Interp; level: longint; command: pchar; proc: TTcl_CmdProc;
    cmdClientData: TClientData; argc: longint; argv: PPchar); cdecl;
  TTcl_CmdObjTraceProc = function(clientData: TClientData; interp: PTcl_Interp; level: longint; command: pchar; commandInfo: TTcl_Command;
    objc: longint; objv: PPTcl_Obj): longint; cdecl;
  TTcl_CmdObjTraceDeleteProc = procedure(clientData: TClientData); cdecl;
  TTcl_DupInternalRepProc = procedure(srcPtr: PTcl_Obj; dupPtr: PTcl_Obj); cdecl;
  TTcl_EncodingConvertProc = function(clientData: TClientData; src: pchar; srcLen: longint; flags: longint; statePtr: PTcl_EncodingState;
    dst: pchar; dstLen: longint; srcReadPtr: Plongint; dstWrotePtr: Plongint; dstCharsPtr: Plongint): longint; cdecl;
  TTcl_EncodingFreeProc = procedure(clientData: TClientData); cdecl;
  TTcl_EventProc = function(evPtr: PTcl_Event; flags: longint): longint; cdecl;
  TTcl_EventCheckProc = procedure(clientData: TClientData; flags: longint); cdecl;
  TTcl_EventDeleteProc = function(evPtr: PTcl_Event; clientData: TClientData): longint; cdecl;
  TTcl_EventSetupProc = procedure(clientData: TClientData; flags: longint); cdecl;
  TTcl_ExitProc = procedure(clientData: TClientData); cdecl;
  TTcl_FileProc = procedure(clientData: TClientData; mask: longint); cdecl;
  TTcl_FileFreeProc = procedure(clientData: TClientData); cdecl;
  TTcl_FreeInternalRepProc = procedure(objPtr: PTcl_Obj); cdecl;
  TTcl_FreeProc = procedure(blockPtr: pchar); cdecl;
  PTcl_FreeProc = ^TTcl_FreeProc;
  TTcl_IdleProc = procedure(clientData: TClientData); cdecl;
  TTcl_InterpDeleteProc = procedure(clientData: TClientData; interp: PTcl_Interp); cdecl;
  PTcl_InterpDeleteProc = ^TTcl_InterpDeleteProc;
  TTcl_MathProc = function(clientData: TClientData; interp: PTcl_Interp; args: PTcl_Value; resultPtr: PTcl_Value): longint; cdecl;
  PTcl_MathProc = ^TTcl_MathProc;
  TTcl_NamespaceDeleteProc = procedure(clientData: TClientData); cdecl;
  TTcl_ObjCmdProc = function(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj): longint; cdecl;
  TTcl_PackageInitProc = function(interp: PTcl_Interp): longint; cdecl;
  PTcl_PackageInitProc = ^TTcl_PackageInitProc;
  TTcl_PackageUnloadProc = function(interp: PTcl_Interp; flags: longint): longint; cdecl;
  TTcl_PanicProc = procedure(format: pchar; args: array of const); cdecl;
  TTcl_TcpAcceptProc = procedure(callbackData: TClientData; chan: TTcl_Channel; address: pchar; port: longint); cdecl;
  TTcl_TimerProc = procedure(clientData: TClientData); cdecl;
  TTcl_SetFromAnyProc = function(interp: PTcl_Interp; objPtr: PTcl_Obj): longint; cdecl;
  TTcl_UpdateStringProc = procedure(objPtr: PTcl_Obj); cdecl;
  TTcl_VarTraceProc = function(clientData: TClientData; interp: PTcl_Interp; part1: pchar; part2: pchar; flags: longint): pchar; cdecl;
  TTcl_CommandTraceProc = procedure(clientData: TClientData; interp: PTcl_Interp; oldName: pchar; newName: pchar; flags: longint); cdecl;
  TTcl_CreateFileHandlerProc = procedure(fd: longint; mask: longint; proc: TTcl_FileProc; clientData: TClientData); cdecl;
  TTcl_DeleteFileHandlerProc = procedure(fd: longint); cdecl;
  TTcl_AlertNotifierProc = procedure(clientData: TClientData); cdecl;
  TTcl_ServiceModeHookProc = procedure(mode: longint); cdecl;
  TTcl_FinalizeNotifierProc = procedure(clientData: TClientData); cdecl;
  TTcl_InitNotifierProc = function(): TClientData;
  TTcl_MainLoopProc = procedure(para1: pointer); cdecl;

  TTcl_Event = record
    proc: TTcl_EventProc;
    nextPtr: PTcl_Event;
  end;

  TTcl_ObjType = record
    Name: pchar;
    freeIntRepProc: TTcl_FreeInternalRepProc;
    dupIntRepProc: TTcl_DupInternalRepProc;
    updateStringProc: TTcl_UpdateStringProc;
    setFromAnyProc: TTcl_SetFromAnyProc;
  end;
  PTcl_ObjType = ^TTcl_ObjType;

  TTcl_Obj = record
    refCount: longint;
    bytes: pchar;
    length: longint;
    typePtr: PTcl_ObjType;
    internalRep: record
      case longint of
        0: (longValue: clong);
        1: (doubleValue: double);
        2: (otherValuePtr: pointer);
        3: (wideValue: TTcl_WideInt);
        4: (twoPtrValue: record
            ptr1: pointer;
            ptr2: pointer;
            end);
        5: (ptrAndLongRep: record
            ptr: pointer;
            Value: culong;
            end);
      end;
  end;

procedure Tcl_IncrRefCount(objPtr: PTcl_Obj); cdecl; external libtcl8_6;
procedure Tcl_DecrRefCount(objPtr: PTcl_Obj); cdecl; external libtcl8_6;
function Tcl_IsShared(objPtr: PTcl_Obj): longint; cdecl; external libtcl8_6;

type
  TTcl_SavedResult = record
    Result: pchar;
    freeProc: TTcl_FreeProc;
    objResultPtr: PTcl_Obj;
    appendResult: pchar;
    appendAvl: longint;
    appendUsed: longint;
    resultSpace: array[0..(TCL_RESULT_SIZE + 1) - 1] of char;
  end;
  PTcl_SavedResult = ^TTcl_SavedResult;

  PTcl_Namespace = ^TTcl_Namespace;
  PPTcl_Namespace = ^PTcl_Namespace;

  TTcl_Namespace = record
    Name: pchar;
    fullName: pchar;
    clientData: TClientData;
    deleteProc: TTcl_NamespaceDeleteProc;
    parentPtr: PTcl_Namespace;
  end;

  TTcl_CallFrame = record
    nsPtr: PTcl_Namespace;
    dummy1: longint;
    dummy2: longint;
    dummy3: pointer;
    dummy4: pointer;
    dummy5: pointer;
    dummy6: longint;
    dummy7: pointer;
    dummy8: pointer;
    dummy9: longint;
    dummy10: pointer;
    dummy11: pointer;
    dummy12: pointer;
    dummy13: pointer;
  end;
  PTcl_CallFrame = ^TTcl_CallFrame;

  TTcl_CmdInfo = record
    isNativeObjectProc: longint;
    objProc: TTcl_ObjCmdProc;
    objClientData: TClientData;
    proc: TTcl_CmdProc;
    clientData: TClientData;
    deleteProc: TTcl_CmdDeleteProc;
    deleteData: TClientData;
    namespacePtr: PTcl_Namespace;
  end;
  PTcl_CmdInfo = ^TTcl_CmdInfo;

const
  TCL_DSTRING_STATIC_SIZE = 200;

type
  TTcl_DString = record
    _string: pchar;
    length: longint;
    spaceAvl: longint;
    staticSpace: array[0..(TCL_DSTRING_STATIC_SIZE) - 1] of char;
  end;
  PTcl_DString = ^TTcl_DString;

const
  TCL_MAX_PREC = 17;
  TCL_DOUBLE_SPACE = TCL_MAX_PREC + 10;
  TCL_INTEGER_SPACE = 24;
  TCL_DONT_USE_BRACES = 1;
  TCL_DONT_QUOTE_HASH = 8;
  TCL_EXACT = 1;
  TCL_NO_EVAL = $010000;
  TCL_EVAL_GLOBAL = $020000;
  TCL_EVAL_DIRECT = $040000;
  TCL_EVAL_INVOKE = $080000;
  TCL_CANCEL_UNWIND = $100000;
  TCL_EVAL_NOERR = $200000;

const
  TCL_GLOBAL_ONLY = 1;
  TCL_NAMESPACE_ONLY = 2;
  TCL_APPEND_VALUE = 4;
  TCL_LIST_ELEMENT = 8;
  TCL_TRACE_READS = $10;
  TCL_TRACE_WRITES = $20;
  TCL_TRACE_UNSETS = $40;
  TCL_TRACE_DESTROYED = $80;
  TCL_INTERP_DESTROYED = $100;
  TCL_LEAVE_ERR_MSG = $200;
  TCL_TRACE_ARRAY = $800;

const
  TCL_TRACE_OLD_STYLE = $1000;

const
  TCL_TRACE_RESULT_DYNAMIC = $8000;
  TCL_TRACE_RESULT_OBJECT = $10000;
  TCL_ENSEMBLE_PREFIX = $02;
  TCL_TRACE_RENAME = $2000;
  TCL_TRACE_DELETE = $4000;
  TCL_ALLOW_INLINE_COMPILATION = $20000;

const
  TCL_PARSE_PART1 = $400;

const
  TCL_LINK_INT = 1;
  TCL_LINK_DOUBLE = 2;
  TCL_LINK_BOOLEAN = 3;
  TCL_LINK_STRING = 4;
  TCL_LINK_WIDE_INT = 5;
  TCL_LINK_CHAR = 6;
  TCL_LINK_UCHAR = 7;
  TCL_LINK_SHORT = 8;
  TCL_LINK_USHORT = 9;
  TCL_LINK_UINT = 10;
  TCL_LINK_LONG = 11;
  TCL_LINK_ULONG = 12;
  TCL_LINK_FLOAT = 13;
  TCL_LINK_WIDE_UINT = 14;
  TCL_LINK_READ_ONLY = $80;

const
  TCL_SMALL_HASH_TABLE = 4;

const
  TCL_HASH_KEY_STORE_HASH = 1;

const
  TCL_HASH_KEY_RANDOMIZE_HASH = $1;
  TCL_HASH_KEY_SYSTEM_HASH = $2;
  TCL_HASH_KEY_TYPE_VERSION = 1;

type
  PTcl_HashTable = ^TTcl_HashTable;
  PTcl_HashKeyType = ^TTcl_HashKeyType;

  PPTcl_HashEntry = ^PTcl_HashEntry;
  PTcl_HashEntry = ^TTcl_HashEntry;

  TTcl_HashEntry = record
    nextPtr: PTcl_HashEntry;
    tablePtr: PTcl_HashTable;
    //      hash : pointer;
    bucketPtr: PPTcl_HashEntry;
    clientData: TClientData;
    key: record
      case longint of
        0: (oneWordValue: pchar);
        1: (objPtr: PTcl_Obj);
        2: (words: array[0..0] of longint);
        3: (_string: array[0..0] of char);
      end;
  end;

  TTcl_HashTable = record
    buckets: ^PTcl_HashEntry;
    staticBuckets: array[0..(TCL_SMALL_HASH_TABLE) - 1] of PTcl_HashEntry;
    numBuckets: longint;
    numEntries: longint;
    rebuildSize: longint;
    downShift: longint;
    mask: longint;
    keyType: longint;
    findProc: function(tablePtr: PTcl_HashTable; key: pchar): PTcl_HashEntry; cdecl;
    createProc: function(tablePtr: PTcl_HashTable; key: pchar; newPtr: Plongint): PTcl_HashEntry; cdecl;
    typePtr: PTcl_HashKeyType;
  end;

  TTcl_HashKeyProc = function(tablePtr: PTcl_HashTable; keyPtr: pointer): dword; cdecl;
  TTcl_CompareHashKeysProc = function(keyPtr: pointer; hPtr: PTcl_HashEntry): longint; cdecl;
  TTcl_AllocHashEntryProc = function(tablePtr: PTcl_HashTable; keyPtr: pointer): PTcl_HashEntry; cdecl;
  TTcl_FreeHashEntryProc = procedure(hPtr: PTcl_HashEntry); cdecl;

  TTcl_HashKeyType = record
    version: longint;
    flags: longint;
    hashKeyProc: TTcl_HashKeyProc;
    compareKeysProc: TTcl_CompareHashKeysProc;
    allocEntryProc: TTcl_AllocHashEntryProc;
    freeEntryProc: TTcl_FreeHashEntryProc;
  end;

  TTcl_HashSearch = record
    tablePtr: PTcl_HashTable;
    nextIndex: longint;
    nextEntryPtr: PTcl_HashEntry;
  end;
  PTcl_HashSearch = ^TTcl_HashSearch;

const
  TCL_STRING_KEYS = 0;
  TCL_ONE_WORD_KEYS = 1;
  TCL_CUSTOM_TYPE_KEYS = -(2);
  TCL_CUSTOM_PTR_KEYS = -(1);

type
  TTcl_DictSearch = record
    Next: pointer;
    epoch: longint;
    dictionaryPtr: TTcl_Dict;
  end;
  PTcl_DictSearch = ^TTcl_DictSearch;

const
  TCL_DONT_WAIT = 1 shl 1;
  TCL_WINDOW_EVENTS = 1 shl 2;
  TCL_FILE_EVENTS = 1 shl 3;
  TCL_TIMER_EVENTS = 1 shl 4;
  TCL_IDLE_EVENTS = 1 shl 5;
  TCL_ALL_EVENTS = not (TCL_DONT_WAIT);

type
  PTcl_QueuePosition = ^TTcl_QueuePosition;
  TTcl_QueuePosition = longint;

const
  TCL_QUEUE_TAIL = 0;
  TCL_QUEUE_HEAD = 1;
  TCL_QUEUE_MARK = 2;

const
  TCL_SERVICE_NONE = 0;
  TCL_SERVICE_ALL = 1;

type
  PTcl_Time = ^TTcl_Time;

  TTcl_Time = record
    sec: clong;
    usec: clong;
  end;

  TTcl_SetTimerProc = procedure(timePtr: PTcl_Time); cdecl;
  TTcl_WaitForEventProc = function(timePtr: PTcl_Time): longint; cdecl;
  TTcl_GetTimeProc = procedure(timebuf: PTcl_Time; clientData: TClientData); cdecl;
  PTcl_GetTimeProc = ^TTcl_GetTimeProc;
  TTcl_ScaleTimeProc = procedure(timebuf: PTcl_Time; clientData: TClientData); cdecl;
  PTcl_ScaleTimeProc = ^TTcl_ScaleTimeProc;

const
  TCL_READABLE = 1 shl 1;
  TCL_WRITABLE = 1 shl 2;
  TCL_EXCEPTION = 1 shl 3;
  TCL_STDIN = 1 shl 1;
  TCL_STDOUT = 1 shl 2;
  TCL_STDERR = 1 shl 3;
  TCL_ENFORCE_MODE = 1 shl 4;
  TCL_CLOSE_READ = 1 shl 1;
  TCL_CLOSE_WRITE = 1 shl 2;

const
  TCL_CHANNEL_THREAD_INSERT = 0;
  TCL_CHANNEL_THREAD_REMOVE = 1;

type
  TTcl_DriverBlockModeProc = function(instanceData: TClientData; mode: longint): longint; cdecl;
  TTcl_DriverCloseProc = function(instanceData: TClientData; interp: PTcl_Interp): longint; cdecl;
  PTcl_DriverCloseProc = ^TTcl_DriverCloseProc;
  TTcl_DriverClose2Proc = function(instanceData: TClientData; interp: PTcl_Interp; flags: longint): longint; cdecl;
  TTcl_DriverInputProc = function(instanceData: TClientData; buf: pchar; toRead: longint; errorCodePtr: Plongint): longint; cdecl;
  TTcl_DriverOutputProc = function(instanceData: TClientData; buf: pchar; toWrite: longint; errorCodePtr: Plongint): longint; cdecl;
  TTcl_DriverSeekProc = function(instanceData: TClientData; offset: longint; mode: longint; errorCodePtr: Plongint): longint; cdecl;
  TTcl_DriverSetOptionProc = function(instanceData: TClientData; interp: PTcl_Interp; optionName: pchar; Value: pchar): longint; cdecl;
  TTcl_DriverGetOptionProc = function(instanceData: TClientData; interp: PTcl_Interp; optionName: pchar; dsPtr: PTcl_DString): longint; cdecl;
  TTcl_DriverWatchProc = procedure(instanceData: TClientData; mask: longint); cdecl;
  TTcl_DriverGetHandleProc = function(instanceData: TClientData; direction: longint; handlePtr: PClientData): longint; cdecl;
  TTcl_DriverFlushProc = function(instanceData: TClientData): longint; cdecl;
  TTcl_DriverHandlerProc = function(instanceData: TClientData; interestMask: longint): longint; cdecl;
  TTcl_DriverWideSeekProc = function(instanceData: TClientData; offset: TTcl_WideInt; mode: longint; errorCodePtr: Plongint): TTcl_WideInt; cdecl;
  TTcl_DriverThreadActionProc = procedure(instanceData: TClientData; action: longint); cdecl;
  TTcl_DriverTruncateProc = function(instanceData: TClientData; length: TTcl_WideInt): longint; cdecl;

  TTcl_ChannelType = record
    typeName: pchar;
    version: TTcl_ChannelTypeVersion;
    closeProc: TTcl_DriverCloseProc;
    inputProc: TTcl_DriverInputProc;
    outputProc: TTcl_DriverOutputProc;
    seekProc: TTcl_DriverSeekProc;
    setOptionProc: TTcl_DriverSetOptionProc;
    getOptionProc: TTcl_DriverGetOptionProc;
    watchProc: TTcl_DriverWatchProc;
    getHandleProc: TTcl_DriverGetHandleProc;
    close2Proc: TTcl_DriverClose2Proc;
    blockModeProc: TTcl_DriverBlockModeProc;
    flushProc: TTcl_DriverFlushProc;
    handlerProc: TTcl_DriverHandlerProc;
    wideSeekProc: TTcl_DriverWideSeekProc;
    threadActionProc: TTcl_DriverThreadActionProc;
    truncateProc: TTcl_DriverTruncateProc;
  end;
  PTcl_ChannelType = ^TTcl_ChannelType;

const
  TCL_MODE_BLOCKING = 0;
  TCL_MODE_NONBLOCKING = 1;

type
  PTcl_PathType = ^TTcl_PathType;
  TTcl_PathType = longint;

const
  TCL_PATH_ABSOLUTE = 0;
  TCL_PATH_RELATIVE = 1;
  TCL_PATH_VOLUME_RELATIVE = 2;

type
  TTcl_GlobTypeData = record
    _type: longint;
    perm: longint;
    macType: PTcl_Obj;
    macCreator: PTcl_Obj;
  end;
  PTcl_GlobTypeData = ^TTcl_GlobTypeData;

const
  TCL_GLOB_TYPE_BLOCK = 1 shl 0;
  TCL_GLOB_TYPE_CHAR = 1 shl 1;
  TCL_GLOB_TYPE_DIR = 1 shl 2;
  TCL_GLOB_TYPE_PIPE = 1 shl 3;
  TCL_GLOB_TYPE_FILE = 1 shl 4;
  TCL_GLOB_TYPE_LINK = 1 shl 5;
  TCL_GLOB_TYPE_SOCK = 1 shl 6;
  TCL_GLOB_TYPE_MOUNT = 1 shl 7;
  TCL_GLOB_PERM_RONLY = 1 shl 0;
  TCL_GLOB_PERM_HIDDEN = 1 shl 1;
  TCL_GLOB_PERM_R = 1 shl 2;
  TCL_GLOB_PERM_W = 1 shl 3;
  TCL_GLOB_PERM_X = 1 shl 4;
  TCL_UNLOAD_DETACH_FROM_INTERPRETER = 1 shl 0;
  TCL_UNLOAD_DETACH_FROM_PROCESS = 1 shl 1;

type
  TTcl_FSStatProc = function(pathPtr: PTcl_Obj; buf: PTcl_StatBuf): longint; cdecl;
  TTcl_FSAccessProc = function(pathPtr: PTcl_Obj; mode: longint): longint; cdecl;
  TTcl_FSOpenFileChannelProc = function(interp: PTcl_Interp; pathPtr: PTcl_Obj; mode: longint; permissions: longint): TTcl_Channel; cdecl;
  TTcl_FSMatchInDirectoryProc = function(interp: PTcl_Interp; Result: PTcl_Obj; pathPtr: PTcl_Obj; pattern: pchar; types: PTcl_GlobTypeData): longint; cdecl;
  TTcl_FSGetCwdProc = function(interp: PTcl_Interp): PTcl_Obj; cdecl;
  TTcl_FSChdirProc = function(pathPtr: PTcl_Obj): longint; cdecl;
  TTcl_FSLstatProc = function(pathPtr: PTcl_Obj; buf: PTcl_StatBuf): longint; cdecl;
  TTcl_FSCreateDirectoryProc = function(pathPtr: PTcl_Obj): longint; cdecl;
  TTcl_FSDeleteFileProc = function(pathPtr: PTcl_Obj): longint; cdecl;
  TTcl_FSCopyDirectoryProc = function(srcPathPtr: PTcl_Obj; destPathPtr: PTcl_Obj; errorPtr: PPTcl_Obj): longint; cdecl;
  TTcl_FSCopyFileProc = function(srcPathPtr: PTcl_Obj; destPathPtr: PTcl_Obj): longint; cdecl;
  TTcl_FSRemoveDirectoryProc = function(pathPtr: PTcl_Obj; recursive: longint; errorPtr: PPTcl_Obj): longint; cdecl;
  TTcl_FSRenameFileProc = function(srcPathPtr: PTcl_Obj; destPathPtr: PTcl_Obj): longint; cdecl;
  TTcl_FSUnloadFileProc = procedure(loadHandle: TTcl_LoadHandle); cdecl;
  PTcl_FSUnloadFileProc = ^TTcl_FSUnloadFileProc;

  Putimbuf = ^Tutimbuf;
  Tutimbuf = record
  end;

  TTcl_FSListVolumesProc = function: PTcl_Obj; cdecl;
  TTcl_FSUtimeProc = function(pathPtr: PTcl_Obj; tval: Putimbuf): longint; cdecl;
  TTcl_FSNormalizePathProc = function(interp: PTcl_Interp; pathPtr: PTcl_Obj; nextCheckpoint: longint): longint; cdecl;
  TTcl_FSFileAttrsGetProc = function(interp: PTcl_Interp; index: longint; pathPtr: PTcl_Obj; objPtrRef: PPTcl_Obj): longint; cdecl;
  TTcl_FSFileAttrStringsProc = function(pathPtr: PTcl_Obj; objPtrRef: PPTcl_Obj): PPchar; cdecl;
  TTcl_FSFileAttrsSetProc = function(interp: PTcl_Interp; index: longint; pathPtr: PTcl_Obj; objPtr: PTcl_Obj): longint; cdecl;
  TTcl_FSLinkProc = function(pathPtr: PTcl_Obj; toPtr: PTcl_Obj; linkType: longint): PTcl_Obj; cdecl;
  TTcl_FSLoadFileProc = function(interp: PTcl_Interp; pathPtr: PTcl_Obj; handlePtr: PTcl_LoadHandle; unloadProcPtr: PTcl_FSUnloadFileProc): longint; cdecl;
  TTcl_FSPathInFilesystemProc = function(pathPtr: PTcl_Obj; clientDataPtr: PClientData): longint; cdecl;
  TTcl_FSFilesystemPathTypeProc = function(pathPtr: PTcl_Obj): PTcl_Obj; cdecl;
  TTcl_FSFilesystemSeparatorProc = function(pathPtr: PTcl_Obj): PTcl_Obj; cdecl;
  TTcl_FSFreeInternalRepProc = procedure(clientData: TClientData); cdecl;
  TTcl_FSDupInternalRepProc = function(clientData: TClientData): TClientData; cdecl;
  TTcl_FSInternalToNormalizedProc = function(clientData: TClientData): PTcl_Obj; cdecl;
  TTcl_FSCreateInternalRepProc = function(pathPtr: PTcl_Obj): TClientData; cdecl;

  TTcl_FSVersion = Pointer;
  PTcl_FSVersion = ^TTcl_FSVersion;

  TTcl_Filesystem = record
    typeName: pchar;
    structureLength: longint;
    version: TTcl_FSVersion;
    pathInFilesystemProc: TTcl_FSPathInFilesystemProc;
    dupInternalRepProc: TTcl_FSDupInternalRepProc;
    freeInternalRepProc: TTcl_FSFreeInternalRepProc;
    internalToNormalizedProc: TTcl_FSInternalToNormalizedProc;
    createInternalRepProc: TTcl_FSCreateInternalRepProc;
    normalizePathProc: TTcl_FSNormalizePathProc;
    filesystemPathTypeProc: TTcl_FSFilesystemPathTypeProc;
    filesystemSeparatorProc: TTcl_FSFilesystemSeparatorProc;
    statProc: TTcl_FSStatProc;
    accessProc: TTcl_FSAccessProc;
    openFileChannelProc: TTcl_FSOpenFileChannelProc;
    matchInDirectoryProc: TTcl_FSMatchInDirectoryProc;
    utimeProc: TTcl_FSUtimeProc;
    linkProc: TTcl_FSLinkProc;
    listVolumesProc: TTcl_FSListVolumesProc;
    fileAttrStringsProc: TTcl_FSFileAttrStringsProc;
    fileAttrsGetProc: TTcl_FSFileAttrsGetProc;
    fileAttrsSetProc: TTcl_FSFileAttrsSetProc;
    createDirectoryProc: TTcl_FSCreateDirectoryProc;
    removeDirectoryProc: TTcl_FSRemoveDirectoryProc;
    deleteFileProc: TTcl_FSDeleteFileProc;
    copyFileProc: TTcl_FSCopyFileProc;
    renameFileProc: TTcl_FSRenameFileProc;
    copyDirectoryProc: TTcl_FSCopyDirectoryProc;
    lstatProc: TTcl_FSLstatProc;
    loadFileProc: TTcl_FSLoadFileProc;
    getCwdProc: TTcl_FSGetCwdProc;
    chdirProc: TTcl_FSChdirProc;
  end;
  PTcl_Filesystem = ^TTcl_Filesystem;

const
  TCL_CREATE_SYMBOLIC_LINK = $01;
  TCL_CREATE_HARD_LINK = $02;

type
  TTcl_NotifierProcs = record
    setTimerProc: TTcl_SetTimerProc;
    waitForEventProc: TTcl_WaitForEventProc;
    createFileHandlerProc: TTcl_CreateFileHandlerProc;
    deleteFileHandlerProc: TTcl_DeleteFileHandlerProc;
    initNotifierProc: TTcl_InitNotifierProc;
    finalizeNotifierProc: TTcl_FinalizeNotifierProc;
    alertNotifierProc: TTcl_AlertNotifierProc;
    serviceModeHookProc: TTcl_ServiceModeHookProc;
  end;
  PTcl_NotifierProcs = ^TTcl_NotifierProcs;

  TTcl_Token = record
    _type: longint;
    start: pchar;
    size: longint;
    numComponents: longint;
  end;
  PTcl_Token = ^TTcl_Token;

const
  TCL_TOKEN_WORD = 1;
  TCL_TOKEN_SIMPLE_WORD = 2;
  TCL_TOKEN_TEXT = 4;
  TCL_TOKEN_BS = 8;
  TCL_TOKEN_COMMAND = 16;
  TCL_TOKEN_VARIABLE = 32;
  TCL_TOKEN_SUB_EXPR = 64;
  TCL_TOKEN_OPERATOR = 128;
  TCL_TOKEN_EXPAND_WORD = 256;

  TCL_PARSE_SUCCESS = 0;
  TCL_PARSE_QUOTE_EXTRA = 1;
  TCL_PARSE_BRACE_EXTRA = 2;
  TCL_PARSE_MISSING_BRACE = 3;
  TCL_PARSE_MISSING_BRACKET = 4;
  TCL_PARSE_MISSING_PAREN = 5;
  TCL_PARSE_MISSING_QUOTE = 6;
  TCL_PARSE_MISSING_VAR_BRACE = 7;
  TCL_PARSE_SYNTAX = 8;
  TCL_PARSE_BAD_NUMBER = 9;

  NUM_STATIC_TOKENS = 20;

type
  TTcl_Parse = record
    commentStart: pchar;
    commentSize: longint;
    commandStart: pchar;
    commandSize: longint;
    numWords: longint;
    tokenPtr: PTcl_Token;
    numTokens: longint;
    tokensAvailable: longint;
    errorType: longint;
    _string: pchar;
    end_: pchar;
    interp: PTcl_Interp;
    term: pchar;
    incomplete: longint;
    staticTokens: array[0..(NUM_STATIC_TOKENS) - 1] of TTcl_Token;
  end;
  PTcl_Parse = ^TTcl_Parse;

  TTcl_EncodingType = record
    encodingName: pchar;
    toUtfProc: TTcl_EncodingConvertProc;
    fromUtfProc: TTcl_EncodingConvertProc;
    freeProc: TTcl_EncodingFreeProc;
    clientData: TClientData;
    nullSize: longint;
  end;
  PTcl_EncodingType = ^TTcl_EncodingType;

const
  TCL_ENCODING_START = $01;
  TCL_ENCODING_END = $02;
  TCL_ENCODING_STOPONERROR = $04;
  TCL_ENCODING_NO_TERMINATE = $08;
  TCL_ENCODING_CHAR_LIMIT = $10;

  TCL_CONVERT_MULTIBYTE = -(1);
  TCL_CONVERT_SYNTAX = -(2);
  TCL_CONVERT_UNKNOWN = -(3);
  TCL_CONVERT_NOSPACE = -(4);

const
  TCL_UTF_MAX = 3;

type
  PTcl_UniChar = ^TTcl_UniChar;
  TTcl_UniChar = dword;
  //type
  //  PTcl_UniChar = ^TTcl_UniChar;
  //  TTcl_UniChar = word;
type
  TTcl_Config = record
    key: pchar;
    Value: pchar;
  end;
  PTcl_Config = ^TTcl_Config;

const
  TCL_LIMIT_COMMANDS = $01;
  TCL_LIMIT_TIME = $02;

type
  TTcl_LimitHandlerProc = procedure(clientData: TClientData; interp: PTcl_Interp); cdecl;
  TTcl_LimitHandlerDeleteProc = procedure(clientData: TClientData); cdecl;

type
  Tmp_int = record
  end;
  Pmp_int = ^Tmp_int;

  Pmp_digit = ^Tmp_digit;
  Tmp_digit = dword;

  TTcl_ArgvInfo = record
    _type: longint;
    keyStr: pchar;
    srcPtr: pointer;
    dstPtr: pointer;
    helpStr: pchar;
    clientData: TClientData;
  end;
  PTcl_ArgvInfo = ^TTcl_ArgvInfo;

const
  TCL_ARGV_CONSTANT = 15;
  TCL_ARGV_INT = 16;
  TCL_ARGV_STRING = 17;
  TCL_ARGV_REST = 18;
  TCL_ARGV_FLOAT = 19;
  TCL_ARGV_FUNC = 20;
  TCL_ARGV_GENFUNC = 21;
  TCL_ARGV_HELP = 22;
  TCL_ARGV_END = 23;

type
  TTcl_ArgvFuncProc = function(clientData: TClientData; objPtr: PTcl_Obj; dstPtr: pointer): longint; cdecl;
  TTcl_ArgvGenFuncProc = function(clientData: TClientData; interp: PTcl_Interp; objc: longint; objv: PPTcl_Obj; dstPtr: pointer): longint; cdecl;

const
  TCL_ZLIB_FORMAT_RAW = 1;
  TCL_ZLIB_FORMAT_ZLIB = 2;
  TCL_ZLIB_FORMAT_GZIP = 4;
  TCL_ZLIB_FORMAT_AUTO = 8;

  TCL_ZLIB_STREAM_DEFLATE = 16;
  TCL_ZLIB_STREAM_INFLATE = 32;

  TCL_ZLIB_COMPRESS_NONE = 0;
  TCL_ZLIB_COMPRESS_FAST = 1;
  TCL_ZLIB_COMPRESS_BEST = 9;
  TCL_ZLIB_COMPRESS_DEFAULT = -(1);

  TCL_ZLIB_NO_FLUSH = 0;
  TCL_ZLIB_FLUSH = 2;
  TCL_ZLIB_FULLFLUSH = 3;
  TCL_ZLIB_FINALIZE = 4;

  TCL_LOAD_GLOBAL = 1;
  TCL_LOAD_LAZY = 2;

type
  TTcl_NRPostProc = function(Data: PClientData; interp: PTcl_Interp; Result: integer): integer;

function Tcl_InitStubs(interp: PTcl_Interp; version: pchar; exact: longint): pchar; cdecl; external libtcl8_6;
function TclTomMathInitializeStubs(interp: PTcl_Interp; version: pchar; epoch: longint; revision: longint): pchar; cdecl; external libtcl8_6;
procedure Tcl_MainEx(argc: longint; argv: PPchar; appInitProc: TTcl_AppInitProc; interp: PTcl_Interp); cdecl; external libtcl8_6;
function Tcl_PkgInitStubsCheck(interp: PTcl_Interp; version: pchar; exact: longint): pchar; cdecl; external libtcl8_6;
procedure Tcl_GetMemoryInfo(dsPtr: PTcl_DString); cdecl; external libtcl8_6;

var
  Tcl_AppInit: TTcl_AppInitProc; cvar;external libtcl8_6;

const
  TCL_CHANNEL_VERSION_1 = $1;
  TCL_CHANNEL_VERSION_2 = $2;
  TCL_CHANNEL_VERSION_3 = $3;
  TCL_CHANNEL_VERSION_5 = $5;
  TCL_FILESYSTEM_VERSION_1 = $1;

function Tcl_DStringLength(dsPtr: PTcl_DString): longint;
function Tcl_DStringValue(dsPtr: PTcl_DString): pchar;

function TCL_VOLATILE: PTcl_FreeProc;
function TCL_STATIC: PTcl_FreeProc;
function TCL_DYNAMIC: PTcl_FreeProc;

function TCL_CLOSE2PROC: PTcl_DriverCloseProc;
function TCL_STUB_MAGIC: longint;

// === Konventiert am: 15-4-25 13:25:48 ===


implementation

function Tcl_DStringLength(dsPtr: PTcl_DString): longint;
begin
  Tcl_DStringLength := dsPtr^.length;
end;

function Tcl_DStringValue(dsPtr: PTcl_DString): pchar;
begin
  Tcl_DStringValue := dsPtr^._string;
end;

function TCL_VOLATILE: PTcl_FreeProc;
begin
  TCL_VOLATILE := PTcl_FreeProc(1);
end;

function TCL_STATIC: PTcl_FreeProc;
begin
  TCL_STATIC := PTcl_FreeProc(0);
end;

function TCL_DYNAMIC: PTcl_FreeProc;
begin
  TCL_DYNAMIC := PTcl_FreeProc(3);
end;

function TCL_CLOSE2PROC: PTcl_DriverCloseProc;
begin
  TCL_CLOSE2PROC := PTcl_DriverCloseProc(1);
end;

function TCL_STUB_MAGIC: longint;
begin
  TCL_STUB_MAGIC := longint($FCA3BACF);
end;

end.
