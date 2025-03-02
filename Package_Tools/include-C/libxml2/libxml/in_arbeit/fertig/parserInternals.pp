
unit parserInternals;
interface

{
  Automatically converted by H2Pas 1.0.0 from parserInternals.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    parserInternals.h
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
Pchar  = ^char;
Plongint  = ^longint;
PxmlChar  = ^xmlChar;
PxmlElementContentPtr  = ^xmlElementContentPtr;
PxmlEnumerationPtr  = ^xmlEnumerationPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: internals routines and limits exported by the parser.
 * Description: this module exports a number of internal parsing routines
 *              they are not really all intended for applications but
 *              can prove useful doing low level processing.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_PARSER_INTERNALS_H__}
{$define __XML_PARSER_INTERNALS_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/parser.h>}
{$include <libxml/HTMLparser.h>}
{$include <libxml/chvalid.h>}
{ C++ extern C conditionnal removed }
{*
 * xmlParserMaxDepth:
 *
 * arbitrary depth limit for the XML documents that we allow to
 * process. This is not a limitation of the parser but a safety
 * boundary feature, use XML_PARSE_HUGE option to override it.
  }
  var
    xmlParserMaxDepth : dword;cvar;external;
{*
 * XML_MAX_TEXT_LENGTH:
 *
 * Maximum size allowed for a single text node when building a tree.
 * This is not a limitation of the parser but a safety boundary feature,
 * use XML_PARSE_HUGE option to override it.
 * Introduced in 2.9.0
  }

