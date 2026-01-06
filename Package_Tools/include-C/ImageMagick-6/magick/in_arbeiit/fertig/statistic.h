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

  MagickCore statistical methods.
*/
#ifndef MAGICKCORE_STATISTIC_H
#define MAGICKCORE_STATISTIC_H


#define MaximumNumberOfImageMoments  8
#define MaximumNumberOfPerceptualHashes  7

typedef struct _ChannelStatistics
{
  size_t
    depth;

  double
    minima,
    maxima,
    sum,
    sum_squared,
    sum_cubed,
    sum_fourth_power,
    mean,
    variance,
    standard_deviation,
    kurtosis,
    skewness,
    entropy;
} ChannelStatistics;

#undef I

typedef struct _ChannelMoments
{
  double
    I[32];

  PointInfo
    centroid,
    ellipse_axis;

  double
    ellipse_angle,
    ellipse_eccentricity,
    ellipse_intensity;
} ChannelMoments;

typedef struct _ChannelPerceptualHash
{
  double
    P[32],
    Q[32];
} ChannelPerceptualHash;

typedef enum
{
  UndefinedEvaluateOperator,
  AddEvaluateOperator,
  AndEvaluateOperator,
  DivideEvaluateOperator,
  LeftShiftEvaluateOperator,
  MaxEvaluateOperator,
  MinEvaluateOperator,
  MultiplyEvaluateOperator,
  OrEvaluateOperator,
  RightShiftEvaluateOperator,
  SetEvaluateOperator,
  SubtractEvaluateOperator,
  XorEvaluateOperator,
  PowEvaluateOperator,
  LogEvaluateOperator,
  ThresholdEvaluateOperator,
  ThresholdBlackEvaluateOperator,
  ThresholdWhiteEvaluateOperator,
  GaussianNoiseEvaluateOperator,
  ImpulseNoiseEvaluateOperator,
  LaplacianNoiseEvaluateOperator,
  MultiplicativeNoiseEvaluateOperator,
  PoissonNoiseEvaluateOperator,
  UniformNoiseEvaluateOperator,
  CosineEvaluateOperator,
  SineEvaluateOperator,
  AddModulusEvaluateOperator,
  MeanEvaluateOperator,
  AbsEvaluateOperator,
  ExponentialEvaluateOperator,
  MedianEvaluateOperator,
  SumEvaluateOperator,
  RootMeanSquareEvaluateOperator,
  InverseLogEvaluateOperator
} MagickEvaluateOperator;

typedef enum
{
  UndefinedFunction,
  PolynomialFunction,
  SinusoidFunction,
  ArcsinFunction,
  ArctanFunction
} MagickFunction;

typedef enum
{
  UndefinedStatistic,
  GradientStatistic,
  MaximumStatistic,
  MeanStatistic,
  MedianStatistic,
  MinimumStatistic,
  ModeStatistic,
  NonpeakStatistic,
  StandardDeviationStatistic,
  RootMeanSquareStatistic
} StatisticType;

extern  ChannelStatistics
  *GetImageChannelStatistics(const Image *,ExceptionInfo *);

extern  ChannelMoments
  *GetImageChannelMoments(const Image *,ExceptionInfo *);

extern  ChannelPerceptualHash
  *GetImageChannelPerceptualHash(const Image *,ExceptionInfo *);

extern  Image
  *EvaluateImages(const Image *,const MagickEvaluateOperator,ExceptionInfo *);
extern  Image
  *PolynomialImage(const Image *,const size_t,const double *,ExceptionInfo *);
extern  Image
  *PolynomialImageChannel(const Image *,const ChannelType,const size_t,
    const double *,ExceptionInfo *);
extern  Image
  *StatisticImage(const Image *,const StatisticType,const size_t,const size_t,
    ExceptionInfo *);
extern  Image
  *StatisticImageChannel(const Image *,const ChannelType,const StatisticType,
    const size_t,const size_t,ExceptionInfo *);

extern  MagickBooleanType
  EvaluateImage(Image *,const MagickEvaluateOperator,const double,
    ExceptionInfo *);
extern  MagickBooleanType
  EvaluateImageChannel(Image *,const ChannelType,const MagickEvaluateOperator,
    const double,ExceptionInfo *);
extern  MagickBooleanType
  FunctionImage(Image *,const MagickFunction,const size_t,const double *,
    ExceptionInfo *);
extern  MagickBooleanType
  FunctionImageChannel(Image *,const ChannelType,const MagickFunction,
    const size_t,const double *,ExceptionInfo *);
extern  MagickBooleanType
  GetImageChannelEntropy(const Image *,const ChannelType,double *,
    ExceptionInfo *);
extern  MagickBooleanType
  GetImageChannelExtrema(const Image *,const ChannelType,size_t *,size_t *,
    ExceptionInfo *);
extern  MagickBooleanType
  GetImageChannelMean(const Image *,const ChannelType,double *,double *,
    ExceptionInfo *);
extern  MagickBooleanType
  GetImageChannelKurtosis(const Image *,const ChannelType,double *,double *,
    ExceptionInfo *);
extern  MagickBooleanType
  GetImageChannelRange(const Image *,const ChannelType,double *,double *,
    ExceptionInfo *);
extern  MagickBooleanType
  GetImageEntropy(const Image *,double *,ExceptionInfo *);
extern  MagickBooleanType
  GetImageExtrema(const Image *,size_t *,size_t *,ExceptionInfo *);
extern  MagickBooleanType
  GetImageMean(const Image *,double *,double *,ExceptionInfo *);
extern  MagickBooleanType
  GetImageKurtosis(const Image *,double *,double *,ExceptionInfo *);
extern  MagickBooleanType
  GetImageRange(const Image *,double *,double *,ExceptionInfo *);


#endif
