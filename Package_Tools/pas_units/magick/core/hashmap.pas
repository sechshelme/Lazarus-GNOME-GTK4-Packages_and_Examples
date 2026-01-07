unit hashmap;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  SmallHashmapSize = 17;
  MediumHashmapSize = 509;
  LargeHashmapSize = 8191;
  HugeHashmapSize = 131071;

type
  PHashmapInfo = type Pointer;
  PLinkedListInfo = type Pointer;

function DestroyHashmap(para1: PHashmapInfo): PHashmapInfo; cdecl; external libmagiccore;

type
  THashmapHashFunc = function(key: pointer): Tsize_t; cdecl;
  THashmapEqualFunc = function(left: pointer; right: pointer): TMagickBooleanType; cdecl;
  THashmapKeyDestructor = procedure(key: pointer); cdecl;
  THashmapValueDestructor = procedure(value: pointer); cdecl;

function NewHashmap(initial_size: Tsize_t; hash_key: THashmapHashFunc; equal_key: THashmapEqualFunc;
  destroy_key: THashmapKeyDestructor; destroy_value: THashmapValueDestructor): PHashmapInfo; cdecl; external libmagiccore;

type
  TLinkedListDestructor = procedure(data: pointer); cdecl;

function DestroyLinkedList(list: PLinkedListInfo; destroy: TLinkedListDestructor): PLinkedListInfo; cdecl; external libmagiccore;
function NewLinkedList(para1: Tsize_t): PLinkedListInfo; cdecl; external libmagiccore;
function AppendValueToLinkedList(para1: PLinkedListInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function CompareHashmapString(para1: pointer; para2: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function CompareHashmapStringInfo(para1: pointer; para2: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function InsertValueInLinkedList(para1: PLinkedListInfo; para2: Tsize_t; para3: pointer): TMagickBooleanType; cdecl; external libmagiccore;

type
  TLinkedListCompare = function(current: pointer; element: pointer): longint; cdecl;

function InsertValueInSortedLinkedList(list: PLinkedListInfo; compare: TLinkedListCompare; head: PPointer;
  element: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function IsHashmapEmpty(para1: PHashmapInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsLinkedListEmpty(para1: PLinkedListInfo): TMagickBooleanType; cdecl; external libmagiccore;
function LinkedListToArray(para1: PLinkedListInfo; para2: Ppointer): TMagickBooleanType; cdecl; external libmagiccore;
function PutEntryInHashmap(para1: PHashmapInfo; para2: pointer; para3: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function GetNumberOfElementsInLinkedList(para1: PLinkedListInfo): Tsize_t; cdecl; external libmagiccore;
function GetNumberOfEntriesInHashmap(para1: PHashmapInfo): Tsize_t; cdecl; external libmagiccore;
function HashPointerType(para1: pointer): Tsize_t; cdecl; external libmagiccore;
function HashStringType(para1: pointer): Tsize_t; cdecl; external libmagiccore;
function HashStringInfoType(para1: pointer): Tsize_t; cdecl; external libmagiccore;
procedure ClearLinkedList(list: PLinkedListInfo; destroy: TLinkedListDestructor); cdecl; external libmagiccore;
function GetLastValueInLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagiccore;
function GetNextKeyInHashmap(para1: PHashmapInfo): pointer; cdecl; external libmagiccore;
function GetNextValueInHashmap(para1: PHashmapInfo): pointer; cdecl; external libmagiccore;
function GetNextValueInLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagiccore;
function GetValueFromHashmap(para1: PHashmapInfo; para2: pointer): pointer; cdecl; external libmagiccore;
function GetValueFromLinkedList(para1: PLinkedListInfo; para2: Tsize_t): pointer; cdecl; external libmagiccore;
function RemoveElementByValueFromLinkedList(para1: PLinkedListInfo; para2: pointer): pointer; cdecl; external libmagiccore;
function RemoveElementFromLinkedList(para1: PLinkedListInfo; para2: Tsize_t): pointer; cdecl; external libmagiccore;
function RemoveEntryFromHashmap(para1: PHashmapInfo; para2: pointer): pointer; cdecl; external libmagiccore;
function RemoveLastElementFromLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagiccore;
procedure ResetHashmapIterator(para1: PHashmapInfo); cdecl; external libmagiccore;
procedure ResetLinkedListIterator(para1: PLinkedListInfo); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:33 ===


implementation



end.
