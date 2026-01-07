unit registry;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PRegistryType = ^TRegistryType;
  TRegistryType = longint;

const
  UndefinedRegistryType = 0;
  ImageRegistryType = 1;
  ImageInfoRegistryType = 2;
  StringRegistryType = 3;

function GetNextImageRegistry: pchar; cdecl; external libmagiccore;
function DefineImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function DeleteImageRegistry(para1: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function RegistryComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function SetImageRegistry(para1: TRegistryType; para2: pchar; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function GetImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): pointer; cdecl; external libmagiccore;
procedure RegistryComponentTerminus; cdecl; external libmagiccore;
function RemoveImageRegistry(para1: pchar): pointer; cdecl; external libmagiccore;
procedure ResetImageRegistryIterator; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:40:11 ===


implementation



end.
