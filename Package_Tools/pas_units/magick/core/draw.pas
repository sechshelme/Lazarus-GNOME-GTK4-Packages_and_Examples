unit draw;

interface

uses
  fp_magiccore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.

  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at

    https://imagemagick.org/script/license.php

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore drawing methods.
 }
{$ifndef MAGICKCORE_DRAW_H}
{$define MAGICKCORE_DRAW_H}
{$include "magick/geometry.h"}
{$include "magick/image.h"}
{$include "magick/pixel.h"}
{$include "magick/type.h"}
{$include "magick/color.h"}
type
  PAlignType = ^TAlignType;
  TAlignType =  Longint;
  Const
    UndefinedAlign = 0;
    LeftAlign = 1;
    CenterAlign = 2;
    RightAlign = 3;
;
type
  PClipPathUnits = ^TClipPathUnits;
  TClipPathUnits =  Longint;
  Const
    UndefinedPathUnits = 0;
    UserSpace = 1;
    UserSpaceOnUse = 2;
    ObjectBoundingBox = 3;
;
type
  PDecorationType = ^TDecorationType;
  TDecorationType =  Longint;
  Const
    UndefinedDecoration = 0;
    NoDecoration = 1;
    UnderlineDecoration = 2;
    OverlineDecoration = 3;
    LineThroughDecoration = 4;
;
type
  PDirectionType = ^TDirectionType;
  TDirectionType =  Longint;
  Const
    UndefinedDirection = 0;
    RightToLeftDirection = 1;
    LeftToRightDirection = 2;
    TopToBottomDirection = 3;
;
{$undef EvenOddRule}
type
  PFillRule = ^TFillRule;
  TFillRule =  Longint;
  Const
    UndefinedRule = 0;
    EvenOddRule = 1;
    NonZeroRule = 2;
;
type
  PGradientType = ^TGradientType;
  TGradientType =  Longint;
  Const
    UndefinedGradient = 0;
    LinearGradient = 1;
    RadialGradient = 2;
;
type
  PLineCap = ^TLineCap;
  TLineCap =  Longint;
  Const
    UndefinedCap = 0;
    ButtCap = 1;
    RoundCap = 2;
    SquareCap = 3;
;
type
  PLineJoin = ^TLineJoin;
  TLineJoin =  Longint;
  Const
    UndefinedJoin = 0;
    MiterJoin = 1;
    RoundJoin = 2;
    BevelJoin = 3;
;
type
  PPaintMethod = ^TPaintMethod;
  TPaintMethod =  Longint;
  Const
    UndefinedMethod = 0;
    PointMethod = 1;
    ReplaceMethod = 2;
    FloodfillMethod = 3;
    FillToBorderMethod = 4;
    ResetMethod = 5;
;
type
  PPrimitiveType = ^TPrimitiveType;
  TPrimitiveType =  Longint;
  Const
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
;
type
  PReferenceType = ^TReferenceType;
  TReferenceType =  Longint;
  Const
    UndefinedReference = 0;
    GradientReference = 1;
;
type
  PSpreadMethod = ^TSpreadMethod;
  TSpreadMethod =  Longint;
  Const
    UndefinedSpread = 0;
    PadSpread = 1;
    ReflectSpread = 2;
    RepeatSpread = 3;
