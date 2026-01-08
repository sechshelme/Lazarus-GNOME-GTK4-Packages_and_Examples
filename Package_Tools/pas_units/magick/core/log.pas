unit log;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function GetLogInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPLogInfo; cdecl; external libmagiccore;
function GetLogList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPchar; cdecl; external libmagiccore;
function GetLogName: pchar; cdecl; external libmagiccore;
function SetLogName(para1: pchar): pchar; cdecl; external libmagiccore;
function GetLogEventMask: TLogEventType; cdecl; external libmagiccore;
function SetLogEventMask(para1: pchar): TLogEventType; cdecl; external libmagiccore;
function IsEventLogging: TMagickBooleanType; cdecl; external libmagiccore;
function ListLogInfo(para1: PFILE; para2: PExceptionInfo): char; cdecl; external libmagiccore;
function LogComponentGenesis: char; cdecl; external libmagiccore;
function LogMagickEvent(para1: TLogEventType; para2: pchar; para3: pchar; para4: Tsize_t; para5: pchar): char; cdecl; varargs; external libmagiccore;
function LogMagickEventList(para1: TLogEventType; para2: pchar; para3: pchar; para4: Tsize_t; para5: pchar;
  para6: Tva_list): char; cdecl; external libmagiccore;
procedure CloseMagickLog; cdecl; external libmagiccore;
procedure LogComponentTerminus; cdecl; external libmagiccore;
procedure SetLogFormat(para1: pchar); cdecl; external libmagiccore;
procedure SetLogMethod(para1: TMagickLogMethod); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:42 ===


implementation



end.
