unit xml_tree;

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

  Magick's toolkit xml-tree methods.
 }
{$ifndef MAGICKCORE_XML_TREE_H}
{$define MAGICKCORE_XML_TREE_H}
{$include "magick/exception.h"}
{$include "magick/splay-tree.h"}
type

function CanonicalXMLContent(para1:Pchar; para2:TMagickBooleanType):Pchar;cdecl;external libmagiccore;
function XMLTreeInfoToXML(para1:PXMLTreeInfo):Pchar;cdecl;external libmagiccore;
function GetXMLTreeAttribute(para1:PXMLTreeInfo; para2:Pchar):Pchar;cdecl;external libmagiccore;
function GetXMLTreeContent(para1:PXMLTreeInfo):Pchar;cdecl;external libmagiccore;
function GetXMLTreeProcessingInstructions(para1:PXMLTreeInfo; para2:Pchar):^Pchar;cdecl;external libmagiccore;
function GetXMLTreeTag(para1:PXMLTreeInfo):Pchar;cdecl;external libmagiccore;
function GetXMLTreeAttributes(para1:PXMLTreeInfo; para2:PSplayTreeInfo):TMagickBooleanType;cdecl;external libmagiccore;
function AddChildToXMLTree(para1:PXMLTreeInfo; para2:Pchar; para3:Tsize_t):PXMLTreeInfo;cdecl;external libmagiccore;
function AddPathToXMLTree(para1:PXMLTreeInfo; para2:Pchar; para3:Tsize_t):PXMLTreeInfo;cdecl;external libmagiccore;
function DestroyXMLTree(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function GetNextXMLTreeTag(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function GetXMLTreeChild(para1:PXMLTreeInfo; para2:Pchar):PXMLTreeInfo;cdecl;external libmagiccore;
function GetXMLTreeOrdered(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function GetXMLTreePath(para1:PXMLTreeInfo; para2:Pchar):PXMLTreeInfo;cdecl;external libmagiccore;
function GetXMLTreeSibling(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function InsertTagIntoXMLTree(para1:PXMLTreeInfo; para2:PXMLTreeInfo; para3:Tsize_t):PXMLTreeInfo;cdecl;external libmagiccore;
function NewXMLTree(para1:Pchar; para2:PExceptionInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function NewXMLTreeTag(para1:Pchar):PXMLTreeInfo;cdecl;external libmagiccore;
function ParseTagFromXMLTree(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function PruneTagFromXMLTree(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external libmagiccore;
function SetXMLTreeAttribute(para1:PXMLTreeInfo; para2:Pchar; para3:Pchar):PXMLTreeInfo;cdecl;external libmagiccore;
function SetXMLTreeContent(para1:PXMLTreeInfo; para2:Pchar):PXMLTreeInfo;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:50:57 ===


implementation



end.
