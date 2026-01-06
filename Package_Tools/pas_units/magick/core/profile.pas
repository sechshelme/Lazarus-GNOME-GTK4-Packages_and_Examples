unit profile;

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

  MagickCore image profile methods.
 }
{$ifndef MAGICKCORE_PROFILE_H}
{$define MAGICKCORE_PROFILE_H}
{$include "magick/string_.h"}
type
  PProfileInfo = ^TProfileInfo;
  TProfileInfo = record
      name : Pchar;
      length : Tsize_t;
      info : Pbyte;
      signature : Tsize_t;
    end;

  PRenderingIntent = ^TRenderingIntent;
  TRenderingIntent =  Longint;
  Const
    UndefinedIntent = 0;
    SaturationIntent = 1;
    PerceptualIntent = 2;
    AbsoluteIntent = 3;
    RelativeIntent = 4;
;

function GetNextImageProfile(para1:PImage):Pchar;cdecl;external libmagiccore;
function GetImageProfile(para1:PImage; para2:Pchar):PStringInfo;cdecl;external libmagiccore;
function CloneImageProfiles(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteImageProfile(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ProfileImage(para1:PImage; para2:Pchar; para3:pointer; para4:Tsize_t; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageProfile(para1:PImage; para2:Pchar; para3:PStringInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SyncImageProfiles(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function RemoveImageProfile(para1:PImage; para2:Pchar):PStringInfo;cdecl;external libmagiccore;
procedure DestroyImageProfiles(para1:PImage);cdecl;external libmagiccore;
procedure ResetImageProfileIterator(para1:PImage);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:33:33 ===


implementation



end.
