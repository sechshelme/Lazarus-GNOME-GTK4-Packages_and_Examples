{$IFDEF read_interface}


type
  PCompressionType = ^TCompressionType;
  TCompressionType = longint;

const
  UndefinedCompression = 0;
  NoCompression = 1;
  BZipCompression = 2;
  DXT1Compression = 3;
  DXT3Compression = 4;
  DXT5Compression = 5;
  FaxCompression = 6;
  Group4Compression = 7;
  JPEGCompression = 8;
  JPEG2000Compression = 9;
  LosslessJPEGCompression = 10;
  LZWCompression = 11;
  RLECompression = 12;
  ZipCompression = 13;
  ZipSCompression = 14;
  PizCompression = 15;
  Pxr24Compression = 16;
  B44Compression = 17;
  B44ACompression = 18;
  LZMACompression = 19;
  JBIG1Compression = 20;
  JBIG2Compression = 21;
  ZstdCompression = 22;
  WebPCompression = 23;

type
  PAscii85Info = type Pointer;

function HuffmanDecodeImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function HuffmanEncodeImage(para1: PImageInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function LZWEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
function PackbitsEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
function ZLIBEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
procedure Ascii85Encode(para1: PImage; para2: byte); cdecl; external libmagickcore;
procedure Ascii85Flush(para1: PImage); cdecl; external libmagickcore;
procedure Ascii85Initialize(para1: PImage); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
