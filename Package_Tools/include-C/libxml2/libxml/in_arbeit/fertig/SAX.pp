
unit SAX;
interface

{
  Automatically converted by H2Pas 1.0.0 from SAX.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SAX.h
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
PxmlSAXHandlerV1  = ^xmlSAXHandlerV1;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: Old SAX version 1 handler, deprecated
 * Description: DEPRECATED set of SAX version 1 interfaces used to
 *              build the DOM tree.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_SAX_H__}
{$define __XML_SAX_H__}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/parser.h>}
{$include <libxml/xlink.h>}
{$ifdef LIBXML_LEGACY_ENABLED}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)

function getPublicId(ctx:pointer):PxmlChar;cdecl;external;
(* Const before type ignored *)
function getSystemId(ctx:pointer):PxmlChar;cdecl;external;
procedure setDocumentLocator(ctx:pointer; loc:TxmlSAXLocatorPtr);cdecl;external;
function getLineNumber(ctx:pointer):longint;cdecl;external;
function getColumnNumber(ctx:pointer):longint;cdecl;external;
function isStandalone(ctx:pointer):longint;cdecl;external;
function hasInternalSubset(ctx:pointer):longint;cdecl;external;
function hasExternalSubset(ctx:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure internalSubset(ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure externalSubset(ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;external;
(* Const before type ignored *)
function getEntity(ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
function getParameterEntity(ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function resolveEntity(ctx:pointer; publicId:PxmlChar; systemId:PxmlChar):TxmlParserInputPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure entityDecl(ctx:pointer; name:PxmlChar; _type:longint; publicId:PxmlChar; systemId:PxmlChar; 
            content:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure attributeDecl(ctx:pointer; elem:PxmlChar; fullname:PxmlChar; _type:longint; def:longint; 
            defaultValue:PxmlChar; tree:TxmlEnumerationPtr);cdecl;external;
(* Const before type ignored *)
procedure elementDecl(ctx:pointer; name:PxmlChar; _type:longint; content:TxmlElementContentPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure notationDecl(ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure unparsedEntityDecl(ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar; notationName:PxmlChar);cdecl;external;
procedure startDocument(ctx:pointer);cdecl;external;
procedure endDocument(ctx:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure attribute(ctx:pointer; fullname:PxmlChar; value:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure startElement(ctx:pointer; fullname:PxmlChar; atts:PPxmlChar);cdecl;external;
(* Const before type ignored *)
procedure endElement(ctx:pointer; name:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure reference(ctx:pointer; name:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure characters(ctx:pointer; ch:PxmlChar; len:longint);cdecl;external;
(* Const before type ignored *)
procedure ignorableWhitespace(ctx:pointer; ch:PxmlChar; len:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure processingInstruction(ctx:pointer; target:PxmlChar; data:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure globalNamespace(ctx:pointer; href:PxmlChar; prefix:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure setNamespace(ctx:pointer; name:PxmlChar);cdecl;external;
function getNamespace(ctx:pointer):TxmlNsPtr;cdecl;external;
function checkNamespace(ctx:pointer; nameSpace:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure namespaceDecl(ctx:pointer; href:PxmlChar; prefix:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure comment(ctx:pointer; value:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure cdataBlock(ctx:pointer; value:PxmlChar; len:longint);cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
procedure initxmlDefaultSAXHandler(hdlr:PxmlSAXHandlerV1; warning:longint);cdecl;external;
{$ifdef LIBXML_HTML_ENABLED}
procedure inithtmlDefaultSAXHandler(hdlr:PxmlSAXHandlerV1);cdecl;external;
{$endif}
{$ifdef LIBXML_DOCB_ENABLED}

procedure initdocbDefaultSAXHandler(hdlr:PxmlSAXHandlerV1);cdecl;external;
{$endif}
{$endif}
{ LIBXML_SAX1_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_LEGACY_ENABLED  }
{$endif}
{ __XML_SAX_H__  }

implementation


end.
