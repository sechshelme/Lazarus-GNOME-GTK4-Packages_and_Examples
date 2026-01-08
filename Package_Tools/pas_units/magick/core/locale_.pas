unit locale_;

interface

uses
  fp_magiccore, magick_type, hashmap;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPLocaleInfo = ^PLocaleInfo;
  PLocaleInfo = ^TLocaleInfo;
  TLocaleInfo = record
    path: pchar;
    tag: pchar;
    message: pchar;
    stealth: TMagickBooleanType;
    previous: PLocaleInfo;
    next: PLocaleInfo;
    signature: Tsize_t;
  end;

function GetLocaleList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagiccore;
function GetLocaleMessage(para1: pchar): pchar; cdecl; external libmagiccore;
function GetLocaleInfo_(para1: pchar; para2: PExceptionInfo): PLocaleInfo; cdecl; external libmagiccore;
function GetLocaleInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPLocaleInfo; cdecl; external libmagiccore;
function InterpretLocaleValue(magick_restrict: pchar; magick_restrict2: PPchar): double; cdecl; external libmagiccore;
function LocaleCompare(para1: pchar; para2: pchar): longint; cdecl; external libmagiccore;
function LocaleLowercase(para1: longint): longint; cdecl; external libmagiccore;
function LocaleNCompare(para1: pchar; para2: pchar; para3: Tsize_t): longint; cdecl; external libmagiccore;
function LocaleUppercase(para1: longint): longint; cdecl; external libmagiccore;
function DestroyLocaleOptions(para1: PLinkedListInfo): PLinkedListInfo; cdecl; external libmagiccore;
function GetLocaleOptions(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagiccore;
function ListLocaleInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function LocaleComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function FormatLocaleFile(para1: PFILE; magick_restrict: pchar; args: array of const): Tssize_t; cdecl; external libmagiccore;
function FormatLocaleFile(para1: PFILE; magick_restrict: pchar): Tssize_t; cdecl; external libmagiccore;
function FormatLocaleFileList(para1: PFILE; magick_restrict: pchar; para3: Tva_list): Tssize_t; cdecl; external libmagiccore;
function FormatLocaleString(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar; args: array of const): Tssize_t; cdecl; external libmagiccore;
function FormatLocaleString(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar): Tssize_t; cdecl; external libmagiccore;
function FormatLocaleStringList(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar; para4: Tva_list): Tssize_t; cdecl; external libmagiccore;
procedure LocaleComponentTerminus; cdecl; external libmagiccore;
procedure LocaleLower(para1: pchar); cdecl; external libmagiccore;
procedure LocaleUpper(para1: pchar); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:47:34 ===


implementation



end.
