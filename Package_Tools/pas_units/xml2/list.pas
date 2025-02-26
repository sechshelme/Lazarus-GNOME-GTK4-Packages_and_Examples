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

  PxmlLinkPtr = ^TxmlLinkPtr;
  TxmlLinkPtr = PxmlLink;

  PxmlListPtr = ^TxmlListPtr;
  TxmlListPtr = PxmlList;

  TxmlListDeallocator = procedure(lk: TxmlLinkPtr); cdecl;
  TxmlListDataCompare = function(data0: pointer; data1: pointer): longint; cdecl;
  TxmlListWalker = function(Data: pointer; user: pointer): longint; cdecl;
function xmlListCreate(deallocator: TxmlListDeallocator; compare: TxmlListDataCompare): TxmlListPtr; cdecl; external libxml2;
procedure xmlListDelete(l: TxmlListPtr); cdecl; external libxml2;
function xmlListSearch(l: TxmlListPtr; Data: pointer): pointer; cdecl; external libxml2;
function xmlListReverseSearch(l: TxmlListPtr; Data: pointer): pointer; cdecl; external libxml2;
function xmlListInsert(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
function xmlListAppend(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
function xmlListRemoveFirst(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
function xmlListRemoveLast(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
function xmlListRemoveAll(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
procedure xmlListClear(l: TxmlListPtr); cdecl; external libxml2;
function xmlListEmpty(l: TxmlListPtr): longint; cdecl; external libxml2;
function xmlListFront(l: TxmlListPtr): TxmlLinkPtr; cdecl; external libxml2;
function xmlListEnd(l: TxmlListPtr): TxmlLinkPtr; cdecl; external libxml2;
function xmlListSize(l: TxmlListPtr): longint; cdecl; external libxml2;
procedure xmlListPopFront(l: TxmlListPtr); cdecl; external libxml2;
procedure xmlListPopBack(l: TxmlListPtr); cdecl; external libxml2;
function xmlListPushFront(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
function xmlListPushBack(l: TxmlListPtr; Data: pointer): longint; cdecl; external libxml2;
procedure xmlListReverse(l: TxmlListPtr); cdecl; external libxml2;
procedure xmlListSort(l: TxmlListPtr); cdecl; external libxml2;
procedure xmlListWalk(l: TxmlListPtr; walker: TxmlListWalker; user: pointer); cdecl; external libxml2;
procedure xmlListReverseWalk(l: TxmlListPtr; walker: TxmlListWalker; user: pointer); cdecl; external libxml2;
procedure xmlListMerge(l1: TxmlListPtr; l2: TxmlListPtr); cdecl; external libxml2;
function xmlListDup(old: TxmlListPtr): TxmlListPtr; cdecl; external libxml2;
function xmlListCopy(cur: TxmlListPtr; old: TxmlListPtr): longint; cdecl; external libxml2;
function xmlLinkGetData(lk: TxmlLinkPtr): pointer; cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:51:40 ===


implementation



end.