;
type
  PPointInfo = ^TPointInfo;
  TPointInfo = record
      x : Tdouble;
      y : Tdouble;
    end;

  PStopInfo = ^TStopInfo;
  TStopInfo = record
      color : TMagickPixelPacket;
      offset : TMagickRealType;
    end;

  PGradientInfo = ^TGradientInfo;
  TGradientInfo = record
      _type : TGradientType;
      bounding_box : TRectangleInfo;
      gradient_vector : TSegmentInfo;
      stops : PStopInfo;
      number_stops : Tsize_t;
      spread : TSpreadMethod;
      debug : TMagickBooleanType;
      signature : Tsize_t;
      center : TPointInfo;
      radius : TMagickRealType;
      angle : TMagickRealType;
      radii : TPointInfo;
    end;

  PElementReference = ^TElementReference;
  TElementReference = record
      id : Pchar;
      _type : TReferenceType;
      gradient : TGradientInfo;
      signature : Tsize_t;
      previous : PElementReference;
      next : PElementReference;
    end;

  PDrawInfo = ^TDrawInfo;
  TDrawInfo = record
      primitive : Pchar;
      geometry : Pchar;
      viewbox : TRectangleInfo;
      affine : TAffineMatrix;
      gravity : TGravityType;
      fill : TPixelPacket;
      stroke : TPixelPacket;
      stroke_width : Tdouble;
      gradient : TGradientInfo;
      fill_pattern : PImage;
      tile : PImage;
      stroke_pattern : PImage;
      stroke_antialias : TMagickBooleanType;
      text_antialias : TMagickBooleanType;
      fill_rule : TFillRule;
      linecap : TLineCap;
      linejoin : TLineJoin;
      miterlimit : Tsize_t;
      dash_offset : Tdouble;
      decorate : TDecorationType;
      compose : TCompositeOperator;
      text : Pchar;
      face : Tsize_t;
      font : Pchar;
      metrics : Pchar;
      family : Pchar;
      style : TStyleType;
      stretch : TStretchType;
      weight : Tsize_t;
      encoding : Pchar;
      pointsize : Tdouble;
      density : Pchar;
      align : TAlignType;
      undercolor : TPixelPacket;
      border_color : TPixelPacket;
      server_name : Pchar;
      dash_pattern : Pdouble;
      clip_mask : Pchar;
      bounds : TSegmentInfo;
      clip_units : TClipPathUnits;
      opacity : TQuantum;
      render : TMagickBooleanType;
      element_reference : TElementReference;
      debug : TMagickBooleanType;
      signature : Tsize_t;
      kerning : Tdouble;
      interword_spacing : Tdouble;
      interline_spacing : Tdouble;
      direction : TDirectionType;
      fill_opacity : Tdouble;
      stroke_opacity : Tdouble;
      clip_path : TMagickBooleanType;
      clipping_mask : PImage;
      compliance : TComplianceType;
      composite_mask : PImage;
      id : Pchar;
      image_info : PImageInfo;
    end;

  PPrimitiveInfo = ^TPrimitiveInfo;
  TPrimitiveInfo = record
      point : TPointInfo;
      coordinates : Tsize_t;
      primitive : TPrimitiveType;
      method : TPaintMethod;
      text : Pchar;
      closed_subpath : TMagickBooleanType;
    end;

  PTypeMetric = ^TTypeMetric;
  TTypeMetric = record
      pixels_per_em : TPointInfo;
      ascent : Tdouble;
      descent : Tdouble;
      width : Tdouble;
      height : Tdouble;
      max_advance : Tdouble;
      underline_position : Tdouble;
      underline_thickness : Tdouble;
      bounds : TSegmentInfo;
      origin : TPointInfo;
    end;

function AcquireDrawInfo:PDrawInfo;cdecl;external libmagiccore;
function CloneDrawInfo(para1:PImageInfo; para2:PDrawInfo):PDrawInfo;cdecl;external libmagiccore;
function DestroyDrawInfo(para1:PDrawInfo):PDrawInfo;cdecl;external libmagiccore;
function DrawAffineImage(para1:PImage; para2:PImage; para3:PAffineMatrix):TMagickBooleanType;cdecl;external libmagiccore;
function DrawClipPath(para1:PImage; para2:PDrawInfo; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function DrawGradientImage(para1:PImage; para2:PDrawInfo):TMagickBooleanType;cdecl;external libmagiccore;
function DrawImage(para1:PImage; para2:PDrawInfo):TMagickBooleanType;cdecl;external libmagiccore;
function DrawPatternPath(para1:PImage; para2:PDrawInfo; para3:Pchar; para4:PPImage):TMagickBooleanType;cdecl;external libmagiccore;
function DrawPrimitive(para1:PImage; para2:PDrawInfo; para3:PPrimitiveInfo):TMagickBooleanType;cdecl;external libmagiccore;
procedure GetAffineMatrix(para1:PAffineMatrix);cdecl;external libmagiccore;
procedure GetDrawInfo(para1:PImageInfo; para2:PDrawInfo);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 14:40:22 ===


implementation



end.
