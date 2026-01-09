

{$IFDEF read_interface}



// ==== /usr/include/ImageMagick-6/magick/memory_.h

function HeapOverflowSanityCheck(count, quantum: Tsize_t): TMagickBooleanType; inline;
function HeapOverflowSanityCheckGetSize(count, quantum: Tsize_t; var extent: Tsize_t): TMagickBooleanType; inline;

// ==== /usr/include/ImageMagick-6/magick/module.h

function MagickImageCoderSignature: Tsize_t;
function MagickImageFilterSignature: Tsize_t;

// ==== /usr/include/ImageMagick-6/magick/pixel-accessor.h

function ClampPixelRed(pixel: PPixelPacket): TQuantum; inline;
function ClampPixelGreen(pixel: PPixelPacket): TQuantum; inline;
function ClampPixelBlue(pixel: PPixelPacket): TQuantum; inline;
function ClampPixelIndex(indexes: PIndexPacket): TQuantum; inline;
function ClampPixelOpacity(pixel: PPixelPacket): TQuantum; inline;
function GetPixela(pixel: PPixelPacket): TQuantum; inline;
function GetPixelb(pixel: PPixelPacket): TQuantum; inline;
function GetPixelAlpha(pixel: PPixelPacket): double; inline;
function GetPixelBlack(indexes: PIndexPacket): TQuantum; inline;
function GetPixelBlue(pixel: PPixelPacket): TQuantum; inline;
function GetPixelCb(pixel: PPixelPacket): TQuantum; inline;
function GetPixelCr(pixel: PPixelPacket): TQuantum; inline;
function GetPixelCyan(pixel: PPixelPacket): TQuantum; inline;
function GetPixelGray(pixel: PPixelPacket): TQuantum; inline;
function GetPixelGreen(pixel: PPixelPacket): TQuantum; inline;
function GetPixelIndex(indexes: PIndexPacket): TQuantum; inline;
function GetPixelL(pixel: PPixelPacket): TQuantum; inline;
function GetPixelLabel(pixel: PPixelPacket): nativeint; inline;
function GetPixelMagenta(pixel: PPixelPacket): TQuantum; inline;
function GetPixelNext(pixel: PPixelPacket): PPixelPacket; inline;
function GetPixelOpacity(pixel: PPixelPacket): TQuantum; inline;
function GetPixelRed(pixel: PPixelPacket): TQuantum; inline;
procedure GetPixelRGB(pixel: PPixelPacket; packet: PPixelPacket); inline;
procedure GetPixelRGBO(pixel: PPixelPacket; packet: PPixelPacket); inline;
function GetPixelY(pixel: PPixelPacket): TQuantum; inline;
function GetPixelYellow(pixel: PPixelPacket): TQuantum; inline;
procedure SetPixela(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelAlpha(pixel: PPixelPacket; value: double); inline;
procedure SetPixelb(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelBlack(indexes: PIndexPacket; value: TQuantum); inline;
procedure SetPixelBlue(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelCb(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelCr(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelCyan(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelGray(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelGreen(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelIndex(indexes: PIndexPacket; value: TIndexPacket); inline;
procedure SetPixelL(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelMagenta(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelOpacity(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelRed(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelRgb(pixel: PPixelPacket; packet: PPixelPacket); inline;
procedure SetPixelRGBA(pixel: PPixelPacket; packet: PPixelPacket); inline;
procedure SetPixelRGBO(pixel: PPixelPacket; packet: PPixelPacket); inline;
procedure SetPixelYellow(pixel: PPixelPacket; value: TQuantum); inline;
procedure SetPixelY(pixel: PPixelPacket; value: TQuantum); inline;

function AbsolutePixelValue(x: TMagickRealType): TMagickRealType; inline;
function ClampPixel(value: TMagickRealType): TQuantum; inline;
function PerceptibleReciprocal(x: double): double; inline;
function GetPixelLuma(image: PImage; pixel: PPixelPacket): TMagickRealType; inline;
function GetPixelLuminance(image: PImage; pixel: PPixelPacket): TMagickRealType; inline;
procedure GetPixelPacketRGBA(red, green, blue, opacity: TQuantum; pixel: PPixelPacket); inline;
function IsPixelAtDepth(pixel, range: TQuantumAny): TMagickBooleanType; inline;
function IsPixelGray(pixel: PPixelPacket): TMagickBooleanType; inline;
function IsPixelMonochrome(pixel: PPixelPacket): TMagickBooleanType; inline;
function PixelPacketIntensity(pixel: PPixelPacket): TQuantum; inline;
procedure SetPixelViaMagickPixel(image: PImage; magick_pixel: PMagickPixelPacket; pixel: PPixelPacket); inline;

// ==== /usr/include/ImageMagick-6/magick/quantum.h

function RoundToQuantum(quantum: TMagickRealType): TQuantum;

function ClampToQuantum(const quantum: TMagickRealType): TQuantum; inline;
function ScaleQuantumToChar(const quantum: TQuantum): byte; inline;

// ==== /usr/include/ImageMagick-6/magick/resource_.h

function MagickResourceInfinity: DWord;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function HeapOverflowSanityCheck(count, quantum: Tsize_t): TMagickBooleanType; inline;
begin
  if (count = 0) or (quantum = 0) then begin
    Result := MagickTrue;
    Exit;
  end;

  if quantum <> ((count * quantum) div count) then begin
    Result := MagickTrue;
  end else begin
    Result := MagickFalse;
  end;
end;

function HeapOverflowSanityCheckGetSize(count, quantum: Tsize_t; var extent: Tsize_t): TMagickBooleanType; inline;
var
  length: Tsize_t;
begin
  if (count = 0) or (quantum = 0) then begin
    Result := MagickTrue;
    Exit;
  end;

  length := count * quantum;
  if quantum <> (length div count) then begin
    Result := MagickTrue;
  end else begin
    if @extent <> nil then begin
      extent := length;
    end;
    Result := MagickFalse;
  end;
end;

// ===

function MagickImageCoderSignature: Tsize_t;
begin
  MagickImageCoderSignature := Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
end;

function MagickImageFilterSignature: Tsize_t;
begin
  MagickImageFilterSignature := Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
end;

// ====

function ClampPixelRed(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := ClampToQuantum(pixel^.red);
end;

function ClampPixelGreen(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := ClampToQuantum(pixel^.green);
end;

function ClampPixelBlue(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := ClampToQuantum(pixel^.blue);
end;

function ClampPixelIndex(indexes: PIndexPacket): TQuantum;
begin
  Result := ClampToQuantum(indexes^);
end;

function ClampPixelOpacity(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := ClampToQuantum(pixel^.opacity);
end;

function GetPixela(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.green;
end;

function GetPixelb(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.blue;
end;

function GetPixelAlpha(pixel: PPixelPacket): double; inline;
begin
  Result := double(QuantumRange) - double(pixel^.opacity);
end;

function GetPixelBlack(indexes: PIndexPacket): TQuantum;
begin
  Result := indexes^;
end;

function GetPixelBlue(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.blue;
end;

function GetPixelCb(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.green;
end;

function GetPixelCr(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.blue;
end;

function GetPixelCyan(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.red;
end;

function GetPixelGray(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.red;
end;

function GetPixelGreen(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.green;
end;

function GetPixelIndex(indexes: PIndexPacket): TQuantum;
begin
  Result := indexes^;
end;

function GetPixelL(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.red;
end;

function GetPixelLabel(pixel: PPixelPacket): nativeint; inline;
begin
  Result := nativeint(pixel^.red);
end;

function GetPixelMagenta(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.green;
end;

function GetPixelNext(pixel: PPixelPacket): PPixelPacket; inline;
begin
  Result := pixel + 1;
end;

function GetPixelOpacity(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.opacity;
end;

function GetPixelRed(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.red;
end;

procedure GetPixelRGB(pixel: PPixelPacket; packet: PPixelPacket); inline;
begin
  packet^.red := GetPixelRed(pixel);
  packet^.green := GetPixelGreen(pixel);
  packet^.blue := GetPixelBlue(pixel);
end;

procedure GetPixelRGBO(pixel: PPixelPacket; packet: PPixelPacket); inline;
begin
  packet^.red := GetPixelRed(pixel);
  packet^.green := GetPixelGreen(pixel);
  packet^.blue := GetPixelBlue(pixel);
  packet^.opacity := GetPixelOpacity(pixel);
end;

function GetPixelY(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.red;
end;

function GetPixelYellow(pixel: PPixelPacket): TQuantum; inline;
begin
  Result := pixel^.blue;
end;

procedure SetPixela(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.green := value;
end;

procedure SetPixelAlpha(pixel: PPixelPacket; value: double); inline;
begin
  pixel^.opacity := Round(double(QuantumRange) - value);
end;

procedure SetPixelb(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.blue := value;
end;

procedure SetPixelBlack(indexes: PIndexPacket; value: TQuantum); inline;
begin
  indexes^ := value;
end;

procedure SetPixelBlue(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.blue := value;
end;

procedure SetPixelCb(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.green := value;
end;

procedure SetPixelCr(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.blue := value;
end;

procedure SetPixelCyan(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.red := value;
end;

procedure SetPixelGray(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.red := value;
  pixel^.green := value;
  pixel^.blue := value;
end;

procedure SetPixelGreen(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.green := value;
end;

procedure SetPixelIndex(indexes: PIndexPacket; value: TIndexPacket); inline;
begin
  indexes^ := value;
end;

procedure SetPixelL(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.red := value;
end;

procedure SetPixelMagenta(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.green := value;
end;

procedure SetPixelOpacity(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.opacity := value;
end;

procedure SetPixelRed(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.red := value;
end;

procedure SetPixelRgb(pixel: PPixelPacket; packet: PPixelPacket); inline;
begin
  SetPixelRed(pixel, packet^.red);
  SetPixelGreen(pixel, packet^.green);
  SetPixelBlue(pixel, packet^.blue);
end;

procedure SetPixelRGBA(pixel: PPixelPacket; packet: PPixelPacket); inline;
begin
  SetPixelRed(pixel, packet^.red);
  SetPixelGreen(pixel, packet^.green);
  SetPixelBlue(pixel, packet^.blue);
  SetPixelAlpha(pixel, double(packet^.opacity));
end;

procedure SetPixelRGBO(pixel: PPixelPacket; packet: PPixelPacket); inline;
begin
  SetPixelRed(pixel, packet^.red);
  SetPixelGreen(pixel, packet^.green);
  SetPixelBlue(pixel, packet^.blue);
  SetPixelOpacity(pixel, packet^.opacity);
end;

procedure SetPixelYellow(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.blue := value;
end;

procedure SetPixelY(pixel: PPixelPacket; value: TQuantum); inline;
begin
  pixel^.red := value;
end;

// ====

function AbsolutePixelValue(x: TMagickRealType): TMagickRealType; inline;
begin
  if x < 0.0 then begin
    Result := -x;
  end else begin
    Result := x;
  end;
end;

function ClampPixel(value: TMagickRealType): TQuantum; inline;
begin
  if value < 0.0 then begin
    Result := 0;
  end else if value >= TMagickRealType(QuantumRange) then begin
    Result := QuantumRange;
  end else begin
    Result := Round(value + 0.5);
  end;
end;

function PerceptibleReciprocal(x: double): double; inline;
var
  sign: double;
begin
  if x < 0.0 then begin
    sign := -1.0;
  end else begin
    sign := 1.0;
  end;
  if (sign * x) >= MagickEpsilon then begin
    Result := 1.0 / x;
  end else begin
    Result := sign / MagickEpsilon;
  end;
end;

function GetPixelLuma(image: PImage; pixel: PPixelPacket): TMagickRealType; inline;
begin
  Result := 0.212656 * pixel^.red + 0.715158 * pixel^.green + 0.072186 * pixel^.blue;
end;

function GetPixelLuminance(image: PImage; pixel: PPixelPacket): TMagickRealType; inline;
begin
  Result := 0.212656 * DecodePixelGamma(pixel^.red) +
    0.715158 * DecodePixelGamma(pixel^.green) +
    0.072186 * DecodePixelGamma(pixel^.blue);
end;

procedure GetPixelPacketRGBA(red, green, blue, opacity: TQuantum; pixel: PPixelPacket); inline;
begin
  pixel^.red := red;
  pixel^.green := green;
  pixel^.blue := blue;
  pixel^.opacity := opacity;
end;

function IsPixelAtDepth(pixel, range: TQuantumAny): TMagickBooleanType; inline;
var
  quantum: TQuantum;
begin
  if range = 0 then begin
    Result := MagickTrue;
    Exit;
  end;
  quantum := round((QuantumRange * TQuantumAny((TMagickRealType(range * pixel) / QuantumRange + 0.5)) / range + 0.5));
  Result := (pixel = quantum);
end;

function IsPixelGray(pixel: PPixelPacket): TMagickBooleanType; inline;
var
  red_green, green_blue: TMagickRealType;
begin
  red_green := pixel^.red - pixel^.green;
  green_blue := pixel^.green - pixel^.blue;
  Result := ((QuantumScale * AbsolutePixelValue(red_green)) < MagickEpsilon) and
    ((QuantumScale * AbsolutePixelValue(green_blue)) < MagickEpsilon);
end;

function IsPixelMonochrome(pixel: PPixelPacket): TMagickBooleanType; inline;
var
  red, red_green, green_blue: TMagickRealType;
begin
  red := pixel^.red;
  if (AbsolutePixelValue(red) >= MagickEpsilon) and
    (AbsolutePixelValue(red - QuantumRange) >= MagickEpsilon) then begin
    Result := MagickFalse;
    Exit;
  end;
  red_green := pixel^.red - pixel^.green;
  green_blue := pixel^.green - pixel^.blue;
  Result := ((QuantumScale * AbsolutePixelValue(red_green)) < MagickEpsilon) and
    ((QuantumScale * AbsolutePixelValue(green_blue)) < MagickEpsilon);
end;

function PixelPacketIntensity(pixel: PPixelPacket): TQuantum; inline;
var
  intensity: TMagickRealType;
begin
  if (pixel^.red = pixel^.green) and (pixel^.green = pixel^.blue) then begin
    Result := pixel^.red;
    Exit;
  end;
  intensity := 0.212656 * pixel^.red + 0.715158 * pixel^.green + 0.072186 * pixel^.blue;
  Result := ClampToQuantum(intensity);
end;

procedure SetPixelViaMagickPixel(image: PImage; magick_pixel: PMagickPixelPacket; pixel: PPixelPacket); inline;
begin
  pixel^.red := ClampToQuantum(magick_pixel^.red);
  pixel^.green := ClampToQuantum(magick_pixel^.green);
  pixel^.blue := ClampToQuantum(magick_pixel^.blue);
  pixel^.opacity := ClampToQuantum(magick_pixel^.opacity);
end;

// ===

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

// ===

function MagickResourceInfinity: DWord;
begin
  MagickResourceInfinity := (not 0) shr 1;
end;

{$ENDIF read_implementation}
