
unit pattern;
interface

{
  Automatically converted by H2Pas 1.0.0 from pattern.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pattern.h
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
PxmlDict  = ^xmlDict;
PxmlPattern  = ^xmlPattern;
PxmlPatternFlags  = ^xmlPatternFlags;
PxmlPatternPtr  = ^xmlPatternPtr;
PxmlStreamCtxt  = ^xmlStreamCtxt;
PxmlStreamCtxtPtr  = ^xmlStreamCtxtPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: pattern expression handling
 * Description: allows to compile and test pattern expressions for nodes
 *              either in a tree or based on a parser state.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_PATTERN_H__}
{$define __XML_PATTERN_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$include <libxml/dict.h>}
{$ifdef LIBXML_PATTERN_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * xmlPattern:
 *
 * A compiled (XPath based) pattern to select nodes
  }
type

  PxmlPatternPtr = ^TxmlPatternPtr;
  TxmlPatternPtr = PxmlPattern;
{*
 * xmlPatternFlags:
 *
 * This is the set of options affecting the behaviour of pattern
 * matching with this module
 *
  }
{ simple pattern match  }
{ standard XPath pattern  }
{ XPath subset for schema selector  }
{ XPath subset for schema field  }

  PxmlPatternFlags = ^TxmlPatternFlags;
  TxmlPatternFlags =  Longint;
  Const
    XML_PATTERN_DEFAULT = 0;
    XML_PATTERN_XPATH = 1 shl 0;
    XML_PATTERN_XSSEL = 1 shl 1;
    XML_PATTERN_XSFIELD = 1 shl 2;
;

procedure xmlFreePattern(comp:TxmlPatternPtr);cdecl;external;
procedure xmlFreePatternList(comp:TxmlPatternPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlPatterncompile(pattern:PxmlChar; dict:PxmlDict; flags:longint; namespaces:PPxmlChar):TxmlPatternPtr;cdecl;external;
function xmlPatternMatch(comp:TxmlPatternPtr; node:TxmlNodePtr):longint;cdecl;external;
{ streaming interfaces  }
type

  PxmlStreamCtxtPtr = ^TxmlStreamCtxtPtr;
  TxmlStreamCtxtPtr = PxmlStreamCtxt;

function xmlPatternStreamable(comp:TxmlPatternPtr):longint;cdecl;external;
function xmlPatternMaxDepth(comp:TxmlPatternPtr):longint;cdecl;external;
function xmlPatternMinDepth(comp:TxmlPatternPtr):longint;cdecl;external;
function xmlPatternFromRoot(comp:TxmlPatternPtr):longint;cdecl;external;
function xmlPatternGetStreamCtxt(comp:TxmlPatternPtr):TxmlStreamCtxtPtr;cdecl;external;
procedure xmlFreeStreamCtxt(stream:TxmlStreamCtxtPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStreamPushNode(stream:TxmlStreamCtxtPtr; name:PxmlChar; ns:PxmlChar; nodeType:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStreamPush(stream:TxmlStreamCtxtPtr; name:PxmlChar; ns:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStreamPushAttr(stream:TxmlStreamCtxtPtr; name:PxmlChar; ns:PxmlChar):longint;cdecl;external;
function xmlStreamPop(stream:TxmlStreamCtxtPtr):longint;cdecl;external;
function xmlStreamWantsAnyNode(stream:TxmlStreamCtxtPtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_PATTERN_ENABLED  }
{$endif}
{ __XML_PATTERN_H__  }

implementation


end.
