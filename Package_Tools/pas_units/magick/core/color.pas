unit color;

interface

uses
  fp_magiccore;

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

function GetColorList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function GetColorInfo(para1:Pchar; para2:PExceptionInfo):PColorInfo;cdecl;external libmagiccore;
function GetColorInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PColorInfo;cdecl;external libmagiccore;
function ColorComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function IsColorSimilar(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function IsImageSimilar(para1:PImage; para2:PImage; x:Pssize_t; y:Pssize_t; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsMagickColorSimilar(para1:PMagickPixelPacket; para2:PMagickPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function IsOpacitySimilar(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function ListColorInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function QueryColorCompliance(para1:Pchar; para2:TComplianceType; para3:PPixelPacket; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function QueryColorDatabase(para1:Pchar; para2:PPixelPacket; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function QueryColorname(para1:PImage; para2:PPixelPacket; para3:TComplianceType; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function QueryMagickColorCompliance(para1:Pchar; para2:TComplianceType; para3:PMagickPixelPacket; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function QueryMagickColor(para1:Pchar; para2:PMagickPixelPacket; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function QueryMagickColorname(para1:PImage; para2:PMagickPixelPacket; para3:TComplianceType; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
procedure ColorComponentTerminus;cdecl;external libmagiccore;
procedure ConcatenateColorComponent(para1:PMagickPixelPacket; para2:TChannelType; para3:TComplianceType; para4:Pchar);cdecl;external libmagiccore;
procedure GetColorTuple(para1:PMagickPixelPacket; para2:TMagickBooleanType; para3:Pchar);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:36:24 ===


implementation



end.
