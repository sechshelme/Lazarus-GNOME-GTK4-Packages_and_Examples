unit gem;

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

  MagickCore private graphic gems methods.
 }
{$ifndef MAGICKCORE_GEM_H}
{$define MAGICKCORE_GEM_H}
{$include "magick/random_.h"}
{$include "magick/visual-effects.h"}

function ExpandAffine(para1:PAffineMatrix):Tdouble;cdecl;external libmagiccore;
function GenerateDifferentialNoise(para1:PRandomInfo; para2:TQuantum; para3:TNoiseType; para4:TMagickRealType):Tdouble;cdecl;external libmagiccore;
function GetOptimalKernelWidth(para1:Tdouble; para2:Tdouble):Tsize_t;cdecl;external libmagiccore;
function GetOptimalKernelWidth1D(para1:Tdouble; para2:Tdouble):Tsize_t;cdecl;external libmagiccore;
function GetOptimalKernelWidth2D(para1:Tdouble; para2:Tdouble):Tsize_t;cdecl;external libmagiccore;
procedure ConvertHCLToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertHCLpToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertHSBToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertHSIToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertHSLToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertHSVToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertHWBToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertLCHabToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertLCHuvToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure ConvertRGBToHCL(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToHCLp(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToHSB(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToHSI(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToHSL(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToHSV(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToHWB(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToLCHab(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
procedure ConvertRGBToLCHuv(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:36:31 ===


implementation



end.
