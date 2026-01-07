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

function GetDelegateCommand(para1: PImageInfo; para2: PImage; para3: pchar; para4: pchar; para5: PExceptionInfo): pchar; cdecl; external libmagiccore;
function GetDelegateList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagiccore;
function GetDelegateCommands(para1: PDelegateInfo): pchar; cdecl; external libmagiccore;
function GetDelegateInfo(para1: pchar; para2: pchar; exception: PExceptionInfo): PDelegateInfo; cdecl; external libmagiccore;
function GetDelegateInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPDelegateInfo; cdecl; external libmagiccore;
function ExternalDelegateCommand(para1: TMagickBooleanType; para2: TMagickBooleanType; para3: pchar; para4: pchar; para5: PExceptionInfo): longint; cdecl; external libmagiccore;
function GetDelegateMode(para1: PDelegateInfo): Tssize_t; cdecl; external libmagiccore;
function DelegateComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function GetDelegateThreadSupport(para1: PDelegateInfo): TMagickBooleanType; cdecl; external libmagiccore;
function InvokeDelegate(para1: PImageInfo; para2: PImage; para3: pchar; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function ListDelegateInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
procedure DelegateComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:50:50 ===


implementation



end.
