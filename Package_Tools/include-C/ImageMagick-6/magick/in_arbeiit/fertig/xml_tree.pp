
unit xml_tree;
interface

{
  Automatically converted by H2Pas 1.0.0 from xml_tree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xml_tree.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PExceptionInfo  = ^ExceptionInfo;
PSplayTreeInfo  = ^SplayTreeInfo;
PXMLTreeInfo  = ^XMLTreeInfo;
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
(* Const before type ignored *)
(* Const before type ignored *)

function CanonicalXMLContent(para1:Pchar; para2:TMagickBooleanType):Pchar;cdecl;external;
function XMLTreeInfoToXML(para1:PXMLTreeInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetXMLTreeAttribute(para1:PXMLTreeInfo; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function GetXMLTreeContent(para1:PXMLTreeInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetXMLTreeProcessingInstructions(para1:PXMLTreeInfo; para2:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function GetXMLTreeTag(para1:PXMLTreeInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function GetXMLTreeAttributes(para1:PXMLTreeInfo; para2:PSplayTreeInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AddChildToXMLTree(para1:PXMLTreeInfo; para2:Pchar; para3:Tsize_t):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AddPathToXMLTree(para1:PXMLTreeInfo; para2:Pchar; para3:Tsize_t):PXMLTreeInfo;cdecl;external;
function DestroyXMLTree(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external;
function GetNextXMLTreeTag(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
function GetXMLTreeChild(para1:PXMLTreeInfo; para2:Pchar):PXMLTreeInfo;cdecl;external;
function GetXMLTreeOrdered(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
function GetXMLTreePath(para1:PXMLTreeInfo; para2:Pchar):PXMLTreeInfo;cdecl;external;
function GetXMLTreeSibling(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
function InsertTagIntoXMLTree(para1:PXMLTreeInfo; para2:PXMLTreeInfo; para3:Tsize_t):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
function NewXMLTree(para1:Pchar; para2:PExceptionInfo):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
function NewXMLTreeTag(para1:Pchar):PXMLTreeInfo;cdecl;external;
function ParseTagFromXMLTree(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external;
function PruneTagFromXMLTree(para1:PXMLTreeInfo):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetXMLTreeAttribute(para1:PXMLTreeInfo; para2:Pchar; para3:Pchar):PXMLTreeInfo;cdecl;external;
(* Const before type ignored *)
function SetXMLTreeContent(para1:PXMLTreeInfo; para2:Pchar):PXMLTreeInfo;cdecl;external;

implementation


end.
