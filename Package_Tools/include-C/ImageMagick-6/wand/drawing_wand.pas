unit drawing_wand;

interface

uses
  fp_magiccore, fp_magicwand;

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

function DrawGetTextAlignment(para1:PDrawingWand):TAlignType;cdecl;external libmagicwand;
function DrawGetClipPath(para1:PDrawingWand):Pchar;cdecl;external libmagicwand;
function DrawGetDensity(para1:PDrawingWand):Pchar;cdecl;external libmagicwand;
function DrawGetException(para1:PDrawingWand; para2:PExceptionType):Pchar;cdecl;external libmagicwand;
function DrawGetFont(para1:PDrawingWand):Pchar;cdecl;external libmagicwand;
function DrawGetFontFamily(para1:PDrawingWand):Pchar;cdecl;external libmagicwand;
function DrawGetTextEncoding(para1:PDrawingWand):Pchar;cdecl;external libmagicwand;
function DrawGetVectorGraphics(para1:PDrawingWand):Pchar;cdecl;external libmagicwand;
function DrawGetClipUnits(para1:PDrawingWand):TClipPathUnits;cdecl;external libmagicwand;
function DrawGetTextDecoration(para1:PDrawingWand):TDecorationType;cdecl;external libmagicwand;
function DrawGetTextDirection(para1:PDrawingWand):TDirectionType;cdecl;external libmagicwand;
function DrawGetFillOpacity(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetFontSize(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetOpacity(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetStrokeDashArray(para1:PDrawingWand; para2:Psize_t):Pdouble;cdecl;external libmagicwand;
function DrawGetStrokeDashOffset(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetStrokeOpacity(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetStrokeWidth(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetTextKerning(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetTextInterlineSpacing(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetTextInterwordSpacing(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function PeekDrawingWand(para1:PDrawingWand):PDrawInfo;cdecl;external libmagicwand;
function AcquireDrawingWand(para1:PDrawInfo; para2:PImage):PDrawingWand;cdecl;external libmagicwand;
function CloneDrawingWand(para1:PDrawingWand):PDrawingWand;cdecl;external libmagicwand;
function DestroyDrawingWand(para1:PDrawingWand):PDrawingWand;cdecl;external libmagicwand;
function NewDrawingWand:PDrawingWand;cdecl;external libmagicwand;
function DrawGetExceptionType(para1:PDrawingWand):TExceptionType;cdecl;external libmagicwand;
function DrawGetClipRule(para1:PDrawingWand):TFillRule;cdecl;external libmagicwand;
function DrawGetGravity(para1:PDrawingWand):TGravityType;cdecl;external libmagicwand;
function DrawGetStrokeLineCap(para1:PDrawingWand):TLineCap;cdecl;external libmagicwand;
function DrawGetStrokeLineJoin(para1:PDrawingWand):TLineJoin;cdecl;external libmagicwand;
function DrawClearException(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawComposite(para1:PDrawingWand; para2:TCompositeOperator; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble; para7:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawGetFontResolution(para1:PDrawingWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function DrawGetStrokeAntialias(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawGetTextAntialias(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawPopPattern(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawPushPattern(para1:PDrawingWand; para2:Pchar; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function DrawRender(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetClipPath(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetDensity(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetFillPatternURL(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetFont(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetFontFamily(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetFontResolution(para1:PDrawingWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetStrokeDashArray(para1:PDrawingWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetStrokePatternURL(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function DrawSetVectorGraphics(para1:PDrawingWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function IsDrawingWand(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function PopDrawingWand(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function PushDrawingWand(para1:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function DrawGetFontStretch(para1:PDrawingWand):TStretchType;cdecl;external libmagicwand;
function DrawGetFontStyle(para1:PDrawingWand):TStyleType;cdecl;external libmagicwand;
function DrawGetFontWeight(para1:PDrawingWand):Tsize_t;cdecl;external libmagicwand;
function DrawGetStrokeMiterLimit(para1:PDrawingWand):Tsize_t;cdecl;external libmagicwand;
procedure ClearDrawingWand(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawAffine(para1:PDrawingWand; para2:PAffineMatrix);cdecl;external libmagicwand;
procedure DrawAnnotation(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Pbyte);cdecl;external libmagicwand;
procedure DrawArc(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external libmagicwand;
procedure DrawBezier(para1:PDrawingWand; para2:Tsize_t; para3:PPointInfo);cdecl;external libmagicwand;
procedure DrawGetBorderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawCircle(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawColor(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:TPaintMethod);cdecl;external libmagicwand;
procedure DrawComment(para1:PDrawingWand; para2:Pchar);cdecl;external libmagicwand;
procedure DrawEllipse(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external libmagicwand;
procedure DrawGetFillColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawGetStrokeColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawSetTextKerning(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetTextInterlineSpacing(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetTextInterwordSpacing(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawGetTextUnderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawLine(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawMatte(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:TPaintMethod);cdecl;external libmagicwand;
procedure DrawPathClose(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawPathCurveToAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToQuadraticBezierAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToQuadraticBezierRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToQuadraticBezierSmoothAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToQuadraticBezierSmoothRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToSmoothAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawPathCurveToSmoothRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawPathEllipticArcAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:TMagickBooleanType; 
            para6:TMagickBooleanType; para7:Tdouble; para8:Tdouble);cdecl;external libmagicwand;
procedure DrawPathEllipticArcRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:TMagickBooleanType; 
            para6:TMagickBooleanType; para7:Tdouble; para8:Tdouble);cdecl;external libmagicwand;
procedure DrawPathFinish(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawPathLineToAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPathLineToRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPathLineToHorizontalAbsolute(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawPathLineToHorizontalRelative(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawPathLineToVerticalAbsolute(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawPathLineToVerticalRelative(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawPathMoveToAbsolute(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPathMoveToRelative(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPathStart(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawPoint(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawPolygon(para1:PDrawingWand; para2:Tsize_t; para3:PPointInfo);cdecl;external libmagicwand;
procedure DrawPolyline(para1:PDrawingWand; para2:Tsize_t; para3:PPointInfo);cdecl;external libmagicwand;
procedure DrawPopClipPath(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawPopDefs(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawPushClipPath(para1:PDrawingWand; para2:Pchar);cdecl;external libmagicwand;
procedure DrawPushDefs(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawRectangle(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external libmagicwand;
procedure DrawResetVectorGraphics(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawRotate(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawRoundRectangle(para1:PDrawingWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
            para6:Tdouble; para7:Tdouble);cdecl;external libmagicwand;
procedure DrawScale(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
procedure DrawSetBorderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawSetClipRule(para1:PDrawingWand; para2:TFillRule);cdecl;external libmagicwand;
procedure DrawSetClipUnits(para1:PDrawingWand; para2:TClipPathUnits);cdecl;external libmagicwand;
procedure DrawSetFillColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawSetFillOpacity(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetFillRule(para1:PDrawingWand; para2:TFillRule);cdecl;external libmagicwand;
procedure DrawSetFontSize(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetFontStretch(para1:PDrawingWand; para2:TStretchType);cdecl;external libmagicwand;
procedure DrawSetFontStyle(para1:PDrawingWand; para2:TStyleType);cdecl;external libmagicwand;
procedure DrawSetFontWeight(para1:PDrawingWand; para2:Tsize_t);cdecl;external libmagicwand;
procedure DrawSetGravity(para1:PDrawingWand; para2:TGravityType);cdecl;external libmagicwand;
procedure DrawSetOpacity(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetStrokeAntialias(para1:PDrawingWand; para2:TMagickBooleanType);cdecl;external libmagicwand;
procedure DrawSetStrokeColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawSetStrokeDashOffset(para1:PDrawingWand; dashoffset:Tdouble);cdecl;external libmagicwand;
procedure DrawSetStrokeLineCap(para1:PDrawingWand; para2:TLineCap);cdecl;external libmagicwand;
procedure DrawSetStrokeLineJoin(para1:PDrawingWand; para2:TLineJoin);cdecl;external libmagicwand;
procedure DrawSetStrokeMiterLimit(para1:PDrawingWand; para2:Tsize_t);cdecl;external libmagicwand;
procedure DrawSetStrokeOpacity(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetStrokeWidth(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetTextAlignment(para1:PDrawingWand; para2:TAlignType);cdecl;external libmagicwand;
procedure DrawSetTextAntialias(para1:PDrawingWand; para2:TMagickBooleanType);cdecl;external libmagicwand;
procedure DrawSetTextDecoration(para1:PDrawingWand; para2:TDecorationType);cdecl;external libmagicwand;
procedure DrawSetTextDirection(para1:PDrawingWand; para2:TDirectionType);cdecl;external libmagicwand;
procedure DrawSetTextEncoding(para1:PDrawingWand; para2:Pchar);cdecl;external libmagicwand;
procedure DrawSetTextUnderColor(para1:PDrawingWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure DrawSetViewbox(para1:PDrawingWand; para2:Tssize_t; para3:Tssize_t; para4:Tssize_t; para5:Tssize_t);cdecl;external libmagicwand;
procedure DrawSkewX(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSkewY(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawTranslate(para1:PDrawingWand; para2:Tdouble; para3:Tdouble);cdecl;external libmagicwand;
{$endif}

// === Konventiert am: 5-1-26 19:39:56 ===


implementation



end.
