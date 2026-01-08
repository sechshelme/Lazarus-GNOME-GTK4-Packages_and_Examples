unit token;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTokenInfo = type Pointer;

function Tokenizer(para1: PTokenInfo; para2: dword; para3: pchar; para4: Tsize_t; para5: pchar;
  para6: pchar; para7: pchar; para8: pchar; para9: char; para10: pchar;
  para11: Plongint; para12: pchar): longint; cdecl; external libmagiccore;
function GlobExpression(magick_restrict: pchar; magick_restrict2: pchar; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;
function IsGlob(para1: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function IsMagickTrue(para1: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function GetNextToken(magick_restrict: pchar; magick_restrict2: PPchar; para3: Tsize_t; magick_restrict3: pchar): Tsize_t; cdecl; external libmagiccore;
function AcquireTokenInfo: PTokenInfo; cdecl; external libmagiccore;
function DestroyTokenInfo(para1: PTokenInfo): PTokenInfo; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:40:16 ===


implementation



end.
