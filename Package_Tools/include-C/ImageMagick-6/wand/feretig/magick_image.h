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

  MagickWand image Methods.
*/

#ifndef MAGICKWAND_MAGICK_IMAGE_H
#define MAGICKWAND_MAGICK_IMAGE_H


extern  ChannelFeatures
  *MagickGetImageChannelFeatures(MagickWand *,const size_t);

extern  ChannelStatistics
  *MagickGetImageChannelStatistics(MagickWand *);

extern  char
  *MagickGetImageFilename(MagickWand *);
extern  char
  *MagickGetImageFormat(MagickWand *);
extern  char
  *MagickGetImageSignature(MagickWand *);
extern  char
  *MagickIdentifyImage(MagickWand *);

extern  ColorspaceType
  MagickGetImageColorspace(MagickWand *);

extern  CompositeOperator
  MagickGetImageCompose(MagickWand *);

extern  CompressionType
  MagickGetImageCompression(MagickWand *);

extern  DisposeType
  MagickGetImageDispose(MagickWand *);

extern  double
  *MagickGetImageChannelDistortions(MagickWand *,const MagickWand *,    const MetricType);
extern  double
  MagickGetImageFuzz(MagickWand *);
extern  double
  MagickGetImageGamma(MagickWand *);
extern  double
  MagickGetImageTotalInkDensity(MagickWand *);

extern  EndianType
  MagickGetImageEndian(MagickWand *);

extern  GravityType
  MagickGetImageGravity(MagickWand *);

extern  Image
  *MagickDestroyImage(Image *);
extern  Image
  *GetImageFromMagickWand(const MagickWand *);

extern  ImageType
  MagickGetImageType(MagickWand *);

extern  InterlaceType
  MagickGetImageInterlaceScheme(MagickWand *);

extern  InterpolatePixelMethod
  MagickGetImageInterpolateMethod(MagickWand *);

