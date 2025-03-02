
unit xmlreader;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlreader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlreader.h
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
PxmlChar  = ^xmlChar;
PxmlParserProperties  = ^xmlParserProperties;
PxmlParserSeverities  = ^xmlParserSeverities;
PxmlReaderTypes  = ^xmlReaderTypes;
PxmlTextReader  = ^xmlTextReader;
PxmlTextReaderErrorFunc  = ^xmlTextReaderErrorFunc;
PxmlTextReaderLocatorPtr  = ^xmlTextReaderLocatorPtr;
PxmlTextReaderMode  = ^xmlTextReaderMode;
PxmlTextReaderPtr  = ^xmlTextReaderPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: the XMLReader implementation
 * Description: API of the XML streaming API based on C# interfaces.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_XMLREADER_H__}
{$define __XML_XMLREADER_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$include <libxml/xmlIO.h>}
{$ifdef LIBXML_SCHEMAS_ENABLED}
{$include <libxml/relaxng.h>}
{$include <libxml/xmlschemas.h>}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * xmlParserSeverities:
 *
 * How severe an error callback is when the per-reader error callback API
 * is used.
  }
type
  PxmlParserSeverities = ^TxmlParserSeverities;
  TxmlParserSeverities =  Longint;
  Const
    XML_PARSER_SEVERITY_VALIDITY_WARNING = 1;
    XML_PARSER_SEVERITY_VALIDITY_ERROR = 2;
    XML_PARSER_SEVERITY_WARNING = 3;
    XML_PARSER_SEVERITY_ERROR = 4;
;
{$ifdef LIBXML_READER_ENABLED}
{*
 * xmlTextReaderMode:
 *
 * Internal state values for the reader.
  }
type
  PxmlTextReaderMode = ^TxmlTextReaderMode;
  TxmlTextReaderMode =  Longint;
  Const
    XML_TEXTREADER_MODE_INITIAL = 0;
    XML_TEXTREADER_MODE_INTERACTIVE = 1;
    XML_TEXTREADER_MODE_ERROR = 2;
    XML_TEXTREADER_MODE_EOF = 3;
    XML_TEXTREADER_MODE_CLOSED = 4;
    XML_TEXTREADER_MODE_READING = 5;
;
{*
 * xmlParserProperties:
 *
 * Some common options to use with xmlTextReaderSetParserProp, but it
 * is better to use xmlParserOption and the xmlReaderNewxxx and
 * xmlReaderForxxx APIs now.
  }
type
  PxmlParserProperties = ^TxmlParserProperties;
  TxmlParserProperties =  Longint;
  Const
    XML_PARSER_LOADDTD = 1;
    XML_PARSER_DEFAULTATTRS = 2;
    XML_PARSER_VALIDATE = 3;
    XML_PARSER_SUBST_ENTITIES = 4;
;
{*
 * xmlReaderTypes:
 *
 * Predefined constants for the different types of nodes.
  }
type
  PxmlReaderTypes = ^TxmlReaderTypes;
  TxmlReaderTypes =  Longint;
  Const
    XML_READER_TYPE_NONE = 0;
    XML_READER_TYPE_ELEMENT = 1;
    XML_READER_TYPE_ATTRIBUTE = 2;
    XML_READER_TYPE_TEXT = 3;
    XML_READER_TYPE_CDATA = 4;
    XML_READER_TYPE_ENTITY_REFERENCE = 5;
    XML_READER_TYPE_ENTITY = 6;
    XML_READER_TYPE_PROCESSING_INSTRUCTION = 7;
    XML_READER_TYPE_COMMENT = 8;
    XML_READER_TYPE_DOCUMENT = 9;
    XML_READER_TYPE_DOCUMENT_TYPE = 10;
    XML_READER_TYPE_DOCUMENT_FRAGMENT = 11;
    XML_READER_TYPE_NOTATION = 12;
    XML_READER_TYPE_WHITESPACE = 13;
    XML_READER_TYPE_SIGNIFICANT_WHITESPACE = 14;
    XML_READER_TYPE_END_ELEMENT = 15;
    XML_READER_TYPE_END_ENTITY = 16;
    XML_READER_TYPE_XML_DECLARATION = 17;
;
{*
 * xmlTextReader:
 *
 * Structure for an xmlReader context.
  }
