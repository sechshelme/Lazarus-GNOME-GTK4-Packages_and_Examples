unit compress;

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

  MagickCore image compression/decompression methods.
 }
{$ifndef MAGICKCORE_COMPRESS_H}
{$define MAGICKCORE_COMPRESS_H}
{ ISO/IEC std 15444-1  }
{ Lempel-Ziv-Markov chain algorithm  }
{ ISO/IEC std 11544 / ITU-T rec T.82  }
{ ISO/IEC std 14492 / ITU-T rec T.88  }
type
  PCompressionType = ^TCompressionType;
  TCompressionType =  Longint;
  Const
    UndefinedCompression = 0;
    NoCompression = 1;
    BZipCompression = 2;
    DXT1Compression = 3;
    DXT3Compression = 4;
    DXT5Compression = 5;
    FaxCompression = 6;
    Group4Compression = 7;
    JPEGCompression = 8;
    JPEG2000Compression = 9;
    LosslessJPEGCompression = 10;
    LZWCompression = 11;
    RLECompression = 12;
    ZipCompression = 13;
    ZipSCompression = 14;
    PizCompression = 15;
    Pxr24Compression = 16;
    B44Compression = 17;
    B44ACompression = 18;
    LZMACompression = 19;
    JBIG1Compression = 20;
    JBIG2Compression = 21;
    ZstdCompression = 22;
    WebPCompression = 23;
;
type

function HuffmanDecodeImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function HuffmanEncodeImage(para1:PImageInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function LZWEncodeImage(para1:PImage; para2:Tsize_t; magick_restrict:Pbyte):TMagickBooleanType;cdecl;external libmagiccore;
function PackbitsEncodeImage(para1:PImage; para2:Tsize_t; magick_restrict:Pbyte):TMagickBooleanType;cdecl;external libmagiccore;
function ZLIBEncodeImage(para1:PImage; para2:Tsize_t; magick_restrict:Pbyte):TMagickBooleanType;cdecl;external libmagiccore;
procedure Ascii85Encode(para1:PImage; para2:byte);cdecl;external libmagiccore;
procedure Ascii85Flush(para1:PImage);cdecl;external libmagiccore;
procedure Ascii85Initialize(para1:PImage);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:50:48 ===


implementation



end.
