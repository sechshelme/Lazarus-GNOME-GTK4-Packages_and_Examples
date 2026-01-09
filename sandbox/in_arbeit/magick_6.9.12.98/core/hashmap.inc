{$IFDEF read_interface}



function DestroyHashmap(para1: PHashmapInfo): PHashmapInfo; cdecl; external libmagickcore;

type
  THashmapHashFunc = function(key: pointer): Tsize_t; cdecl;
  THashmapEqualFunc = function(left: pointer; right: pointer): TMagickBooleanType; cdecl;
  THashmapKeyDestructor = procedure(key: pointer); cdecl;
  THashmapValueDestructor = procedure(value: pointer); cdecl;

function NewHashmap(initial_size: Tsize_t; hash_key: THashmapHashFunc; equal_key: THashmapEqualFunc;
  destroy_key: THashmapKeyDestructor; destroy_value: THashmapValueDestructor): PHashmapInfo; cdecl; external libmagickcore;

type
  TLinkedListDestructor = procedure(data: pointer); cdecl;

function DestroyLinkedList(list: PLinkedListInfo; destroy: TLinkedListDestructor): PLinkedListInfo; cdecl; external libmagickcore;
function NewLinkedList(para1: Tsize_t): PLinkedListInfo; cdecl; external libmagickcore;
function AppendValueToLinkedList(para1: PLinkedListInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function CompareHashmapString(para1: pointer; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function CompareHashmapStringInfo(para1: pointer; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function InsertValueInLinkedList(para1: PLinkedListInfo; para2: Tsize_t; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;

type
  TLinkedListCompare = function(current: pointer; element: pointer): longint; cdecl;

function InsertValueInSortedLinkedList(list: PLinkedListInfo; compare: TLinkedListCompare; head: PPointer;
  element: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function IsHashmapEmpty(para1: PHashmapInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsLinkedListEmpty(para1: PLinkedListInfo): TMagickBooleanType; cdecl; external libmagickcore;
function LinkedListToArray(para1: PLinkedListInfo; para2: Ppointer): TMagickBooleanType; cdecl; external libmagickcore;
function PutEntryInHashmap(para1: PHashmapInfo; para2: pointer; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetNumberOfElementsInLinkedList(para1: PLinkedListInfo): Tsize_t; cdecl; external libmagickcore;
function GetNumberOfEntriesInHashmap(para1: PHashmapInfo): Tsize_t; cdecl; external libmagickcore;
function HashPointerType(para1: pointer): Tsize_t; cdecl; external libmagickcore;
function HashStringType(para1: pointer): Tsize_t; cdecl; external libmagickcore;
function HashStringInfoType(para1: pointer): Tsize_t; cdecl; external libmagickcore;
procedure ClearLinkedList(list: PLinkedListInfo; destroy: TLinkedListDestructor); cdecl; external libmagickcore;
function GetLastValueInLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagickcore;
function GetNextKeyInHashmap(para1: PHashmapInfo): pointer; cdecl; external libmagickcore;
function GetNextValueInHashmap(para1: PHashmapInfo): pointer; cdecl; external libmagickcore;
function GetNextValueInLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagickcore;
function GetValueFromHashmap(para1: PHashmapInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function GetValueFromLinkedList(para1: PLinkedListInfo; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function RemoveElementByValueFromLinkedList(para1: PLinkedListInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function RemoveElementFromLinkedList(para1: PLinkedListInfo; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function RemoveEntryFromHashmap(para1: PHashmapInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function RemoveLastElementFromLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagickcore;
procedure ResetHashmapIterator(para1: PHashmapInfo); cdecl; external libmagickcore;
procedure ResetLinkedListIterator(para1: PLinkedListInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
