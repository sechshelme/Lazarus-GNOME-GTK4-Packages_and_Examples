
unit threshold;
interface

{
  Automatically converted by H2Pas 1.0.0 from threshold.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    threshold.h
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
PAutoThresholdMethod  = ^AutoThresholdMethod;
Pchar  = ^char;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PImage  = ^Image;
PThresholdMap  = ^ThresholdMap;
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

  MagickCore image threshold methods.
 }
{$ifndef MAGICKCORE_THRESHOLD_H}
{$define MAGICKCORE_THRESHOLD_H}
type
  PAutoThresholdMethod = ^TAutoThresholdMethod;
  TAutoThresholdMethod =  Longint;
  Const
    UndefinedThresholdMethod = 0;
    KapurThresholdMethod = 1;
    OTSUThresholdMethod = 2;
    TriangleThresholdMethod = 3;
;
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function AdaptiveThresholdImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:PExceptionInfo):PImage;cdecl;external;
function DestroyThresholdMap(para1:PThresholdMap):PThresholdMap;cdecl;external;
(* Const before type ignored *)
function GetThresholdMap(para1:Pchar; para2:PExceptionInfo):PThresholdMap;cdecl;external;
(* Const before type ignored *)
function AutoThresholdImage(para1:PImage; para2:TAutoThresholdMethod; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function BilevelImage(para1:PImage; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function BilevelImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function BlackThresholdImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function BlackThresholdImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
function ClampImage(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ClampImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external;
function ListThresholdMaps(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function OrderedDitherImage(para1:PImage):TMagickBooleanType;cdecl;external;
{ deprecated  }
(* Const before type ignored *)
function OrderedDitherImageChannel(para1:PImage; para2:TChannelType; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function OrderedPosterizeImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function OrderedPosterizeImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function PerceptibleImage(para1:PImage; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PerceptibleImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function RandomThresholdImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RandomThresholdImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function WhiteThresholdImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function WhiteThresholdImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;

implementation


end.
