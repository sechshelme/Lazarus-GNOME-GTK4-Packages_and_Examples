{$IFDEF read_interface}


function RoundToQuantum(quantum: TMagickRealType): TQuantum;


function ClampToQuantum(const quantum: TMagickRealType): TQuantum; inline;
function ScaleQuantumToChar(const quantum: TQuantum): byte; inline;

function GetQuantumEndian(para1: PQuantumInfo): TEndianType; cdecl; external libmagickcore;
function SetQuantumDepth(para1: PImage; para2: PQuantumInfo; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetQuantumEndian(para1: PImage; para2: PQuantumInfo; para3: TEndianType): TMagickBooleanType; cdecl; external libmagickcore;
function SetQuantumFormat(para1: PImage; para2: PQuantumInfo; para3: TQuantumFormatType): TMagickBooleanType; cdecl; external libmagickcore;
function SetQuantumPad(para1: PImage; para2: PQuantumInfo; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function GetQuantumFormat(para1: PQuantumInfo): TQuantumFormatType; cdecl; external libmagickcore;
function AcquireQuantumInfo(para1: PImageInfo; para2: PImage): PQuantumInfo; cdecl; external libmagickcore;
function DestroyQuantumInfo(para1: PQuantumInfo): PQuantumInfo; cdecl; external libmagickcore;
function GetQuantumType(para1: PImage; para2: PExceptionInfo): TQuantumType; cdecl; external libmagickcore;
function ExportQuantumPixels(para1: PImage; para2: PCacheView; para3: PQuantumInfo; para4: TQuantumType; magick_restrict: pbyte;
  para6: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetQuantumExtent(para1: PImage; para2: PQuantumInfo; para3: TQuantumType): Tsize_t; cdecl; external libmagickcore;
function ImportQuantumPixels(para1: PImage; para2: PCacheView; para3: PQuantumInfo; para4: TQuantumType; magick_restrict: pbyte;
  para6: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetQuantumPixels(para1: PQuantumInfo): pbyte; cdecl; external libmagickcore;
procedure GetQuantumInfo(para1: PImageInfo; para2: PQuantumInfo); cdecl; external libmagickcore;
procedure SetQuantumAlphaType(para1: PQuantumInfo; para2: TQuantumAlphaType); cdecl; external libmagickcore;
procedure SetQuantumImageType(para1: PImage; para2: TQuantumType); cdecl; external libmagickcore;
procedure SetQuantumMinIsWhite(para1: PQuantumInfo; para2: TMagickBooleanType); cdecl; external libmagickcore;
procedure SetQuantumPack(para1: PQuantumInfo; para2: TMagickBooleanType); cdecl; external libmagickcore;
procedure SetQuantumQuantum(para1: PQuantumInfo; para2: Tsize_t); cdecl; external libmagickcore;
procedure SetQuantumScale(para1: PQuantumInfo; para2: double); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

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


{$ENDIF read_implementation}
