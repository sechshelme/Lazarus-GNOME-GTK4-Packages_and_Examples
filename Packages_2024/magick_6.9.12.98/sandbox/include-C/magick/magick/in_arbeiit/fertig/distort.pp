
unit distort;
interface

{
  Automatically converted by H2Pas 1.0.0 from distort.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    distort.h
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
PDistortImageMethod  = ^DistortImageMethod;
Pdouble  = ^double;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PSparseColorMethod  = ^SparseColorMethod;
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

  MagickCore image distortion methods.
 }
{$ifndef MAGICKCORE_DISTORT_H}
{$define MAGICKCORE_DISTORT_H}
{
  These two enum are linked, with common enumerated values.  Both
  DistortImages() and SparseColor() often share code to determine functional
  coefficients for common methods.

  Caution should be taken to ensure that only the common methods contain the
  same enumerated value, while all others remain unique across both
  enumerations.
 }
type
  PDistortImageMethod = ^TDistortImageMethod;
  TDistortImageMethod =  Longint;
  Const
    UndefinedDistortion = 0;
    AffineDistortion = 1;
    AffineProjectionDistortion = 2;
    ScaleRotateTranslateDistortion = 3;
    PerspectiveDistortion = 4;
    PerspectiveProjectionDistortion = 5;
    BilinearForwardDistortion = 6;
    BilinearDistortion = BilinearForwardDistortion;
    BilinearReverseDistortion = (BilinearForwardDistortion)+1;
    PolynomialDistortion = (BilinearForwardDistortion)+2;
    ArcDistortion = (BilinearForwardDistortion)+3;
    PolarDistortion = (BilinearForwardDistortion)+4;
    DePolarDistortion = (BilinearForwardDistortion)+5;
    Cylinder2PlaneDistortion = (BilinearForwardDistortion)+6;
    Plane2CylinderDistortion = (BilinearForwardDistortion)+7;
    BarrelDistortion = (BilinearForwardDistortion)+8;
    BarrelInverseDistortion = (BilinearForwardDistortion)+9;
    ShepardsDistortion = (BilinearForwardDistortion)+10;
    ResizeDistortion = (BilinearForwardDistortion)+11;
    SentinelDistortion = (BilinearForwardDistortion)+12;
;
{
    Methods unique to SparseColor().
   }
type
  PSparseColorMethod = ^TSparseColorMethod;
  TSparseColorMethod =  Longint;
  Const
    UndefinedColorInterpolate = UndefinedDistortion;
    BarycentricColorInterpolate = AffineDistortion;
    BilinearColorInterpolate = BilinearReverseDistortion;
    PolynomialColorInterpolate = PolynomialDistortion;
    ShepardsColorInterpolate = ShepardsDistortion;
    VoronoiColorInterpolate = SentinelDistortion;
    InverseColorInterpolate = (SentinelDistortion)+1;
    ManhattanColorInterpolate = (SentinelDistortion)+2;
;
(* Const before type ignored *)
(* Const before type ignored *)

function AffineTransformImage(para1:PImage; para2:PAffineMatrix; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function DistortImage(para1:PImage; para2:TDistortImageMethod; para3:Tsize_t; para4:Pdouble; para5:TMagickBooleanType; 
           exception:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function DistortResizeImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RotateImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SparseColorImage(para1:PImage; para2:TChannelType; para3:TSparseColorMethod; para4:Tsize_t; para5:Pdouble; 
           para6:PExceptionInfo):PImage;cdecl;external;
{$endif}

implementation


end.
