unit list;

interface

uses
  ctypes, xml2_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlLink = record
  end;
  PxmlLink = ^TxmlLink;

  TxmlList = record
  end;
  PxmlList = ^TxmlList;

  TxmlListDeallocator = procedure(lk: PxmlLink); cdecl;
  TxmlListDataCompare = function(data0: pointer; data1: pointer): longint; cdecl;
  TxmlListWalker = function(Data: pointer; user: pointer): longint; cdecl;

function xmlListCreate(deallocator: TxmlListDeallocator; compare: TxmlListDataCompare): PxmlList; cdecl; external libxml2;
procedure xmlListDelete(l: PxmlList); cdecl; external libxml2;
function xmlListSearch(l: PxmlList; Data: pointer): pointer; cdecl; external libxml2;
function xmlListReverseSearch(l: PxmlList; Data: pointer): pointer; cdecl; external libxml2;
function xmlListInsert(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
function xmlListAppend(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
function xmlListRemoveFirst(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
function xmlListRemoveLast(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
function xmlListRemoveAll(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
procedure xmlListClear(l: PxmlList); cdecl; external libxml2;
function xmlListEmpty(l: PxmlList): longint; cdecl; external libxml2;
function xmlListFront(l: PxmlList): PxmlLink; cdecl; external libxml2;
function xmlListEnd(l: PxmlList): PxmlLink; cdecl; external libxml2;
function xmlListSize(l: PxmlList): longint; cdecl; external libxml2;
procedure xmlListPopFront(l: PxmlList); cdecl; external libxml2;
procedure xmlListPopBack(l: PxmlList); cdecl; external libxml2;
function xmlListPushFront(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
function xmlListPushBack(l: PxmlList; Data: pointer): longint; cdecl; external libxml2;
procedure xmlListReverse(l: PxmlList); cdecl; external libxml2;
procedure xmlListSort(l: PxmlList); cdecl; external libxml2;
procedure xmlListWalk(l: PxmlList; walker: TxmlListWalker; user: pointer); cdecl; external libxml2;
procedure xmlListReverseWalk(l: PxmlList; walker: TxmlListWalker; user: pointer); cdecl; external libxml2;
procedure xmlListMerge(l1: PxmlList; l2: PxmlList); cdecl; external libxml2;
function xmlListDup(old: PxmlList): PxmlList; cdecl; external libxml2;
function xmlListCopy(cur: PxmlList; old: PxmlList): longint; cdecl; external libxml2;
function xmlLinkGetData(lk: PxmlLink): pointer; cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:51:40 ===


implementation



end.
