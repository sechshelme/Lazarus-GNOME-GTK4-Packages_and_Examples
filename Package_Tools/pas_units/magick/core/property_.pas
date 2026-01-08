unit property_;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GetNextImageProperty(para1: PImage): pchar; cdecl; external libmagiccore;
function InterpretImageProperties(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagiccore;
function RemoveImageProperty(para1: PImage; para2: pchar): pchar; cdecl; external libmagiccore;
function GetImageProperty(para1: PImage; para2: pchar): pchar; cdecl; external libmagiccore;
function GetMagickProperty(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagiccore;
function CloneImageProperties(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function DefineImageProperty(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function DeleteImageProperty(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function FormatImageProperty(para1: PImage; para2: pchar; para3: pchar; args: array of const): TMagickBooleanType; cdecl; external libmagiccore;
function FormatImageProperty(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function SetImageProperty(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;
procedure DestroyImageProperties(para1: PImage); cdecl; external libmagiccore;
procedure ResetImagePropertyIterator(para1: PImage); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:40:04 ===


implementation



end.