type
{*
 * xmlTextReaderPtr:
 *
 * Pointer to an xmlReader context.
  }

  PxmlTextReaderPtr = ^TxmlTextReaderPtr;
  TxmlTextReaderPtr = PxmlTextReader;
{
 * Constructors & Destructor
  }
(* Const before type ignored *)

function xmlNewTextReader(input:TxmlParserInputBufferPtr; URI:Pchar):TxmlTextReaderPtr;cdecl;external;
(* Const before type ignored *)
function xmlNewTextReaderFilename(URI:Pchar):TxmlTextReaderPtr;cdecl;external;
procedure xmlFreeTextReader(reader:TxmlTextReaderPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextReaderSetup(reader:TxmlTextReaderPtr; input:TxmlParserInputBufferPtr; URL:Pchar; encoding:Pchar; options:longint):longint;cdecl;external;
{
 * Iterators
  }
function xmlTextReaderRead(reader:TxmlTextReaderPtr):longint;cdecl;external;
{$ifdef LIBXML_WRITER_ENABLED}
function xmlTextReaderReadInnerXml(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderReadOuterXml(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
{$endif}

function xmlTextReaderReadString(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderReadAttributeValue(reader:TxmlTextReaderPtr):longint;cdecl;external;
{
 * Attributes of the node
  }
function xmlTextReaderAttributeCount(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderDepth(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderHasAttributes(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderHasValue(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderIsDefault(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderIsEmptyElement(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderNodeType(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderQuoteChar(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderReadState(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderIsNamespaceDecl(reader:TxmlTextReaderPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstBaseUri(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstLocalName(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstName(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstNamespaceUri(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstPrefix(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstXmlLang(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextReaderConstString(reader:TxmlTextReaderPtr; str:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstValue(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
{
 * use the Const version of the routine for
 * better performance and simpler code
  }
function xmlTextReaderBaseUri(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderLocalName(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderName(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderNamespaceUri(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderPrefix(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderXmlLang(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderValue(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
{
 * Methods of the XmlTextReader
  }
function xmlTextReaderClose(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderGetAttributeNo(reader:TxmlTextReaderPtr; no:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderGetAttribute(reader:TxmlTextReaderPtr; name:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextReaderGetAttributeNs(reader:TxmlTextReaderPtr; localName:PxmlChar; namespaceURI:PxmlChar):PxmlChar;cdecl;external;
function xmlTextReaderGetRemainder(reader:TxmlTextReaderPtr):TxmlParserInputBufferPtr;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderLookupNamespace(reader:TxmlTextReaderPtr; prefix:PxmlChar):PxmlChar;cdecl;external;
function xmlTextReaderMoveToAttributeNo(reader:TxmlTextReaderPtr; no:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderMoveToAttribute(reader:TxmlTextReaderPtr; name:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextReaderMoveToAttributeNs(reader:TxmlTextReaderPtr; localName:PxmlChar; namespaceURI:PxmlChar):longint;cdecl;external;
function xmlTextReaderMoveToFirstAttribute(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderMoveToNextAttribute(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderMoveToElement(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderNormalization(reader:TxmlTextReaderPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderConstEncoding(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
{
 * Extensions
  }
function xmlTextReaderSetParserProp(reader:TxmlTextReaderPtr; prop:longint; value:longint):longint;cdecl;external;
function xmlTextReaderGetParserProp(reader:TxmlTextReaderPtr; prop:longint):longint;cdecl;external;
function xmlTextReaderCurrentNode(reader:TxmlTextReaderPtr):TxmlNodePtr;cdecl;external;
function xmlTextReaderGetParserLineNumber(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderGetParserColumnNumber(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderPreserve(reader:TxmlTextReaderPtr):TxmlNodePtr;cdecl;external;
{$ifdef LIBXML_PATTERN_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextReaderPreservePattern(reader:TxmlTextReaderPtr; pattern:PxmlChar; namespaces:PPxmlChar):longint;cdecl;external;
{$endif}
{ LIBXML_PATTERN_ENABLED  }

function xmlTextReaderCurrentDoc(reader:TxmlTextReaderPtr):TxmlDocPtr;cdecl;external;
function xmlTextReaderExpand(reader:TxmlTextReaderPtr):TxmlNodePtr;cdecl;external;
function xmlTextReaderNext(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderNextSibling(reader:TxmlTextReaderPtr):longint;cdecl;external;
function xmlTextReaderIsValid(reader:TxmlTextReaderPtr):longint;cdecl;external;
{$ifdef LIBXML_SCHEMAS_ENABLED}
(* Const before type ignored *)
function xmlTextReaderRelaxNGValidate(reader:TxmlTextReaderPtr; rng:Pchar):longint;cdecl;external;
function xmlTextReaderRelaxNGValidateCtxt(reader:TxmlTextReaderPtr; ctxt:TxmlRelaxNGValidCtxtPtr; options:longint):longint;cdecl;external;
function xmlTextReaderRelaxNGSetSchema(reader:TxmlTextReaderPtr; schema:TxmlRelaxNGPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextReaderSchemaValidate(reader:TxmlTextReaderPtr; xsd:Pchar):longint;cdecl;external;
function xmlTextReaderSchemaValidateCtxt(reader:TxmlTextReaderPtr; ctxt:TxmlSchemaValidCtxtPtr; options:longint):longint;cdecl;external;
function xmlTextReaderSetSchema(reader:TxmlTextReaderPtr; schema:TxmlSchemaPtr):longint;cdecl;external;
{$endif}
(* Const before type ignored *)

function xmlTextReaderConstXmlVersion(reader:TxmlTextReaderPtr):PxmlChar;cdecl;external;
function xmlTextReaderStandalone(reader:TxmlTextReaderPtr):longint;cdecl;external;
{
 * Index lookup
  }
function xmlTextReaderByteConsumed(reader:TxmlTextReaderPtr):longint;cdecl;external;
{
 * New more complete APIs for simpler creation and reuse of readers
  }
function xmlReaderWalker(doc:TxmlDocPtr):TxmlTextReaderPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderForDoc(cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):TxmlTextReaderPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderForFile(filename:Pchar; encoding:Pchar; options:longint):TxmlTextReaderPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderForMemory(buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlTextReaderPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderForFd(fd:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlTextReaderPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderForIO(ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; encoding:Pchar; 
           options:longint):TxmlTextReaderPtr;cdecl;external;
function xmlReaderNewWalker(reader:TxmlTextReaderPtr; doc:TxmlDocPtr):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderNewDoc(reader:TxmlTextReaderPtr; cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderNewFile(reader:TxmlTextReaderPtr; filename:Pchar; encoding:Pchar; options:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderNewMemory(reader:TxmlTextReaderPtr; buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; 
           options:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderNewFd(reader:TxmlTextReaderPtr; fd:longint; URL:Pchar; encoding:Pchar; options:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReaderNewIO(reader:TxmlTextReaderPtr; ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; 
           encoding:Pchar; options:longint):longint;cdecl;external;
{
 * Error handling extensions
  }
type
  PxmlTextReaderLocatorPtr = ^TxmlTextReaderLocatorPtr;
  TxmlTextReaderLocatorPtr = pointer;
{*
 * xmlTextReaderErrorFunc:
 * @arg: the user argument
 * @msg: the message
 * @severity: the severity of the error
 * @locator: a locator indicating where the error occurred
 *
 * Signature of an error callback from a reader parser
  }
(* Const before type ignored *)

  TxmlTextReaderErrorFunc = procedure (arg:pointer; msg:Pchar; severity:TxmlParserSeverities; locator:TxmlTextReaderLocatorPtr);cdecl;

function xmlTextReaderLocatorLineNumber(locator:TxmlTextReaderLocatorPtr):longint;cdecl;external;
function xmlTextReaderLocatorBaseURI(locator:TxmlTextReaderLocatorPtr):PxmlChar;cdecl;external;
procedure xmlTextReaderSetErrorHandler(reader:TxmlTextReaderPtr; f:TxmlTextReaderErrorFunc; arg:pointer);cdecl;external;
procedure xmlTextReaderSetStructuredErrorHandler(reader:TxmlTextReaderPtr; f:TxmlStructuredErrorFunc; arg:pointer);cdecl;external;
procedure xmlTextReaderGetErrorHandler(reader:TxmlTextReaderPtr; f:PxmlTextReaderErrorFunc; arg:Ppointer);cdecl;external;
{$endif}
{ LIBXML_READER_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_XMLREADER_H__  }

implementation


end.
