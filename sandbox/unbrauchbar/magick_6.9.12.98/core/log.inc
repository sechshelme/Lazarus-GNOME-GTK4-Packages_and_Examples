{$IFDEF read_interface}


const
  MagickLogFilename = 'log.xml';

type
  PLogEventType = ^TLogEventType;
  TLogEventType = longint;

const
  UndefinedEvents = 0;
  NoEvents = $00000;
  TraceEvent = $00001;
  AnnotateEvent = $00002;
  BlobEvent = $00004;
  CacheEvent = $00008;
  CoderEvent = $00010;
  ConfigureEvent = $00020;
  DeprecateEvent = $00040;
  DrawEvent = $00080;
  ExceptionEvent = $00100;
  ImageEvent = $00200;
  LocaleEvent = $00400;
  ModuleEvent = $00800;
  PolicyEvent = $01000;
  ResourceEvent = $02000;
  TransformEvent = $04000;
  UserEvent = $09000;
  WandEvent = $10000;
  X11Event = $20000;
  AccelerateEvent = $40000;
  AllEvents = $7fffffff;

type
  TMagickLogMethod = procedure(para1: TLogEventType; para2: pchar); cdecl;

  PLogInfo = type Pointer;
  PPLogInfo = ^PLogInfo;

function GetLogInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPLogInfo; cdecl; external libmagickcore;
function GetLogList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPchar; cdecl; external libmagickcore;
function GetLogName: pchar; cdecl; external libmagickcore;
function SetLogName(para1: pchar): pchar; cdecl; external libmagickcore;
function GetLogEventMask: TLogEventType; cdecl; external libmagickcore;
function SetLogEventMask(para1: pchar): TLogEventType; cdecl; external libmagickcore;
function IsEventLogging: TMagickBooleanType; cdecl; external libmagickcore;
function ListLogInfo(para1: PFILE; para2: PExceptionInfo): char; cdecl; external libmagickcore;
function LogComponentGenesis: char; cdecl; external libmagickcore;
function LogMagickEvent(para1: TLogEventType; para2: pchar; para3: pchar; para4: Tsize_t; para5: pchar): char; cdecl; varargs; external libmagickcore;
function LogMagickEventList(para1: TLogEventType; para2: pchar; para3: pchar; para4: Tsize_t; para5: pchar;
  para6: Tva_list): char; cdecl; external libmagickcore;
procedure CloseMagickLog; cdecl; external libmagickcore;
procedure LogComponentTerminus; cdecl; external libmagickcore;
procedure SetLogFormat(para1: pchar); cdecl; external libmagickcore;
procedure SetLogMethod(para1: TMagickLogMethod); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
