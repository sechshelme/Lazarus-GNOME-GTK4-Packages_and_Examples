
unit HTMLparser;
interface

{
  Automatically converted by H2Pas 1.0.0 from HTMLparser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    HTMLparser.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PhtmlDocPtr  = ^htmlDocPtr;
PhtmlElemDesc  = ^htmlElemDesc;
PhtmlElemDescPtr  = ^htmlElemDescPtr;
PhtmlEntityDesc  = ^htmlEntityDesc;
PhtmlEntityDescPtr  = ^htmlEntityDescPtr;
PhtmlNodePtr  = ^htmlNodePtr;
PhtmlParserCtxt  = ^htmlParserCtxt;
PhtmlParserCtxtPtr  = ^htmlParserCtxtPtr;
PhtmlParserInput  = ^htmlParserInput;
PhtmlParserInputPtr  = ^htmlParserInputPtr;
PhtmlParserNodeInfo  = ^htmlParserNodeInfo;
PhtmlParserOption  = ^htmlParserOption;
PhtmlSAXHandler  = ^htmlSAXHandler;
PhtmlSAXHandlerPtr  = ^htmlSAXHandlerPtr;
PhtmlStatus  = ^htmlStatus;
Plongint  = ^longint;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: interface for an HTML 4.0 non-verifying parser
 * Description: this module implements an HTML 4.0 non-verifying parser
 *              with API compatible with the XML parser ones. It should
 *              be able to parse "real world" HTML, even if severely
 *              broken from a specification point of view.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __HTML_PARSER_H__}
{$define __HTML_PARSER_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/parser.h>}
{$ifdef LIBXML_HTML_ENABLED}
{ C++ extern C conditionnal removed }
{
 * Most of the back-end structures from XML and HTML are shared.
  }
type
  PhtmlParserCtxt = ^ThtmlParserCtxt;
  ThtmlParserCtxt = TxmlParserCtxt;

  PhtmlParserCtxtPtr = ^ThtmlParserCtxtPtr;
  ThtmlParserCtxtPtr = TxmlParserCtxtPtr;

  PhtmlParserNodeInfo = ^ThtmlParserNodeInfo;
  ThtmlParserNodeInfo = TxmlParserNodeInfo;

  PhtmlSAXHandler = ^ThtmlSAXHandler;
  ThtmlSAXHandler = TxmlSAXHandler;

  PhtmlSAXHandlerPtr = ^ThtmlSAXHandlerPtr;
  ThtmlSAXHandlerPtr = TxmlSAXHandlerPtr;

  PhtmlParserInput = ^ThtmlParserInput;
  ThtmlParserInput = TxmlParserInput;

  PhtmlParserInputPtr = ^ThtmlParserInputPtr;
  ThtmlParserInputPtr = TxmlParserInputPtr;

  PhtmlDocPtr = ^ThtmlDocPtr;
  ThtmlDocPtr = TxmlDocPtr;

  PhtmlNodePtr = ^ThtmlNodePtr;
  ThtmlNodePtr = TxmlNodePtr;
{
 * Internal description of an HTML element, representing HTML 4.01
 * and XHTML 1.0 (which share the same structure).
  }

  PhtmlElemDescPtr = ^ThtmlElemDescPtr;
  ThtmlElemDescPtr = PhtmlElemDesc;
(* Const before type ignored *)
{ The tag name  }
{ Whether the start tag can be implied  }
{ Whether the end tag can be implied  }
{ Whether the end tag should be saved  }
{ Is this an empty element ?  }
{ Is this a deprecated element ?  }
{ 1: only in Loose DTD, 2: only Frameset one  }
{ is this a block 0 or inline 1 element  }
(* Const before type ignored *)
{ the description  }
{ NRK Jan.2003
 * New fields encapsulating HTML structure
 *
 * Bugs:
 *	This is a very limited representation.  It fails to tell us when
 *	an element *requires* subelements (we only have whether they're
 *	allowed or not), and it doesn't tell us where CDATA and PCDATA
 *	are allowed.  Some element relationships are not fully represented:
 *	these are flagged with the word MODIFIER
  }
(* Const before type ignored *)
{ allowed sub-elements of this element  }
(* Const before type ignored *)
{ subelement for suggested auto-repair
					   if necessary or NULL  }
