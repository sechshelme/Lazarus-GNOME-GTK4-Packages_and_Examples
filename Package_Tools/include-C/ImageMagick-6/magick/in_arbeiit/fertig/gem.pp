
unit gem;
interface

{
  Automatically converted by H2Pas 1.0.0 from gem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gem.h
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
Pdouble  = ^double;
PQuantum  = ^Quantum;
PRandomInfo  = ^RandomInfo;
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
(* Const before type ignored *)

function ExpandAffine(para1:PAffineMatrix):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GenerateDifferentialNoise(para1:PRandomInfo; para2:TQuantum; para3:TNoiseType; para4:TMagickRealType):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetOptimalKernelWidth(para1:Tdouble; para2:Tdouble):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetOptimalKernelWidth1D(para1:Tdouble; para2:Tdouble):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetOptimalKernelWidth2D(para1:Tdouble; para2:Tdouble):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHCLToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHCLpToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHSBToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHSIToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHSLToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHSVToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertHWBToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertLCHabToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertLCHuvToRGB(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHCL(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHCLp(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHSB(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHSI(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHSL(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHSV(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToHWB(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToLCHab(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ConvertRGBToLCHuv(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
{$endif}

implementation


end.
