unit magick_property;

interface

uses
  fp_magiccore, fp_magicwand;

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

function MagickGetFilename(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetFormat(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetFont(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetHomeURL:Pchar;cdecl;external libmagicwand;
function MagickGetImageArtifact(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external libmagicwand;
function MagickGetImageArtifacts(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickGetImageProfiles(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickGetImageProperty(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external libmagicwand;
function MagickGetImageProperties(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickGetOption(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external libmagicwand;
function MagickGetOptions(para1:PMagickWand; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickQueryConfigureOption(para1:Pchar):Pchar;cdecl;external libmagicwand;
function MagickQueryConfigureOptions(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickQueryFonts(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickQueryFormats(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external libmagicwand;
function MagickGetColorspace(para1:PMagickWand):TColorspaceType;cdecl;external libmagicwand;
function MagickGetCompression(para1:PMagickWand):TCompressionType;cdecl;external libmagicwand;
function MagickGetCopyright:Pchar;cdecl;external libmagicwand;
function MagickGetPackageName:Pchar;cdecl;external libmagicwand;
function MagickGetQuantumDepth(para1:Psize_t):Pchar;cdecl;external libmagicwand;
function MagickGetQuantumRange(para1:Psize_t):Pchar;cdecl;external libmagicwand;
function MagickGetReleaseDate:Pchar;cdecl;external libmagicwand;
function MagickGetVersion(para1:Psize_t):Pchar;cdecl;external libmagicwand;
function MagickGetPointsize(para1:PMagickWand):Tdouble;cdecl;external libmagicwand;
function MagickGetSamplingFactors(para1:PMagickWand; para2:Psize_t):Pdouble;cdecl;external libmagicwand;
function MagickQueryFontMetrics(para1:PMagickWand; para2:PDrawingWand; para3:Pchar):Pdouble;cdecl;external libmagicwand;
function MagickQueryMultilineFontMetrics(para1:PMagickWand; para2:PDrawingWand; para3:Pchar):Pdouble;cdecl;external libmagicwand;
function MagickGetGravity(para1:PMagickWand):TGravityType;cdecl;external libmagicwand;
function MagickGetType(para1:PMagickWand):TImageType;cdecl;external libmagicwand;
function MagickGetInterlaceScheme(para1:PMagickWand):TInterlaceType;cdecl;external libmagicwand;
function MagickGetInterpolateMethod(para1:PMagickWand):TInterpolatePixelMethod;cdecl;external libmagicwand;
function MagickGetOrientation(para1:PMagickWand):TOrientationType;cdecl;external libmagicwand;
function MagickDeleteImageArtifact(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDeleteImageProperty(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickDeleteOption(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetAntialias(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetPage(para1:PMagickWand; para2:Psize_t; para3:Psize_t; para4:Pssize_t; para5:Pssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetResolution(para1:PMagickWand; para2:Pdouble; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetSize(para1:PMagickWand; para2:Psize_t; para3:Psize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetSizeOffset(para1:PMagickWand; para2:Pssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickProfileImage(para1:PMagickWand; para2:Pchar; para3:pointer; para4:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetAntialias(para1:PMagickWand; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetBackgroundColor(para1:PMagickWand; para2:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetColorspace(para1:PMagickWand; para2:TColorspaceType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetCompression(para1:PMagickWand; para2:TCompressionType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetCompressionQuality(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetDepth(para1:PMagickWand; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetExtract(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetFilename(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetFormat(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetFont(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetGravity(para1:PMagickWand; para2:TGravityType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageArtifact(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageProfile(para1:PMagickWand; para2:Pchar; para3:pointer; para4:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageProperty(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetInterlaceScheme(para1:PMagickWand; para2:TInterlaceType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetInterpolateMethod(para1:PMagickWand; para2:TInterpolatePixelMethod):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetOption(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetOrientation(para1:PMagickWand; para2:TOrientationType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetPage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetPassphrase(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetPointsize(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetResolution(para1:PMagickWand; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetResourceLimit(_type:TResourceType; limit:TMagickSizeType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetSamplingFactors(para1:PMagickWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetSecurityPolicy(para1:PMagickWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetSize(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetSizeOffset(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetType(para1:PMagickWand; para2:TImageType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetProgressMonitor(para1:PMagickWand; para2:TMagickProgressMonitor; para3:pointer):TMagickProgressMonitor;cdecl;external libmagicwand;
function MagickGetResource(para1:TResourceType):TMagickSizeType;cdecl;external libmagicwand;
function MagickGetResourceLimit(para1:TResourceType):TMagickSizeType;cdecl;external libmagicwand;
function MagickGetBackgroundColor(para1:PMagickWand):PPixelWand;cdecl;external libmagicwand;
function MagickGetOrientationType(para1:PMagickWand):TOrientationType;cdecl;external libmagicwand;
function MagickGetCompressionQuality(para1:PMagickWand):Tsize_t;cdecl;external libmagicwand;
function MagickGetImageProfile(para1:PMagickWand; para2:Pchar; para3:Psize_t):Pbyte;cdecl;external libmagicwand;
function MagickRemoveImageProfile(para1:PMagickWand; para2:Pchar; para3:Psize_t):Pbyte;cdecl;external libmagicwand;

// === Konventiert am: 5-1-26 19:40:05 ===


implementation



end.
