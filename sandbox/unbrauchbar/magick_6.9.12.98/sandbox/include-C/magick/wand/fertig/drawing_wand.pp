
unit drawing_wand;
interface

{
  Automatically converted by H2Pas 1.0.0 from drawing_wand.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    drawing_wand.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAffineMatrix  = ^AffineMatrix;
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
PDrawInfo  = ^DrawInfo;
PDrawingWand  = ^DrawingWand;
PExceptionType  = ^ExceptionType;
PImage  = ^Image;
PMagickWand  = ^MagickWand;
PPixelWand  = ^PixelWand;
PPointInfo  = ^PointInfo;
Psize_t  = ^size_t;
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

  MagickWand drawing wand methods.
 }
{$ifndef MAGICKWAND_DRAWING_WAND_H}
{$define MAGICKWAND_DRAWING_WAND_H}
{$include "wand/pixel-wand.h"}
type
(* Const before type ignored *)

function DrawGetTextAlignment(para1:PDrawingWand):TAlignType;cdecl;external;
(* Const before type ignored *)
function DrawGetClipPath(para1:PDrawingWand):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetDensity(para1:PDrawingWand):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetException(para1:PDrawingWand; para2:PExceptionType):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetFont(para1:PDrawingWand):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetFontFamily(para1:PDrawingWand):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetTextEncoding(para1:PDrawingWand):Pchar;cdecl;external;
function DrawGetVectorGraphics(para1:PDrawingWand):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetClipUnits(para1:PDrawingWand):TClipPathUnits;cdecl;external;
(* Const before type ignored *)
function DrawGetTextDecoration(para1:PDrawingWand):TDecorationType;cdecl;external;
(* Const before type ignored *)
function DrawGetTextDirection(para1:PDrawingWand):TDirectionType;cdecl;external;
(* Const before type ignored *)
function DrawGetFillOpacity(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetFontSize(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetOpacity(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeDashArray(para1:PDrawingWand; para2:Psize_t):Pdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeDashOffset(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeOpacity(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeWidth(para1:PDrawingWand):Tdouble;cdecl;external;
function DrawGetTextKerning(para1:PDrawingWand):Tdouble;cdecl;external;
function DrawGetTextInterlineSpacing(para1:PDrawingWand):Tdouble;cdecl;external;
function DrawGetTextInterwordSpacing(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PeekDrawingWand(para1:PDrawingWand):PDrawInfo;cdecl;external;
(* Const before type ignored *)
function AcquireDrawingWand(para1:PDrawInfo; para2:PImage):PDrawingWand;cdecl;external;
(* Const before type ignored *)
function CloneDrawingWand(para1:PDrawingWand):PDrawingWand;cdecl;external;
function DestroyDrawingWand(para1:PDrawingWand):PDrawingWand;cdecl;external;
function NewDrawingWand:PDrawingWand;cdecl;external;
(* Const before type ignored *)
function DrawGetExceptionType(para1:PDrawingWand):TExceptionType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function DrawGetClipRule(para1:PDrawingWand):TFillRule;cdecl;external;
(* Const before type ignored *)
function DrawGetGravity(para1:PDrawingWand):TGravityType;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeLineCap(para1:PDrawingWand):TLineCap;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeLineJoin(para1:PDrawingWand):TLineJoin;cdecl;external;
function DrawClearException(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function DrawComposite(para1:PDrawingWand; para2:TCompositeOperator; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble; para7:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawGetFontResolution(para1:PDrawingWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeAntialias(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawGetTextAntialias(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
function DrawPopPattern(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function DrawPushPattern(para1:PDrawingWand; para2:Pchar; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble):TMagickBooleanType;cdecl;external;
function DrawRender(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetClipPath(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetDensity(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetFillPatternURL(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetFont(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetFontFamily(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function DrawSetFontResolution(para1:PDrawingWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function DrawSetStrokeDashArray(para1:PDrawingWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetStrokePatternURL(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawSetVectorGraphics(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsDrawingWand(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
function PopDrawingWand(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
function PushDrawingWand(para1:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DrawGetFontStretch(para1:PDrawingWand):TStretchType;cdecl;external;
(* Const before type ignored *)
function DrawGetFontStyle(para1:PDrawingWand):TStyleType;cdecl;external;
(* Const before type ignored *)
function DrawGetFontWeight(para1:PDrawingWand):Tsize_t;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeMiterLimit(para1:PDrawingWand):Tsize_t;cdecl;external;
procedure ClearDrawingWand(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
procedure DrawAffine(para1:PDrawingWand; para2:PAffineMatrix);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawAnnotation(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Pbyte);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawArc(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawBezier(para1:PDrawingWand; para2:Tsize_t; para3:PPointInfo);cdecl;external;
(* Const before type ignored *)
procedure DrawGetBorderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawCircle(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawColor(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:TPaintMethod);cdecl;external;
(* Const before type ignored *)
procedure DrawComment(para1:PDrawingWand; para2:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawEllipse(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawGetFillColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure DrawGetStrokeColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextKerning(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextInterlineSpacing(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextInterwordSpacing(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawGetTextUnderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawLine(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawMatte(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:TPaintMethod);cdecl;external;
procedure DrawPathClose(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToQuadraticBezierAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToQuadraticBezierRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToQuadraticBezierSmoothAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToQuadraticBezierSmoothRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToSmoothAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathCurveToSmoothRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathEllipticArcAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:TMagickBooleanType; 
            para6:TMagickBooleanType; para7:Tdouble; para8:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathEllipticArcRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:TMagickBooleanType; 
            para6:TMagickBooleanType; para7:Tdouble; para8:Tdouble);cdecl;external;
procedure DrawPathFinish(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathLineToAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathLineToRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawPathLineToHorizontalAbsolute(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawPathLineToHorizontalRelative(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawPathLineToVerticalAbsolute(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawPathLineToVerticalRelative(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathMoveToAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPathMoveToRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
procedure DrawPathStart(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPoint(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPolygon(para1:PDrawingWand; para2:Tsize_t; para3:PPointInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawPolyline(para1:PDrawingWand; para2:Tsize_t; para3:PPointInfo);cdecl;external;
procedure DrawPopClipPath(para1:PDrawingWand);cdecl;external;
procedure DrawPopDefs(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
procedure DrawPushClipPath(para1:PDrawingWand; para2:Pchar);cdecl;external;
procedure DrawPushDefs(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawRectangle(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
procedure DrawResetVectorGraphics(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
procedure DrawRotate(para1:PDrawingWand; para2:Tdouble);cdecl;external;
procedure DrawRoundRectangle(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawScale(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetBorderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure DrawSetClipRule(para1:PDrawingWand; para2:TFillRule);cdecl;external;
(* Const before type ignored *)
procedure DrawSetClipUnits(para1:PDrawingWand; para2:TClipPathUnits);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFillColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFillOpacity(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFillRule(para1:PDrawingWand; para2:TFillRule);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFontSize(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFontStretch(para1:PDrawingWand; para2:TStretchType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFontStyle(para1:PDrawingWand; para2:TStyleType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFontWeight(para1:PDrawingWand; para2:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure DrawSetGravity(para1:PDrawingWand; para2:TGravityType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetOpacity(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeAntialias(para1:PDrawingWand; para2:TMagickBooleanType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeDashOffset(para1:PDrawingWand; dashoffset:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeLineCap(para1:PDrawingWand; para2:TLineCap);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeLineJoin(para1:PDrawingWand; para2:TLineJoin);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeMiterLimit(para1:PDrawingWand; para2:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeOpacity(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeWidth(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextAlignment(para1:PDrawingWand; para2:TAlignType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextAntialias(para1:PDrawingWand; para2:TMagickBooleanType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextDecoration(para1:PDrawingWand; para2:TDecorationType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextDirection(para1:PDrawingWand; para2:TDirectionType);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextEncoding(para1:PDrawingWand; para2:Pchar);cdecl;external;
(* Const before type ignored *)
procedure DrawSetTextUnderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external;
procedure DrawSetViewbox(para1:PDrawingWand; para2:Tssize_t; para3:Tssize_t; para4:Tssize_t; para5:Tssize_t);cdecl;external;
(* Const before type ignored *)
procedure DrawSkewX(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSkewY(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure DrawTranslate(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external;
{$endif}

implementation


end.
