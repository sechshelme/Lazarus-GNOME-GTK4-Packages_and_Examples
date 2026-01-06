
unit hashmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from hashmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hashmap.h
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
PHashmapInfo  = ^HashmapInfo;
PLinkedListInfo  = ^LinkedListInfo;
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

  MagickCore hash methods.
 }
{$ifndef MAGICKCORE_HASHMAP_H}
{$define MAGICKCORE_HASHMAP_H}

const
  SmallHashmapSize = 17;  
  MediumHashmapSize = 509;  
  LargeHashmapSize = 8191;  
  HugeHashmapSize = 131071;  
type

function DestroyHashmap(para1:PHashmapInfo):PHashmapInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function NewHashmap(para1:Tsize_t; para2:function (para1:pointer):Tsize_t; para3:function (para1:pointer; para2:pointer):TMagickBooleanType; para4:Pprocedure (para1:pointer); para5:Pprocedure (para1:pointer)):PHashmapInfo;cdecl;external;
function DestroyLinkedList(para1:PLinkedListInfo; para2:Pprocedure (para1:pointer)):PLinkedListInfo;cdecl;external;
(* Const before type ignored *)
function NewLinkedList(para1:Tsize_t):PLinkedListInfo;cdecl;external;
(* Const before type ignored *)
function AppendValueToLinkedList(para1:PLinkedListInfo; para2:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CompareHashmapString(para1:pointer; para2:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CompareHashmapStringInfo(para1:pointer; para2:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function InsertValueInLinkedList(para1:PLinkedListInfo; para2:Tsize_t; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function InsertValueInSortedLinkedList(para1:PLinkedListInfo; para2:function (para1:pointer; para2:pointer):longint; para3:Ppointer; para4:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsHashmapEmpty(para1:PHashmapInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsLinkedListEmpty(para1:PLinkedListInfo):TMagickBooleanType;cdecl;external;
function LinkedListToArray(para1:PLinkedListInfo; para2:Ppointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PutEntryInHashmap(para1:PHashmapInfo; para2:pointer; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetNumberOfElementsInLinkedList(para1:PLinkedListInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetNumberOfEntriesInHashmap(para1:PHashmapInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
function HashPointerType(para1:pointer):Tsize_t;cdecl;external;
(* Const before type ignored *)
function HashStringType(para1:pointer):Tsize_t;cdecl;external;
(* Const before type ignored *)
function HashStringInfoType(para1:pointer):Tsize_t;cdecl;external;
procedure ClearLinkedList(para1:PLinkedListInfo; para2:Pprocedure (para1:pointer));cdecl;external;
function GetLastValueInLinkedList(para1:PLinkedListInfo):pointer;cdecl;external;
function GetNextKeyInHashmap(para1:PHashmapInfo):pointer;cdecl;external;
function GetNextValueInHashmap(para1:PHashmapInfo):pointer;cdecl;external;
function GetNextValueInLinkedList(para1:PLinkedListInfo):pointer;cdecl;external;
(* Const before type ignored *)
function GetValueFromHashmap(para1:PHashmapInfo; para2:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function GetValueFromLinkedList(para1:PLinkedListInfo; para2:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
function RemoveElementByValueFromLinkedList(para1:PLinkedListInfo; para2:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function RemoveElementFromLinkedList(para1:PLinkedListInfo; para2:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
function RemoveEntryFromHashmap(para1:PHashmapInfo; para2:pointer):pointer;cdecl;external;
function RemoveLastElementFromLinkedList(para1:PLinkedListInfo):pointer;cdecl;external;
procedure ResetHashmapIterator(para1:PHashmapInfo);cdecl;external;
procedure ResetLinkedListIterator(para1:PLinkedListInfo);cdecl;external;
{$endif}

implementation


end.
