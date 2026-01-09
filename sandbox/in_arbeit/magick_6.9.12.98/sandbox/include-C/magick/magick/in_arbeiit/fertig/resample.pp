
unit resample;
interface

{
  Automatically converted by H2Pas 1.0.0 from resample.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    resample.h
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
PExceptionInfo  = ^ExceptionInfo;
PFilterTypes  = ^FilterTypes;
PImage  = ^Image;
PMagickPixelPacket  = ^MagickPixelPacket;
PResampleFilter  = ^ResampleFilter;
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

  MagickCore graphic resample methods.
 }
{$ifndef MAGICKCORE_RESAMPLE_H}
{$define MAGICKCORE_RESAMPLE_H}
{$include "magick/cache-view.h"}
{
  WARNING:  The order of this table must also match the order of a table
  located in AcquireResizeFilter() in "resize.c" otherwise the users filter
  will not match the actual filter that is setup.
 }
{ a count of all the filters, not a real filter  }
type
  PFilterTypes = ^TFilterTypes;
  TFilterTypes =  Longint;
  Const
    UndefinedFilter = 0;
    PointFilter = 1;
    BoxFilter = 2;
    TriangleFilter = 3;
    HermiteFilter = 4;
    HanningFilter = 5;
    HammingFilter = 6;
    BlackmanFilter = 7;
    GaussianFilter = 8;
    QuadraticFilter = 9;
    CubicFilter = 10;
    CatromFilter = 11;
    MitchellFilter = 12;
    JincFilter = 13;
    SincFilter = 14;
    SincFastFilter = 15;
    KaiserFilter = 16;
    WelshFilter = 17;
    ParzenFilter = 18;
    BohmanFilter = 19;
    BartlettFilter = 20;
    LagrangeFilter = 21;
    LanczosFilter = 22;
    LanczosSharpFilter = 23;
    Lanczos2Filter = 24;
    Lanczos2SharpFilter = 25;
    RobidouxFilter = 26;
    RobidouxSharpFilter = 27;
    CosineFilter = 28;
    SplineFilter = 29;
    LanczosRadiusFilter = 30;
    SentinelFilter = 31;
;
{
  Backward compatibility for the more correctly named Jinc Filter.  Original
  source of this filter is from "zoom" but it refers to a reference by Pratt,
  who does not actualy name the filter.
 }
  BesselFilter = JincFilter;  
type
(* Const before type ignored *)
(* Const before type ignored *)

function ResamplePixelColor(para1:PResampleFilter; para2:Tdouble; para3:Tdouble; para4:PMagickPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SetResampleFilterInterpolateMethod(para1:PResampleFilter; para2:TInterpolatePixelMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SetResampleFilterVirtualPixelMethod(para1:PResampleFilter; para2:TVirtualPixelMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function AcquireResampleFilter(para1:PImage; para2:PExceptionInfo):PResampleFilter;cdecl;external;
function DestroyResampleFilter(para1:PResampleFilter):PResampleFilter;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ScaleResampleFilter(para1:PResampleFilter; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure SetResampleFilter(para1:PResampleFilter; para2:TFilterTypes; para3:Tdouble);cdecl;external;
{$endif}

implementation


end.
