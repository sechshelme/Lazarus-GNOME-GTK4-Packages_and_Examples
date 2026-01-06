unit pixel_accessor;

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

  MagickCore pixel accessor methods.
 }
{$ifndef MAGICKCORE_PIXEL_ACCESSOR_H}
{$define MAGICKCORE_PIXEL_ACCESSOR_H}
{$include <math.h>}
{$include "magick/gem.h"}
{$include "magick/pixel.h"}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ClampPixelRed(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelGreen(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelBlue(pixel : longint) : longint;

{xxxxxx #define ClampPixelIndex(indexes) ClampToQuantum(*(indexes)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelOpacity(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixela(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelb(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelAlpha(pixel : longint) : longint;

{xxxxxxxxxxx #define GetPixelBlack(indexes) (*(indexes)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelBlue(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelCb(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelCr(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelCyan(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelGray(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelGreen(pixel : longint) : longint;

{xxxxxxxxxxxxxx#define GetPixelIndex(indexes)  (*(indexes)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelL(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GetPixelLabel(pixel : longint) : Tssize_t;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelMagenta(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GetPixelNext(pixel : longint) : Tpixel;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelOpacity(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelRed(pixel : longint) : longint;

{xxxxxxxxx
#define GetPixelRGB(pixel,packet) \
 \
  (packet)->red=GetPixelRed((pixel)); \
  (packet)->green=GetPixelGreen((pixel)); \
  (packet)->blue=GetPixelBlue((pixel)); \

#define GetPixelRGBO(pixel,packet) \
 \
  (packet)->red=GetPixelRed((pixel)); \
  (packet)->green=GetPixelGreen((pixel)); \
  (packet)->blue=GetPixelBlue((pixel)); \
  (packet)->opacity=GetPixelOpacity((pixel)); \

 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelY(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelYellow(pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixela(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelAlpha(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelb(pixel,value : longint) : longint;

{xxxxxxxxxxxxx#define SetPixelBlack(indexes,value) (*(indexes)=(Quantum) (value)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelBlue(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelCb(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelCr(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelCyan(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelGray(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelGreen(pixel,value : longint) : longint;

{xxxxxxxxxx#define SetPixelIndex(indexes,value) (*(indexes)=(IndexPacket) (value)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelL(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelMagenta(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelOpacity(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelRed(pixel,value : longint) : longint;

{xxxxxxxxxx
#define SetPixelRgb(pixel,packet) \
 \
  SetPixelRed(pixel,(packet)->red); \
  SetPixelGreen(pixel,(packet)->green); \
  SetPixelBlue(pixel,(packet)->blue); \

#define SetPixelRGBA(pixel,packet) \
 \
  SetPixelRed(pixel,(packet)->red); \
  SetPixelGreen(pixel,(packet)->green); \
  SetPixelBlue(pixel,(packet)->blue); \
  SetPixelAlpha(pixel,(QuantumRange-(packet)->opacity)); \

#define SetPixelRGBO(pixel,packet) \
 \
  SetPixelRed(pixel,(packet)->red); \
  SetPixelGreen(pixel,(packet)->green); \
  SetPixelBlue(pixel,(packet)->blue); \
  SetPixelOpacity(pixel,(packet)->opacity); \

 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelYellow(pixel,value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelY(pixel,value : longint) : longint;

{xxxxxxxxxxxxxxxxxxxxxxxxx
static inline MagickRealType AbsolutePixelValue(const MagickRealType x)

  return(x < 0.0 ? -x : x);


static inline Quantum ClampPixel(const MagickRealType value)
 
  if (value < 0.0)
    return((Quantum) 0); 
  if (value >= (MagickRealType) QuantumRange)
    return((Quantum) QuantumRange);
#if !defined(MAGICKCORE_HDRI_SUPPORT)
  return((Quantum) (value+0.5));
#else
  return((Quantum) value);
#endif


static inline double PerceptibleReciprocal(const double x)
 
  double
    sign;
      
  sign=x < 0.0 ? -1.0 : 1.0;
  if ((sign*x) >= MagickEpsilon)
    return(1.0/x);
  return(sign/MagickEpsilon);
   

static inline MagickRealType GetPixelLuma(
  const Image *magick_restrict image,const PixelPacket *magick_restrict pixel)

  MagickRealType
    intensity;

  (void) image;
  intensity=(MagickRealType) (0.212656f*pixel->red+0.715158f*pixel->green+
    0.072186f*pixel->blue);
  return(intensity);


static inline MagickRealType GetPixelLuminance(
  const Image *magick_restrict image,const PixelPacket *magick_restrict pixel)

  MagickRealType
    intensity;

  if (image->colorspace != sRGBColorspace)
    
      intensity=(MagickRealType) (0.212656f*pixel->red+0.715158f*pixel->green+
        0.072186f*pixel->blue);
      return(intensity);
    
  intensity=(MagickRealType) (0.212656*DecodePixelGamma((MagickRealType)
    pixel->red)+0.715158*DecodePixelGamma((MagickRealType) pixel->green)+
    0.072186*DecodePixelGamma((MagickRealType) pixel->blue));
  return(intensity);


static inline void GetPixelPacketRGBA(const Quantum red,const Quantum green,
  const Quantum blue,const Quantum opacity,PixelPacket *magick_restrict pixel)

  pixel->red=red;
  pixel->green=green;
  pixel->blue=blue;
  pixel->opacity=opacity;


static inline MagickBooleanType IsPixelAtDepth(const Quantum pixel,
  const QuantumAny range)

  Quantum
    quantum;

  if (range == 0)
    return(MagickTrue);
#if !defined(MAGICKCORE_HDRI_SUPPORT)
  quantum=(Quantum) (((MagickRealType) QuantumRange*((QuantumAny)
    (((MagickRealType) range*pixel)/QuantumRange+0.5)))/range+0.5);
#else
  quantum=(Quantum) (((MagickRealType) QuantumRange*((QuantumAny)
    (((MagickRealType) range*(MagickRealType) pixel)/(MagickRealType) QuantumRange+
    0.5)))/(MagickRealType) range);
#endif
  return(pixel == quantum ? MagickTrue : MagickFalse);


static inline MagickBooleanType IsPixelGray(const PixelPacket *pixel)

  MagickRealType
    green_blue,
    red_green;

  red_green=(MagickRealType) pixel->red-(MagickRealType) pixel->green;
  green_blue=(MagickRealType) pixel->green-(MagickRealType) pixel->blue;
  if (((QuantumScale*AbsolutePixelValue(red_green)) < MagickEpsilon) &&
      ((QuantumScale*AbsolutePixelValue(green_blue)) < MagickEpsilon))
    return(MagickTrue);
  return(MagickFalse);


static inline MagickBooleanType IsPixelMonochrome(
  const PixelPacket *pixel)

  MagickRealType
    green_blue,
    red,
    red_green;

  red=(MagickRealType) pixel->red;
  if ((AbsolutePixelValue(red) >= MagickEpsilon) &&
      (AbsolutePixelValue(red-(double) QuantumRange) >= MagickEpsilon))
    return(MagickFalse);
  red_green=(MagickRealType) pixel->red-(double) pixel->green;
  green_blue=(MagickRealType) pixel->green-(double) pixel->blue;
  if (((QuantumScale*AbsolutePixelValue(red_green)) < MagickEpsilon) &&
      ((QuantumScale*AbsolutePixelValue(green_blue)) < MagickEpsilon))
    return(MagickTrue);
  return(MagickFalse);


static inline Quantum PixelPacketIntensity(const PixelPacket *pixel)

  MagickRealType
    intensity;

  if ((pixel->red  == pixel->green) && (pixel->green == pixel->blue))
    return(pixel->red);
  intensity=(MagickRealType) (0.212656f*pixel->red+0.715158f*pixel->green+
    0.072186f*pixel->blue);
  return(ClampToQuantum(intensity));


static inline void SetPixelViaMagickPixel(const Image *magick_restrict image,
  const MagickPixelPacket *magick_restrict magick_pixel,
  PixelPacket *magick_restrict pixel)
 
  pixel->red=ClampToQuantum(magick_pixel->red);
  pixel->green=ClampToQuantum(magick_pixel->green);
  pixel->blue=ClampToQuantum(magick_pixel->blue);
  if (image->matte != MagickFalse)
    pixel->opacity=ClampToQuantum(magick_pixel->opacity);

 }
{$endif}

// === Konventiert am: 6-1-26 14:27:12 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelRed(pixel : longint) : longint;
begin
  ClampPixelRed:=ClampToQuantum(pixel^.red);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelGreen(pixel : longint) : longint;
begin
  ClampPixelGreen:=ClampToQuantum(pixel^.green);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelBlue(pixel : longint) : longint;
begin
  ClampPixelBlue:=ClampToQuantum(pixel^.blue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ClampPixelOpacity(pixel : longint) : longint;
begin
  ClampPixelOpacity:=ClampToQuantum(pixel^.opacity);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixela(pixel : longint) : longint;
begin
  GetPixela:=pixel^.green;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelb(pixel : longint) : longint;
begin
  GetPixelb:=pixel^.blue;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelAlpha(pixel : longint) : longint;
begin
  GetPixelAlpha:=(Tdouble(QuantumRange))-(Tdouble(pixel^.opacity));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelBlue(pixel : longint) : longint;
begin
  GetPixelBlue:=pixel^.blue;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelCb(pixel : longint) : longint;
begin
  GetPixelCb:=pixel^.green;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelCr(pixel : longint) : longint;
begin
  GetPixelCr:=pixel^.blue;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelCyan(pixel : longint) : longint;
begin
  GetPixelCyan:=pixel^.red;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelGray(pixel : longint) : longint;
begin
  GetPixelGray:=pixel^.red;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelGreen(pixel : longint) : longint;
begin
  GetPixelGreen:=pixel^.green;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelL(pixel : longint) : longint;
begin
  GetPixelL:=pixel^.red;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GetPixelLabel(pixel : longint) : Tssize_t;
begin
  GetPixelLabel:=Tssize_t(pixel^.red);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelMagenta(pixel : longint) : longint;
begin
  GetPixelMagenta:=pixel^.green;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GetPixelNext(pixel : longint) : Tpixel;
begin
  GetPixelNext:=Tpixel(+(1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelOpacity(pixel : longint) : longint;
begin
  GetPixelOpacity:=pixel^.opacity;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelRed(pixel : longint) : longint;
begin
  GetPixelRed:=pixel^.red;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelY(pixel : longint) : longint;
begin
  GetPixelY:=pixel^.red;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GetPixelYellow(pixel : longint) : longint;
begin
  GetPixelYellow:=pixel^.blue;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixela(pixel,value : longint) : longint;
begin
  SetPixela:=(pixel^.green):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelAlpha(pixel,value : longint) : longint;
begin
  SetPixelAlpha:=(pixel^.opacity):=(TQuantum((Tdouble(QuantumRange))-(Tdouble(value))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelb(pixel,value : longint) : longint;
begin
  SetPixelb:=(pixel^.blue):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelBlue(pixel,value : longint) : longint;
begin
  SetPixelBlue:=(pixel^.blue):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelCb(pixel,value : longint) : longint;
begin
  SetPixelCb:=(pixel^.green):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelCr(pixel,value : longint) : longint;
begin
  SetPixelCr:=(pixel^.blue):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelCyan(pixel,value : longint) : longint;
begin
  SetPixelCyan:=(pixel^.red):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelGray(pixel,value : longint) : longint;
begin
  SetPixelGray:=(pixel^.red):=((pixel^.green):=((pixel^.blue):=(TQuantum(value))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelGreen(pixel,value : longint) : longint;
begin
  SetPixelGreen:=(pixel^.green):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelL(pixel,value : longint) : longint;
begin
  SetPixelL:=(pixel^.red):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelMagenta(pixel,value : longint) : longint;
begin
  SetPixelMagenta:=(pixel^.green):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelOpacity(pixel,value : longint) : longint;
begin
  SetPixelOpacity:=(pixel^.opacity):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelRed(pixel,value : longint) : longint;
begin
  SetPixelRed:=(pixel^.red):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelYellow(pixel,value : longint) : longint;
begin
  SetPixelYellow:=(pixel^.blue):=(TQuantum(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SetPixelY(pixel,value : longint) : longint;
begin
  SetPixelY:=(pixel^.red):=(TQuantum(value));
end;


end.
