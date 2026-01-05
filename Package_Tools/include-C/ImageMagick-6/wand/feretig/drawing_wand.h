/*
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
*/
#ifndef MAGICKWAND_DRAWING_WAND_H
#define MAGICKWAND_DRAWING_WAND_H

#include "wand/pixel-wand.h"


typedef struct _DrawingWand
  DrawingWand;

extern  AlignType
  DrawGetTextAlignment(const DrawingWand *);

extern  char
  *DrawGetClipPath(const DrawingWand *);
extern  char
  *DrawGetDensity(const DrawingWand *);
extern  char
  *DrawGetException(const DrawingWand *,ExceptionType *);
extern  char
  *DrawGetFont(const DrawingWand *);
extern  char
  *DrawGetFontFamily(const DrawingWand *);
extern  char
  *DrawGetTextEncoding(const DrawingWand *);
extern  char
  *DrawGetVectorGraphics(DrawingWand *);

extern  ClipPathUnits
  DrawGetClipUnits(const DrawingWand *) ;

extern  DecorationType
  DrawGetTextDecoration(const DrawingWand *) ;

extern  DirectionType
  DrawGetTextDirection(const DrawingWand *);

extern  double
  DrawGetFillOpacity(const DrawingWand *) ;
extern  double
  DrawGetFontSize(const DrawingWand *) ;
extern  double
  DrawGetOpacity(const DrawingWand *) ;
extern  double
  *DrawGetStrokeDashArray(const DrawingWand *,size_t *);
extern  double
  DrawGetStrokeDashOffset(const DrawingWand *) ;
extern  double
  DrawGetStrokeOpacity(const DrawingWand *) ;
extern  double
  DrawGetStrokeWidth(const DrawingWand *) ;
extern  double
  DrawGetTextKerning(DrawingWand *) ;
extern  double
  DrawGetTextInterlineSpacing(DrawingWand *) ;
extern  double
  DrawGetTextInterwordSpacing(DrawingWand *) ;

extern  DrawInfo
  *PeekDrawingWand(const DrawingWand *);

extern  DrawingWand
  *AcquireDrawingWand(const DrawInfo *,Image *);
extern  DrawingWand
  *CloneDrawingWand(const DrawingWand *);
extern  DrawingWand
  *DestroyDrawingWand(DrawingWand *);
extern  DrawingWand
  *NewDrawingWand(void);

extern  ExceptionType
  DrawGetExceptionType(const DrawingWand *);

extern  FillRule
  DrawGetClipRule(const DrawingWand *) ,
  DrawGetFillRule(const DrawingWand *) ;

extern  GravityType
  DrawGetGravity(const DrawingWand *) ;

extern  LineCap
  DrawGetStrokeLineCap(const DrawingWand *) ;

extern  LineJoin
  DrawGetStrokeLineJoin(const DrawingWand *) ;

extern  MagickBooleanType
  DrawClearException(DrawingWand *);
extern  MagickBooleanType
  DrawComposite(DrawingWand *,const CompositeOperator,const double,const double,    const double,const double,MagickWand *);
extern  MagickBooleanType
  DrawGetFontResolution(const DrawingWand *,double *,double *);
extern  MagickBooleanType
  DrawGetStrokeAntialias(const DrawingWand *) ;
extern  MagickBooleanType
  DrawGetTextAntialias(const DrawingWand *) ;
extern  MagickBooleanType
  DrawPopPattern(DrawingWand *);
extern  MagickBooleanType
  DrawPushPattern(DrawingWand *,const char *,const double,const double,    const double,const double);
extern  MagickBooleanType
  DrawRender(DrawingWand *);
extern  MagickBooleanType
  DrawSetClipPath(DrawingWand *,const char *);
extern  MagickBooleanType
  DrawSetDensity(DrawingWand *,const char *);
extern  MagickBooleanType
  DrawSetFillPatternURL(DrawingWand *,const char *);
extern  MagickBooleanType
  DrawSetFont(DrawingWand *,const char *);
extern  MagickBooleanType
  DrawSetFontFamily(DrawingWand *,const char *);
