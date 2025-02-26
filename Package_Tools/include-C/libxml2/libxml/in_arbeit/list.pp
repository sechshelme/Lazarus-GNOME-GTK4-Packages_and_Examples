
unit list;
interface

{
  Automatically converted by H2Pas 1.0.0 from list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    list.h
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
PxmlLink  = ^xmlLink;
PxmlLinkPtr  = ^xmlLinkPtr;
PxmlList  = ^xmlList;
PxmlListPtr  = ^xmlListPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: lists interfaces
 * Description: this module implement the list support used in
 * various place in the library.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Gary Pennington <Gary.Pennington@uk.sun.com>
  }
{$ifndef __XML_LINK_INCLUDE__}
{$define __XML_LINK_INCLUDE__}
{$include <libxml/xmlversion.h>}
{ C++ extern C conditionnal removed }
type

  PxmlLinkPtr = ^TxmlLinkPtr;
  TxmlLinkPtr = PxmlLink;

  PxmlListPtr = ^TxmlListPtr;
  TxmlListPtr = PxmlList;
{*
 * xmlListDeallocator:
 * @lk:  the data to deallocate
 *
 * Callback function used to free data from a list.
  }

  TxmlListDeallocator = procedure (lk:TxmlLinkPtr);cdecl;
{*
 * xmlListDataCompare:
 * @data0: the first data
 * @data1: the second data
 *
 * Callback function used to compare 2 data.
 *
 * Returns 0 is equality, -1 or 1 otherwise depending on the ordering.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TxmlListDataCompare = function (data0:pointer; data1:pointer):longint;cdecl;
{*
 * xmlListWalker:
 * @data: the data found in the list
 * @user: extra user provided data to the walker
 *
 * Callback function used when walking a list with xmlListWalk().
 *
 * Returns 0 to stop walking the list, 1 otherwise.
  }
(* Const before type ignored *)

  TxmlListWalker = function (data:pointer; user:pointer):longint;cdecl;
{ Creation/Deletion  }

function xmlListCreate(deallocator:TxmlListDeallocator; compare:TxmlListDataCompare):TxmlListPtr;cdecl;external;
procedure xmlListDelete(l:TxmlListPtr);cdecl;external;
{ Basic Operators  }
function xmlListSearch(l:TxmlListPtr; data:pointer):pointer;cdecl;external;
function xmlListReverseSearch(l:TxmlListPtr; data:pointer):pointer;cdecl;external;
function xmlListInsert(l:TxmlListPtr; data:pointer):longint;cdecl;external;
function xmlListAppend(l:TxmlListPtr; data:pointer):longint;cdecl;external;
function xmlListRemoveFirst(l:TxmlListPtr; data:pointer):longint;cdecl;external;
function xmlListRemoveLast(l:TxmlListPtr; data:pointer):longint;cdecl;external;
function xmlListRemoveAll(l:TxmlListPtr; data:pointer):longint;cdecl;external;
procedure xmlListClear(l:TxmlListPtr);cdecl;external;
function xmlListEmpty(l:TxmlListPtr):longint;cdecl;external;
function xmlListFront(l:TxmlListPtr):TxmlLinkPtr;cdecl;external;
function xmlListEnd(l:TxmlListPtr):TxmlLinkPtr;cdecl;external;
function xmlListSize(l:TxmlListPtr):longint;cdecl;external;
procedure xmlListPopFront(l:TxmlListPtr);cdecl;external;
procedure xmlListPopBack(l:TxmlListPtr);cdecl;external;
function xmlListPushFront(l:TxmlListPtr; data:pointer):longint;cdecl;external;
function xmlListPushBack(l:TxmlListPtr; data:pointer):longint;cdecl;external;
{ Advanced Operators  }
procedure xmlListReverse(l:TxmlListPtr);cdecl;external;
procedure xmlListSort(l:TxmlListPtr);cdecl;external;
procedure xmlListWalk(l:TxmlListPtr; walker:TxmlListWalker; user:pointer);cdecl;external;
procedure xmlListReverseWalk(l:TxmlListPtr; walker:TxmlListWalker; user:pointer);cdecl;external;
procedure xmlListMerge(l1:TxmlListPtr; l2:TxmlListPtr);cdecl;external;
(* Const before type ignored *)
function xmlListDup(old:TxmlListPtr):TxmlListPtr;cdecl;external;
(* Const before type ignored *)
function xmlListCopy(cur:TxmlListPtr; old:TxmlListPtr):longint;cdecl;external;
{ Link operators  }
function xmlLinkGetData(lk:TxmlLinkPtr):pointer;cdecl;external;
{ xmlListUnique()  }
{ xmlListSwap  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_LINK_INCLUDE__  }

implementation


end.
