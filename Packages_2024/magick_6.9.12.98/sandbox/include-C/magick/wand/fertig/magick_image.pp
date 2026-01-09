
unit magick_image;
interface

{
  Automatically converted by H2Pas 1.0.0 from magick_image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    magick_image.h
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
Pbyte  = ^byte;
PChannelFeatures  = ^ChannelFeatures;
PChannelStatistics  = ^ChannelStatistics;
Pchar  = ^char;
Pdouble  = ^double;
PDrawingWand  = ^DrawingWand;
PFILE  = ^FILE;
PImage  = ^Image;
PKernelInfo  = ^KernelInfo;
PMagickBooleanType  = ^MagickBooleanType;
PMagickSizeType  = ^MagickSizeType;
PMagickWand  = ^MagickWand;
PPixelWand  = ^PixelWand;
PRectangleInfo  = ^RectangleInfo;
Psize_t  = ^size_t;
Pssize_t  = ^ssize_t;
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

  MagickWand image Methods.
 }
{$ifndef MAGICKWAND_MAGICK_IMAGE_H}
{$define MAGICKWAND_MAGICK_IMAGE_H}
(* Const before type ignored *)

function MagickGetImageChannelFeatures(para1:PMagickWand; para2:Tsize_t):PChannelFeatures;cdecl;external;
function MagickGetImageChannelStatistics(para1:PMagickWand):PChannelStatistics;cdecl;external;
function MagickGetImageFilename(para1:PMagickWand):Pchar;cdecl;external;
function MagickGetImageFormat(para1:PMagickWand):Pchar;cdecl;external;
function MagickGetImageSignature(para1:PMagickWand):Pchar;cdecl;external;
function MagickIdentifyImage(para1:PMagickWand):Pchar;cdecl;external;
function MagickGetImageColorspace(para1:PMagickWand):TColorspaceType;cdecl;external;
function MagickGetImageCompose(para1:PMagickWand):TCompositeOperator;cdecl;external;
function MagickGetImageCompression(para1:PMagickWand):TCompressionType;cdecl;external;
function MagickGetImageDispose(para1:PMagickWand):TDisposeType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGetImageChannelDistortions(para1:PMagickWand; para2:PMagickWand; para3:TMetricType):Pdouble;cdecl;external;
function MagickGetImageFuzz(para1:PMagickWand):Tdouble;cdecl;external;
function MagickGetImageGamma(para1:PMagickWand):Tdouble;cdecl;external;
function MagickGetImageTotalInkDensity(para1:PMagickWand):Tdouble;cdecl;external;
function MagickGetImageEndian(para1:PMagickWand):TEndianType;cdecl;external;
function MagickGetImageGravity(para1:PMagickWand):TGravityType;cdecl;external;
function MagickDestroyImage(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function GetImageFromMagickWand(para1:PMagickWand):PImage;cdecl;external;
function MagickGetImageType(para1:PMagickWand):TImageType;cdecl;external;
function MagickGetImageInterlaceScheme(para1:PMagickWand):TInterlaceType;cdecl;external;
function MagickGetImageInterpolateMethod(para1:PMagickWand):TInterpolatePixelMethod;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAdaptiveBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAdaptiveBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAdaptiveResizeImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAdaptiveSharpenImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAdaptiveSharpenImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAdaptiveThresholdImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickAddImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickAddNoiseImage(para1:PMagickWand; para2:TNoiseType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAddNoiseImageChannel(para1:PMagickWand; para2:TChannelType; para3:TNoiseType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickAffineTransformImage(para1:PMagickWand; para2:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickAnnotateImage(para1:PMagickWand; para2:PDrawingWand; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickAnimateImages(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
function MagickAutoGammaImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickAutoGammaImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external;
function MagickAutoLevelImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickAutoLevelImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external;
function MagickAutoOrientImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickBlackThresholdImage(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickBlueShiftImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickBorderImage(para1:PMagickWand; para2:PPixelWand; para3:Tsize_t; para4:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickBrightnessContrastImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickBrightnessContrastImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCharcoalImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickChopImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
function MagickClampImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickClampImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external;
function MagickClipImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickClipImagePath(para1:PMagickWand; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickClutImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickClutImageChannel(para1:PMagickWand; para2:TChannelType; para3:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickColorDecisionListImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickColorizeImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickColorMatrixImage(para1:PMagickWand; para2:PKernelInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickCommentImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCompositeImage(para1:PMagickWand; para2:PMagickWand; para3:TCompositeOperator; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCompositeImageChannel(para1:PMagickWand; para2:TChannelType; para3:PMagickWand; para4:TCompositeOperator; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCompositeImageGravity(para1:PMagickWand; para2:PMagickWand; para3:TCompositeOperator; para4:TGravityType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCompositeLayers(para1:PMagickWand; para2:PMagickWand; para3:TCompositeOperator; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickConstituteImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Pchar; para5:TStorageType; 
           para6:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickContrastImage(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickContrastStretchImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickContrastStretchImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickConvolveImage(para1:PMagickWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickConvolveImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tsize_t; para4:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCropImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickCycleColormapImage(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDecipherImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDeskewImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
function MagickDespeckleImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDisplayImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDisplayImages(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickDistortImage(para1:PMagickWand; para2:TDistortImageMethod; para3:Tsize_t; para4:Pdouble; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDrawImage(para1:PMagickWand; para2:PDrawingWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickEdgeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickEmbossImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickEncipherImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
function MagickEnhanceImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
function MagickEqualizeImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickEqualizeImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickEvaluateImage(para1:PMagickWand; para2:TMagickEvaluateOperator; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickEvaluateImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickEvaluateOperator; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickExportImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickExtentImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickFilterImage(para1:PMagickWand; para2:PKernelInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickFilterImageChannel(para1:PMagickWand; para2:TChannelType; para3:PKernelInfo):TMagickBooleanType;cdecl;external;
function MagickFlipImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickFloodfillPaintImage(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:Tdouble; para5:PPixelWand; 
           para6:Tssize_t; para7:Tssize_t; para8:TMagickBooleanType):TMagickBooleanType;cdecl;external;
function MagickFlopImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickForwardFourierTransformImage(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickFrameImage(para1:PMagickWand; para2:PPixelWand; para3:Tsize_t; para4:Tsize_t; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickFunctionImage(para1:PMagickWand; para2:TMagickFunction; para3:Tsize_t; para4:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickFunctionImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickFunction; para4:Tsize_t; para5:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGammaImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGammaImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGaussianBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGaussianBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageAlphaChannel(para1:PMagickWand):TMagickBooleanType;cdecl;external;
function MagickGetImageBackgroundColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
function MagickGetImageBluePrimary(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageBorderColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGetImageChannelDistortion(para1:PMagickWand; para2:PMagickWand; para3:TChannelType; para4:TMetricType; para5:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetImageChannelKurtosis(para1:PMagickWand; para2:TChannelType; para3:Pdouble; para4:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetImageChannelMean(para1:PMagickWand; para2:TChannelType; para3:Pdouble; para4:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetImageChannelRange(para1:PMagickWand; para2:TChannelType; para3:Pdouble; para4:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetImageColormapColor(para1:PMagickWand; para2:Tsize_t; para3:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGetImageDistortion(para1:PMagickWand; para2:PMagickWand; para3:TMetricType; para4:Pdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageGreenPrimary(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageMatteColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
function MagickGetImageLength(para1:PMagickWand; para2:PMagickSizeType):TMagickBooleanType;cdecl;external;
function MagickGetImagePage(para1:PMagickWand; para2:Psize_t; para3:Psize_t; para4:Pssize_t; para5:Pssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGetImagePixelColor(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:PPixelWand):TMagickBooleanType;cdecl;external;
function MagickGetImageRange(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageRedPrimary(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageResolution(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
function MagickGetImageWhitePoint(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickHaldClutImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickHaldClutImageChannel(para1:PMagickWand; para2:TChannelType; para3:PMagickWand):TMagickBooleanType;cdecl;external;
function MagickHasNextImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
function MagickHasPreviousImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickImplodeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickImportImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickInverseFourierTransformImage(para1:PMagickWand; para2:PMagickWand; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickLabelImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLevelImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLevelImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLevelImageColors(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLevelImageColorsChannel(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:PPixelWand; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLevelizeImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLevelizeImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLinearStretchImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLiquidRescaleImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickLocalContrastImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
function MagickMagnifyImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickMedianFilterImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
function MagickMinifyImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickModeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickModulateImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMorphologyImage(para1:PMagickWand; para2:TMorphologyMethod; para3:Tssize_t; para4:PKernelInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMorphologyImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMorphologyMethod; para4:Tssize_t; para5:PKernelInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMotionBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMotionBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickNegateImage(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickNegateImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickNewImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:PPixelWand):TMagickBooleanType;cdecl;external;
function MagickNextImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
function MagickNormalizeImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickNormalizeImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickOilPaintImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickOpaquePaintImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:Tdouble; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickOpaquePaintImageChannel(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:PPixelWand; para5:Tdouble; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickOrderedPosterizeImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickOrderedPosterizeImageChannel(para1:PMagickWand; para2:TChannelType; para3:Pchar):TMagickBooleanType;cdecl;external;
function MagickOptimizeImageTransparency(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickTransparentPaintImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble; invert:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickPingImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPingImageBlob(para1:PMagickWand; para2:pointer; para3:Tsize_t):TMagickBooleanType;cdecl;external;
function MagickPingImageFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPolaroidImage(para1:PMagickWand; para2:PDrawingWand; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPosterizeImage(para1:PMagickWand; para2:Tsize_t; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
function MagickPreviousImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickQuantizeImage(para1:PMagickWand; para2:Tsize_t; para3:TColorspaceType; para4:Tsize_t; para5:TMagickBooleanType; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickQuantizeImages(para1:PMagickWand; para2:Tsize_t; para3:TColorspaceType; para4:Tsize_t; para5:TMagickBooleanType; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRaiseImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRandomThresholdImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRandomThresholdImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickReadImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickReadImageBlob(para1:PMagickWand; para2:pointer; para3:Tsize_t):TMagickBooleanType;cdecl;external;
function MagickReadImageFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickReduceNoiseImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRemapImage(para1:PMagickWand; para2:PMagickWand; para3:TDitherMethod):TMagickBooleanType;cdecl;external;
function MagickRemoveImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickResampleImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:TFilterTypes; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickResetImagePage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickResizeImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:TFilterTypes; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRollImage(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRotateImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickRotationalBlurImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRotationalBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSampleImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickScaleImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSegmentImage(para1:PMagickWand; para2:TColorspaceType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSelectiveBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSelectiveBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSeparateImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSepiaToneImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageAlphaChannel(para1:PMagickWand; para2:TAlphaChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageBackgroundColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageBias(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageBluePrimary(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageBorderColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageChannelDepth(para1:PMagickWand; para2:TChannelType; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageClipMask(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageColormapColor(para1:PMagickWand; para2:Tsize_t; para3:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageColorspace(para1:PMagickWand; para2:TColorspaceType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageCompose(para1:PMagickWand; para2:TCompositeOperator):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageCompression(para1:PMagickWand; para2:TCompressionType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageDelay(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageDepth(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageDispose(para1:PMagickWand; para2:TDisposeType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageCompressionQuality(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageEndian(para1:PMagickWand; para2:TEndianType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageExtent(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageFilename(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageFormat(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageFuzz(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageGamma(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageGravity(para1:PMagickWand; para2:TGravityType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageGreenPrimary(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageInterlaceScheme(para1:PMagickWand; para2:TInterlaceType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageInterpolateMethod(para1:PMagickWand; para2:TInterpolatePixelMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageIterations(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageMatte(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageMatteColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageOpacity(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageOrientation(para1:PMagickWand; para2:TOrientationType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImagePage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageRedPrimary(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageRenderingIntent(para1:PMagickWand; para2:TRenderingIntent):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageResolution(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageScene(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImagePixelColor(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageTicksPerSecond(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageType(para1:PMagickWand; para2:TImageType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageUnits(para1:PMagickWand; para2:TResolutionType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageWhitePoint(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickShadeImage(para1:PMagickWand; para2:TMagickBooleanType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickShadowImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSharpenImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSharpenImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickShaveImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickShearImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSigmoidalContrastImage(para1:PMagickWand; para2:TMagickBooleanType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSigmoidalContrastImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSketchImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSolarizeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSolarizeImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSparseColorImage(para1:PMagickWand; para2:TChannelType; para3:TSparseColorMethod; para4:Tsize_t; para5:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSpliceImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSpreadImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickStatisticImage(para1:PMagickWand; para2:TStatisticType; para3:Tsize_t; para4:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickStatisticImageChannel(para1:PMagickWand; para2:TChannelType; para3:TStatisticType; para4:Tsize_t; para5:Tsize_t):TMagickBooleanType;cdecl;external;
function MagickStripImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSwirlImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickTintImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickTransformImageColorspace(para1:PMagickWand; para2:TColorspaceType):TMagickBooleanType;cdecl;external;
function MagickTransposeImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
function MagickTransverseImage(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickThresholdImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickThresholdImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickThumbnailImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickTrimImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
function MagickUniqueImageColors(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickUnsharpMaskImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickUnsharpMaskImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickVignetteImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickWaveImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickWhiteThresholdImage(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickWriteImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
function MagickWriteImageFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickWriteImages(para1:PMagickWand; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
function MagickWriteImagesFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageProgressMonitor(para1:PMagickWand; para2:TMagickProgressMonitor; para3:pointer):TMagickProgressMonitor;cdecl;external;
(* Const before type ignored *)
function MagickAppendImages(para1:PMagickWand; para2:TMagickBooleanType):PMagickWand;cdecl;external;
function MagickCoalesceImages(para1:PMagickWand):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickCombineImages(para1:PMagickWand; para2:TChannelType):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCompareImageChannels(para1:PMagickWand; para2:PMagickWand; para3:TChannelType; para4:TMetricType; para5:Pdouble):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickCompareImages(para1:PMagickWand; para2:PMagickWand; para3:TMetricType; para4:Pdouble):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickCompareImageLayers(para1:PMagickWand; para2:TImageLayerMethod):PMagickBooleanType;cdecl;external;
function MagickDeconstructImages(para1:PMagickWand):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickEvaluateImages(para1:PMagickWand; para2:TMagickEvaluateOperator):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickFxImage(para1:PMagickWand; para2:Pchar):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickFxImageChannel(para1:PMagickWand; para2:TChannelType; para3:Pchar):PMagickBooleanType;cdecl;external;
function MagickGetImage(para1:PMagickWand):PMagickBooleanType;cdecl;external;
function MagickGetImageClipMask(para1:PMagickWand):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGetImageRegion(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickMergeImageLayers(para1:PMagickWand; para2:TImageLayerMethod):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickMorphImages(para1:PMagickWand; para2:Tsize_t):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMontageImage(para1:PMagickWand; para2:PDrawingWand; para3:Pchar; para4:Pchar; para5:TMontageMode; 
           para6:Pchar):PMagickBooleanType;cdecl;external;
function MagickOptimizeImageLayers(para1:PMagickWand):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickPreviewImages(wand:PMagickWand; para2:TPreviewType):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSimilarityImage(para1:PMagickWand; para2:PMagickWand; para3:PRectangleInfo; para4:Pdouble):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSmushImages(para1:PMagickWand; para2:TMagickBooleanType; para3:Tssize_t):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSteganoImage(para1:PMagickWand; para2:PMagickWand; para3:Tssize_t):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickStereoImage(para1:PMagickWand; para2:PMagickWand):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickTextureImage(para1:PMagickWand; para2:PMagickWand):PMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickTransformImage(para1:PMagickWand; para2:Pchar; para3:Pchar):PMagickBooleanType;cdecl;external;
function MagickGetImageOrientation(para1:PMagickWand):TOrientationType;cdecl;external;
function MagickGetImageHistogram(para1:PMagickWand; para2:Psize_t):^PPixelWand;cdecl;external;
function MagickGetImageRenderingIntent(para1:PMagickWand):TRenderingIntent;cdecl;external;
function MagickGetImageUnits(para1:PMagickWand):TResolutionType;cdecl;external;
function MagickGetImageColors(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageCompressionQuality(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageDelay(para1:PMagickWand):Tsize_t;cdecl;external;
(* Const before type ignored *)
function MagickGetImageChannelDepth(para1:PMagickWand; para2:TChannelType):Tsize_t;cdecl;external;
function MagickGetImageDepth(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageHeight(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageIterations(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageScene(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageTicksPerSecond(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageWidth(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetNumberImages(para1:PMagickWand):Tsize_t;cdecl;external;
function MagickGetImageBlob(para1:PMagickWand; para2:Psize_t):Pbyte;cdecl;external;
function MagickGetImagesBlob(para1:PMagickWand; para2:Psize_t):Pdouble;cdecl;external;
function MagickGetImageVirtualPixelMethod(para1:PMagickWand):TVirtualPixelMethod;cdecl;external;
(* Const before type ignored *)
function MagickSetImageVirtualPixelMethod(para1:PMagickWand; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external;
{$endif}

implementation


end.
