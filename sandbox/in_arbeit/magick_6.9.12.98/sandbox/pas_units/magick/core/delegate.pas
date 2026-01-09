unit delegate;

interface

uses
  fp_magiccore, magick_type, semaphore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPDelegateInfo = ^PDelegateInfo;
  PDelegateInfo = ^TDelegateInfo;
  TDelegateInfo = record
    path: pchar;
    decode: pchar;
    encode: pchar;
    commands: pchar;
    mode: Tssize_t;
    thread_support: TMagickBooleanType;
    spawn: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PDelegateInfo;
    next: PDelegateInfo;
    signature: Tsize_t;
    semaphore: PSemaphoreInfo;
  end;

function GetDelegateCommand(para1: PImageInfo; para2: PImage; para3: pchar; para4: pchar; para5: PExceptionInfo): pchar; cdecl; external libmagickcore;
function GetDelegateList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetDelegateCommands(para1: PDelegateInfo): pchar; cdecl; external libmagickcore;
function GetDelegateInfo(para1: pchar; para2: pchar; exception: PExceptionInfo): PDelegateInfo; cdecl; external libmagickcore;
function GetDelegateInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPDelegateInfo; cdecl; external libmagickcore;
function ExternalDelegateCommand(para1: TMagickBooleanType; para2: TMagickBooleanType; para3: pchar; para4: pchar; para5: PExceptionInfo): longint; cdecl; external libmagickcore;
function GetDelegateMode(para1: PDelegateInfo): Tssize_t; cdecl; external libmagickcore;
function DelegateComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetDelegateThreadSupport(para1: PDelegateInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InvokeDelegate(para1: PImageInfo; para2: PImage; para3: pchar; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ListDelegateInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure DelegateComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:50 ===


implementation



end.
