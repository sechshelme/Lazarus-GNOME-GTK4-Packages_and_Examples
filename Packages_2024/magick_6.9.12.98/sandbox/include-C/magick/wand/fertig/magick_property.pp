
unit magick_property;
interface

{
  Automatically converted by H2Pas 1.0.0 from magick_property.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    magick_property.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
PDrawingWand  = ^DrawingWand;
PMagickWand  = ^MagickWand;
PPixelWand  = ^PixelWand;
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

  MagickWand property, options, and profile  methods.
 }
{$ifndef MAGICKWAND_MAGICK_PROPERTY_H}
{$define MAGICKWAND_MAGICK_PROPERTY_H}
(* Const before type ignored *)

function MagickGetFilename(para1:PMagickWand):Pchar;cdecl;external;
function MagickGetFormat(para1:PMagickWand):Pchar;cdecl;external;
function MagickGetFont(para1:PMagickWand):Pchar;cdecl;external;
function MagickGetHomeURL:Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetImageArtifact(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetImageArtifacts(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetImageProfiles(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetImageProperty(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetImageProperties(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetOption(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetOptions(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function MagickQueryConfigureOption(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickQueryConfigureOptions(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function MagickQueryFonts(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
function MagickQueryFormats(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external;
function MagickGetColorspace(para1:PMagickWand):TColorspaceType;cdecl;external;
function MagickGetCompression(para1:PMagickWand):TCompressionType;cdecl;external;
(* Const before type ignored *)
function MagickGetCopyright:Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetPackageName:Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetQuantumDepth(para1:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetQuantumRange(para1:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetReleaseDate:Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetVersion(para1:Psize_t):Pchar;cdecl;external;
function MagickGetPointsize(para1:PMagickWand):Tdouble;cdecl;external;
function MagickGetSamplingFactors(para1:PMagickWand; para2:Psize_t):Pdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickQueryFontMetrics(para1:PMagickWand; para2:PDrawingWand; para3:Pchar):Pdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickQueryMultilineFontMetrics(para1:PMagickWand; para2:PDrawingWand; para3:Pchar):Pdouble;cdecl;external;
function MagickGetGravity(para1:PMagickWand):TGravityType;cdecl;external;
function MagickGetType(para1:PMagickWand):TImageType;cdecl;external;
function MagickGetInterlaceScheme(para1:PMagickWand):TInterlaceType;cdecl;external;
function MagickGetInterpolateMethod(para1:PMagickWand):TInterpolatePixelMethod;cdecl;external;
function MagickGetOrientation(para1:PMagickWand):TOrientationType;cdecl;external;
(* Const before type ignored *)
function MagickDeleteImageArtifact(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDeleteImageProperty(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickDeleteOption(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetAntialias(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetPage(para1:PMagickWand; para2:Psize_t; para3:Psize_t; para4:Pssize_t; para5:Pssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetResolution(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetSize(para1:PMagickWand; para2:Psize_t; para3:Psize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetSizeOffset(para1:PMagickWand; para2:Pssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickProfileImage(para1:PMagickWand; para2:Pchar; para3:pointer; para4:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetAntialias(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetBackgroundColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetColorspace(para1:PMagickWand; para2:TColorspaceType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetCompression(para1:PMagickWand; para2:TCompressionType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetCompressionQuality(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetDepth(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetExtract(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetFilename(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetFormat(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetFont(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetGravity(para1:PMagickWand; para2:TGravityType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageArtifact(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageProfile(para1:PMagickWand; para2:Pchar; para3:pointer; para4:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageProperty(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetInterlaceScheme(para1:PMagickWand; para2:TInterlaceType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetInterpolateMethod(para1:PMagickWand; para2:TInterpolatePixelMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetOption(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetOrientation(para1:PMagickWand; para2:TOrientationType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetPage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetPassphrase(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetPointsize(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetResolution(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetResourceLimit(_type:TResourceType; limit:TMagickSizeType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetSamplingFactors(para1:PMagickWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetSecurityPolicy(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetSize(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetSizeOffset(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetType(para1:PMagickWand; para2:TImageType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetProgressMonitor(para1:PMagickWand; para2:TMagickProgressMonitor; para3:pointer):TMagickProgressMonitor;cdecl;external;
(* Const before type ignored *)
function MagickGetResource(para1:TResourceType):TMagickSizeType;cdecl;external;
(* Const before type ignored *)
function MagickGetResourceLimit(para1:TResourceType):TMagickSizeType;cdecl;external;
function MagickGetBackgroundColor(para1:PMagickWand):PPixelWand;cdecl;external;
function MagickGetOrientationType(para1:PMagickWand):TOrientationType;cdecl;external;
function MagickGetCompressionQuality(para1:PMagickWand):Tsize_t;cdecl;external;
(* Const before type ignored *)
function MagickGetImageProfile(para1:PMagickWand; para2:Pchar; para3:Psize_t):Pbyte;cdecl;external;
(* Const before type ignored *)
function MagickRemoveImageProfile(para1:PMagickWand; para2:Pchar; para3:Psize_t):Pbyte;cdecl;external;

implementation


end.
