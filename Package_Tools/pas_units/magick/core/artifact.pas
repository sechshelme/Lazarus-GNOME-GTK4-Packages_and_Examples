unit artifact;

interface

uses
  fp_magiccore, magick_type;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function GetNextImageArtifact(para1:PImage):Pchar;cdecl;external libmagiccore;
function RemoveImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagiccore;
function GetImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagiccore;
function CloneImageArtifacts(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function DefineImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageArtifact(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
procedure DestroyImageArtifacts(para1:PImage);cdecl;external libmagiccore;
procedure ResetImageArtifactIterator(para1:PImage);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:15 ===


implementation



end.