extern  MagickBooleanType
  DrawSetFontResolution(DrawingWand *,const double,const double);
extern  MagickBooleanType
  DrawSetStrokeDashArray(DrawingWand *,const size_t,const double *);
extern  MagickBooleanType
  DrawSetStrokePatternURL(DrawingWand *,const char *);
extern  MagickBooleanType
  DrawSetVectorGraphics(DrawingWand *,const char *);
extern  MagickBooleanType
  IsDrawingWand(const DrawingWand *);
extern  MagickBooleanType
  PopDrawingWand(DrawingWand *);
extern  MagickBooleanType
  PushDrawingWand(DrawingWand *);

extern  StretchType
  DrawGetFontStretch(const DrawingWand *);

extern  StyleType
  DrawGetFontStyle(const DrawingWand *);

extern  size_t
  DrawGetFontWeight(const DrawingWand *) ;
extern  size_t
  DrawGetStrokeMiterLimit(const DrawingWand *) ;

extern  void
  ClearDrawingWand(DrawingWand *);
extern  void
  DrawAffine(DrawingWand *,const AffineMatrix *);
extern  void
  DrawAnnotation(DrawingWand *,const double,const double,const unsigned char *);
extern  void
  DrawArc(DrawingWand *,const double,const double,const double,const double,    const double,const double);
extern  void
  DrawBezier(DrawingWand *,const size_t,const PointInfo *);
extern  void
  DrawGetBorderColor(const DrawingWand *,PixelWand *);
extern  void
  DrawCircle(DrawingWand *,const double,const double,const double,const double);
extern  void
  DrawColor(DrawingWand *,const double,const double,const PaintMethod);
extern  void
  DrawComment(DrawingWand *,const char *);
extern  void
  DrawEllipse(DrawingWand *,const double,const double,const double,const double,    const double,const double);
extern  void
  DrawGetFillColor(const DrawingWand *,PixelWand *);
extern  void
  DrawGetStrokeColor(const DrawingWand *,PixelWand *);
extern  void
  DrawSetTextKerning(DrawingWand *,const double);
extern  void
  DrawSetTextInterlineSpacing(DrawingWand *,const double);
extern  void
  DrawSetTextInterwordSpacing(DrawingWand *,const double);
extern  void
  DrawGetTextUnderColor(const DrawingWand *,PixelWand *);
extern  void
  DrawLine(DrawingWand *,const double, const double,const double,const double);
extern  void
  DrawMatte(DrawingWand *,const double,const double,const PaintMethod);
extern  void
  DrawPathClose(DrawingWand *);
extern  void
  DrawPathCurveToAbsolute(DrawingWand *,const double,const double,const double,    const double,const double,const double);
extern  void
  DrawPathCurveToRelative(DrawingWand *,const double,const double,const double,    const double,const double, const double);
extern  void
  DrawPathCurveToQuadraticBezierAbsolute(DrawingWand *,const double,    const double,const double,const double);
extern  void
  DrawPathCurveToQuadraticBezierRelative(DrawingWand *,const double,    const double,const double,const double);
extern  void
  DrawPathCurveToQuadraticBezierSmoothAbsolute(DrawingWand *,const double,    const double);
extern  void
  DrawPathCurveToQuadraticBezierSmoothRelative(DrawingWand *,const double,    const double);
extern  void
  DrawPathCurveToSmoothAbsolute(DrawingWand *,const double,const double,    const double,const double);
extern  void
  DrawPathCurveToSmoothRelative(DrawingWand *,const double,const double,    const double,const double);
extern  void
  DrawPathEllipticArcAbsolute(DrawingWand *,const double,const double,    const double,const MagickBooleanType,const MagickBooleanType,const double,    const double);
extern  void
  DrawPathEllipticArcRelative(DrawingWand *,const double,const double,    const double,const MagickBooleanType,const MagickBooleanType,const double,    const double);
extern  void
  DrawPathFinish(DrawingWand *);
extern  void
  DrawPathLineToAbsolute(DrawingWand *,const double,const double);
