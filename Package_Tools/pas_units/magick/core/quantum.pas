unit quantum;

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

  MagickCore quantum inline methods.
 }
{$ifndef MAGICKCORE_QUANTUM_H}
{$define MAGICKCORE_QUANTUM_H}
{$include <float.h>}
{$include "magick/image.h"}
{$include "magick/semaphore.h"}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function RoundToQuantum(quantum : longint) : longint;

type
  PEndianType = ^TEndianType;
  TEndianType =  Longint;
  Const
    UndefinedEndian = 0;
    LSBEndian = 1;
    MSBEndian = 2;
;
type
  PQuantumAlphaType = ^TQuantumAlphaType;
  TQuantumAlphaType =  Longint;
  Const
    UndefinedQuantumAlpha = 0;
    AssociatedQuantumAlpha = 1;
    DisassociatedQuantumAlpha = 2;
;
type
  PQuantumFormatType = ^TQuantumFormatType;
  TQuantumFormatType =  Longint;
  Const
    UndefinedQuantumFormat = 0;
    FloatingPointQuantumFormat = 1;
    SignedQuantumFormat = 2;
    UnsignedQuantumFormat = 3;
;
{ deprecated  }
type
  PQuantumType = ^TQuantumType;
  TQuantumType =  Longint;
  Const
    UndefinedQuantum = 0;
    AlphaQuantum = 1;
    BlackQuantum = 2;
    BlueQuantum = 3;
    CMYKAQuantum = 4;
    CMYKQuantum = 5;
    CyanQuantum = 6;
    GrayAlphaQuantum = 7;
    GrayQuantum = 8;
    GreenQuantum = 9;
    IndexAlphaQuantum = 10;
    IndexQuantum = 11;
    MagentaQuantum = 12;
    OpacityQuantum = 13;
    RedQuantum = 14;
    RGBAQuantum = 15;
    BGRAQuantum = 16;
    RGBOQuantum = 17;
    RGBQuantum = 18;
    YellowQuantum = 19;
    GrayPadQuantum = 20;
    RGBPadQuantum = 21;
    CbYCrYQuantum = 22;
    CbYCrQuantum = 23;
    CbYCrAQuantum = 24;
    CMYKOQuantum = 25;
    BGRQuantum = 26;
    BGROQuantum = 27;
;
type
{xxxxxxxxxxxxxxxxxxxx
static inline Quantum ClampToQuantum(const MagickRealType quantum)

#if defined(MAGICKCORE_HDRI_SUPPORT)
  return((Quantum) quantum);
#else
  if ((IsNaN(quantum) != 0) || (quantum <= 0.0))
    return((Quantum) 0);
  if (quantum >= (MagickRealType) QuantumRange)
    return(QuantumRange);
  return((Quantum) (quantum+0.5));
#endif


#if (MAGICKCORE_QUANTUM_DEPTH == 8)
static inline unsigned char ScaleQuantumToChar(const Quantum quantum)

#if !defined(MAGICKCORE_HDRI_SUPPORT)
  return((unsigned char) quantum);
#else
  if ((IsNaN(quantum) != 0) || (quantum <= 0.0f))
    return(0);
  if (quantum >= 255.0)
    return(255);
  return((unsigned char) (quantum+0.5f));
#endif

#elif (MAGICKCORE_QUANTUM_DEPTH == 16)
static inline unsigned char ScaleQuantumToChar(const Quantum quantum)

#if !defined(MAGICKCORE_HDRI_SUPPORT)
  return((unsigned char) (((quantum+128UL)-((quantum+128UL) >> 8)) >> 8));
#else
  if ((IsNaN(quantum) != 0) || (quantum <= 0.0f))
    return(0);
  if ((quantum/257.0f) >= 255.0f)
    return(255);
  return((unsigned char) (quantum/257.0f+0.5f));
#endif

#elif (MAGICKCORE_QUANTUM_DEPTH == 32)
static inline unsigned char ScaleQuantumToChar(const Quantum quantum)

#if !defined(MAGICKCORE_HDRI_SUPPORT)
  return((unsigned char) ((quantum+MagickULLConstant(8421504))/
    MagickULLConstant(16843009)));
#else
  if ((IsNaN(quantum) != 0) || (quantum <= 0.0))
    return(0);
  if ((quantum/16843009.0) >= 255.0)
    return(255);
  return((unsigned char) (quantum/16843009.0+0.5));
#endif

#elif (MAGICKCORE_QUANTUM_DEPTH == 64)
static inline unsigned char ScaleQuantumToChar(const Quantum quantum)

#if !defined(MAGICKCORE_HDRI_SUPPORT)
  return((unsigned char) (quantum/72340172838076673.0+0.5));
#else
  if ((IsNaN(quantum) != 0) || (quantum <= 0.0))
    return(0);
  if ((quantum/72340172838076673.0) >= 255.0)
    return(255);
  return((unsigned char) (quantum/72340172838076673.0+0.5));
#endif

#endif
 }

