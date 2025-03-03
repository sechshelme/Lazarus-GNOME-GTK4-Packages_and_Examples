
unit xlink;
interface

{
  Automatically converted by H2Pas 1.0.0 from xlink.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xlink.h
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
PxlinkActuate  = ^xlinkActuate;
PxlinkHandler  = ^xlinkHandler;
PxlinkHandlerPtr  = ^xlinkHandlerPtr;
PxlinkHRef  = ^xlinkHRef;
PxlinkRole  = ^xlinkRole;
PxlinkShow  = ^xlinkShow;
PxlinkTitle  = ^xlinkTitle;
PxlinkType  = ^xlinkType;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: unfinished XLink detection module
 * Description: unfinished XLink detection module
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_XLINK_H__}
{$define __XML_XLINK_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$ifdef LIBXML_XPTR_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * Various defines for the various Link properties.
 *
 * NOTE: the link detection layer will try to resolve QName expansion
 *       of namespaces. If "foo" is the prefix for "http://foo.com/"
 *       then the link detection layer will expand role="foo:myrole"
 *       to "http://foo.com/:myrole".
 * NOTE: the link detection layer will expand URI-References found on
 *       href attributes by using the base mechanism if found.
  }
type
  PxlinkHRef = ^TxlinkHRef;
  TxlinkHRef = PxmlChar;

  PxlinkRole = ^TxlinkRole;
  TxlinkRole = PxmlChar;

  PxlinkTitle = ^TxlinkTitle;
  TxlinkTitle = PxmlChar;

  PxlinkType = ^TxlinkType;
  TxlinkType =  Longint;
  Const
    XLINK_TYPE_NONE = 0;
    XLINK_TYPE_SIMPLE = 1;
    XLINK_TYPE_EXTENDED = 2;
    XLINK_TYPE_EXTENDED_SET = 3;
;
type
  PxlinkShow = ^TxlinkShow;
  TxlinkShow =  Longint;
  Const
    XLINK_SHOW_NONE = 0;
    XLINK_SHOW_NEW = 1;
    XLINK_SHOW_EMBED = 2;
    XLINK_SHOW_REPLACE = 3;
;
type
  PxlinkActuate = ^TxlinkActuate;
  TxlinkActuate =  Longint;
  Const
    XLINK_ACTUATE_NONE = 0;
    XLINK_ACTUATE_AUTO = 1;
    XLINK_ACTUATE_ONREQUEST = 2;
;
{*
 * xlinkNodeDetectFunc:
 * @ctx:  user data pointer
 * @node:  the node to check
 *
 * This is the prototype for the link detection routine.
 * It calls the default link detection callbacks upon link detection.
  }
type

  TxlinkNodeDetectFunc = procedure (ctx:pointer; node:TxmlNodePtr);cdecl;
{
 * The link detection module interact with the upper layers using
 * a set of callback registered at parsing time.
  }
{*
 * xlinkSimpleLinkFunk:
 * @ctx:  user data pointer
 * @node:  the node carrying the link
 * @href:  the target of the link
 * @role:  the role string
 * @title:  the link title
 *
 * This is the prototype for a simple link detection callback.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TxlinkSimpleLinkFunk = procedure (ctx:pointer; node:TxmlNodePtr; href:TxlinkHRef; role:TxlinkRole; title:TxlinkTitle);cdecl;
{*
 * xlinkExtendedLinkFunk:
 * @ctx:  user data pointer
 * @node:  the node carrying the link
 * @nbLocators: the number of locators detected on the link
 * @hrefs:  pointer to the array of locator hrefs
 * @roles:  pointer to the array of locator roles
 * @nbArcs: the number of arcs detected on the link
 * @from:  pointer to the array of source roles found on the arcs
 * @to:  pointer to the array of target roles found on the arcs
 * @show:  array of values for the show attributes found on the arcs
 * @actuate:  array of values for the actuate attributes found on the arcs
 * @nbTitles: the number of titles detected on the link
 * @title:  array of titles detected on the link
 * @langs:  array of xml:lang values for the titles
 *
 * This is the prototype for a extended link detection callback.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TxlinkExtendedLinkFunk = procedure (ctx:pointer; node:TxmlNodePtr; nbLocators:longint; hrefs:PxlinkHRef; roles:PxlinkRole; 
                nbArcs:longint; from:PxlinkRole; to:PxlinkRole; show:PxlinkShow; actuate:PxlinkActuate; 
                nbTitles:longint; titles:PxlinkTitle; langs:PPxmlChar);cdecl;
{*
 * xlinkExtendedLinkSetFunk:
 * @ctx:  user data pointer
 * @node:  the node carrying the link
 * @nbLocators: the number of locators detected on the link
 * @hrefs:  pointer to the array of locator hrefs
 * @roles:  pointer to the array of locator roles
 * @nbTitles: the number of titles detected on the link
 * @title:  array of titles detected on the link
 * @langs:  array of xml:lang values for the titles
 *
 * This is the prototype for a extended link set detection callback.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TxlinkExtendedLinkSetFunk = procedure (ctx:pointer; node:TxmlNodePtr; nbLocators:longint; hrefs:PxlinkHRef; roles:PxlinkRole; 
                nbTitles:longint; titles:PxlinkTitle; langs:PPxmlChar);cdecl;
{*
 * This is the structure containing a set of Links detection callbacks.
 *
 * There is no default xlink callbacks, if one want to get link
 * recognition activated, those call backs must be provided before parsing.
  }

  PxlinkHandlerPtr = ^TxlinkHandlerPtr;
  TxlinkHandlerPtr = PxlinkHandler;
  PxlinkHandler = ^TxlinkHandler;
  TxlinkHandler = record
      simple : TxlinkSimpleLinkFunk;
      extended : TxlinkExtendedLinkFunk;
      set : TxlinkExtendedLinkSetFunk;
    end;

{
 * The default detection routine, can be overridden, they call the default
 * detection callbacks.
  }

function xlinkGetDefaultDetect:TxlinkNodeDetectFunc;cdecl;external;
procedure xlinkSetDefaultDetect(func:TxlinkNodeDetectFunc);cdecl;external;
{
 * Routines to set/get the default handlers.
  }
function xlinkGetDefaultHandler:TxlinkHandlerPtr;cdecl;external;
procedure xlinkSetDefaultHandler(handler:TxlinkHandlerPtr);cdecl;external;
{
 * Link detection module itself.
  }
function xlinkIsLink(doc:TxmlDocPtr; node:TxmlNodePtr):TxlinkType;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_XPTR_ENABLED  }
{$endif}
{ __XML_XLINK_H__  }

implementation


end.
