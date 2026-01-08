unit mime;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMimeInfo = type Pointer;
  PPMimeInfo = ^PMimeInfo;

function GetMimeList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function MagickToMime(para1: pchar): pchar; cdecl; external libmagickcore;
function GetMimeDescription(para1: PMimeInfo): pchar; cdecl; external libmagickcore;
function GetMimeType(para1: PMimeInfo): pchar; cdecl; external libmagickcore;
function ListMimeInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function MimeComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetMimeInfo(para1: pchar; para2: pbyte; para3: Tsize_t; para4: PExceptionInfo): PMimeInfo; cdecl; external libmagickcore;
function GetMimeInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMimeInfo; cdecl; external libmagickcore;
procedure MimeComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:27 ===


implementation



end.
