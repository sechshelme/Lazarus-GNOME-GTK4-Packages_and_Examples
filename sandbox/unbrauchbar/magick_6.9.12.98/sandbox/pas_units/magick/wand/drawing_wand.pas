unit drawing_wand;

interface

uses
  fp_magiccore, fp_magicwand, MagickWand, pixel_wand;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDrawingWand = type Pointer;

function DrawGetTextAlignment(para1: PDrawingWand): TAlignType; cdecl; external libmagickwand;
function DrawGetClipPath(para1: PDrawingWand): pchar; cdecl; external libmagickwand;
function DrawGetDensity(para1: PDrawingWand): pchar; cdecl; external libmagickwand;
function DrawGetException(para1: PDrawingWand; para2: PExceptionType): pchar; cdecl; external libmagickwand;
function DrawGetFont(para1: PDrawingWand): pchar; cdecl; external libmagickwand;
function DrawGetFontFamily(para1: PDrawingWand): pchar; cdecl; external libmagickwand;
function DrawGetTextEncoding(para1: PDrawingWand): pchar; cdecl; external libmagickwand;
function DrawGetVectorGraphics(para1: PDrawingWand): pchar; cdecl; external libmagickwand;
function DrawGetClipUnits(para1: PDrawingWand): TClipPathUnits; cdecl; external libmagickwand;
function DrawGetTextDecoration(para1: PDrawingWand): TDecorationType; cdecl; external libmagickwand;
function DrawGetTextDirection(para1: PDrawingWand): TDirectionType; cdecl; external libmagickwand;
function DrawGetFillOpacity(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetFontSize(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetOpacity(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetStrokeDashArray(para1: PDrawingWand; para2: Psize_t): Pdouble; cdecl; external libmagickwand;
function DrawGetStrokeDashOffset(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetStrokeOpacity(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetStrokeWidth(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetTextKerning(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetTextInterlineSpacing(para1: PDrawingWand): double; cdecl; external libmagickwand;
function DrawGetTextInterwordSpacing(para1: PDrawingWand): double; cdecl; external libmagickwand;
function PeekDrawingWand(para1: PDrawingWand): PDrawInfo; cdecl; external libmagickwand;
function AcquireDrawingWand(para1: PDrawInfo; para2: PImage): PDrawingWand; cdecl; external libmagickwand;
function CloneDrawingWand(para1: PDrawingWand): PDrawingWand; cdecl; external libmagickwand;
function DestroyDrawingWand(para1: PDrawingWand): PDrawingWand; cdecl; external libmagickwand;
function NewDrawingWand: PDrawingWand; cdecl; external libmagickwand;
function DrawGetExceptionType(para1: PDrawingWand): TExceptionType; cdecl; external libmagickwand;
function DrawGetClipRule(para1: PDrawingWand): TFillRule; cdecl; external libmagickwand;
function DrawGetGravity(para1: PDrawingWand): TGravityType; cdecl; external libmagickwand;
function DrawGetStrokeLineCap(para1: PDrawingWand): TLineCap; cdecl; external libmagickwand;
function DrawGetStrokeLineJoin(para1: PDrawingWand): TLineJoin; cdecl; external libmagickwand;
function DrawClearException(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawComposite(para1: PDrawingWand; para2: TCompositeOperator; para3: double; para4: double; para5: double;
  para6: double; para7: PMagickWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawGetFontResolution(para1: PDrawingWand; para2: Pdouble; para3: Pdouble): TMagickBooleanType; cdecl; external libmagickwand;
function DrawGetStrokeAntialias(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawGetTextAntialias(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawPopPattern(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawPushPattern(para1: PDrawingWand; para2: pchar; para3: double; para4: double; para5: double;
  para6: double): TMagickBooleanType; cdecl; external libmagickwand;
function DrawRender(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetClipPath(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetDensity(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetFillPatternURL(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetFont(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetFontFamily(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetFontResolution(para1: PDrawingWand; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetStrokeDashArray(para1: PDrawingWand; para2: Tsize_t; para3: Pdouble): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetStrokePatternURL(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function DrawSetVectorGraphics(para1: PDrawingWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function IsDrawingWand(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function PopDrawingWand(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function PushDrawingWand(para1: PDrawingWand): TMagickBooleanType; cdecl; external libmagickwand;
function DrawGetFontStretch(para1: PDrawingWand): TStretchType; cdecl; external libmagickwand;
function DrawGetFontStyle(para1: PDrawingWand): TStyleType; cdecl; external libmagickwand;
function DrawGetFontWeight(para1: PDrawingWand): Tsize_t; cdecl; external libmagickwand;
function DrawGetStrokeMiterLimit(para1: PDrawingWand): Tsize_t; cdecl; external libmagickwand;
procedure ClearDrawingWand(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawAffine(para1: PDrawingWand; para2: PAffineMatrix); cdecl; external libmagickwand;
procedure DrawAnnotation(para1: PDrawingWand; para2: double; para3: double; para4: pbyte); cdecl; external libmagickwand;
procedure DrawArc(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double;
  para6: double; para7: double); cdecl; external libmagickwand;
procedure DrawBezier(para1: PDrawingWand; para2: Tsize_t; para3: PPointInfo); cdecl; external libmagickwand;
procedure DrawGetBorderColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawCircle(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawColor(para1: PDrawingWand; para2: double; para3: double; para4: TPaintMethod); cdecl; external libmagickwand;
procedure DrawComment(para1: PDrawingWand; para2: pchar); cdecl; external libmagickwand;
procedure DrawEllipse(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double;
  para6: double; para7: double); cdecl; external libmagickwand;
procedure DrawGetFillColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawGetStrokeColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawSetTextKerning(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetTextInterlineSpacing(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetTextInterwordSpacing(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawGetTextUnderColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawLine(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawMatte(para1: PDrawingWand; para2: double; para3: double; para4: TPaintMethod); cdecl; external libmagickwand;
procedure DrawPathClose(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawPathCurveToAbsolute(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double;
  para6: double; para7: double); cdecl; external libmagickwand;
procedure DrawPathCurveToRelative(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double;
  para6: double; para7: double); cdecl; external libmagickwand;
procedure DrawPathCurveToQuadraticBezierAbsolute(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawPathCurveToQuadraticBezierRelative(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawPathCurveToQuadraticBezierSmoothAbsolute(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPathCurveToQuadraticBezierSmoothRelative(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPathCurveToSmoothAbsolute(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawPathCurveToSmoothRelative(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawPathEllipticArcAbsolute(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: TMagickBooleanType;
  para6: TMagickBooleanType; para7: double; para8: double); cdecl; external libmagickwand;
procedure DrawPathEllipticArcRelative(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: TMagickBooleanType;
  para6: TMagickBooleanType; para7: double; para8: double); cdecl; external libmagickwand;
procedure DrawPathFinish(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawPathLineToAbsolute(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPathLineToRelative(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPathLineToHorizontalAbsolute(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawPathLineToHorizontalRelative(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawPathLineToVerticalAbsolute(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawPathLineToVerticalRelative(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawPathMoveToAbsolute(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPathMoveToRelative(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPathStart(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawPoint(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawPolygon(para1: PDrawingWand; para2: Tsize_t; para3: PPointInfo); cdecl; external libmagickwand;
procedure DrawPolyline(para1: PDrawingWand; para2: Tsize_t; para3: PPointInfo); cdecl; external libmagickwand;
procedure DrawPopClipPath(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawPopDefs(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawPushClipPath(para1: PDrawingWand; para2: pchar); cdecl; external libmagickwand;
procedure DrawPushDefs(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawRectangle(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickwand;
procedure DrawResetVectorGraphics(para1: PDrawingWand); cdecl; external libmagickwand;
procedure DrawRotate(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawRoundRectangle(para1: PDrawingWand; para2: double; para3: double; para4: double; para5: double;
  para6: double; para7: double); cdecl; external libmagickwand;
procedure DrawScale(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;
procedure DrawSetBorderColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawSetClipRule(para1: PDrawingWand; para2: TFillRule); cdecl; external libmagickwand;
procedure DrawSetClipUnits(para1: PDrawingWand; para2: TClipPathUnits); cdecl; external libmagickwand;
procedure DrawSetFillColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawSetFillOpacity(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetFillRule(para1: PDrawingWand; para2: TFillRule); cdecl; external libmagickwand;
procedure DrawSetFontSize(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetFontStretch(para1: PDrawingWand; para2: TStretchType); cdecl; external libmagickwand;
procedure DrawSetFontStyle(para1: PDrawingWand; para2: TStyleType); cdecl; external libmagickwand;
procedure DrawSetFontWeight(para1: PDrawingWand; para2: Tsize_t); cdecl; external libmagickwand;
procedure DrawSetGravity(para1: PDrawingWand; para2: TGravityType); cdecl; external libmagickwand;
procedure DrawSetOpacity(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetStrokeAntialias(para1: PDrawingWand; para2: TMagickBooleanType); cdecl; external libmagickwand;
procedure DrawSetStrokeColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawSetStrokeDashOffset(para1: PDrawingWand; dashoffset: double); cdecl; external libmagickwand;
procedure DrawSetStrokeLineCap(para1: PDrawingWand; para2: TLineCap); cdecl; external libmagickwand;
procedure DrawSetStrokeLineJoin(para1: PDrawingWand; para2: TLineJoin); cdecl; external libmagickwand;
procedure DrawSetStrokeMiterLimit(para1: PDrawingWand; para2: Tsize_t); cdecl; external libmagickwand;
procedure DrawSetStrokeOpacity(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetStrokeWidth(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSetTextAlignment(para1: PDrawingWand; para2: TAlignType); cdecl; external libmagickwand;
procedure DrawSetTextAntialias(para1: PDrawingWand; para2: TMagickBooleanType); cdecl; external libmagickwand;
procedure DrawSetTextDecoration(para1: PDrawingWand; para2: TDecorationType); cdecl; external libmagickwand;
procedure DrawSetTextDirection(para1: PDrawingWand; para2: TDirectionType); cdecl; external libmagickwand;
procedure DrawSetTextEncoding(para1: PDrawingWand; para2: pchar); cdecl; external libmagickwand;
procedure DrawSetTextUnderColor(para1: PDrawingWand; para2: PPixelWand); cdecl; external libmagickwand;
procedure DrawSetViewbox(para1: PDrawingWand; para2: Tssize_t; para3: Tssize_t; para4: Tssize_t; para5: Tssize_t); cdecl; external libmagickwand;
procedure DrawSkewX(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawSkewY(para1: PDrawingWand; para2: double); cdecl; external libmagickwand;
procedure DrawTranslate(para1: PDrawingWand; para2: double; para3: double); cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:39:56 ===


implementation



end.
