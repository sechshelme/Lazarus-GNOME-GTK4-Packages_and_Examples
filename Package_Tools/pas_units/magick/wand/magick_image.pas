unit magick_image;

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

  MagickWand image Methods.
 }
{$ifndef MAGICKWAND_MAGICK_IMAGE_H}
{$define MAGICKWAND_MAGICK_IMAGE_H}

function MagickGetImageChannelFeatures(para1:PMagickWand; para2:Tsize_t):PChannelFeatures;cdecl;external libmagicwand;
function MagickGetImageChannelStatistics(para1:PMagickWand):PChannelStatistics;cdecl;external libmagicwand;
function MagickGetImageFilename(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetImageFormat(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetImageSignature(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickIdentifyImage(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetImageColorspace(para1:PMagickWand):TColorspaceType;cdecl;external libmagicwand;
function MagickGetImageCompose(para1:PMagickWand):TCompositeOperator;cdecl;external libmagicwand;
function MagickGetImageCompression(para1:PMagickWand):TCompressionType;cdecl;external libmagicwand;
function MagickGetImageDispose(para1:PMagickWand):TDisposeType;cdecl;external libmagicwand;
function MagickGetImageChannelDistortions(para1:PMagickWand; para2:PMagickWand; para3:TMetricType):Pdouble;cdecl;external libmagicwand;
function MagickGetImageFuzz(para1:PMagickWand):Tdouble;cdecl;external libmagicwand;
function MagickGetImageGamma(para1:PMagickWand):Tdouble;cdecl;external libmagicwand;
function MagickGetImageTotalInkDensity(para1:PMagickWand):Tdouble;cdecl;external libmagicwand;
function MagickGetImageEndian(para1:PMagickWand):TEndianType;cdecl;external libmagicwand;
function MagickGetImageGravity(para1:PMagickWand):TGravityType;cdecl;external libmagicwand;
function MagickDestroyImage(para1:PImage):PImage;cdecl;external libmagicwand;
function GetImageFromMagickWand(para1:PMagickWand):PImage;cdecl;external libmagicwand;
function MagickGetImageType(para1:PMagickWand):TImageType;cdecl;external libmagicwand;
function MagickGetImageInterlaceScheme(para1:PMagickWand):TInterlaceType;cdecl;external libmagicwand;
function MagickGetImageInterpolateMethod(para1:PMagickWand):TInterpolatePixelMethod;cdecl;external libmagicwand;
function MagickAdaptiveBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAdaptiveBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAdaptiveResizeImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAdaptiveSharpenImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAdaptiveSharpenImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAdaptiveThresholdImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAddImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAddNoiseImage(para1:PMagickWand; para2:TNoiseType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAddNoiseImageChannel(para1:PMagickWand; para2:TChannelType; para3:TNoiseType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAffineTransformImage(para1:PMagickWand; para2:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAnnotateImage(para1:PMagickWand; para2:PDrawingWand; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAnimateImages(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAutoGammaImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAutoGammaImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAutoLevelImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAutoLevelImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickAutoOrientImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBlackThresholdImage(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBlueShiftImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBorderImage(para1:PMagickWand; para2:PPixelWand; para3:Tsize_t; para4:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBrightnessContrastImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickBrightnessContrastImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCharcoalImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickChopImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClampImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClampImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClipImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClipImagePath(para1:PMagickWand; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClutImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClutImageChannel(para1:PMagickWand; para2:TChannelType; para3:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickColorDecisionListImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickColorizeImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickColorMatrixImage(para1:PMagickWand; para2:PKernelInfo):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCommentImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCompositeImage(para1:PMagickWand; para2:PMagickWand; para3:TCompositeOperator; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCompositeImageChannel(para1:PMagickWand; para2:TChannelType; para3:PMagickWand; para4:TCompositeOperator; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCompositeImageGravity(para1:PMagickWand; para2:PMagickWand; para3:TCompositeOperator; para4:TGravityType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCompositeLayers(para1:PMagickWand; para2:PMagickWand; para3:TCompositeOperator; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickConstituteImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Pchar; para5:TStorageType; 
           para6:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function MagickContrastImage(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickContrastStretchImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickContrastStretchImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickConvolveImage(para1:PMagickWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickConvolveImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tsize_t; para4:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCropImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickCycleColormapImage(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDecipherImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDeskewImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDespeckleImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDisplayImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDisplayImages(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDistortImage(para1:PMagickWand; para2:TDistortImageMethod; para3:Tsize_t; para4:Pdouble; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDrawImage(para1:PMagickWand; para2:PDrawingWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEdgeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEmbossImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEncipherImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEnhanceImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEqualizeImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEqualizeImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEvaluateImage(para1:PMagickWand; para2:TMagickEvaluateOperator; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickEvaluateImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickEvaluateOperator; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickExportImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function MagickExtentImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFilterImage(para1:PMagickWand; para2:PKernelInfo):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFilterImageChannel(para1:PMagickWand; para2:TChannelType; para3:PKernelInfo):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFlipImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFloodfillPaintImage(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:Tdouble; para5:PPixelWand; 
           para6:Tssize_t; para7:Tssize_t; para8:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFlopImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickForwardFourierTransformImage(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFrameImage(para1:PMagickWand; para2:PPixelWand; para3:Tsize_t; para4:Tsize_t; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFunctionImage(para1:PMagickWand; para2:TMagickFunction; para3:Tsize_t; para4:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickFunctionImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickFunction; para4:Tsize_t; para5:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGammaImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGammaImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGaussianBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGaussianBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageAlphaChannel(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageBackgroundColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageBluePrimary(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageBorderColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageChannelDistortion(para1:PMagickWand; para2:PMagickWand; para3:TChannelType; para4:TMetricType; para5:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageChannelKurtosis(para1:PMagickWand; para2:TChannelType; para3:Pdouble; para4:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageChannelMean(para1:PMagickWand; para2:TChannelType; para3:Pdouble; para4:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageChannelRange(para1:PMagickWand; para2:TChannelType; para3:Pdouble; para4:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageColormapColor(para1:PMagickWand; para2:Tsize_t; para3:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageDistortion(para1:PMagickWand; para2:PMagickWand; para3:TMetricType; para4:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageGreenPrimary(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageMatteColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageLength(para1:PMagickWand; para2:PMagickSizeType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImagePage(para1:PMagickWand; para2:Psize_t; para3:Psize_t; para4:Pssize_t; para5:Pssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImagePixelColor(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageRange(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageRedPrimary(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageResolution(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageWhitePoint(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickHaldClutImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickHaldClutImageChannel(para1:PMagickWand; para2:TChannelType; para3:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickHasNextImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickHasPreviousImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickImplodeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickImportImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function MagickInverseFourierTransformImage(para1:PMagickWand; para2:PMagickWand; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLabelImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLevelImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLevelImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLevelImageColors(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLevelImageColorsChannel(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:PPixelWand; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLevelizeImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLevelizeImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLinearStretchImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLiquidRescaleImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickLocalContrastImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMagnifyImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMedianFilterImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMinifyImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickModeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickModulateImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMorphologyImage(para1:PMagickWand; para2:TMorphologyMethod; para3:Tssize_t; para4:PKernelInfo):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMorphologyImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMorphologyMethod; para4:Tssize_t; para5:PKernelInfo):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMotionBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMotionBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickNegateImage(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickNegateImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickNewImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickNextImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickNormalizeImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickNormalizeImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOilPaintImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOpaquePaintImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:Tdouble; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOpaquePaintImageChannel(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:PPixelWand; para5:Tdouble; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOrderedPosterizeImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOrderedPosterizeImageChannel(para1:PMagickWand; para2:TChannelType; para3:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOptimizeImageTransparency(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTransparentPaintImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble; invert:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPingImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPingImageBlob(para1:PMagickWand; para2:pointer; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPingImageFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPolaroidImage(para1:PMagickWand; para2:PDrawingWand; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPosterizeImage(para1:PMagickWand; para2:Tsize_t; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPreviousImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickQuantizeImage(para1:PMagickWand; para2:Tsize_t; para3:TColorspaceType; para4:Tsize_t; para5:TMagickBooleanType; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickQuantizeImages(para1:PMagickWand; para2:Tsize_t; para3:TColorspaceType; para4:Tsize_t; para5:TMagickBooleanType; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRaiseImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t; 
           para6:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRandomThresholdImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRandomThresholdImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickReadImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickReadImageBlob(para1:PMagickWand; para2:pointer; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickReadImageFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external libmagicwand;
function MagickReduceNoiseImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRemapImage(para1:PMagickWand; para2:PMagickWand; para3:TDitherMethod):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRemoveImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickResampleImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:TFilterTypes; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickResetImagePage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickResizeImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:TFilterTypes; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRollImage(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRotateImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRotationalBlurImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRotationalBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSampleImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickScaleImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSegmentImage(para1:PMagickWand; para2:TColorspaceType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSelectiveBlurImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSelectiveBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSeparateImageChannel(para1:PMagickWand; para2:TChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSepiaToneImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImage(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageAlphaChannel(para1:PMagickWand; para2:TAlphaChannelType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageBackgroundColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageBias(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageBluePrimary(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageBorderColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageChannelDepth(para1:PMagickWand; para2:TChannelType; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageClipMask(para1:PMagickWand; para2:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageColormapColor(para1:PMagickWand; para2:Tsize_t; para3:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageColorspace(para1:PMagickWand; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageCompose(para1:PMagickWand; para2:TCompositeOperator):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageCompression(para1:PMagickWand; para2:TCompressionType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageDelay(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageDepth(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageDispose(para1:PMagickWand; para2:TDisposeType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageCompressionQuality(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageEndian(para1:PMagickWand; para2:TEndianType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageExtent(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageFilename(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageFormat(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageFuzz(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageGamma(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageGravity(para1:PMagickWand; para2:TGravityType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageGreenPrimary(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageInterlaceScheme(para1:PMagickWand; para2:TInterlaceType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageInterpolateMethod(para1:PMagickWand; para2:TInterpolatePixelMethod):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageIterations(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageMatte(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageMatteColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageOpacity(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageOrientation(para1:PMagickWand; para2:TOrientationType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImagePage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageRedPrimary(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageRenderingIntent(para1:PMagickWand; para2:TRenderingIntent):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageResolution(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageScene(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImagePixelColor(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageTicksPerSecond(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageType(para1:PMagickWand; para2:TImageType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageUnits(para1:PMagickWand; para2:TResolutionType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageWhitePoint(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickShadeImage(para1:PMagickWand; para2:TMagickBooleanType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickShadowImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSharpenImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSharpenImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickShaveImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickShearImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSigmoidalContrastImage(para1:PMagickWand; para2:TMagickBooleanType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSigmoidalContrastImageChannel(para1:PMagickWand; para2:TChannelType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSketchImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSolarizeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSolarizeImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSparseColorImage(para1:PMagickWand; para2:TChannelType; para3:TSparseColorMethod; para4:Tsize_t; para5:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSpliceImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSpreadImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickStatisticImage(para1:PMagickWand; para2:TStatisticType; para3:Tsize_t; para4:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickStatisticImageChannel(para1:PMagickWand; para2:TChannelType; para3:TStatisticType; para4:Tsize_t; para5:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickStripImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSwirlImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTintImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTransformImageColorspace(para1:PMagickWand; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTransposeImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTransverseImage(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickThresholdImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickThresholdImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickThumbnailImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTrimImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickUniqueImageColors(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickUnsharpMaskImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickUnsharpMaskImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickVignetteImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickWaveImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickWhiteThresholdImage(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickWriteImage(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickWriteImageFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external libmagicwand;
function MagickWriteImages(para1:PMagickWand; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickWriteImagesFile(para1:PMagickWand; para2:PFILE):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageProgressMonitor(para1:PMagickWand; para2:TMagickProgressMonitor; para3:pointer):TMagickProgressMonitor;cdecl;external libmagicwand;
function MagickAppendImages(para1:PMagickWand; para2:TMagickBooleanType):PMagickWand;cdecl;external libmagicwand;
function MagickCoalesceImages(para1:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickCombineImages(para1:PMagickWand; para2:TChannelType):PMagickBooleanType;cdecl;external libmagicwand;
function MagickCompareImageChannels(para1:PMagickWand; para2:PMagickWand; para3:TChannelType; para4:TMetricType; para5:Pdouble):PMagickBooleanType;cdecl;external libmagicwand;
function MagickCompareImages(para1:PMagickWand; para2:PMagickWand; para3:TMetricType; para4:Pdouble):PMagickBooleanType;cdecl;external libmagicwand;
function MagickCompareImageLayers(para1:PMagickWand; para2:TImageLayerMethod):PMagickBooleanType;cdecl;external libmagicwand;
function MagickDeconstructImages(para1:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickEvaluateImages(para1:PMagickWand; para2:TMagickEvaluateOperator):PMagickBooleanType;cdecl;external libmagicwand;
function MagickFxImage(para1:PMagickWand; para2:Pchar):PMagickBooleanType;cdecl;external libmagicwand;
function MagickFxImageChannel(para1:PMagickWand; para2:TChannelType; para3:Pchar):PMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImage(para1:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageClipMask(para1:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageRegion(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):PMagickBooleanType;cdecl;external libmagicwand;
function MagickMergeImageLayers(para1:PMagickWand; para2:TImageLayerMethod):PMagickBooleanType;cdecl;external libmagicwand;
function MagickMorphImages(para1:PMagickWand; para2:Tsize_t):PMagickBooleanType;cdecl;external libmagicwand;
function MagickMontageImage(para1:PMagickWand; para2:PDrawingWand; para3:Pchar; para4:Pchar; para5:TMontageMode; 
           para6:Pchar):PMagickBooleanType;cdecl;external libmagicwand;
function MagickOptimizeImageLayers(para1:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickPreviewImages(wand:PMagickWand; para2:TPreviewType):PMagickBooleanType;cdecl;external libmagicwand;
function MagickSimilarityImage(para1:PMagickWand; para2:PMagickWand; para3:PRectangleInfo; para4:Pdouble):PMagickBooleanType;cdecl;external libmagicwand;
function MagickSmushImages(para1:PMagickWand; para2:TMagickBooleanType; para3:Tssize_t):PMagickBooleanType;cdecl;external libmagicwand;
function MagickSteganoImage(para1:PMagickWand; para2:PMagickWand; para3:Tssize_t):PMagickBooleanType;cdecl;external libmagicwand;
function MagickStereoImage(para1:PMagickWand; para2:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickTextureImage(para1:PMagickWand; para2:PMagickWand):PMagickBooleanType;cdecl;external libmagicwand;
function MagickTransformImage(para1:PMagickWand; para2:Pchar; para3:Pchar):PMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageOrientation(para1:PMagickWand):TOrientationType;cdecl;external libmagicwand;
function MagickGetImageHistogram(para1:PMagickWand; para2:Psize_t):^PPixelWand;cdecl;external libmagicwand;
function MagickGetImageRenderingIntent(para1:PMagickWand):TRenderingIntent;cdecl;external libmagicwand;
function MagickGetImageUnits(para1:PMagickWand):TResolutionType;cdecl;external libmagicwand;
function MagickGetImageColors(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageCompressionQuality(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageDelay(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageChannelDepth(para1:PMagickWand; para2:TChannelType):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageDepth(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageHeight(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageIterations(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageScene(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageTicksPerSecond(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageWidth(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetNumberImages(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageBlob(para1:PMagickWand; para2:Psize_t):Pbyte;cdecl;external libmagicwand;
function MagickGetImagesBlob(para1:PMagickWand; para2:Psize_t):Pdouble;cdecl;external libmagicwand;
function MagickGetImageVirtualPixelMethod(para1:PMagickWand):TVirtualPixelMethod;cdecl;external libmagicwand;
function MagickSetImageVirtualPixelMethod(para1:PMagickWand; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external libmagicwand;
{$endif}

// === Konventiert am: 5-1-26 19:40:03 ===


implementation



end.