const
  XML_MAX_TEXT_LENGTH = 10000000;  
{*
 * XML_MAX_NAME_LENGTH:
 *
 * Maximum size allowed for a markup identifier.
 * This is not a limitation of the parser but a safety boundary feature,
 * use XML_PARSE_HUGE option to override it.
 * Note that with the use of parsing dictionaries overriding the limit
 * may result in more runtime memory usage in face of "unfriendly' content
 * Introduced in 2.9.0
  }
  XML_MAX_NAME_LENGTH = 50000;  
{*
 * XML_MAX_DICTIONARY_LIMIT:
 *
 * Maximum size allowed by the parser for a dictionary by default
 * This is not a limitation of the parser but a safety boundary feature,
 * use XML_PARSE_HUGE option to override it.
 * Introduced in 2.9.0
  }
  XML_MAX_DICTIONARY_LIMIT = 10000000;  
{*
 * XML_MAX_LOOKUP_LIMIT:
 *
 * Maximum size allowed by the parser for ahead lookup
 * This is an upper boundary enforced by the parser to avoid bad
 * behaviour on "unfriendly' content
 * Introduced in 2.9.0
  }
  XML_MAX_LOOKUP_LIMIT = 10000000;  
{*
 * XML_MAX_NAMELEN:
 *
 * Identifiers can be longer, but this will be more costly
 * at runtime.
  }
  XML_MAX_NAMELEN = 100;  
{*
 * INPUT_CHUNK:
 *
 * The parser tries to always have that amount of input ready.
 * One of the point is providing context when reporting errors.
  }
  INPUT_CHUNK = 250;  
{***********************************************************************
 *									*
 * UNICODE version of the macros.					*
 *									*
 *********************************************************************** }
{*
 * IS_BYTE_CHAR:
 * @c:  an byte value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 * [2] Char ::= #x9 | #xA | #xD | [#x20...]
 * any byte character in the accepted range
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IS_BYTE_CHAR(c : longint) : longint;

{*
 * IS_CHAR:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 * [2] Char ::= #x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD]
 *                  | [#x10000-#x10FFFF]
 * any Unicode character, excluding the surrogate blocks, FFFE, and FFFF.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_CHAR(c : longint) : longint;

{*
 * IS_CHAR_CH:
 * @c: an xmlChar (usually an unsigned char)
 *
 * Behaves like IS_CHAR on single-byte value
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_CHAR_CH(c : longint) : longint;

{*
 * IS_BLANK:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 * [3] S ::= (#x20 | #x9 | #xD | #xA)+
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BLANK(c : longint) : longint;

{*
 * IS_BLANK_CH:
 * @c:  an xmlChar value (normally unsigned char)
 *
 * Behaviour same as IS_BLANK
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BLANK_CH(c : longint) : longint;

{*
 * IS_BASECHAR:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 * [85] BaseChar ::= ... long list see REC ...
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BASECHAR(c : longint) : longint;

{*
 * IS_DIGIT:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 * [88] Digit ::= ... long list see REC ...
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_DIGIT(c : longint) : longint;

{*
 * IS_DIGIT_CH:
 * @c:  an xmlChar value (usually an unsigned char)
 *
 * Behaves like IS_DIGIT but with a single byte argument
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_DIGIT_CH(c : longint) : longint;

{*
 * IS_COMBINING:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 * [87] CombiningChar ::= ... long list see REC ...
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_COMBINING(c : longint) : longint;

{*
 * IS_COMBINING_CH:
 * @c:  an xmlChar (usually an unsigned char)
 *
 * Always false (all combining chars > 0xff)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_COMBINING_CH(c : longint) : longint;

{*
 * IS_EXTENDER:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 *
 * [89] Extender ::= #x00B7 | #x02D0 | #x02D1 | #x0387 | #x0640 |
 *                   #x0E46 | #x0EC6 | #x3005 | [#x3031-#x3035] |
 *                   [#x309D-#x309E] | [#x30FC-#x30FE]
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_EXTENDER(c : longint) : longint;

{*
 * IS_EXTENDER_CH:
 * @c:  an xmlChar value (usually an unsigned char)
 *
 * Behaves like IS_EXTENDER but with a single-byte argument
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_EXTENDER_CH(c : longint) : longint;

{*
 * IS_IDEOGRAPHIC:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 *
 * [86] Ideographic ::= [#x4E00-#x9FA5] | #x3007 | [#x3021-#x3029]
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_IDEOGRAPHIC(c : longint) : longint;

{*
 * IS_LETTER:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 *
 * [84] Letter ::= BaseChar | Ideographic
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_LETTER(c : longint) : longint;

{*
 * IS_LETTER_CH:
 * @c:  an xmlChar value (normally unsigned char)
 *
 * Macro behaves like IS_LETTER, but only check base chars
 *
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_LETTER_CH(c : longint) : longint;

{*
 * IS_ASCII_LETTER:
 * @c: an xmlChar value
 *
 * Macro to check [a-zA-Z]
 *
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_ASCII_LETTER(c : longint) : longint;

{*
 * IS_ASCII_DIGIT:
 * @c: an xmlChar value
 *
 * Macro to check [0-9]
 *
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_ASCII_DIGIT(c : longint) : longint;

{*
 * IS_PUBIDCHAR:
 * @c:  an UNICODE value (int)
 *
 * Macro to check the following production in the XML spec:
 *
 *
 * [13] PubidChar ::= #x20 | #xD | #xA | [a-zA-Z0-9] | [-'()+,./:=?;!*#@$_%]
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_PUBIDCHAR(c : longint) : longint;

{*
 * IS_PUBIDCHAR_CH:
 * @c:  an xmlChar value (normally unsigned char)
 *
 * Same as IS_PUBIDCHAR but for single-byte value
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_PUBIDCHAR_CH(c : longint) : longint;

{*
 * SKIP_EOL:
 * @p:  and UTF8 string pointer
 *
 * Skips the end of line chars.
  }
{#define SKIP_EOL(p)							\ }
{    if (*(p) == 0x13)  p++ ; if (*(p) == 0x10) p++; 			\ }
{    if (*(p) == 0x10)  p++ ; if (*(p) == 0x13) p++;  }
{*
 * MOVETO_ENDTAG:
 * @p:  and UTF8 string pointer
 *
 * Skips to the next '>' char.
  }
{#define MOVETO_ENDTAG(p)						\ }
{    while ((*p) && (*(p) != '>')) (p)++ }
{*
 * MOVETO_STARTTAG:
 * @p:  and UTF8 string pointer
 *
 * Skips to the next '<' char.
  }
{#define MOVETO_STARTTAG(p)						\ }
{    while ((*p) && (*(p) != '<')) (p)++ }
{*
 * Global variables used for predefined strings.
  }
(* Const before type ignored *)
  var
    xmlStringText : PxmlChar;cvar;external;
(* Const before type ignored *)
    xmlStringTextNoenc : PxmlChar;cvar;external;
(* Const before type ignored *)
    xmlStringComment : PxmlChar;cvar;external;
{
 * Function to finish the work of the macros where needed.
  }

function xmlIsLetter(c:longint):longint;cdecl;external;
{*
 * Parser context.
  }
(* Const before type ignored *)
function xmlCreateFileParserCtxt(filename:Pchar):TxmlParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlCreateURLParserCtxt(filename:Pchar; options:longint):TxmlParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlCreateMemoryParserCtxt(buffer:Pchar; size:longint):TxmlParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCreateEntityParserCtxt(URL:PxmlChar; ID:PxmlChar; base:PxmlChar):TxmlParserCtxtPtr;cdecl;external;
function xmlSwitchEncoding(ctxt:TxmlParserCtxtPtr; enc:TxmlCharEncoding):longint;cdecl;external;
function xmlSwitchToEncoding(ctxt:TxmlParserCtxtPtr; handler:TxmlCharEncodingHandlerPtr):longint;cdecl;external;
function xmlSwitchInputEncoding(ctxt:TxmlParserCtxtPtr; input:TxmlParserInputPtr; handler:TxmlCharEncodingHandlerPtr):longint;cdecl;external;
{$ifdef IN_LIBXML}
{ internal error reporting  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure __xmlErrEncoding(ctxt:TxmlParserCtxtPtr; xmlerr:TxmlParserErrors; msg:Pchar; str1:PxmlChar; str2:PxmlChar);cdecl;external;
{$endif}
{*
 * Input Streams.
  }
(* Const before type ignored *)

function xmlNewStringInputStream(ctxt:TxmlParserCtxtPtr; buffer:PxmlChar):TxmlParserInputPtr;cdecl;external;
function xmlNewEntityInputStream(ctxt:TxmlParserCtxtPtr; entity:TxmlEntityPtr):TxmlParserInputPtr;cdecl;external;
function xmlPushInput(ctxt:TxmlParserCtxtPtr; input:TxmlParserInputPtr):longint;cdecl;external;
function xmlPopInput(ctxt:TxmlParserCtxtPtr):TxmlChar;cdecl;external;
procedure xmlFreeInputStream(input:TxmlParserInputPtr);cdecl;external;
(* Const before type ignored *)
function xmlNewInputFromFile(ctxt:TxmlParserCtxtPtr; filename:Pchar):TxmlParserInputPtr;cdecl;external;
function xmlNewInputStream(ctxt:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;external;
{*
 * Namespaces.
  }
(* Const before type ignored *)
function xmlSplitQName(ctxt:TxmlParserCtxtPtr; name:PxmlChar; prefix:PPxmlChar):PxmlChar;cdecl;external;
{*
 * Generic production rules.
  }
(* Const before type ignored *)
function xmlParseName(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParseNmtoken(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParseEntityValue(ctxt:TxmlParserCtxtPtr; orig:PPxmlChar):PxmlChar;cdecl;external;
function xmlParseAttValue(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParseSystemLiteral(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParsePubidLiteral(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
procedure xmlParseCharData(ctxt:TxmlParserCtxtPtr; cdata:longint);cdecl;external;
function xmlParseExternalID(ctxt:TxmlParserCtxtPtr; publicID:PPxmlChar; strict:longint):PxmlChar;cdecl;external;
procedure xmlParseComment(ctxt:TxmlParserCtxtPtr);cdecl;external;
(* Const before type ignored *)
function xmlParsePITarget(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
procedure xmlParsePI(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseNotationDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseEntityDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlParseDefaultDecl(ctxt:TxmlParserCtxtPtr; value:PPxmlChar):longint;cdecl;external;
function xmlParseNotationType(ctxt:TxmlParserCtxtPtr):TxmlEnumerationPtr;cdecl;external;
function xmlParseEnumerationType(ctxt:TxmlParserCtxtPtr):TxmlEnumerationPtr;cdecl;external;
function xmlParseEnumeratedType(ctxt:TxmlParserCtxtPtr; tree:PxmlEnumerationPtr):longint;cdecl;external;
function xmlParseAttributeType(ctxt:TxmlParserCtxtPtr; tree:PxmlEnumerationPtr):longint;cdecl;external;
procedure xmlParseAttributeListDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlParseElementMixedContentDecl(ctxt:TxmlParserCtxtPtr; inputchk:longint):TxmlElementContentPtr;cdecl;external;
function xmlParseElementChildrenContentDecl(ctxt:TxmlParserCtxtPtr; inputchk:longint):TxmlElementContentPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseElementContentDecl(ctxt:TxmlParserCtxtPtr; name:PxmlChar; result:PxmlElementContentPtr):longint;cdecl;external;
function xmlParseElementDecl(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
procedure xmlParseMarkupDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlParseCharRef(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
function xmlParseEntityRef(ctxt:TxmlParserCtxtPtr):TxmlEntityPtr;cdecl;external;
procedure xmlParseReference(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParsePEReference(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseDocTypeDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
(* Const before type ignored *)
function xmlParseAttribute(ctxt:TxmlParserCtxtPtr; value:PPxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlParseStartTag(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
procedure xmlParseEndTag(ctxt:TxmlParserCtxtPtr);cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }

procedure xmlParseCDSect(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseContent(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseElement(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlParseVersionNum(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParseVersionInfo(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParseEncName(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlParseEncodingDecl(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlParseSDDecl(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
procedure xmlParseXMLDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseTextDecl(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParseMisc(ctxt:TxmlParserCtxtPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlParseExternalSubset(ctxt:TxmlParserCtxtPtr; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;external;
{*
 * XML_SUBSTITUTE_NONE:
 *
 * If no entities need to be substituted.
  }
const
  XML_SUBSTITUTE_NONE = 0;  
{*
 * XML_SUBSTITUTE_REF:
 *
 * Whether general entities need to be substituted.
  }
  XML_SUBSTITUTE_REF = 1;  
{*
 * XML_SUBSTITUTE_PEREF:
 *
 * Whether parameter entities need to be substituted.
  }
  XML_SUBSTITUTE_PEREF = 2;  
{*
 * XML_SUBSTITUTE_BOTH:
 *
 * Both general and parameter entities need to be substituted.
  }
  XML_SUBSTITUTE_BOTH = 3;  
(* Const before type ignored *)

function xmlStringDecodeEntities(ctxt:TxmlParserCtxtPtr; str:PxmlChar; what:longint; end:TxmlChar; end2:TxmlChar; 
           end3:TxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlStringLenDecodeEntities(ctxt:TxmlParserCtxtPtr; str:PxmlChar; len:longint; what:longint; end:TxmlChar; 
           end2:TxmlChar; end3:TxmlChar):PxmlChar;cdecl;external;
{
 * Generated by MACROS on top of parser.c c.f. PUSH_AND_POP.
  }
function nodePush(ctxt:TxmlParserCtxtPtr; value:TxmlNodePtr):longint;cdecl;external;
function nodePop(ctxt:TxmlParserCtxtPtr):TxmlNodePtr;cdecl;external;
function inputPush(ctxt:TxmlParserCtxtPtr; value:TxmlParserInputPtr):longint;cdecl;external;
function inputPop(ctxt:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;external;
(* Const before type ignored *)
function namePop(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function namePush(ctxt:TxmlParserCtxtPtr; value:PxmlChar):longint;cdecl;external;
{
 * other commodities shared between parser.c and parserInternals.
  }
function xmlSkipBlankChars(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlStringCurrentChar(ctxt:TxmlParserCtxtPtr; cur:PxmlChar; len:Plongint):longint;cdecl;external;
procedure xmlParserHandlePEReference(ctxt:TxmlParserCtxtPtr);cdecl;external;
(* Const before type ignored *)
function xmlCheckLanguageID(lang:PxmlChar):longint;cdecl;external;
{
 * Really core function shared with HTML parser.
  }
function xmlCurrentChar(ctxt:TxmlParserCtxtPtr; len:Plongint):longint;cdecl;external;
function xmlCopyCharMultiByte(out:PxmlChar; val:longint):longint;cdecl;external;
function xmlCopyChar(len:longint; out:PxmlChar; val:longint):longint;cdecl;external;
procedure xmlNextChar(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlParserInputShrink(in:TxmlParserInputPtr);cdecl;external;
{$ifdef LIBXML_HTML_ENABLED}
{
 * Actually comes from the HTML parser but launched from the init stuff.
  }
procedure htmlInitAutoClose;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlCreateFileParserCtxt(filename:Pchar; encoding:Pchar):ThtmlParserCtxtPtr;cdecl;external;
{$endif}
{
 * Specific function to keep track of entities references
 * and used by the XSLT debugger.
  }
{$ifdef LIBXML_LEGACY_ENABLED}
{*
 * xmlEntityReferenceFunc:
 * @ent: the entity
 * @firstNode:  the fist node in the chunk
 * @lastNode:  the last nod in the chunk
 *
 * Callback function used when one needs to be able to track back the
 * provenance of a chunk of nodes inherited from an entity replacement.
  }
type

  TxmlEntityReferenceFunc = procedure (ent:TxmlEntityPtr; firstNode:TxmlNodePtr; lastNode:TxmlNodePtr);cdecl;

procedure xmlSetEntityReferenceFunc(func:TxmlEntityReferenceFunc);cdecl;external;
function xmlParseQuotedString(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
procedure xmlParseNamespace(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlNamespaceParseNSDef(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlScanName(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
function xmlNamespaceParseNCName(ctxt:TxmlParserCtxtPtr):PxmlChar;cdecl;external;
procedure xmlParserHandleReference(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlNamespaceParseQName(ctxt:TxmlParserCtxtPtr; prefix:PPxmlChar):PxmlChar;cdecl;external;
{*
 * Entities
  }
function xmlDecodeEntities(ctxt:TxmlParserCtxtPtr; len:longint; what:longint; end:TxmlChar; end2:TxmlChar; 
           end3:TxmlChar):PxmlChar;cdecl;external;
procedure xmlHandleEntity(ctxt:TxmlParserCtxtPtr; entity:TxmlEntityPtr);cdecl;external;
{$endif}
{ LIBXML_LEGACY_ENABLED  }
{$ifdef IN_LIBXML}
{
 * internal only
  }
(* Const before type ignored *)

procedure xmlErrMemory(ctxt:TxmlParserCtxtPtr; extra:Pchar);cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_PARSER_INTERNALS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BYTE_CHAR(c : longint) : longint;
begin
  IS_BYTE_CHAR:=xmlIsChar_ch(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_CHAR(c : longint) : longint;
begin
  IS_CHAR:=xmlIsCharQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_CHAR_CH(c : longint) : longint;
begin
  IS_CHAR_CH:=xmlIsChar_ch(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BLANK(c : longint) : longint;
begin
  IS_BLANK:=xmlIsBlankQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BLANK_CH(c : longint) : longint;
begin
  IS_BLANK_CH:=xmlIsBlank_ch(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_BASECHAR(c : longint) : longint;
begin
  IS_BASECHAR:=xmlIsBaseCharQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_DIGIT(c : longint) : longint;
begin
  IS_DIGIT:=xmlIsDigitQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_DIGIT_CH(c : longint) : longint;
begin
  IS_DIGIT_CH:=xmlIsDigit_ch(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_COMBINING(c : longint) : longint;
begin
  IS_COMBINING:=xmlIsCombiningQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_COMBINING_CH(c : longint) : longint;
begin
  IS_COMBINING_CH:=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_EXTENDER(c : longint) : longint;
begin
  IS_EXTENDER:=xmlIsExtenderQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_EXTENDER_CH(c : longint) : longint;
begin
  IS_EXTENDER_CH:=xmlIsExtender_ch(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_IDEOGRAPHIC(c : longint) : longint;
begin
  IS_IDEOGRAPHIC:=xmlIsIdeographicQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_LETTER(c : longint) : longint;
begin
  IS_LETTER:=(IS_BASECHAR(c)) or (IS_IDEOGRAPHIC(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_LETTER_CH(c : longint) : longint;
begin
  IS_LETTER_CH:=xmlIsBaseChar_ch(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_ASCII_LETTER(c : longint) : longint;
begin
  IS_ASCII_LETTER:=(($41<=c) and (@(c<=$5a))) or (($61<=c) and (@(c<=$7a)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_ASCII_DIGIT(c : longint) : longint;
begin
  IS_ASCII_DIGIT:=($30<=c) and (@(c<=$39));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_PUBIDCHAR(c : longint) : longint;
begin
  IS_PUBIDCHAR:=xmlIsPubidCharQ(c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_PUBIDCHAR_CH(c : longint) : longint;
begin
  IS_PUBIDCHAR_CH:=xmlIsPubidChar_ch(c);
end;


end.
