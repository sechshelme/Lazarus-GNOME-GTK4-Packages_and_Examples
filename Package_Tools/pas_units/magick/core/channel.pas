unit channel;

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

  MagickCore image channel methods.
 }
{$ifndef MAGICKCORE_CHANNEL_H}
{$define MAGICKCORE_CHANNEL_H}
{$include "magick/image.h"}

function CombineImages(para1:PImage; para2:TChannelType; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function SeparateImage(para1:PImage; para2:TChannelType; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function SeparateImages(para1:PImage; para2:TChannelType; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetImageAlphaChannel(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SeparateImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageAlphaChannel(para1:PImage; para2:TAlphaChannelType):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:18 ===


implementation



end.
