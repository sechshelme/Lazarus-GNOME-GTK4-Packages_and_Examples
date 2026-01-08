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

function GetNextImageRegistry: pchar; cdecl; external libmagickcore;
function DefineImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageRegistry(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function RegistryComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetImageRegistry(para1: TRegistryType; para2: pchar; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;
procedure RegistryComponentTerminus; cdecl; external libmagickcore;
function RemoveImageRegistry(para1: pchar): pointer; cdecl; external libmagickcore;
procedure ResetImageRegistryIterator; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:40:11 ===


implementation



end.
