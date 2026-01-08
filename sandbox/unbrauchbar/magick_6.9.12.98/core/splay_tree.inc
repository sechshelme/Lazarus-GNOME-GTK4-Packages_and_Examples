{$IFDEF read_interface}


type
  PSplayTreeInfo = type Pointer;

function AddValueToSplayTree(para1: PSplayTreeInfo; para2: pointer; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteNodeByValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteNodeFromSplayTree(para1: PSplayTreeInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetNextKeyInSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagickcore;
function GetNextValueInSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagickcore;
function GetRootValueFromSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagickcore;
function GetValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function CompareSplayTreeString(para1: pointer; para2: pointer): longint; cdecl; external libmagickcore;
function CompareSplayTreeStringInfo(para1: pointer; para2: pointer): longint; cdecl; external libmagickcore;

type
  TSplayTreeDestructor = procedure(data: pointer); cdecl;
  TSplayTreeCompare = function(left: pointer; right: pointer): Tssize_t; cdecl;

function CloneSplayTree(map: PSplayTreeInfo; compare: TSplayTreeCompare; destroy: TSplayTreeDestructor): PSplayTreeInfo; cdecl; external libmagickcore;
function DestroySplayTree(para1: PSplayTreeInfo): PSplayTreeInfo; cdecl; external libmagickcore;

type
  TSplayTreeCompare2 = function(left: pointer; right: pointer): longint; cdecl;
  TSplayTreeDestructor2 = procedure(data: pointer); cdecl;

function NewSplayTree(compare: TSplayTreeCompare2; left_destroy: TSplayTreeDestructor2; right_destroy: TSplayTreeDestructor2): PSplayTreeInfo; cdecl; external libmagickcore;
function GetNumberOfNodesInSplayTree(para1: PSplayTreeInfo): Tsize_t; cdecl; external libmagickcore;
function RemoveNodeByValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function RemoveNodeFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagickcore;
procedure ResetSplayTree(para1: PSplayTreeInfo); cdecl; external libmagickcore;
procedure ResetSplayTreeIterator(para1: PSplayTreeInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:54:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
