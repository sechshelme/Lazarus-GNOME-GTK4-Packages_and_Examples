
unit DOCBparser;
interface

{
  Automatically converted by H2Pas 1.0.0 from DOCBparser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    DOCBparser.h
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
PdocbDocPtr  = ^docbDocPtr;
PdocbParserCtxt  = ^docbParserCtxt;
PdocbParserCtxtPtr  = ^docbParserCtxtPtr;
PdocbParserInput  = ^docbParserInput;
PdocbParserInputPtr  = ^docbParserInputPtr;
PdocbSAXHandler  = ^docbSAXHandler;
PdocbSAXHandlerPtr  = ^docbSAXHandlerPtr;
Plongint  = ^longint;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: old DocBook SGML parser
 * Description: interface for a DocBook SGML non-verifying parser
 * This code is DEPRECATED, and should not be used anymore.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __DOCB_PARSER_H__}
{$define __DOCB_PARSER_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_DOCB_ENABLED}
{$include <libxml/parser.h>}
{$include <libxml/parserInternals.h>}
{ C++ extern C conditionnal removed }
{
 * Most of the back-end structures from XML and SGML are shared.
  }
type
  PdocbParserCtxt = ^TdocbParserCtxt;
  TdocbParserCtxt = TxmlParserCtxt;

  PdocbParserCtxtPtr = ^TdocbParserCtxtPtr;
  TdocbParserCtxtPtr = TxmlParserCtxtPtr;

  PdocbSAXHandler = ^TdocbSAXHandler;
  TdocbSAXHandler = TxmlSAXHandler;

  PdocbSAXHandlerPtr = ^TdocbSAXHandlerPtr;
  TdocbSAXHandlerPtr = TxmlSAXHandlerPtr;

  PdocbParserInput = ^TdocbParserInput;
  TdocbParserInput = TxmlParserInput;

  PdocbParserInputPtr = ^TdocbParserInputPtr;
  TdocbParserInputPtr = TxmlParserInputPtr;

  PdocbDocPtr = ^TdocbDocPtr;
  TdocbDocPtr = TxmlDocPtr;
{
 * There is only few public functions.
  }
(* Const before type ignored *)

function docbEncodeEntities(out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint; quoteChar:longint):longint;cdecl;external;
(* Const before type ignored *)
function docbSAXParseDoc(cur:PxmlChar; encoding:Pchar; sax:TdocbSAXHandlerPtr; userData:pointer):TdocbDocPtr;cdecl;external;
(* Const before type ignored *)
function docbParseDoc(cur:PxmlChar; encoding:Pchar):TdocbDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function docbSAXParseFile(filename:Pchar; encoding:Pchar; sax:TdocbSAXHandlerPtr; userData:pointer):TdocbDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function docbParseFile(filename:Pchar; encoding:Pchar):TdocbDocPtr;cdecl;external;
{*
 * Interfaces for the Push mode.
  }
procedure docbFreeParserCtxt(ctxt:TdocbParserCtxtPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function docbCreatePushParserCtxt(sax:TdocbSAXHandlerPtr; user_data:pointer; chunk:Pchar; size:longint; filename:Pchar; 
           enc:TxmlCharEncoding):TdocbParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function docbParseChunk(ctxt:TdocbParserCtxtPtr; chunk:Pchar; size:longint; terminate:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function docbCreateFileParserCtxt(filename:Pchar; encoding:Pchar):TdocbParserCtxtPtr;cdecl;external;
function docbParseDocument(ctxt:TdocbParserCtxtPtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_DOCB_ENABLED  }
{$endif}
{ __DOCB_PARSER_H__  }

implementation


end.
