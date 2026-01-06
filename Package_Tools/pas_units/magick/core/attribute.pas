unit attribute;

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

  MagickCore methods to set or get image attributes.
 }
{$ifndef MAGICKCORE_ATTRIBUTE_H}
{$define MAGICKCORE_ATTRIBUTE_H}
{$include "magick/image.h"}
{$include "magick/exception.h"}

function GetImageType(para1:PImage; para2:PExceptionInfo):TImageType;cdecl;external libmagiccore;
function IdentifyImageGray(para1:PImage; para2:PExceptionInfo):TImageType;cdecl;external libmagiccore;
function IdentifyImageType(para1:PImage; para2:PExceptionInfo):TImageType;cdecl;external libmagiccore;
function IdentifyImageMonochrome(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsGrayImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsMonochromeImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsOpaqueImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageChannelDepth(para1:PImage; para2:TChannelType; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageDepth(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageType(para1:PImage; para2:TImageType):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageBoundingBox(para1:PImage; exception:PExceptionInfo):TRectangleInfo;cdecl;external libmagiccore;
function GetImageChannelDepth(para1:PImage; para2:TChannelType; para3:PExceptionInfo):Tsize_t;cdecl;external libmagiccore;
function GetImageDepth(para1:PImage; para2:PExceptionInfo):Tsize_t;cdecl;external libmagiccore;
function GetImageQuantumDepth(para1:PImage; para2:TMagickBooleanType):Tsize_t;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 17:33:17 ===


implementation



end.
