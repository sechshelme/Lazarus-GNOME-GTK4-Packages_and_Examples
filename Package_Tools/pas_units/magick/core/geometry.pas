unit geometry;

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

  MagickCore image geometry methods.
 }
{$ifndef MAGICKCORE_GEOMETRY_H}
{$define MAGICKCORE_GEOMETRY_H}
{$undef NoValue}
{$undef XValue}
{$undef YValue}
{$undef WidthValue}
{$undef HeightValue}
{$undef XNegative}
{$undef YNegative}
{ '%'  percentage of something  }
{ '!'  resize no-aspect - special use flag  }
{ '!'  ScaleKernelValue() in morphology.c  }
{ '<'  resize smaller - special use flag  }
{ '>'  resize larger - spacial use flag  }
{ '^'  special handling needed  }
{ '^' see ScaleKernelValue()  }
{ '@'  resize to area - special use flag  }
{ '.'  floating point numbers found  }
{ 'x'  separator found  }
{ '~'  special handling needed  }
{ '/'  alpha  }
{$undef AllValues}
type
  PGeometryFlags = ^TGeometryFlags;
  TGeometryFlags =  Longint;
  Const
    NoValue = $0000;
    XValue = $0001;
    XiValue = $0001;
    YValue = $0002;
    PsiValue = $0002;
    WidthValue = $0004;
    RhoValue = $0004;
    HeightValue = $0008;
    SigmaValue = $0008;
    ChiValue = $0010;
    XiNegative = $0020;
    XNegative = $0020;
    PsiNegative = $0040;
    YNegative = $0040;
    ChiNegative = $0080;
    PercentValue = $1000;
    AspectValue = $2000;
    NormalizeValue = $2000;
    LessValue = $4000;
    GreaterValue = $8000;
    MinimumValue = $10000;
    CorrelateNormalizeValue = $10000;
    AreaValue = $20000;
    DecimalValue = $40000;
    SeparatorValue = $80000;
    AspectRatioValue = $100000;
    AlphaValue = $200000;
    AllValues = $7fffffff;
;
type
  PGravityType = ^TGravityType;
  TGravityType =  Longint;
  Const
    UndefinedGravity = 0;
    ForgetGravity = 0;
    NorthWestGravity = 1;
    NorthGravity = 2;
    NorthEastGravity = 3;
    WestGravity = 4;
    CenterGravity = 5;
    EastGravity = 6;
    SouthWestGravity = 7;
    SouthGravity = 8;
    SouthEastGravity = 9;
    StaticGravity = 10;
;
type
  PAffineMatrix = ^TAffineMatrix;
  TAffineMatrix = record
      sx : Tdouble;
      rx : Tdouble;
      ry : Tdouble;
      sy : Tdouble;
      tx : Tdouble;
      ty : Tdouble;
    end;

  PGeometryInfo = ^TGeometryInfo;
  TGeometryInfo = record
      rho : Tdouble;
      sigma : Tdouble;
      xi : Tdouble;
      psi : Tdouble;
      chi : Tdouble;
    end;

  POffsetInfo = ^TOffsetInfo;
  TOffsetInfo = record
      x : Tssize_t;
      y : Tssize_t;
    end;

  PRectangleInfo = ^TRectangleInfo;
  TRectangleInfo = record
      width : Tsize_t;
      height : Tsize_t;
      x : Tssize_t;
      y : Tssize_t;
    end;

function GetPageGeometry(para1:Pchar):Pchar;cdecl;external libmagiccore;
function IsGeometry(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function IsSceneGeometry(para1:Pchar; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function GetGeometry(para1:Pchar; para2:Pssize_t; para3:Pssize_t; para4:Psize_t; para5:Psize_t):TMagickStatusType;cdecl;external libmagiccore;
function ParseAbsoluteGeometry(para1:Pchar; para2:PRectangleInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ParseAffineGeometry(para1:Pchar; para2:PAffineMatrix; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ParseGeometry(para1:Pchar; para2:PGeometryInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ParseGravityGeometry(para1:PImage; para2:Pchar; para3:PRectangleInfo; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ParseMetaGeometry(para1:Pchar; para2:Pssize_t; para3:Pssize_t; para4:Psize_t; para5:Psize_t):TMagickBooleanType;cdecl;external libmagiccore;
function ParsePageGeometry(para1:PImage; para2:Pchar; para3:PRectangleInfo; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ParseRegionGeometry(para1:PImage; para2:Pchar; para3:PRectangleInfo; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
procedure GravityAdjustGeometry(para1:Tsize_t; para2:Tsize_t; para3:TGravityType; para4:PRectangleInfo);cdecl;external libmagiccore;
function SetGeometry(para1:PImage; para2:PRectangleInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetGeometryInfo(para1:PGeometryInfo):TMagickBooleanType;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:03:21 ===


implementation



end.
