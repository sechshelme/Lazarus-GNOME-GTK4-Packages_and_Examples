unit profile;

interface

uses
  fp_magiccore, magick_type, string_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TProfileInfo = record
    name: pchar;
    length: Tsize_t;
    info: pbyte;
    signature: Tsize_t;
  end;
  PProfileInfo = ^TProfileInfo;

type
  PRenderingIntent = ^TRenderingIntent;
  TRenderingIntent = longint;

const
  UndefinedIntent = 0;
  SaturationIntent = 1;
  PerceptualIntent = 2;
  AbsoluteIntent = 3;
  RelativeIntent = 4;

function GetNextImageProfile(para1: PImage): pchar; cdecl; external libmagickcore;
function GetImageProfile(para1: PImage; para2: pchar): PStringInfo; cdecl; external libmagickcore;
function CloneImageProfiles(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageProfile(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ProfileImage(para1: PImage; para2: pchar; para3: pointer; para4: Tsize_t; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProfile(para1: PImage; para2: pchar; para3: PStringInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SyncImageProfiles(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemoveImageProfile(para1: PImage; para2: pchar): PStringInfo; cdecl; external libmagickcore;
procedure DestroyImageProfiles(para1: PImage); cdecl; external libmagickcore;
procedure ResetImageProfileIterator(para1: PImage); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:33 ===


implementation



end.
