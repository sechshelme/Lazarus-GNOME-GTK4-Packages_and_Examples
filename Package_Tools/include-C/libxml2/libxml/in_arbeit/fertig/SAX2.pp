
unit SAX2;
interface

{
  Automatically converted by H2Pas 1.0.0 from SAX2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SAX2.h
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
PxmlSAXHandler  = ^xmlSAXHandler;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: SAX2 parser interface used to build the DOM tree
 * Description: those are the default SAX2 interfaces used by
 *              the library when building DOM tree.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_SAX2_H__}
{$define __XML_SAX2_H__}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/parser.h>}
{$include <libxml/xlink.h>}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)

function xmlSAX2GetPublicId(ctx:pointer):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlSAX2GetSystemId(ctx:pointer):PxmlChar;cdecl;external;
procedure xmlSAX2SetDocumentLocator(ctx:pointer; loc:TxmlSAXLocatorPtr);cdecl;external;
function xmlSAX2GetLineNumber(ctx:pointer):longint;cdecl;external;
function xmlSAX2GetColumnNumber(ctx:pointer):longint;cdecl;external;
function xmlSAX2IsStandalone(ctx:pointer):longint;cdecl;external;
function xmlSAX2HasInternalSubset(ctx:pointer):longint;cdecl;external;
function xmlSAX2HasExternalSubset(ctx:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2InternalSubset(ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2ExternalSubset(ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;external;
(* Const before type ignored *)
function xmlSAX2GetEntity(ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
function xmlSAX2GetParameterEntity(ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSAX2ResolveEntity(ctx:pointer; publicId:PxmlChar; systemId:PxmlChar):TxmlParserInputPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2EntityDecl(ctx:pointer; name:PxmlChar; _type:longint; publicId:PxmlChar; systemId:PxmlChar; 
            content:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2AttributeDecl(ctx:pointer; elem:PxmlChar; fullname:PxmlChar; _type:longint; def:longint; 
            defaultValue:PxmlChar; tree:TxmlEnumerationPtr);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2ElementDecl(ctx:pointer; name:PxmlChar; _type:longint; content:TxmlElementContentPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2NotationDecl(ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2UnparsedEntityDecl(ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar; notationName:PxmlChar);cdecl;external;
procedure xmlSAX2StartDocument(ctx:pointer);cdecl;external;
procedure xmlSAX2EndDocument(ctx:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2StartElement(ctx:pointer; fullname:PxmlChar; atts:PPxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2EndElement(ctx:pointer; name:PxmlChar);cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED or LIBXML_HTML_ENABLED or LIBXML_LEGACY_ENABLED  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure xmlSAX2StartElementNs(ctx:pointer; localname:PxmlChar; prefix:PxmlChar; URI:PxmlChar; nb_namespaces:longint; 
            namespaces:PPxmlChar; nb_attributes:longint; nb_defaulted:longint; attributes:PPxmlChar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2EndElementNs(ctx:pointer; localname:PxmlChar; prefix:PxmlChar; URI:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2Reference(ctx:pointer; name:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2Characters(ctx:pointer; ch:PxmlChar; len:longint);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2IgnorableWhitespace(ctx:pointer; ch:PxmlChar; len:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSAX2ProcessingInstruction(ctx:pointer; target:PxmlChar; data:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2Comment(ctx:pointer; value:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlSAX2CDataBlock(ctx:pointer; value:PxmlChar; len:longint);cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
function xmlSAXDefaultVersion(version:longint):longint;cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }

function xmlSAXVersion(hdlr:PxmlSAXHandler; version:longint):longint;cdecl;external;
procedure xmlSAX2InitDefaultSAXHandler(hdlr:PxmlSAXHandler; warning:longint);cdecl;external;
{$ifdef LIBXML_HTML_ENABLED}
procedure xmlSAX2InitHtmlDefaultSAXHandler(hdlr:PxmlSAXHandler);cdecl;external;
procedure htmlDefaultSAXHandlerInit;cdecl;external;
{$endif}
{$ifdef LIBXML_DOCB_ENABLED}

procedure xmlSAX2InitDocbDefaultSAXHandler(hdlr:PxmlSAXHandler);cdecl;external;
procedure docbDefaultSAXHandlerInit;cdecl;external;
{$endif}

procedure xmlDefaultSAXHandlerInit;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_SAX2_H__  }

implementation


end.
