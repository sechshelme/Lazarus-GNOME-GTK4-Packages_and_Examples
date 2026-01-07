unit draw;

interface

uses
  fp_magiccore, magick_type, pixel, geometry, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAlignType = ^TAlignType;
  TAlignType = longint;

const
  UndefinedAlign = 0;
  LeftAlign = 1;
  CenterAlign = 2;
  RightAlign = 3;

type
  PClipPathUnits = ^TClipPathUnits;
  TClipPathUnits = longint;

const
  UndefinedPathUnits = 0;
  UserSpace = 1;
  UserSpaceOnUse = 2;
  ObjectBoundingBox = 3;

type
  PDecorationType = ^TDecorationType;
  TDecorationType = longint;

const
  UndefinedDecoration = 0;
  NoDecoration = 1;
  UnderlineDecoration = 2;
  OverlineDecoration = 3;
  LineThroughDecoration = 4;

type
  PDirectionType = ^TDirectionType;
  TDirectionType = longint;

const
  UndefinedDirection = 0;
  RightToLeftDirection = 1;
  LeftToRightDirection = 2;
  TopToBottomDirection = 3;

type
  PFillRule = ^TFillRule;
  TFillRule = longint;

const
  UndefinedRule = 0;
  EvenOddRule = 1;
  NonZeroRule = 2;

type
  PGradientType = ^TGradientType;
  TGradientType = longint;

const
  UndefinedGradient = 0;
  LinearGradient = 1;
  RadialGradient = 2;

type
  PLineCap = ^TLineCap;
  TLineCap = longint;

const
  UndefinedCap = 0;
  ButtCap = 1;
  RoundCap = 2;
  SquareCap = 3;

type
  PLineJoin = ^TLineJoin;
  TLineJoin = longint;

const
  UndefinedJoin = 0;
  MiterJoin = 1;
  RoundJoin = 2;
  BevelJoin = 3;

type
  PPaintMethod = ^TPaintMethod;
  TPaintMethod = longint;

const
  UndefinedMethod = 0;
  PointMethod = 1;
  ReplaceMethod = 2;
  FloodfillMethod = 3;
  FillToBorderMethod = 4;
  ResetMethod = 5;

type
  PPrimitiveType = ^TPrimitiveType;
  TPrimitiveType = longint;

const
  UndefinedPrimitive = 0;
  PointPrimitive = 1;
  LinePrimitive = 2;
  RectanglePrimitive = 3;
  RoundRectanglePrimitive = 4;
  ArcPrimitive = 5;
  EllipsePrimitive = 6;
  CirclePrimitive = 7;
  PolylinePrimitive = 8;
  PolygonPrimitive = 9;
  BezierPrimitive = 10;
  ColorPrimitive = 11;
  MattePrimitive = 12;
  TextPrimitive = 13;
  ImagePrimitive = 14;
  PathPrimitive = 15;

type
  PReferenceType = ^TReferenceType;
  TReferenceType = longint;

const
  UndefinedReference = 0;
  GradientReference = 1;

type
  PSpreadMethod = ^TSpreadMethod;
  TSpreadMethod = longint;

const
  UndefinedSpread = 0;
  PadSpread = 1;
  ReflectSpread = 2;
  RepeatSpread = 3;

