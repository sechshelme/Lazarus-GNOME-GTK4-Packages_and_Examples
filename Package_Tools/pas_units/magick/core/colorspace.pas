unit colorspace;

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

  MagickCore image colorspace methods.
 }
{$ifndef MAGICKCORE_COLORSPACE_H}
{$define MAGICKCORE_COLORSPACE_H}
{ Linear RGB colorspace  }
{ greyscale (non-linear) image (faked 1 channel)  }
{ negated linear RGB with black separated  }
{ Default: non-linear sRGB colorspace  }
{ negated linear RGB colorspace  }
{ alias for LCHuv  }
{ Cylindrical (Polar) Lab  }
{ Cylindrical (Polar) Luv  }
{ alias for HSB  }
{ greyscale (linear) image (faked 1 channel)  }
type
  PColorspaceType = ^TColorspaceType;
  TColorspaceType =  Longint;
  Const
    UndefinedColorspace = 0;
    RGBColorspace = 1;
    GRAYColorspace = 2;
    TransparentColorspace = 3;
    OHTAColorspace = 4;
    LabColorspace = 5;
    XYZColorspace = 6;
    YCbCrColorspace = 7;
    YCCColorspace = 8;
    YIQColorspace = 9;
    YPbPrColorspace = 10;
    YUVColorspace = 11;
    CMYKColorspace = 12;
    sRGBColorspace = 13;
    HSBColorspace = 14;
    HSLColorspace = 15;
    HWBColorspace = 16;
    Rec601LumaColorspace = 17;
    Rec601YCbCrColorspace = 18;
    Rec709LumaColorspace = 19;
    Rec709YCbCrColorspace = 20;
    LogColorspace = 21;
    CMYColorspace = 22;
    LuvColorspace = 23;
    HCLColorspace = 24;
    LCHColorspace = 25;
    LMSColorspace = 26;
    LCHabColorspace = 27;
    LCHuvColorspace = 28;
    scRGBColorspace = 29;
    HSIColorspace = 30;
    HSVColorspace = 31;
    HCLpColorspace = 32;
    YDbDrColorspace = 33;
    xyYColorspace = 34;
    LinearGRAYColorspace = 35;
;

function GetImageColorspaceType(para1:PImage; para2:PExceptionInfo):TColorspaceType;cdecl;external libmagiccore;
function RGBTransformImage(para1:PImage; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageColorspace(para1:PImage; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageGray(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageMonochrome(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function TransformImageColorspace(para1:PImage; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagiccore;
function TransformRGBImage(para1:PImage; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:47:29 ===


implementation



end.