extern  void
  DrawPathLineToRelative(DrawingWand *,const double,const double);
extern  void
  DrawPathLineToHorizontalAbsolute(DrawingWand *,const double);
extern  void
  DrawPathLineToHorizontalRelative(DrawingWand *,const double);
extern  void
  DrawPathLineToVerticalAbsolute(DrawingWand *,const double);
extern  void
  DrawPathLineToVerticalRelative(DrawingWand *,const double);
extern  void
  DrawPathMoveToAbsolute(DrawingWand *,const double,const double);
extern  void
  DrawPathMoveToRelative(DrawingWand *,const double,const double);
extern  void
  DrawPathStart(DrawingWand *);
extern  void
  DrawPoint(DrawingWand *,const double,const double);
extern  void
  DrawPolygon(DrawingWand *,const size_t,const PointInfo *);
extern  void
  DrawPolyline(DrawingWand *,const size_t,const PointInfo *);
extern  void
  DrawPopClipPath(DrawingWand *);
extern  void
  DrawPopDefs(DrawingWand *);
extern  void
  DrawPushClipPath(DrawingWand *,const char *);
extern  void
  DrawPushDefs(DrawingWand *);
extern  void
  DrawRectangle(DrawingWand *,const double,const double,const double,    const double);
extern  void
  DrawResetVectorGraphics(DrawingWand *);
extern  void
  DrawRotate(DrawingWand *,const double);
extern  void
  DrawRoundRectangle(DrawingWand *,double,double,double,double,double,double);
extern  void
  DrawScale(DrawingWand *,const double,const double);
extern  void
  DrawSetBorderColor(DrawingWand *,const PixelWand *);
extern  void
  DrawSetClipRule(DrawingWand *,const FillRule);
extern  void
  DrawSetClipUnits(DrawingWand *,const ClipPathUnits);
extern  void
  DrawSetFillColor(DrawingWand *,const PixelWand *);
extern  void
  DrawSetFillOpacity(DrawingWand *,const double);
extern  void
  DrawSetFillRule(DrawingWand *,const FillRule);
extern  void
  DrawSetFontSize(DrawingWand *,const double);
extern  void
  DrawSetFontStretch(DrawingWand *,const StretchType);
extern  void
  DrawSetFontStyle(DrawingWand *,const StyleType);
extern  void
  DrawSetFontWeight(DrawingWand *,const size_t);
extern  void
  DrawSetGravity(DrawingWand *,const GravityType);
extern  void
  DrawSetOpacity(DrawingWand *,const double);
extern  void
  DrawSetStrokeAntialias(DrawingWand *,const MagickBooleanType);
extern  void
  DrawSetStrokeColor(DrawingWand *,const PixelWand *);
extern  void
  DrawSetStrokeDashOffset(DrawingWand *,const double dashoffset);
extern  void
  DrawSetStrokeLineCap(DrawingWand *,const LineCap);
extern  void
  DrawSetStrokeLineJoin(DrawingWand *,const LineJoin);
extern  void
  DrawSetStrokeMiterLimit(DrawingWand *,const size_t);
extern  void
  DrawSetStrokeOpacity(DrawingWand *, const double);
extern  void
  DrawSetStrokeWidth(DrawingWand *,const double);
extern  void
  DrawSetTextAlignment(DrawingWand *,const AlignType);
extern  void
  DrawSetTextAntialias(DrawingWand *,const MagickBooleanType);
extern  void
  DrawSetTextDecoration(DrawingWand *,const DecorationType);
extern  void
  DrawSetTextDirection(DrawingWand *,const DirectionType);
extern  void
  DrawSetTextEncoding(DrawingWand *,const char *);
extern  void
  DrawSetTextUnderColor(DrawingWand *,const PixelWand *);
extern  void
  DrawSetViewbox(DrawingWand *,ssize_t,ssize_t,ssize_t,ssize_t);
extern  void
  DrawSkewX(DrawingWand *,const double);
extern  void
  DrawSkewY(DrawingWand *,const double);
extern  void
  DrawTranslate(DrawingWand *,const double,const double);


#endif
