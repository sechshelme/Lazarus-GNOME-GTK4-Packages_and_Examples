unit splay_tree;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSplayTreeInfo = type Pointer;

function AddValueToSplayTree(para1: PSplayTreeInfo; para2: pointer; para3: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function DeleteNodeByValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function DeleteNodeFromSplayTree(para1: PSplayTreeInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function GetNextKeyInSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagiccore;
function GetNextValueInSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagiccore;
function GetRootValueFromSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagiccore;
function GetValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagiccore;
function CompareSplayTreeString(para1: pointer; para2: pointer): longint; cdecl; external libmagiccore;
function CompareSplayTreeStringInfo(para1: pointer; para2: pointer): longint; cdecl; external libmagiccore;

type
  TSplayTreeDestructor = procedure(data: pointer); cdecl;
  TSplayTreeCompare = function(left: pointer; right: pointer): Tssize_t; cdecl;

function CloneSplayTree(map: PSplayTreeInfo; compare: TSplayTreeCompare; destroy: TSplayTreeDestructor): PSplayTreeInfo; cdecl; external libmagiccore;
function DestroySplayTree(para1: PSplayTreeInfo): PSplayTreeInfo; cdecl; external libmagiccore;

type
  TSplayTreeCompare2 = function(left: pointer; right: pointer): longint; cdecl;
  TSplayTreeDestructor2 = procedure(data: pointer); cdecl;

function NewSplayTree(compare: TSplayTreeCompare2; left_destroy: TSplayTreeDestructor2; right_destroy: TSplayTreeDestructor2): PSplayTreeInfo; cdecl; external libmagiccore;
function GetNumberOfNodesInSplayTree(para1: PSplayTreeInfo): Tsize_t; cdecl; external libmagiccore;
function RemoveNodeByValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagiccore;
function RemoveNodeFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagiccore;
procedure ResetSplayTree(para1: PSplayTreeInfo); cdecl; external libmagiccore;
procedure ResetSplayTreeIterator(para1: PSplayTreeInfo); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:54:35 ===


implementation



end.
