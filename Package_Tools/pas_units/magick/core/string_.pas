unit string_;

interface

uses
  fp_magiccore, magick_type, method_attribute;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  TStringInfo = record
      path : array[0..(MaxTextExtent)-1] of char;
      datum : Pbyte;
      length : Tsize_t;
      signature : Tsize_t;
      name : Pchar;
    end;
  PStringInfo = ^TStringInfo;

function AcquireString(para1:Pchar):Pchar;cdecl;external libmagiccore;
function CloneString(para1:PPchar; para2:Pchar):Pchar;cdecl;external libmagiccore;
function ConstantString(para1:Pchar):Pchar;cdecl;external libmagiccore;
function DestroyString(para1:Pchar):Pchar;cdecl;external libmagiccore;
function DestroyStringList(para1:PPchar):PPchar;cdecl;external libmagiccore;
function EscapeString(para1:Pchar; para2:char):Pchar;cdecl;external libmagiccore;
function FileToString(para1:Pchar; para2:Tsize_t; para3:PExceptionInfo):Pchar;cdecl;external libmagiccore;
function GetEnvironmentValue(para1:Pchar):Pchar;cdecl;external libmagiccore;
function SanitizeString(para1:Pchar):Pchar;cdecl;external libmagiccore;
function StringInfoToHexString(para1:PStringInfo):Pchar;cdecl;external libmagiccore;
function StringInfoToString(para1:PStringInfo):Pchar;cdecl;external libmagiccore;
function StringToArgv(para1:Pchar; para2:Plongint):PPchar;cdecl;external libmagiccore;
function StringToken(para1:Pchar; para2:PPchar):Pchar;cdecl;external libmagiccore;
function StringToList(para1:Pchar):PPchar;cdecl;external libmagiccore;
function StringToStrings(para1:Pchar; para2:Psize_t):PPchar;cdecl;external libmagiccore;
function GetStringInfoName(para1:PStringInfo):Pchar;cdecl;external libmagiccore;
function GetStringInfoPath(para1:PStringInfo):Pchar;cdecl;external libmagiccore;
function InterpretSiPrefixValue(magick_restrict:Pchar; magick_restrict2:PPchar):double;cdecl;external libmagiccore;
function StringToArrayOfDoubles(para1:Pchar; para2:Pssize_t; para3:PExceptionInfo):Pdouble;cdecl;external libmagiccore;
function CompareStringInfo(para1:PStringInfo; para2:PStringInfo):longint;cdecl;external libmagiccore;
function ConcatenateString(magick_restrict:PPchar; magick_restrict2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function IsStringTrue(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function IsStringNotFalse(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function SubstituteString(para1:PPchar; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ConcatenateMagickString(magick_restrict:Pchar; magick_restrict2:Pchar; para3:Tsize_t):Tsize_t;cdecl;external libmagiccore;
function CopyMagickString(magick_restrict:Pchar; magick_restrict2:Pchar; para3:Tsize_t):Tsize_t;cdecl;external libmagiccore;
function GetStringInfoLength(para1:PStringInfo):Tsize_t;cdecl;external libmagiccore;
function FormatMagickSize(para1:TMagickSizeType; para2:TMagickBooleanType; para3:Pchar):Tssize_t;cdecl;external libmagiccore;
function AcquireStringInfo(para1:Tsize_t):PStringInfo;cdecl;external libmagiccore;
function BlobToStringInfo(para1:pointer; para2:Tsize_t):PStringInfo;cdecl;external libmagiccore;
function CloneStringInfo(para1:PStringInfo):PStringInfo;cdecl;external libmagiccore;
function ConfigureFileToStringInfo(para1:Pchar):PStringInfo;cdecl;external libmagiccore;
function DestroyStringInfo(para1:PStringInfo):PStringInfo;cdecl;external libmagiccore;
function FileToStringInfo(para1:Pchar; para2:Tsize_t; para3:PExceptionInfo):PStringInfo;cdecl;external libmagiccore;
function SplitStringInfo(para1:PStringInfo; para2:Tsize_t):PStringInfo;cdecl;external libmagiccore;
function StringToStringInfo(para1:Pchar):PStringInfo;cdecl;external libmagiccore;
function GetStringInfoDatum(para1:PStringInfo):Pbyte;cdecl;external libmagiccore;
procedure ConcatenateStringInfo(para1:PStringInfo; para2:PStringInfo);cdecl;external libmagiccore;
procedure PrintStringInfo(file_:PFILE; para2:Pchar; para3:PStringInfo);cdecl;external libmagiccore;
procedure ResetStringInfo(para1:PStringInfo);cdecl;external libmagiccore;
procedure SetStringInfo(para1:PStringInfo; para2:PStringInfo);cdecl;external libmagiccore;
procedure SetStringInfoDatum(para1:PStringInfo; para2:Pbyte);cdecl;external libmagiccore;
procedure SetStringInfoLength(para1:PStringInfo; para2:Tsize_t);cdecl;external libmagiccore;
procedure SetStringInfoName(para1:PStringInfo; para2:Pchar);cdecl;external libmagiccore;
procedure SetStringInfoPath(para1:PStringInfo; para2:Pchar);cdecl;external libmagiccore;
procedure StripString(para1:Pchar);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:03:31 ===


implementation



end.
