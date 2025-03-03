
unit xpointer;
interface

{
  Automatically converted by H2Pas 1.0.0 from xpointer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xpointer.h
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
PxmlChar  = ^xmlChar;
PxmlLocationSet  = ^xmlLocationSet;
PxmlLocationSetPtr  = ^xmlLocationSetPtr;
PxmlXPathObjectPtr  = ^xmlXPathObjectPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: API to handle XML Pointers
 * Description: API to handle XML Pointers
 * Base implementation was made accordingly to
 * W3C Candidate Recommendation 7 June 2000
 * http://www.w3.org/TR/2000/CR-xptr-20000607
 *
 * Added support for the element() scheme described in:
 * W3C Proposed Recommendation 13 November 2002
 * http://www.w3.org/TR/2002/PR-xptr-element-20021113/
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_XPTR_H__}
{$define __XML_XPTR_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_XPTR_ENABLED}
{$include <libxml/tree.h>}
{$include <libxml/xpath.h>}
{ C++ extern C conditionnal removed }
{
 * A Location Set
  }
type

  PxmlLocationSetPtr = ^TxmlLocationSetPtr;
  TxmlLocationSetPtr = PxmlLocationSet;
{ number of locations in the set  }
{ size of the array as allocated  }
{ array of locations  }
  PxmlLocationSet = ^TxmlLocationSet;
  TxmlLocationSet = record
      locNr : longint;
      locMax : longint;
      locTab : PxmlXPathObjectPtr;
    end;

{
 * Handling of location sets.
  }

function xmlXPtrLocationSetCreate(val:TxmlXPathObjectPtr):TxmlLocationSetPtr;cdecl;external;
procedure xmlXPtrFreeLocationSet(obj:TxmlLocationSetPtr);cdecl;external;
function xmlXPtrLocationSetMerge(val1:TxmlLocationSetPtr; val2:TxmlLocationSetPtr):TxmlLocationSetPtr;cdecl;external;
function xmlXPtrNewRange(start:TxmlNodePtr; startindex:longint; end:TxmlNodePtr; endindex:longint):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewRangePoints(start:TxmlXPathObjectPtr; end:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewRangeNodePoint(start:TxmlNodePtr; end:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewRangePointNode(start:TxmlXPathObjectPtr; end:TxmlNodePtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewRangeNodes(start:TxmlNodePtr; end:TxmlNodePtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewLocationSetNodes(start:TxmlNodePtr; end:TxmlNodePtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewLocationSetNodeSet(set:TxmlNodeSetPtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewRangeNodeObject(start:TxmlNodePtr; end:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPtrNewCollapsedRange(start:TxmlNodePtr):TxmlXPathObjectPtr;cdecl;external;
procedure xmlXPtrLocationSetAdd(cur:TxmlLocationSetPtr; val:TxmlXPathObjectPtr);cdecl;external;
function xmlXPtrWrapLocationSet(val:TxmlLocationSetPtr):TxmlXPathObjectPtr;cdecl;external;
procedure xmlXPtrLocationSetDel(cur:TxmlLocationSetPtr; val:TxmlXPathObjectPtr);cdecl;external;
procedure xmlXPtrLocationSetRemove(cur:TxmlLocationSetPtr; val:longint);cdecl;external;
{
 * Functions.
  }
function xmlXPtrNewContext(doc:TxmlDocPtr; here:TxmlNodePtr; origin:TxmlNodePtr):TxmlXPathContextPtr;cdecl;external;
(* Const before type ignored *)
function xmlXPtrEval(str:PxmlChar; ctx:TxmlXPathContextPtr):TxmlXPathObjectPtr;cdecl;external;
procedure xmlXPtrRangeToFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
function xmlXPtrBuildNodeList(obj:TxmlXPathObjectPtr):TxmlNodePtr;cdecl;external;
procedure xmlXPtrEvalRangePredicate(ctxt:TxmlXPathParserContextPtr);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_XPTR_ENABLED  }
{$endif}
{ __XML_XPTR_H__  }

implementation


end.
