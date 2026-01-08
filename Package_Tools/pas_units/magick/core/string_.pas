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

function AcquireString(para1:Pchar):Pchar;cdecl;external libmagickcore;
function CloneString(para1:PPchar; para2:Pchar):Pchar;cdecl;external libmagickcore;
function ConstantString(para1:Pchar):Pchar;cdecl;external libmagickcore;
function DestroyString(para1:Pchar):Pchar;cdecl;external libmagickcore;
function DestroyStringList(para1:PPchar):PPchar;cdecl;external libmagickcore;
function EscapeString(para1:Pchar; para2:char):Pchar;cdecl;external libmagickcore;
function FileToString(para1:Pchar; para2:Tsize_t; para3:PExceptionInfo):Pchar;cdecl;external libmagickcore;
function GetEnvironmentValue(para1:Pchar):Pchar;cdecl;external libmagickcore;
function SanitizeString(para1:Pchar):Pchar;cdecl;external libmagickcore;
function StringInfoToHexString(para1:PStringInfo):Pchar;cdecl;external libmagickcore;
function StringInfoToString(para1:PStringInfo):Pchar;cdecl;external libmagickcore;
function StringToArgv(para1:Pchar; para2:Plongint):PPchar;cdecl;external libmagickcore;
function StringToken(para1:Pchar; para2:PPchar):Pchar;cdecl;external libmagickcore;
function StringToList(para1:Pchar):PPchar;cdecl;external libmagickcore;
function StringToStrings(para1:Pchar; para2:Psize_t):PPchar;cdecl;external libmagickcore;
function GetStringInfoName(para1:PStringInfo):Pchar;cdecl;external libmagickcore;
function GetStringInfoPath(para1:PStringInfo):Pchar;cdecl;external libmagickcore;
function InterpretSiPrefixValue(magick_restrict:Pchar; magick_restrict2:PPchar):double;cdecl;external libmagickcore;
function StringToArrayOfDoubles(para1:Pchar; para2:Pssize_t; para3:PExceptionInfo):Pdouble;cdecl;external libmagickcore;
function CompareStringInfo(para1:PStringInfo; para2:PStringInfo):longint;cdecl;external libmagickcore;
function ConcatenateString(magick_restrict:PPchar; magick_restrict2:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function IsStringTrue(para1:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function IsStringNotFalse(para1:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function SubstituteString(para1:PPchar; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function ConcatenateMagickString(magick_restrict:Pchar; magick_restrict2:Pchar; para3:Tsize_t):Tsize_t;cdecl;external libmagickcore;
function CopyMagickString(magick_restrict:Pchar; magick_restrict2:Pchar; para3:Tsize_t):Tsize_t;cdecl;external libmagickcore;
function GetStringInfoLength(para1:PStringInfo):Tsize_t;cdecl;external libmagickcore;
function FormatMagickSize(para1:TMagickSizeType; para2:TMagickBooleanType; para3:Pchar):Tssize_t;cdecl;external libmagickcore;
function AcquireStringInfo(para1:Tsize_t):PStringInfo;cdecl;external libmagickcore;
function BlobToStringInfo(para1:pointer; para2:Tsize_t):PStringInfo;cdecl;external libmagickcore;
function CloneStringInfo(para1:PStringInfo):PStringInfo;cdecl;external libmagickcore;
function ConfigureFileToStringInfo(para1:Pchar):PStringInfo;cdecl;external libmagickcore;
function DestroyStringInfo(para1:PStringInfo):PStringInfo;cdecl;external libmagickcore;
function FileToStringInfo(para1:Pchar; para2:Tsize_t; para3:PExceptionInfo):PStringInfo;cdecl;external libmagickcore;
function SplitStringInfo(para1:PStringInfo; para2:Tsize_t):PStringInfo;cdecl;external libmagickcore;
function StringToStringInfo(para1:Pchar):PStringInfo;cdecl;external libmagickcore;
function GetStringInfoDatum(para1:PStringInfo):Pbyte;cdecl;external libmagickcore;
procedure ConcatenateStringInfo(para1:PStringInfo; para2:PStringInfo);cdecl;external libmagickcore;
procedure PrintStringInfo(file_:PFILE; para2:Pchar; para3:PStringInfo);cdecl;external libmagickcore;
procedure ResetStringInfo(para1:PStringInfo);cdecl;external libmagickcore;
procedure SetStringInfo(para1:PStringInfo; para2:PStringInfo);cdecl;external libmagickcore;
procedure SetStringInfoDatum(para1:PStringInfo; para2:Pbyte);cdecl;external libmagickcore;
procedure SetStringInfoLength(para1:PStringInfo; para2:Tsize_t);cdecl;external libmagickcore;
procedure SetStringInfoName(para1:PStringInfo; para2:Pchar);cdecl;external libmagickcore;
procedure SetStringInfoPath(para1:PStringInfo; para2:Pchar);cdecl;external libmagickcore;
procedure StripString(para1:Pchar);cdecl;external libmagickcore;

// === Konventiert am: 6-1-26 15:03:31 ===


implementation



end.
