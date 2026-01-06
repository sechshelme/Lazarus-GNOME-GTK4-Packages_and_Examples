
unit color;
interface

{
  Automatically converted by H2Pas 1.0.0 from color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    color.h
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
PColorInfo  = ^ColorInfo;
PComplianceType  = ^ComplianceType;
PErrorInfo  = ^ErrorInfo;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PImage  = ^Image;
PMagickPixelPacket  = ^MagickPixelPacket;
PPixelPacket  = ^PixelPacket;
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

  MagickCore image color methods.
 }
{$ifndef MAGICKCORE_COLOR_H}
{$define MAGICKCORE_COLOR_H}
{$include "magick/pixel.h"}
{$include "magick/exception.h"}
type
  PComplianceType = ^TComplianceType;
  TComplianceType =  Longint;
  Const
    UndefinedCompliance = 0;
    NoCompliance = $0000;
    CSSCompliance = $0001;
    SVGCompliance = $0001;
    X11Compliance = $0002;
    XPMCompliance = $0004;
    MVGCompliance = $0008;
    AllCompliance = $7fffffff;
;
{ deprecated, use GetColorInfoList()  }
type
  PColorInfo = ^TColorInfo;
  TColorInfo = record
      path : Pchar;
      name : Pchar;
      compliance : TComplianceType;
      color : TMagickPixelPacket;
      exempt : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PColorInfo;
      next : PColorInfo;
      signature : Tsize_t;
    end;

  PErrorInfo = ^TErrorInfo;
  TErrorInfo = record
      mean_error_per_pixel : Tdouble;
      normalized_mean_error : Tdouble;
      normalized_maximum_error : Tdouble;
    end;
(* Const before type ignored *)

function GetColorList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetColorInfo(para1:Pchar; para2:PExceptionInfo):PColorInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetColorInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PColorInfo;cdecl;external;
function ColorComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function IsColorSimilar(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function IsImageSimilar(para1:PImage; para2:PImage; x:Pssize_t; y:Pssize_t; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function IsMagickColorSimilar(para1:PMagickPixelPacket; para2:PMagickPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function IsOpacitySimilar(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external;
function ListColorInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function QueryColorCompliance(para1:Pchar; para2:TComplianceType; para3:PPixelPacket; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function QueryColorDatabase(para1:Pchar; para2:PPixelPacket; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function QueryColorname(para1:PImage; para2:PPixelPacket; para3:TComplianceType; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function QueryMagickColorCompliance(para1:Pchar; para2:TComplianceType; para3:PMagickPixelPacket; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function QueryMagickColor(para1:Pchar; para2:PMagickPixelPacket; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function QueryMagickColorname(para1:PImage; para2:PMagickPixelPacket; para3:TComplianceType; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
procedure ColorComponentTerminus;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConcatenateColorComponent(para1:PMagickPixelPacket; para2:TChannelType; para3:TComplianceType; para4:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure GetColorTuple(para1:PMagickPixelPacket; para2:TMagickBooleanType; para3:Pchar);cdecl;external;
{$endif}

implementation


end.
