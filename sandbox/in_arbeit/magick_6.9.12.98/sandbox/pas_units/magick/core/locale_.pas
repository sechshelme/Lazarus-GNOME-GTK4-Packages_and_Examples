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

function GetLocaleList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetLocaleMessage(para1: pchar): pchar; cdecl; external libmagickcore;
function GetLocaleInfo_(para1: pchar; para2: PExceptionInfo): PLocaleInfo; cdecl; external libmagickcore;
function GetLocaleInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPLocaleInfo; cdecl; external libmagickcore;
function InterpretLocaleValue(magick_restrict: pchar; magick_restrict2: PPchar): double; cdecl; external libmagickcore;
function LocaleCompare(para1: pchar; para2: pchar): longint; cdecl; external libmagickcore;
function LocaleLowercase(para1: longint): longint; cdecl; external libmagickcore;
function LocaleNCompare(para1: pchar; para2: pchar; para3: Tsize_t): longint; cdecl; external libmagickcore;
function LocaleUppercase(para1: longint): longint; cdecl; external libmagickcore;
function DestroyLocaleOptions(para1: PLinkedListInfo): PLinkedListInfo; cdecl; external libmagickcore;
function GetLocaleOptions(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagickcore;
function ListLocaleInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function LocaleComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function FormatLocaleFile(para1: PFILE; magick_restrict: pchar; args: array of const): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleFile(para1: PFILE; magick_restrict: pchar): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleFileList(para1: PFILE; magick_restrict: pchar; para3: Tva_list): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleString(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar; args: array of const): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleString(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleStringList(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar; para4: Tva_list): Tssize_t; cdecl; external libmagickcore;
procedure LocaleComponentTerminus; cdecl; external libmagickcore;
procedure LocaleLower(para1: pchar); cdecl; external libmagickcore;
procedure LocaleUpper(para1: pchar); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:34 ===


implementation



end.
