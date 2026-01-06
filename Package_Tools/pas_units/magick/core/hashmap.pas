unit hashmap;

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

function DestroyHashmap(para1:PHashmapInfo):PHashmapInfo;cdecl;external libmagiccore;
function NewHashmap(para1:Tsize_t; para2:function (para1:pointer):Tsize_t; para3:function (para1:pointer; para2:pointer):TMagickBooleanType; para4:Pprocedure (para1:pointer); para5:Pprocedure (para1:pointer)):PHashmapInfo;cdecl;external libmagiccore;
function DestroyLinkedList(para1:PLinkedListInfo; para2:Pprocedure (para1:pointer)):PLinkedListInfo;cdecl;external libmagiccore;
function NewLinkedList(para1:Tsize_t):PLinkedListInfo;cdecl;external libmagiccore;
function AppendValueToLinkedList(para1:PLinkedListInfo; para2:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function CompareHashmapString(para1:pointer; para2:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function CompareHashmapStringInfo(para1:pointer; para2:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function InsertValueInLinkedList(para1:PLinkedListInfo; para2:Tsize_t; para3:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function InsertValueInSortedLinkedList(para1:PLinkedListInfo; para2:function (para1:pointer; para2:pointer):longint; para3:Ppointer; para4:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function IsHashmapEmpty(para1:PHashmapInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsLinkedListEmpty(para1:PLinkedListInfo):TMagickBooleanType;cdecl;external libmagiccore;
function LinkedListToArray(para1:PLinkedListInfo; para2:Ppointer):TMagickBooleanType;cdecl;external libmagiccore;
function PutEntryInHashmap(para1:PHashmapInfo; para2:pointer; para3:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function GetNumberOfElementsInLinkedList(para1:PLinkedListInfo):Tsize_t;cdecl;external libmagiccore;
function GetNumberOfEntriesInHashmap(para1:PHashmapInfo):Tsize_t;cdecl;external libmagiccore;
function HashPointerType(para1:pointer):Tsize_t;cdecl;external libmagiccore;
function HashStringType(para1:pointer):Tsize_t;cdecl;external libmagiccore;
function HashStringInfoType(para1:pointer):Tsize_t;cdecl;external libmagiccore;
procedure ClearLinkedList(para1:PLinkedListInfo; para2:Pprocedure (para1:pointer));cdecl;external libmagiccore;
function GetLastValueInLinkedList(para1:PLinkedListInfo):pointer;cdecl;external libmagiccore;
function GetNextKeyInHashmap(para1:PHashmapInfo):pointer;cdecl;external libmagiccore;
function GetNextValueInHashmap(para1:PHashmapInfo):pointer;cdecl;external libmagiccore;
function GetNextValueInLinkedList(para1:PLinkedListInfo):pointer;cdecl;external libmagiccore;
function GetValueFromHashmap(para1:PHashmapInfo; para2:pointer):pointer;cdecl;external libmagiccore;
function GetValueFromLinkedList(para1:PLinkedListInfo; para2:Tsize_t):pointer;cdecl;external libmagiccore;
function RemoveElementByValueFromLinkedList(para1:PLinkedListInfo; para2:pointer):pointer;cdecl;external libmagiccore;
function RemoveElementFromLinkedList(para1:PLinkedListInfo; para2:Tsize_t):pointer;cdecl;external libmagiccore;
function RemoveEntryFromHashmap(para1:PHashmapInfo; para2:pointer):pointer;cdecl;external libmagiccore;
function RemoveLastElementFromLinkedList(para1:PLinkedListInfo):pointer;cdecl;external libmagiccore;
procedure ResetHashmapIterator(para1:PHashmapInfo);cdecl;external libmagiccore;
procedure ResetLinkedListIterator(para1:PLinkedListInfo);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:36:33 ===


implementation



end.
