unit exception;

interface

uses
  fp_magiccore, magick_type, semaphore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PExceptionType = ^TExceptionType;
  TExceptionType = longint;

const
  UndefinedException = 0;
  WarningException = 300;
  ResourceLimitWarning = 300;
  TypeWarning = 305;
  OptionWarning = 310;
  DelegateWarning = 315;
  MissingDelegateWarning = 320;
  CorruptImageWarning = 325;
  FileOpenWarning = 330;
  BlobWarning = 335;
  StreamWarning = 340;
  CacheWarning = 345;
  CoderWarning = 350;
  FilterWarning = 352;
  ModuleWarning = 355;
  DrawWarning = 360;
  ImageWarning = 365;
  WandWarning = 370;
  RandomWarning = 375;
  XServerWarning = 380;
  MonitorWarning = 385;
  RegistryWarning = 390;
  ConfigureWarning = 395;
  PolicyWarning = 399;
  ErrorException = 400;
  ResourceLimitError = 400;
  TypeError = 405;
  OptionError = 410;
  DelegateError = 415;
  MissingDelegateError = 420;
  CorruptImageError = 425;
  FileOpenError = 430;
  BlobError = 435;
  StreamError = 440;
  CacheError = 445;
  CoderError = 450;
  FilterError = 452;
  ModuleError = 455;
  DrawError = 460;
  ImageError = 465;
  WandError = 470;
  RandomError = 475;
  XServerError = 480;
  MonitorError = 485;
  RegistryError = 490;
  ConfigureError = 495;
  PolicyError = 499;
  FatalErrorException = 700;
  ResourceLimitFatalError = 700;
  TypeFatalError = 705;
  OptionFatalError = 710;
  DelegateFatalError = 715;
  MissingDelegateFatalError = 720;
  CorruptImageFatalError = 725;
  FileOpenFatalError = 730;
  BlobFatalError = 735;
  StreamFatalError = 740;
  CacheFatalError = 745;
  CoderFatalError = 750;
  FilterFatalError = 752;
  ModuleFatalError = 755;
  DrawFatalError = 760;
  ImageFatalError = 765;
  WandFatalError = 770;
  RandomFatalError = 775;
  XServerFatalError = 780;
  MonitorFatalError = 785;
  RegistryFatalError = 790;
  ConfigureFatalError = 795;
  PolicyFatalError = 799;

type
  TExceptionInfo = record
    severity: TExceptionType;
    error_number: longint;
    reason: pchar;
    description: pchar;
    exceptions: pointer;
    relinquish: TMagickBooleanType;
    semaphore: PSemaphoreInfo;
    signature: Tsize_t;
  end;
  PExceptionInfo = ^TExceptionInfo;

  TErrorHandler = procedure(para1: TExceptionType; para2: pchar; para3: pchar); cdecl;
  TFatalErrorHandler = procedure(para1: TExceptionType; para2: pchar; para3: pchar); cdecl;
  TWarningHandler = procedure(para1: TExceptionType; para2: pchar; para3: pchar); cdecl;

function GetExceptionMessage(para1: longint): pchar; cdecl; external libmagickcore;
function GetLocaleExceptionMessage(para1: TExceptionType; para2: pchar): pchar; cdecl; external libmagickcore;
function SetErrorHandler(para1: TErrorHandler): TErrorHandler; cdecl; external libmagickcore;
function AcquireExceptionInfo: PExceptionInfo; cdecl; external libmagickcore;
function CloneExceptionInfo(para1: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyExceptionInfo(para1: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SetFatalErrorHandler(para1: TFatalErrorHandler): TFatalErrorHandler; cdecl; external libmagickcore;
function ThrowException(para1: PExceptionInfo; para2: TExceptionType; para3: pchar; para4: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ThrowMagickException(para1: PExceptionInfo; para2: pchar; para3: pchar; para4: Tsize_t; para5: TExceptionType;
  para6: pchar; para7: pchar): TMagickBooleanType; cdecl; varargs; external libmagickcore;
function ThrowMagickExceptionList(para1: PExceptionInfo; para2: pchar; para3: pchar; para4: Tsize_t; para5: TExceptionType;
  para6: pchar; para7: pchar; para8: Tva_list): TMagickBooleanType; cdecl; external libmagickcore;
procedure CatchException(para1: PExceptionInfo); cdecl; external libmagickcore;
procedure ClearMagickException(para1: PExceptionInfo); cdecl; external libmagickcore;
procedure InheritException(para1: PExceptionInfo; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure MagickError(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
procedure MagickFatalError(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
procedure MagickWarning(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
function SetWarningHandler(para1: TWarningHandler): TWarningHandler; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:18 ===


implementation



end.
