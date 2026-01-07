unit quantum;

interface

uses
  fp_magiccore, magick_type, cache_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function RoundToQuantum(quantum: TMagickRealType): TQuantum;

type
  PEndianType = ^TEndianType;
  TEndianType = longint;

const
  UndefinedEndian = 0;
  LSBEndian = 1;
  MSBEndian = 2;

type
  PQuantumAlphaType = ^TQuantumAlphaType;
  TQuantumAlphaType = longint;

const
  UndefinedQuantumAlpha = 0;
  AssociatedQuantumAlpha = 1;
  DisassociatedQuantumAlpha = 2;

type
  PQuantumFormatType = ^TQuantumFormatType;
  TQuantumFormatType = longint;

const
  UndefinedQuantumFormat = 0;
  FloatingPointQuantumFormat = 1;
  SignedQuantumFormat = 2;
  UnsignedQuantumFormat = 3;

type
  PQuantumType = ^TQuantumType;
  TQuantumType = longint;

const
  UndefinedQuantum = 0;
  AlphaQuantum = 1;
  BlackQuantum = 2;
  BlueQuantum = 3;
  CMYKAQuantum = 4;
  CMYKQuantum = 5;
  CyanQuantum = 6;
  GrayAlphaQuantum = 7;
  GrayQuantum = 8;
  GreenQuantum = 9;
  IndexAlphaQuantum = 10;
  IndexQuantum = 11;
  MagentaQuantum = 12;
  OpacityQuantum = 13;
  RedQuantum = 14;
  RGBAQuantum = 15;
  BGRAQuantum = 16;
  RGBOQuantum = 17;
  RGBQuantum = 18;
  YellowQuantum = 19;
  GrayPadQuantum = 20;
  RGBPadQuantum = 21;
  CbYCrYQuantum = 22;
  CbYCrQuantum = 23;
  CbYCrAQuantum = 24;
  CMYKOQuantum = 25;
  BGRQuantum = 26;
  BGROQuantum = 27;

type
  PQuantumInfo = type Pointer;

function ClampToQuantum(const quantum: TMagickRealType): TQuantum; inline;
function ScaleQuantumToChar(const quantum: TQuantum): byte; inline;

function GetQuantumEndian(para1: PQuantumInfo): TEndianType; cdecl; external libmagiccore;
function SetQuantumDepth(para1: PImage; para2: PQuantumInfo; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagiccore;
function SetQuantumEndian(para1: PImage; para2: PQuantumInfo; para3: TEndianType): TMagickBooleanType; cdecl; external libmagiccore;
function SetQuantumFormat(para1: PImage; para2: PQuantumInfo; para3: TQuantumFormatType): TMagickBooleanType; cdecl; external libmagiccore;
function SetQuantumPad(para1: PImage; para2: PQuantumInfo; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagiccore;
function GetQuantumFormat(para1: PQuantumInfo): TQuantumFormatType; cdecl; external libmagiccore;
function AcquireQuantumInfo(para1: PImageInfo; para2: PImage): PQuantumInfo; cdecl; external libmagiccore;
function DestroyQuantumInfo(para1: PQuantumInfo): PQuantumInfo; cdecl; external libmagiccore;
function GetQuantumType(para1: PImage; para2: PExceptionInfo): TQuantumType; cdecl; external libmagiccore;
function ExportQuantumPixels(para1: PImage; para2: PCacheView; para3: PQuantumInfo; para4: TQuantumType; magick_restrict: pbyte;
  para6: PExceptionInfo): Tsize_t; cdecl; external libmagiccore;
function GetQuantumExtent(para1: PImage; para2: PQuantumInfo; para3: TQuantumType): Tsize_t; cdecl; external libmagiccore;
function ImportQuantumPixels(para1: PImage; para2: PCacheView; para3: PQuantumInfo; para4: TQuantumType; magick_restrict: pbyte;
  para6: PExceptionInfo): Tsize_t; cdecl; external libmagiccore;
function GetQuantumPixels(para1: PQuantumInfo): pbyte; cdecl; external libmagiccore;
procedure GetQuantumInfo(para1: PImageInfo; para2: PQuantumInfo); cdecl; external libmagiccore;
procedure SetQuantumAlphaType(para1: PQuantumInfo; para2: TQuantumAlphaType); cdecl; external libmagiccore;
procedure SetQuantumImageType(para1: PImage; para2: TQuantumType); cdecl; external libmagiccore;
procedure SetQuantumMinIsWhite(para1: PQuantumInfo; para2: TMagickBooleanType); cdecl; external libmagiccore;
procedure SetQuantumPack(para1: PQuantumInfo; para2: TMagickBooleanType); cdecl; external libmagiccore;
procedure SetQuantumQuantum(para1: PQuantumInfo; para2: Tsize_t); cdecl; external libmagiccore;
procedure SetQuantumScale(para1: PQuantumInfo; para2: double); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 14:40:29 ===


implementation

function ClampToQuantum(const quantum: TMagickRealType): TQuantum;
begin
  if quantum < 0.0 then begin
    Exit(0);
  end;
  if quantum >= QuantumRange then begin
    Exit(Trunc(QuantumRange));
  end;
  Result := Round(quantum + 0.5);
end;

function ScaleQuantumToChar(const quantum: TQuantum): byte;
begin
  Result := byte(((quantum + 128) - ((quantum + 128) shr 8)) shr 8);
end;

function RoundToQuantum(quantum: TMagickRealType): TQuantum;
begin
  RoundToQuantum := ClampToQuantum(quantum);
end;


end.