function GetQuantumEndian(para1:PQuantumInfo):TEndianType;cdecl;external libmagiccore;
function SetQuantumDepth(para1:PImage; para2:PQuantumInfo; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function SetQuantumEndian(para1:PImage; para2:PQuantumInfo; para3:TEndianType):TMagickBooleanType;cdecl;external libmagiccore;
function SetQuantumFormat(para1:PImage; para2:PQuantumInfo; para3:TQuantumFormatType):TMagickBooleanType;cdecl;external libmagiccore;
function SetQuantumPad(para1:PImage; para2:PQuantumInfo; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function GetQuantumFormat(para1:PQuantumInfo):TQuantumFormatType;cdecl;external libmagiccore;
function AcquireQuantumInfo(para1:PImageInfo; para2:PImage):PQuantumInfo;cdecl;external libmagiccore;
function DestroyQuantumInfo(para1:PQuantumInfo):PQuantumInfo;cdecl;external libmagiccore;
function GetQuantumType(para1:PImage; para2:PExceptionInfo):TQuantumType;cdecl;external libmagiccore;
function ExportQuantumPixels(para1:PImage; para2:PCacheView; para3:PQuantumInfo; para4:TQuantumType; magick_restrict:Pbyte; 
           para6:PExceptionInfo):Tsize_t;cdecl;external libmagiccore;
function GetQuantumExtent(para1:PImage; para2:PQuantumInfo; para3:TQuantumType):Tsize_t;cdecl;external libmagiccore;
function ImportQuantumPixels(para1:PImage; para2:PCacheView; para3:PQuantumInfo; para4:TQuantumType; magick_restrict:Pbyte; 
           para6:PExceptionInfo):Tsize_t;cdecl;external libmagiccore;
function GetQuantumPixels(para1:PQuantumInfo):Pbyte;cdecl;external libmagiccore;
procedure GetQuantumInfo(para1:PImageInfo; para2:PQuantumInfo);cdecl;external libmagiccore;
procedure SetQuantumAlphaType(para1:PQuantumInfo; para2:TQuantumAlphaType);cdecl;external libmagiccore;
procedure SetQuantumImageType(para1:PImage; para2:TQuantumType);cdecl;external libmagiccore;
procedure SetQuantumMinIsWhite(para1:PQuantumInfo; para2:TMagickBooleanType);cdecl;external libmagiccore;
procedure SetQuantumPack(para1:PQuantumInfo; para2:TMagickBooleanType);cdecl;external libmagiccore;
procedure SetQuantumQuantum(para1:PQuantumInfo; para2:Tsize_t);cdecl;external libmagiccore;
procedure SetQuantumScale(para1:PQuantumInfo; para2:Tdouble);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 14:40:29 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RoundToQuantum(quantum : longint) : longint;
begin
  RoundToQuantum:=ClampToQuantum(quantum);
end;


end.