extern  MagickBooleanType
  MagickAdaptiveBlurImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickAdaptiveBlurImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickAdaptiveResizeImage(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickAdaptiveSharpenImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickAdaptiveSharpenImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickAdaptiveThresholdImage(MagickWand *,const size_t,const size_t,    const ssize_t);
extern  MagickBooleanType
  MagickAddImage(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  MagickAddNoiseImage(MagickWand *,const NoiseType);
extern  MagickBooleanType
  MagickAddNoiseImageChannel(MagickWand *,const ChannelType,const NoiseType);
extern  MagickBooleanType
  MagickAffineTransformImage(MagickWand *,const DrawingWand *);
extern  MagickBooleanType
  MagickAnnotateImage(MagickWand *,const DrawingWand *,const double,    const double,const double,const char *);
extern  MagickBooleanType
  MagickAnimateImages(MagickWand *,const char *);
extern  MagickBooleanType
  MagickAutoGammaImage(MagickWand *);
extern  MagickBooleanType
  MagickAutoGammaImageChannel(MagickWand *,const ChannelType);
extern  MagickBooleanType
  MagickAutoLevelImage(MagickWand *);
extern  MagickBooleanType
  MagickAutoLevelImageChannel(MagickWand *,const ChannelType);
extern  MagickBooleanType
  MagickAutoOrientImage(MagickWand *);
extern  MagickBooleanType
  MagickBlackThresholdImage(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickBlueShiftImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickBlurImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickBlurImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickBorderImage(MagickWand *,const PixelWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickBrightnessContrastImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickBrightnessContrastImageChannel(MagickWand *,const ChannelType,    const double,const double);
extern  MagickBooleanType
  MagickCharcoalImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickChopImage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickClampImage(MagickWand *);
extern  MagickBooleanType
  MagickClampImageChannel(MagickWand *,const ChannelType);
extern  MagickBooleanType
  MagickClipImage(MagickWand *);
extern  MagickBooleanType
  MagickClipImagePath(MagickWand *,const char *,const MagickBooleanType);
extern  MagickBooleanType
  MagickClutImage(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  MagickClutImageChannel(MagickWand *,const ChannelType,const MagickWand *);
extern  MagickBooleanType
  MagickColorDecisionListImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickColorizeImage(MagickWand *,const PixelWand *,const PixelWand *);
extern  MagickBooleanType
  MagickColorMatrixImage(MagickWand *,const KernelInfo *);
extern  MagickBooleanType
  MagickCommentImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickCompositeImage(MagickWand *,const MagickWand *,const CompositeOperator,    const ssize_t,const ssize_t);
extern  MagickBooleanType
  MagickCompositeImageChannel(MagickWand *,const ChannelType,const MagickWand *,    const CompositeOperator,const ssize_t,const ssize_t);
extern  MagickBooleanType
  MagickCompositeImageGravity(MagickWand *,const MagickWand *,    const CompositeOperator,const GravityType);
extern  MagickBooleanType
  MagickCompositeLayers(MagickWand *,const MagickWand *,const CompositeOperator,    const ssize_t,const ssize_t);
extern  MagickBooleanType
  MagickConstituteImage(MagickWand *,const size_t,const size_t,const char *,    const StorageType,const void *);
extern  MagickBooleanType
  MagickContrastImage(MagickWand *,const MagickBooleanType);
extern  MagickBooleanType
  MagickContrastStretchImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickContrastStretchImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickConvolveImage(MagickWand *,const size_t,const double *);
extern  MagickBooleanType
  MagickConvolveImageChannel(MagickWand *,const ChannelType,const size_t,    const double *);
extern  MagickBooleanType
  MagickCropImage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickCycleColormapImage(MagickWand *,const ssize_t);
extern  MagickBooleanType
  MagickDecipherImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickDeskewImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickDespeckleImage(MagickWand *);
extern  MagickBooleanType
  MagickDisplayImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickDisplayImages(MagickWand *,const char *);
extern  MagickBooleanType
  MagickDistortImage(MagickWand *,const DistortImageMethod,const size_t,    const double *,const MagickBooleanType);
extern  MagickBooleanType
  MagickDrawImage(MagickWand *,const DrawingWand *);
extern  MagickBooleanType
  MagickEdgeImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickEmbossImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickEncipherImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickEnhanceImage(MagickWand *);
extern  MagickBooleanType
  MagickEqualizeImage(MagickWand *);
extern  MagickBooleanType
  MagickEqualizeImageChannel(MagickWand *,const ChannelType);
extern  MagickBooleanType
  MagickEvaluateImage(MagickWand *,const MagickEvaluateOperator,const double);
extern  MagickBooleanType
  MagickEvaluateImageChannel(MagickWand *,const ChannelType,    const MagickEvaluateOperator,const double);
extern  MagickBooleanType
  MagickExportImagePixels(MagickWand *,const ssize_t,const ssize_t,    const size_t,const size_t,const char *,const StorageType,void *);
extern  MagickBooleanType
  MagickExtentImage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickFilterImage(MagickWand *,const KernelInfo *);
extern  MagickBooleanType
  MagickFilterImageChannel(MagickWand *,const ChannelType,const KernelInfo *);
extern  MagickBooleanType
  MagickFlipImage(MagickWand *);
extern  MagickBooleanType
  MagickFloodfillPaintImage(MagickWand *,const ChannelType,const PixelWand *,    const double,const PixelWand *,const ssize_t,const ssize_t,    const MagickBooleanType);
extern  MagickBooleanType
  MagickFlopImage(MagickWand *);
extern  MagickBooleanType
  MagickForwardFourierTransformImage(MagickWand *,const MagickBooleanType);
extern  MagickBooleanType
  MagickFrameImage(MagickWand *,const PixelWand *,const size_t,const size_t,    const ssize_t,const ssize_t);
extern  MagickBooleanType
  MagickFunctionImage(MagickWand *,const MagickFunction,const size_t,    const double *);
extern  MagickBooleanType
  MagickFunctionImageChannel(MagickWand *,const ChannelType,    const MagickFunction,const size_t,const double *);
extern  MagickBooleanType
  MagickGammaImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickGammaImageChannel(MagickWand *,const ChannelType,const double);
extern  MagickBooleanType
  MagickGaussianBlurImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickGaussianBlurImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickGetImageAlphaChannel(MagickWand *);
extern  MagickBooleanType
  MagickGetImageBackgroundColor(MagickWand *,PixelWand *);
extern  MagickBooleanType
  MagickGetImageBluePrimary(MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickGetImageBorderColor(MagickWand *,PixelWand *);
extern  MagickBooleanType
  MagickGetImageChannelDistortion(MagickWand *,const MagickWand *,    const ChannelType,const MetricType,double *);
extern  MagickBooleanType
  MagickGetImageChannelKurtosis(MagickWand *,const ChannelType,double *,    double *);
extern  MagickBooleanType
  MagickGetImageChannelMean(MagickWand *,const ChannelType,double *,double *);
extern  MagickBooleanType
  MagickGetImageChannelRange(MagickWand *,const ChannelType,double *,double *);
extern  MagickBooleanType
  MagickGetImageColormapColor(MagickWand *,const size_t,PixelWand *);
extern  MagickBooleanType
  MagickGetImageDistortion(MagickWand *,const MagickWand *,const MetricType,    double *);
extern  MagickBooleanType
  MagickGetImageGreenPrimary(MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickGetImageMatteColor(MagickWand *,PixelWand *);
extern  MagickBooleanType
  MagickGetImageLength(MagickWand *,MagickSizeType *);
extern  MagickBooleanType
  MagickGetImagePage(MagickWand *,size_t *,size_t *,ssize_t *,    ssize_t *);
extern  MagickBooleanType
  MagickGetImagePixelColor(MagickWand *,const ssize_t,const ssize_t,    PixelWand *);
extern  MagickBooleanType
  MagickGetImageRange(MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickGetImageRedPrimary(MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickGetImageResolution(MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickGetImageWhitePoint(MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickHaldClutImage(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  MagickHaldClutImageChannel(MagickWand *,const ChannelType,const MagickWand *);
extern  MagickBooleanType
  MagickHasNextImage(MagickWand *);
extern  MagickBooleanType
  MagickHasPreviousImage(MagickWand *);
extern  MagickBooleanType
  MagickImplodeImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickImportImagePixels(MagickWand *,const ssize_t,const ssize_t,const size_t,    const size_t,const char *,const StorageType,const void *);
extern  MagickBooleanType
  MagickInverseFourierTransformImage(MagickWand *,MagickWand *,    const MagickBooleanType);
extern  MagickBooleanType
  MagickLabelImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickLevelImage(MagickWand *,const double,const double,const double);
extern  MagickBooleanType
  MagickLevelImageChannel(MagickWand *,const ChannelType,const double,    const double,const double);
extern  MagickBooleanType
  MagickLevelImageColors(MagickWand *,const PixelWand *,const PixelWand *,    const MagickBooleanType);
extern  MagickBooleanType
  MagickLevelImageColorsChannel(MagickWand *,const ChannelType,    const PixelWand *,const PixelWand *,const MagickBooleanType);
extern  MagickBooleanType
  MagickLevelizeImage(MagickWand *,const double,const double,const double);
extern  MagickBooleanType
  MagickLevelizeImageChannel(MagickWand *,const ChannelType,const double,    const double,const double);
extern  MagickBooleanType
  MagickLinearStretchImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickLiquidRescaleImage(MagickWand *,const size_t,const size_t,const double,    const double);
extern  MagickBooleanType
  MagickLocalContrastImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickMagnifyImage(MagickWand *);
extern  MagickBooleanType
  MagickMedianFilterImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickMinifyImage(MagickWand *);
extern  MagickBooleanType
  MagickModeImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickModulateImage(MagickWand *,const double,const double,const double);
extern  MagickBooleanType
  MagickMorphologyImage(MagickWand *,const MorphologyMethod,const ssize_t,    const KernelInfo *);
extern  MagickBooleanType
  MagickMorphologyImageChannel(MagickWand *,const ChannelType,    const MorphologyMethod,const ssize_t,const KernelInfo *);
extern  MagickBooleanType
  MagickMotionBlurImage(MagickWand *,const double,const double,const double);
extern  MagickBooleanType
  MagickMotionBlurImageChannel(MagickWand *,const ChannelType,const double,    const double,const double);
extern  MagickBooleanType
  MagickNegateImage(MagickWand *,const MagickBooleanType);
extern  MagickBooleanType
  MagickNegateImageChannel(MagickWand *,const ChannelType,    const MagickBooleanType);
extern  MagickBooleanType
  MagickNewImage(MagickWand *,const size_t,const size_t,const PixelWand *);
extern  MagickBooleanType
  MagickNextImage(MagickWand *);
extern  MagickBooleanType
  MagickNormalizeImage(MagickWand *);
extern  MagickBooleanType
  MagickNormalizeImageChannel(MagickWand *,const ChannelType);
extern  MagickBooleanType
  MagickOilPaintImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickOpaquePaintImage(MagickWand *,const PixelWand *,const PixelWand *,    const double,const MagickBooleanType);
extern  MagickBooleanType
  MagickOpaquePaintImageChannel(MagickWand *,const ChannelType,    const PixelWand *,const PixelWand *,const double,const MagickBooleanType);
extern  MagickBooleanType
  MagickOrderedPosterizeImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickOrderedPosterizeImageChannel(MagickWand *,const ChannelType,    const char *);
extern  MagickBooleanType
  MagickOptimizeImageTransparency(MagickWand *);
extern  MagickBooleanType
  MagickTransparentPaintImage(MagickWand *,const PixelWand *,    const double,const double,const MagickBooleanType invert);
extern  MagickBooleanType
  MagickPingImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickPingImageBlob(MagickWand *,const void *,const size_t);
extern  MagickBooleanType
  MagickPingImageFile(MagickWand *,FILE *);
extern  MagickBooleanType
  MagickPolaroidImage(MagickWand *,const DrawingWand *,const double);
extern  MagickBooleanType
  MagickPosterizeImage(MagickWand *,const size_t,const MagickBooleanType);
extern  MagickBooleanType
  MagickPreviousImage(MagickWand *);
extern  MagickBooleanType
  MagickQuantizeImage(MagickWand *,const size_t,const ColorspaceType,    const size_t,const MagickBooleanType,const MagickBooleanType);
extern  MagickBooleanType
  MagickQuantizeImages(MagickWand *,const size_t,const ColorspaceType,    const size_t,const MagickBooleanType,const MagickBooleanType);
extern  MagickBooleanType
  MagickRaiseImage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t,const MagickBooleanType);
extern  MagickBooleanType
  MagickRandomThresholdImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickRandomThresholdImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickReadImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickReadImageBlob(MagickWand *,const void *,const size_t);
extern  MagickBooleanType
  MagickReadImageFile(MagickWand *,FILE *);
extern  MagickBooleanType
  MagickReduceNoiseImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickRemapImage(MagickWand *,const MagickWand *,const DitherMethod);
extern  MagickBooleanType
  MagickRemoveImage(MagickWand *);
extern  MagickBooleanType
  MagickResampleImage(MagickWand *,const double,const double,const FilterTypes,    const double);
extern  MagickBooleanType
  MagickResetImagePage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickResizeImage(MagickWand *,const size_t,const size_t,const FilterTypes,    const double);
extern  MagickBooleanType
  MagickRollImage(MagickWand *,const ssize_t,const ssize_t);
extern  MagickBooleanType
  MagickRotateImage(MagickWand *,const PixelWand *,const double);
extern  MagickBooleanType
  MagickRotationalBlurImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickRotationalBlurImageChannel(MagickWand *,const ChannelType,    const double);
extern  MagickBooleanType
  MagickSampleImage(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickScaleImage(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickSegmentImage(MagickWand *,const ColorspaceType,const MagickBooleanType,    const double,const double);
extern  MagickBooleanType
  MagickSelectiveBlurImage(MagickWand *,const double,const double,const double);
extern  MagickBooleanType
  MagickSelectiveBlurImageChannel(MagickWand *,const ChannelType,const double,    const double,const double);
extern  MagickBooleanType
  MagickSeparateImageChannel(MagickWand *,const ChannelType);
extern  MagickBooleanType
  MagickSepiaToneImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickSetImage(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  MagickSetImageAlphaChannel(MagickWand *,const AlphaChannelType);
extern  MagickBooleanType
  MagickSetImageBackgroundColor(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickSetImageBias(MagickWand *,const double);
extern  MagickBooleanType
  MagickSetImageBluePrimary(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickSetImageBorderColor(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickSetImageChannelDepth(MagickWand *,const ChannelType,const size_t);
extern  MagickBooleanType
  MagickSetImageClipMask(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  MagickSetImageColor(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickSetImageColormapColor(MagickWand *,const size_t,    const PixelWand *);
extern  MagickBooleanType
  MagickSetImageColorspace(MagickWand *,const ColorspaceType);
extern  MagickBooleanType
  MagickSetImageCompose(MagickWand *,const CompositeOperator);
extern  MagickBooleanType
  MagickSetImageCompression(MagickWand *,const CompressionType);
extern  MagickBooleanType
  MagickSetImageDelay(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetImageDepth(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetImageDispose(MagickWand *,const DisposeType);
extern  MagickBooleanType
  MagickSetImageCompressionQuality(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetImageEndian(MagickWand *,const EndianType);
extern  MagickBooleanType
  MagickSetImageExtent(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickSetImageFilename(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetImageFormat(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetImageFuzz(MagickWand *,const double);
extern  MagickBooleanType
  MagickSetImageGamma(MagickWand *,const double);
extern  MagickBooleanType
  MagickSetImageGravity(MagickWand *,const GravityType);
extern  MagickBooleanType
  MagickSetImageGreenPrimary(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickSetImageInterlaceScheme(MagickWand *,const InterlaceType);
extern  MagickBooleanType
  MagickSetImageInterpolateMethod(MagickWand *,const InterpolatePixelMethod);
extern  MagickBooleanType
  MagickSetImageIterations(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetImageMatte(MagickWand *,const MagickBooleanType);
extern  MagickBooleanType
  MagickSetImageMatteColor(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickSetImageOpacity(MagickWand *,const double);
extern  MagickBooleanType
  MagickSetImageOrientation(MagickWand *,const OrientationType);
extern  MagickBooleanType
  MagickSetImagePage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickSetImageRedPrimary(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickSetImageRenderingIntent(MagickWand *,const RenderingIntent);
extern  MagickBooleanType
  MagickSetImageResolution(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickSetImageScene(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetImagePixelColor(MagickWand *,const ssize_t,const ssize_t,    const PixelWand *);
extern  MagickBooleanType
  MagickSetImageTicksPerSecond(MagickWand *,const ssize_t);
extern  MagickBooleanType
  MagickSetImageType(MagickWand *,const ImageType);
extern  MagickBooleanType
  MagickSetImageUnits(MagickWand *,const ResolutionType);
extern  MagickBooleanType
  MagickSetImageWhitePoint(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickShadeImage(MagickWand *,const MagickBooleanType,const double,    const double);
extern  MagickBooleanType
  MagickShadowImage(MagickWand *,const double,const double,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickSharpenImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickSharpenImageChannel(MagickWand *,const ChannelType,const double,    const double);
extern  MagickBooleanType
  MagickShaveImage(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickShearImage(MagickWand *,const PixelWand *,const double,const double);
extern  MagickBooleanType
  MagickSigmoidalContrastImage(MagickWand *,const MagickBooleanType,    const double,const double);
extern  MagickBooleanType
  MagickSigmoidalContrastImageChannel(MagickWand *,const ChannelType,    const MagickBooleanType,const double,const double);
extern  MagickBooleanType
  MagickSketchImage(MagickWand *,const double,const double,const double);
extern  MagickBooleanType
  MagickSolarizeImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickSolarizeImageChannel(MagickWand *,const ChannelType,const double);
extern  MagickBooleanType
  MagickSparseColorImage(MagickWand *,const ChannelType,const SparseColorMethod,    const size_t,const double *);
extern  MagickBooleanType
  MagickSpliceImage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickSpreadImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickStatisticImage(MagickWand *,const StatisticType,const size_t,    const size_t);
extern  MagickBooleanType
  MagickStatisticImageChannel(MagickWand *,const ChannelType,    const StatisticType,const size_t,const size_t);
extern  MagickBooleanType
  MagickStripImage(MagickWand *);
extern  MagickBooleanType
  MagickSwirlImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickTintImage(MagickWand *,const PixelWand *,const PixelWand *);
extern  MagickBooleanType
  MagickTransformImageColorspace(MagickWand *,const ColorspaceType);
extern  MagickBooleanType
  MagickTransposeImage(MagickWand *);
extern  MagickBooleanType
  MagickTransverseImage(MagickWand *);
extern  MagickBooleanType
  MagickThresholdImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickThresholdImageChannel(MagickWand *,const ChannelType,const double);
extern  MagickBooleanType
  MagickThumbnailImage(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickTrimImage(MagickWand *,const double);
extern  MagickBooleanType
  MagickUniqueImageColors(MagickWand *);
extern  MagickBooleanType
  MagickUnsharpMaskImage(MagickWand *,const double,const double,const double,    const double);
extern  MagickBooleanType
  MagickUnsharpMaskImageChannel(MagickWand *,const ChannelType,const double,    const double,const double,const double);
extern  MagickBooleanType
  MagickVignetteImage(MagickWand *,const double,const double,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickWaveImage(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickWhiteThresholdImage(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickWriteImage(MagickWand *,const char *);
extern  MagickBooleanType
  MagickWriteImageFile(MagickWand *,FILE *);
extern  MagickBooleanType
  MagickWriteImages(MagickWand *,const char *,const MagickBooleanType);
extern  MagickBooleanType
  MagickWriteImagesFile(MagickWand *,FILE *);

extern  MagickProgressMonitor
  MagickSetImageProgressMonitor(MagickWand *,const MagickProgressMonitor,
    void *);

extern  MagickWand
  *MagickAppendImages(MagickWand *,const MagickBooleanType);
extern  MagickBooleanType
  *MagickCoalesceImages(MagickWand *);
extern  MagickBooleanType
  *MagickCombineImages(MagickWand *,const ChannelType);
extern  MagickBooleanType
  *MagickCompareImageChannels(MagickWand *,const MagickWand *,const ChannelType,    const MetricType,double *);
extern  MagickBooleanType
  *MagickCompareImages(MagickWand *,const MagickWand *,const MetricType,    double *);
extern  MagickBooleanType
  *MagickCompareImageLayers(MagickWand *,const ImageLayerMethod);
extern  MagickBooleanType
  *MagickDeconstructImages(MagickWand *);
extern  MagickBooleanType
  *MagickEvaluateImages(MagickWand *,const MagickEvaluateOperator);
extern  MagickBooleanType
  *MagickFxImage(MagickWand *,const char *);
extern  MagickBooleanType
  *MagickFxImageChannel(MagickWand *,const ChannelType,const char *);
extern  MagickBooleanType
  *MagickGetImage(MagickWand *);
extern  MagickBooleanType
  *MagickGetImageClipMask(MagickWand *);
extern  MagickBooleanType
  *MagickGetImageRegion(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  *MagickMergeImageLayers(MagickWand *,const ImageLayerMethod);
extern  MagickBooleanType
  *MagickMorphImages(MagickWand *,const size_t);
extern  MagickBooleanType
  *MagickMontageImage(MagickWand *,const DrawingWand *,const char *,    const char *,const MontageMode,const char *);
extern  MagickBooleanType
  *MagickOptimizeImageLayers(MagickWand *);
extern  MagickBooleanType
  *MagickPreviewImages(MagickWand *wand,const PreviewType);
extern  MagickBooleanType
  *MagickSimilarityImage(MagickWand *,const MagickWand *,RectangleInfo *,    double *);
extern  MagickBooleanType
  *MagickSmushImages(MagickWand *,const MagickBooleanType,const ssize_t);
extern  MagickBooleanType
  *MagickSteganoImage(MagickWand *,const MagickWand *,const ssize_t);
extern  MagickBooleanType
  *MagickStereoImage(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  *MagickTextureImage(MagickWand *,const MagickWand *);
extern  MagickBooleanType
  *MagickTransformImage(MagickWand *,const char *,const char *);

extern  OrientationType
  MagickGetImageOrientation(MagickWand *);

extern  PixelWand
  **MagickGetImageHistogram(MagickWand *,size_t *);

extern  RenderingIntent
  MagickGetImageRenderingIntent(MagickWand *);

extern  ResolutionType
  MagickGetImageUnits(MagickWand *);

extern  size_t
  MagickGetImageColors(MagickWand *);
extern  size_t
  MagickGetImageCompressionQuality(MagickWand *);
extern  size_t
  MagickGetImageDelay(MagickWand *);
extern  size_t
  MagickGetImageChannelDepth(MagickWand *,const ChannelType);
extern  size_t
  MagickGetImageDepth(MagickWand *);
extern  size_t
  MagickGetImageHeight(MagickWand *);
extern  size_t
  MagickGetImageIterations(MagickWand *);
extern  size_t
  MagickGetImageScene(MagickWand *);
extern  size_t
  MagickGetImageTicksPerSecond(MagickWand *);
extern  size_t
  MagickGetImageWidth(MagickWand *);
extern  size_t
  MagickGetNumberImages(MagickWand *);

extern  unsigned char
  *MagickGetImageBlob(MagickWand *,size_t *);
extern  double
  *MagickGetImagesBlob(MagickWand *,size_t *);

extern  VirtualPixelMethod
  MagickGetImageVirtualPixelMethod(MagickWand *);
extern  VirtualPixelMethod
  MagickSetImageVirtualPixelMethod(MagickWand *,const VirtualPixelMethod);


#endif
