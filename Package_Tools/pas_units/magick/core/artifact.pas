unit artifact;

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

  MagickCore artifact methods.
 }
{$ifndef MAGICKCORE_ARTIFACT_H}
{$define MAGICKCORE_ARTIFACT_H}

function GetNextImageArtifact(para1:PImage):Pchar;cdecl;external libmagiccore;
function RemoveImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagiccore;
function GetImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagiccore;
function CloneImageArtifacts(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function DefineImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageArtifact(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
procedure DestroyImageArtifacts(para1:PImage);cdecl;external libmagiccore;
procedure ResetImageArtifactIterator(para1:PImage);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:15 ===


implementation



end.