type
  TPointInfo = record
    x: double;
    y: double;
  end;
  PPointInfo = ^TPointInfo;

  TStopInfo = record
    color: TMagickPixelPacket;
    offset: TMagickRealType;
  end;
  PStopInfo = ^TStopInfo;

  TGradientInfo = record
    _type: TGradientType;
    bounding_box: TRectangleInfo;
    gradient_vector: TSegmentInfo;
    stops: PStopInfo;
    number_stops: Tsize_t;
    spread: TSpreadMethod;
    debug: TMagickBooleanType;
    signature: Tsize_t;
    center: TPointInfo;
    radius: TMagickRealType;
    angle: TMagickRealType;
    radii: TPointInfo;
  end;
  PGradientInfo = ^TGradientInfo;

  PElementReference = ^TElementReference;

  TElementReference = record
    id: pchar;
    _type: TReferenceType;
    gradient: TGradientInfo;
    signature: Tsize_t;
    previous: PElementReference;
    next: PElementReference;
  end;

  TDrawInfo = record
    //primitive: pchar;
    //geometry: pchar;
    //viewbox: TRectangleInfo;
    //affine: TAffineMatrix;
    //gravity: TGravityType;
    //fill: TPixelPacket;
    //stroke: TPixelPacket;
    //stroke_width: double;
    //gradient: TGradientInfo;
    //fill_pattern: PImage;
    //tile: PImage;
    //stroke_pattern: PImage;
    //stroke_antialias: TMagickBooleanType;
    //text_antialias: TMagickBooleanType;
    //fill_rule: TFillRule;
    //linecap: TLineCap;
    //linejoin: TLineJoin;
    //miterlimit: Tsize_t;
    //dash_offset: double;
    //decorate: TDecorationType;
    //compose: TCompositeOperator;
    //text: pchar;
    //face: Tsize_t;
    //font: pchar;
    //metrics: pchar;
    //family: pchar;
    //style: TStyleType;
    //stretch: TStretchType;
    //weight: Tsize_t;
    //encoding: pchar;
    //pointsize: Tdouble;
    //density: pchar;
    //align: TAlignType;
    //undercolor: TPixelPacket;
    //border_color: TPixelPacket;
    //server_name: pchar;
    //dash_pattern: Pdouble;
    //clip_mask: pchar;
    //bounds: TSegmentInfo;
    //clip_units: TClipPathUnits;
    //opacity: TQuantum;
    //render: TMagickBooleanType;
    //element_reference: TElementReference;
    //debug: TMagickBooleanType;
    //signature: Tsize_t;
    //kerning: Tdouble;
    //interword_spacing: Tdouble;
    //interline_spacing: Tdouble;
    //direction: TDirectionType;
    //fill_opacity: Tdouble;
    //stroke_opacity: Tdouble;
    //clip_path: TMagickBooleanType;
    //clipping_mask: PImage;
    //compliance: TComplianceType;
    //composite_mask: PImage;
    //id: pchar;
    //image_info: PImageInfo;
  end;
  PDrawInfo = ^TDrawInfo;

  TPrimitiveInfo = record
    point: TPointInfo;
    coordinates: Tsize_t;
    primitive: TPrimitiveType;
    method: TPaintMethod;
    text: pchar;
    closed_subpath: TMagickBooleanType;
  end;
  PPrimitiveInfo = ^TPrimitiveInfo;

  TTypeMetric = record
    pixels_per_em: TPointInfo;
    ascent: double;
    descent: double;
    width: double;
    height: double;
    max_advance: double;
    underline_position: double;
    underline_thickness: double;
    bounds: TSegmentInfo;
    origin: TPointInfo;
  end;
  PTypeMetric = ^TTypeMetric;

function AcquireDrawInfo: PDrawInfo; cdecl; external libmagiccore;
function CloneDrawInfo(para1: PImageInfo; para2: PDrawInfo): PDrawInfo; cdecl; external libmagiccore;
function DestroyDrawInfo(para1: PDrawInfo): PDrawInfo; cdecl; external libmagiccore;
function DrawAffineImage(para1: PImage; para2: PImage; para3: PAffineMatrix): TMagickBooleanType; cdecl; external libmagiccore;
function DrawClipPath(para1: PImage; para2: PDrawInfo; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function DrawGradientImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagiccore;
function DrawImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagiccore;
function DrawPatternPath(para1: PImage; para2: PDrawInfo; para3: pchar; para4: PPImage): TMagickBooleanType; cdecl; external libmagiccore;
function DrawPrimitive(para1: PImage; para2: PDrawInfo; para3: PPrimitiveInfo): TMagickBooleanType; cdecl; external libmagiccore;
procedure GetAffineMatrix(para1: PAffineMatrix); cdecl; external libmagiccore;
procedure GetDrawInfo(para1: PImageInfo; para2: PDrawInfo); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 14:40:22 ===


implementation



end.
