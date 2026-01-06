unit splay_tree;

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

  MagickCore splay-tree methods.
 }
{$ifndef MAGICKCORE_SPLAY_H}
{$define MAGICKCORE_SPLAY_H}
type

function AddValueToSplayTree(para1:PSplayTreeInfo; para2:pointer; para3:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteNodeByValueFromSplayTree(para1:PSplayTreeInfo; para2:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteNodeFromSplayTree(para1:PSplayTreeInfo; para2:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function GetNextKeyInSplayTree(para1:PSplayTreeInfo):pointer;cdecl;external libmagiccore;
function GetNextValueInSplayTree(para1:PSplayTreeInfo):pointer;cdecl;external libmagiccore;
function GetRootValueFromSplayTree(para1:PSplayTreeInfo):pointer;cdecl;external libmagiccore;
function GetValueFromSplayTree(para1:PSplayTreeInfo; para2:pointer):pointer;cdecl;external libmagiccore;
function CompareSplayTreeString(para1:pointer; para2:pointer):longint;cdecl;external libmagiccore;
function CompareSplayTreeStringInfo(para1:pointer; para2:pointer):longint;cdecl;external libmagiccore;
function CloneSplayTree(para1:PSplayTreeInfo; para2:Pprocedure (para1:pointer); para3:Pprocedure (para1:pointer)):PSplayTreeInfo;cdecl;external libmagiccore;
function DestroySplayTree(para1:PSplayTreeInfo):PSplayTreeInfo;cdecl;external libmagiccore;
function NewSplayTree(para1:function (para1:pointer; para2:pointer):longint; para2:Pprocedure (para1:pointer); para3:Pprocedure (para1:pointer)):PSplayTreeInfo;cdecl;external libmagiccore;
function GetNumberOfNodesInSplayTree(para1:PSplayTreeInfo):Tsize_t;cdecl;external libmagiccore;
function RemoveNodeByValueFromSplayTree(para1:PSplayTreeInfo; para2:pointer):pointer;cdecl;external libmagiccore;
function RemoveNodeFromSplayTree(para1:PSplayTreeInfo; para2:pointer):pointer;cdecl;external libmagiccore;
procedure ResetSplayTree(para1:PSplayTreeInfo);cdecl;external libmagiccore;
procedure ResetSplayTreeIterator(para1:PSplayTreeInfo);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:54:35 ===


implementation



end.
