{$IFDEF read_interface}


type
  PDitherMethod = ^TDitherMethod;
  TDitherMethod = longint;

const
  UndefinedDitherMethod = 0;
  NoDitherMethod = 1;
  RiemersmaDitherMethod = 2;
  FloydSteinbergDitherMethod = 3;

type
  TQuantizeInfo = record
    number_colors: Tsize_t;
    tree_depth: Tsize_t;
    dither: TMagickBooleanType;
    colorspace: TColorspaceType;
    measure_error: TMagickBooleanType;
    signature: Tsize_t;
    dither_method: TDitherMethod;
  end;
  PQuantizeInfo = ^TQuantizeInfo;

function CompressImageColormap(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageQuantizeError(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function PosterizeImage(para1: PImage; para2: Tsize_t; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function PosterizeImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function QuantizeImage(para1: PQuantizeInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function QuantizeImages(para1: PQuantizeInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemapImage(para1: PQuantizeInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemapImages(para1: PQuantizeInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireQuantizeInfo(para1: PImageInfo): PQuantizeInfo; cdecl; external libmagickcore;
function CloneQuantizeInfo(para1: PQuantizeInfo): PQuantizeInfo; cdecl; external libmagickcore;
function DestroyQuantizeInfo(para1: PQuantizeInfo): PQuantizeInfo; cdecl; external libmagickcore;
procedure GetQuantizeInfo(para1: PQuantizeInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:54:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
