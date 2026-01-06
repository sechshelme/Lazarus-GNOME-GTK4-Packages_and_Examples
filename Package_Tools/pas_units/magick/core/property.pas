unit property;

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

  MagickCore property methods.
 }
{$ifndef MAGICKCORE_PROPERTY_H}
{$define MAGICKCORE_PROPERTY_H}

function GetNextImageProperty(para1:PImage):Pchar;cdecl;external libmagiccore;
function InterpretImageProperties(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external libmagiccore;
function RemoveImageProperty(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagiccore;
function GetImageProperty(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagiccore;
function GetMagickProperty(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external libmagiccore;
function CloneImageProperties(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function DefineImageProperty(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteImageProperty(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function FormatImageProperty(para1:PImage; para2:Pchar; para3:Pchar; args:array of const):TMagickBooleanType;cdecl;external libmagiccore;
function FormatImageProperty(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageProperty(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
procedure DestroyImageProperties(para1:PImage);cdecl;external libmagiccore;
procedure ResetImagePropertyIterator(para1:PImage);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:40:04 ===


implementation



end.
