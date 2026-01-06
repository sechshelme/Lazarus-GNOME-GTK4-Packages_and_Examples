
unit morphology;
interface

{
  Automatically converted by H2Pas 1.0.0 from morphology.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    morphology.h
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
Pchar  = ^char;
Pdouble  = ^double;
PExceptionInfo  = ^ExceptionInfo;
PGeometryInfo  = ^GeometryInfo;
PImage  = ^Image;
PKernelInfo  = ^KernelInfo;
PKernelInfoType  = ^KernelInfoType;
PMorphologyMethod  = ^MorphologyMethod;
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

  MagickCore morphology methods.
 }
{$ifndef MAGICKCORE_MORPHOLOGY_H}
{$define MAGICKCORE_MORPHOLOGY_H}
{$include "magick/geometry.h"}
{ equivalent to UnityKernel  }
{ The no-op or 'original image' kernel  }
{ Convolution Kernels, Gaussian Based  }
{ Convolution Kernels, by Name  }
{ Shape Kernels  }
{ Hit And Miss Kernels  }
{ Distance Measuring Kernels  }
{ User Specified Kernel Array  }
type
  PKernelInfoType = ^TKernelInfoType;
  TKernelInfoType =  Longint;
  Const
    UndefinedKernel = 0;
    UnityKernel = 1;
    GaussianKernel = 2;
    DoGKernel = 3;
    LoGKernel = 4;
    BlurKernel = 5;
    CometKernel = 6;
    LaplacianKernel = 7;
    SobelKernel = 8;
    FreiChenKernel = 9;
    RobertsKernel = 10;
    PrewittKernel = 11;
    CompassKernel = 12;
    KirschKernel = 13;
    DiamondKernel = 14;
    SquareKernel = 15;
    RectangleKernel = 16;
    OctagonKernel = 17;
    DiskKernel = 18;
    PlusKernel = 19;
    CrossKernel = 20;
    RingKernel = 21;
    PeaksKernel = 22;
    EdgesKernel = 23;
    CornersKernel = 24;
    DiagonalsKernel = 25;
    LineEndsKernel = 26;
    LineJunctionsKernel = 27;
    RidgesKernel = 28;
    ConvexHullKernel = 29;
    ThinSEKernel = 30;
    SkeletonKernel = 31;
    ChebyshevKernel = 32;
    ManhattanKernel = 33;
    OctagonalKernel = 34;
    EuclideanKernel = 35;
    UserDefinedKernel = 36;
    BinomialKernel = 37;
;
{ Convolve / Correlate weighted sums  }
{ Weighted Sum with reflected kernel  }
{ Weighted Sum using a sliding window  }
{ Low-level Morphology methods  }
{ Minimum Value in Neighbourhood  }
{ Maximum Value in Neighbourhood  }
{ Pixel Pick using GreyScale Erode  }
{ Pixel Pick using GreyScale Dialate  }
{ Add Kernel Value, take Minimum  }
{ Second-level Morphology methods  }
{ Dilate then Erode  }
{ Erode then Dilate  }
{ Pixel Pick using GreyScale Open  }
{ Pixel Pick using GreyScale Close  }
{ Open then Close  }
{ Difference Morphology methods  }
{ Dilate difference from Original  }
{ Erode difference from Original  }
{ Dilate difference with Erode  }
{ Close difference from Original  }
{ Open difference from Original  }
{ Recursive Morphology methods  }
{ Foreground/Background pattern matching  }
{ Remove matching pixels from image  }
{ Add matching pixels from image  }
{ Experimental Morphology methods  }
{ distance matte channel copy nearest color  }
{ Add Kernel Value, take Minimum  }
type
  PMorphologyMethod = ^TMorphologyMethod;
  TMorphologyMethod =  Longint;
  Const
    UndefinedMorphology = 0;
    ConvolveMorphology = 1;
    CorrelateMorphology = 2;
    ErodeMorphology = 3;
    DilateMorphology = 4;
    ErodeIntensityMorphology = 5;
    DilateIntensityMorphology = 6;
    DistanceMorphology = 7;
    OpenMorphology = 8;
    CloseMorphology = 9;
    OpenIntensityMorphology = 10;
    CloseIntensityMorphology = 11;
    SmoothMorphology = 12;
    EdgeInMorphology = 13;
    EdgeOutMorphology = 14;
    EdgeMorphology = 15;
    TopHatMorphology = 16;
    BottomHatMorphology = 17;
    HitAndMissMorphology = 18;
    ThinningMorphology = 19;
    ThickenMorphology = 20;
    VoronoiMorphology = 21;
    IterativeDistanceMorphology = 22;
;
type
  PKernelInfo = ^TKernelInfo;
  TKernelInfo = record
      _type : TKernelInfoType;
      width : Tsize_t;
      height : Tsize_t;
      x : Tssize_t;
      y : Tssize_t;
      values : Pdouble;
      minimum : Tdouble;
      maximum : Tdouble;
      negative_range : Tdouble;
      positive_range : Tdouble;
      angle : Tdouble;
      next : PKernelInfo;
      signature : Tsize_t;
    end;
(* Const before type ignored *)

function AcquireKernelInfo(para1:Pchar):PKernelInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireKernelBuiltIn(para1:TKernelInfoType; para2:PGeometryInfo):PKernelInfo;cdecl;external;
(* Const before type ignored *)
function CloneKernelInfo(para1:PKernelInfo):PKernelInfo;cdecl;external;
function DestroyKernelInfo(para1:PKernelInfo):PKernelInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MorphologyImage(para1:PImage; para2:TMorphologyMethod; para3:Tssize_t; para4:PKernelInfo; para5:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MorphologyImageChannel(para1:PImage; para2:TChannelType; para3:TMorphologyMethod; para4:Tssize_t; para5:PKernelInfo; 
           para6:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
procedure ScaleGeometryKernelInfo(para1:PKernelInfo; para2:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ScaleKernelInfo(para1:PKernelInfo; para2:Tdouble; para3:TGeometryFlags);cdecl;external;
(* Const before type ignored *)
procedure ShowKernelInfo(para1:PKernelInfo);cdecl;external;
(* Const before type ignored *)
procedure UnityAddKernelInfo(para1:PKernelInfo; para2:Tdouble);cdecl;external;
{$endif}

implementation


end.
