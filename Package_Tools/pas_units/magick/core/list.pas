unit list;

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

  MagickCore image list methods.
 }
{$ifndef MAGICKCORE_LIST_H}
{$define MAGICKCORE_LIST_H}

function CloneImageList(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function CloneImages(para1:PImage; para2:Pchar; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function DestroyImageList(para1:PImage):PImage;cdecl;external libmagiccore;
function DuplicateImages(para1:PImage; para2:Tsize_t; para3:Pchar; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetFirstImageInList(para1:PImage):PImage;cdecl;external libmagiccore;
function GetImageFromList(para1:PImage; para2:Tssize_t):PImage;cdecl;external libmagiccore;
function GetLastImageInList(para1:PImage):PImage;cdecl;external libmagiccore;
function GetNextImageInList(para1:PImage):PImage;cdecl;external libmagiccore;
function GetPreviousImageInList(para1:PImage):PImage;cdecl;external libmagiccore;
function ImageListToArray(para1:PImage; para2:PExceptionInfo):^PImage;cdecl;external libmagiccore;
function NewImageList:PImage;cdecl;external libmagiccore;
function RemoveImageFromList(para1:PPImage):PImage;cdecl;external libmagiccore;
function RemoveLastImageFromList(para1:PPImage):PImage;cdecl;external libmagiccore;
function RemoveFirstImageFromList(para1:PPImage):PImage;cdecl;external libmagiccore;
function SpliceImageIntoList(para1:PPImage; para2:Tsize_t; para3:PImage):PImage;cdecl;external libmagiccore;
function SplitImageList(para1:PImage):PImage;cdecl;external libmagiccore;
function SyncNextImageInList(para1:PImage):PImage;cdecl;external libmagiccore;
function GetImageListLength(para1:PImage):Tsize_t;cdecl;external libmagiccore;
function GetImageIndexInList(para1:PImage):Tssize_t;cdecl;external libmagiccore;
procedure AppendImageToList(para1:PPImage; para2:PImage);cdecl;external libmagiccore;
procedure DeleteImageFromList(para1:PPImage);cdecl;external libmagiccore;
procedure DeleteImages(para1:PPImage; para2:Pchar; para3:PExceptionInfo);cdecl;external libmagiccore;
procedure InsertImageInList(para1:PPImage; para2:PImage);cdecl;external libmagiccore;
procedure PrependImageToList(para1:PPImage; para2:PImage);cdecl;external libmagiccore;
procedure ReplaceImageInList(para1:PPImage; para2:PImage);cdecl;external libmagiccore;
procedure ReplaceImageInListReturnLast(para1:PPImage; para2:PImage);cdecl;external libmagiccore;
procedure ReverseImageList(para1:PPImage);cdecl;external libmagiccore;
procedure SyncImageList(para1:PImage);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:47:31 ===


implementation



end.