(* Const before type ignored *)
{ Optional Attributes  }
(* Const before type ignored *)
{ Additional deprecated attributes  }
(* Const before type ignored *)
{ Required attributes  }
  PhtmlElemDesc = ^ThtmlElemDesc;
  ThtmlElemDesc = record
      name : Pchar;
      startTag : char;
      endTag : char;
      saveEndTag : char;
      empty : char;
      depr : char;
      dtd : char;
      isinline : char;
      desc : Pchar;
      subelts : ^Pchar;
      defaultsubelt : Pchar;
      attrs_opt : ^Pchar;
      attrs_depr : ^Pchar;
      attrs_req : ^Pchar;
    end;

{
 * Internal description of an HTML entity.
  }

  PhtmlEntityDescPtr = ^ThtmlEntityDescPtr;
  ThtmlEntityDescPtr = PhtmlEntityDesc;
{ the UNICODE value for the character  }
(* Const before type ignored *)
{ The entity name  }
(* Const before type ignored *)
{ the description  }
  PhtmlEntityDesc = ^ThtmlEntityDesc;
  ThtmlEntityDesc = record
      value : dword;
      name : Pchar;
      desc : Pchar;
    end;

{
 * There is only few public functions.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function htmlTagLookup(tag:PxmlChar):PhtmlElemDesc;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlEntityLookup(name:PxmlChar):PhtmlEntityDesc;cdecl;external;
(* Const before type ignored *)
function htmlEntityValueLookup(value:dword):PhtmlEntityDesc;cdecl;external;
function htmlIsAutoClosed(doc:ThtmlDocPtr; elem:ThtmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function htmlAutoCloseTag(doc:ThtmlDocPtr; name:PxmlChar; elem:ThtmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlParseEntityRef(ctxt:ThtmlParserCtxtPtr; str:PPxmlChar):PhtmlEntityDesc;cdecl;external;
function htmlParseCharRef(ctxt:ThtmlParserCtxtPtr):longint;cdecl;external;
procedure htmlParseElement(ctxt:ThtmlParserCtxtPtr);cdecl;external;
function htmlNewParserCtxt:ThtmlParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function htmlCreateMemoryParserCtxt(buffer:Pchar; size:longint):ThtmlParserCtxtPtr;cdecl;external;
function htmlParseDocument(ctxt:ThtmlParserCtxtPtr):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlSAXParseDoc(cur:PxmlChar; encoding:Pchar; sax:ThtmlSAXHandlerPtr; userData:pointer):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlParseDoc(cur:PxmlChar; encoding:Pchar):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlSAXParseFile(filename:Pchar; encoding:Pchar; sax:ThtmlSAXHandlerPtr; userData:pointer):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlParseFile(filename:Pchar; encoding:Pchar):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
function UTF8ToHtml(out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function htmlEncodeEntities(out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint; quoteChar:longint):longint;cdecl;external;
(* Const before type ignored *)
function htmlIsScriptAttribute(name:PxmlChar):longint;cdecl;external;
function htmlHandleOmittedElem(val:longint):longint;cdecl;external;
{$ifdef LIBXML_PUSH_ENABLED}
{*
 * Interfaces for the Push mode.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCreatePushParserCtxt(sax:ThtmlSAXHandlerPtr; user_data:pointer; chunk:Pchar; size:longint; filename:Pchar; 
           enc:TxmlCharEncoding):ThtmlParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function htmlParseChunk(ctxt:ThtmlParserCtxtPtr; chunk:Pchar; size:longint; terminate:longint):longint;cdecl;external;
{$endif}
{ LIBXML_PUSH_ENABLED  }

procedure htmlFreeParserCtxt(ctxt:ThtmlParserCtxtPtr);cdecl;external;
{
 * New set of simpler/more flexible APIs
  }
{*
 * xmlParserOption:
 *
 * This is the set of XML parser options that can be passed down
 * to the xmlReadDoc() and similar calls.
  }
{ Relaxed parsing  }
{ do not default a doctype if not found  }
{ suppress error reports  }
{ suppress warning reports  }
{ pedantic error reporting  }
{ remove blank nodes  }
{ Forbid network access  }
{ Do not add implied html/body... elements  }
{ compact small text nodes  }
{ ignore internal document encoding hint  }
type
  PhtmlParserOption = ^ThtmlParserOption;
  ThtmlParserOption =  Longint;
  Const
    HTML_PARSE_RECOVER = 1 shl 0;
    HTML_PARSE_NODEFDTD = 1 shl 2;
    HTML_PARSE_NOERROR = 1 shl 5;
    HTML_PARSE_NOWARNING = 1 shl 6;
    HTML_PARSE_PEDANTIC = 1 shl 7;
    HTML_PARSE_NOBLANKS = 1 shl 8;
    HTML_PARSE_NONET = 1 shl 11;
    HTML_PARSE_NOIMPLIED = 1 shl 13;
    HTML_PARSE_COMPACT = 1 shl 16;
    HTML_PARSE_IGNORE_ENC = 1 shl 21;
;

procedure htmlCtxtReset(ctxt:ThtmlParserCtxtPtr);cdecl;external;
function htmlCtxtUseOptions(ctxt:ThtmlParserCtxtPtr; options:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function htmlReadDoc(cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlReadFile(URL:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function htmlReadMemory(buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlReadFd(fd:longint; URL:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlReadIO(ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; encoding:Pchar; 
           options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCtxtReadDoc(ctxt:TxmlParserCtxtPtr; cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCtxtReadFile(ctxt:TxmlParserCtxtPtr; filename:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCtxtReadMemory(ctxt:TxmlParserCtxtPtr; buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; 
           options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCtxtReadFd(ctxt:TxmlParserCtxtPtr; fd:longint; URL:Pchar; encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCtxtReadIO(ctxt:TxmlParserCtxtPtr; ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; 
           encoding:Pchar; options:longint):ThtmlDocPtr;cdecl;external;
{ NRK/Jan2003: further knowledge of HTML structure
  }
{ something we don't check at all  }
{ VALID bit set so ( & HTML_VALID ) is TRUE  }
type
  PhtmlStatus = ^ThtmlStatus;
  ThtmlStatus =  Longint;
  Const
    HTML_NA = 0;
    HTML_INVALID = $1;
    HTML_DEPRECATED = $2;
    HTML_VALID = $4;
    HTML_REQUIRED = $c;
;
{ Using htmlElemDesc rather than name here, to emphasise the fact
   that otherwise there's a lookup overhead
 }
(* Const before type ignored *)
(* Const before type ignored *)

function htmlAttrAllowed(para1:PhtmlElemDesc; para2:PxmlChar; para3:longint):ThtmlStatus;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlElementAllowedHere(para1:PhtmlElemDesc; para2:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlElementStatusHere(para1:PhtmlElemDesc; para2:PhtmlElemDesc):ThtmlStatus;cdecl;external;
(* Const before type ignored *)
function htmlNodeStatus(para1:ThtmlNodePtr; para2:longint):ThtmlStatus;cdecl;external;
{*
 * htmlDefaultSubelement:
 * @elt: HTML element
 *
 * Returns the default subelement for this element
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htmlDefaultSubelement(elt : longint) : longint;

{*
 * htmlElementAllowedHereDesc:
 * @parent: HTML parent element
 * @elt: HTML element
 *
 * Checks whether an HTML element description may be a
 * direct child of the specified element.
 *
 * Returns 1 if allowed; 0 otherwise.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htmlElementAllowedHereDesc(parent,elt : longint) : longint;

{*
 * htmlRequiredAttrs:
 * @elt: HTML element
 *
 * Returns the attributes required for the specified element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htmlRequiredAttrs(elt : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_HTML_ENABLED  }
{$endif}
{ __HTML_PARSER_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htmlDefaultSubelement(elt : longint) : longint;
begin
  htmlDefaultSubelement:=elt^.defaultsubelt;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htmlElementAllowedHereDesc(parent,elt : longint) : longint;
begin
  htmlElementAllowedHereDesc:=htmlElementAllowedHere(parent,elt^.name);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htmlRequiredAttrs(elt : longint) : longint;
begin
  htmlRequiredAttrs:=elt^.attrs_req;
end;


end.
