unit xmlreader;

interface

uses
  ctypes, xml2_common, xmlstring, xmlschemas, xmlIO, xmlerror, tree, relaxng;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlParserSeverities = ^TxmlParserSeverities;
  TxmlParserSeverities = longint;

const
  XML_PARSER_SEVERITY_VALIDITY_WARNING = 1;
  XML_PARSER_SEVERITY_VALIDITY_ERROR = 2;
  XML_PARSER_SEVERITY_WARNING = 3;
  XML_PARSER_SEVERITY_ERROR = 4;

type
  PxmlTextReaderMode = ^TxmlTextReaderMode;
  TxmlTextReaderMode = longint;

const
  XML_TEXTREADER_MODE_INITIAL = 0;
  XML_TEXTREADER_MODE_INTERACTIVE = 1;
  XML_TEXTREADER_MODE_ERROR = 2;
  XML_TEXTREADER_MODE_EOF = 3;
  XML_TEXTREADER_MODE_CLOSED = 4;
  XML_TEXTREADER_MODE_READING = 5;

type
  PxmlParserProperties = ^TxmlParserProperties;
  TxmlParserProperties = longint;

const
  XML_PARSER_LOADDTD = 1;
  XML_PARSER_DEFAULTATTRS = 2;
  XML_PARSER_VALIDATE = 3;
  XML_PARSER_SUBST_ENTITIES = 4;

type
  PxmlReaderTypes = ^TxmlReaderTypes;
  TxmlReaderTypes = longint;

const
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

type
  TxmlTextReader = record
  end;
  PxmlTextReader = ^TxmlTextReader;

  PxmlTextReaderPtr = ^TxmlTextReaderPtr;
  TxmlTextReaderPtr = PxmlTextReader;

function xmlNewTextReader(input: TxmlParserInputBufferPtr; URI: pchar): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlNewTextReaderFilename(URI: pchar): TxmlTextReaderPtr; cdecl; external libxml2;
procedure xmlFreeTextReader(reader: TxmlTextReaderPtr); cdecl; external libxml2;
function xmlTextReaderSetup(reader: TxmlTextReaderPtr; input: TxmlParserInputBufferPtr; URL: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlTextReaderRead(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderReadInnerXml(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderReadOuterXml(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;

function xmlTextReaderReadString(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderReadAttributeValue(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderAttributeCount(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderDepth(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderHasAttributes(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderHasValue(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderIsDefault(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderIsEmptyElement(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderNodeType(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderQuoteChar(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderReadState(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderIsNamespaceDecl(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderConstBaseUri(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstLocalName(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstName(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstNamespaceUri(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstPrefix(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstXmlLang(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstString(reader: TxmlTextReaderPtr; str: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstValue(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderBaseUri(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderLocalName(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderName(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderNamespaceUri(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderPrefix(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderXmlLang(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderValue(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderClose(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderGetAttributeNo(reader: TxmlTextReaderPtr; no: longint): PxmlChar; cdecl; external libxml2;
function xmlTextReaderGetAttribute(reader: TxmlTextReaderPtr; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderGetAttributeNs(reader: TxmlTextReaderPtr; localName: PxmlChar; namespaceURI: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderGetRemainder(reader: TxmlTextReaderPtr): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlTextReaderLookupNamespace(reader: TxmlTextReaderPtr; prefix: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderMoveToAttributeNo(reader: TxmlTextReaderPtr; no: longint): longint; cdecl; external libxml2;
function xmlTextReaderMoveToAttribute(reader: TxmlTextReaderPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextReaderMoveToAttributeNs(reader: TxmlTextReaderPtr; localName: PxmlChar; namespaceURI: PxmlChar): longint; cdecl; external libxml2;
function xmlTextReaderMoveToFirstAttribute(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderMoveToNextAttribute(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderMoveToElement(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderNormalization(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderConstEncoding(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderSetParserProp(reader: TxmlTextReaderPtr; prop: longint; Value: longint): longint; cdecl; external libxml2;
function xmlTextReaderGetParserProp(reader: TxmlTextReaderPtr; prop: longint): longint; cdecl; external libxml2;
function xmlTextReaderCurrentNode(reader: TxmlTextReaderPtr): TxmlNodePtr; cdecl; external libxml2;
function xmlTextReaderGetParserLineNumber(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderGetParserColumnNumber(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderPreserve(reader: TxmlTextReaderPtr): TxmlNodePtr; cdecl; external libxml2;
function xmlTextReaderPreservePattern(reader: TxmlTextReaderPtr; pattern: PxmlChar; namespaces: PPxmlChar): longint; cdecl; external libxml2;
function xmlTextReaderCurrentDoc(reader: TxmlTextReaderPtr): TxmlDocPtr; cdecl; external libxml2;
function xmlTextReaderExpand(reader: TxmlTextReaderPtr): TxmlNodePtr; cdecl; external libxml2;
function xmlTextReaderNext(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderNextSibling(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderIsValid(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderRelaxNGValidate(reader: TxmlTextReaderPtr; rng: pchar): longint; cdecl; external libxml2;
function xmlTextReaderRelaxNGValidateCtxt(reader: TxmlTextReaderPtr; ctxt: TxmlRelaxNGValidCtxtPtr; options: longint): longint; cdecl; external libxml2;
function xmlTextReaderRelaxNGSetSchema(reader: TxmlTextReaderPtr; schema: TxmlRelaxNGPtr): longint; cdecl; external libxml2;
function xmlTextReaderSchemaValidate(reader: TxmlTextReaderPtr; xsd: pchar): longint; cdecl; external libxml2;
function xmlTextReaderSchemaValidateCtxt(reader: TxmlTextReaderPtr; ctxt: TxmlSchemaValidCtxtPtr; options: longint): longint; cdecl; external libxml2;
function xmlTextReaderSetSchema(reader: TxmlTextReaderPtr; schema: TxmlSchemaPtr): longint; cdecl; external libxml2;

function xmlTextReaderConstXmlVersion(reader: TxmlTextReaderPtr): PxmlChar; cdecl; external libxml2;
function xmlTextReaderStandalone(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlTextReaderByteConsumed(reader: TxmlTextReaderPtr): longint; cdecl; external libxml2;
function xmlReaderWalker(doc: TxmlDocPtr): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlReaderForDoc(cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlReaderForFile(filename: pchar; encoding: pchar; options: longint): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlReaderForMemory(buffer: pchar; size: longint; URL: pchar; encoding: pchar; options: longint): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlReaderForFd(fd: longint; URL: pchar; encoding: pchar; options: longint): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlReaderForIO(ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar; encoding: pchar;
  options: longint): TxmlTextReaderPtr; cdecl; external libxml2;
function xmlReaderNewWalker(reader: TxmlTextReaderPtr; doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlReaderNewDoc(reader: TxmlTextReaderPtr; cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlReaderNewFile(reader: TxmlTextReaderPtr; filename: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlReaderNewMemory(reader: TxmlTextReaderPtr; buffer: pchar; size: longint; URL: pchar; encoding: pchar;
  options: longint): longint; cdecl; external libxml2;
function xmlReaderNewFd(reader: TxmlTextReaderPtr; fd: longint; URL: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlReaderNewIO(reader: TxmlTextReaderPtr; ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar;
  encoding: pchar; options: longint): longint; cdecl; external libxml2;

type
  PxmlTextReaderLocatorPtr = ^TxmlTextReaderLocatorPtr;
  TxmlTextReaderLocatorPtr = pointer;

  TxmlTextReaderErrorFunc = procedure(arg: pointer; msg: pchar; severity: TxmlParserSeverities; locator: TxmlTextReaderLocatorPtr); cdecl;
  PxmlTextReaderErrorFunc = ^TxmlTextReaderErrorFunc;

function xmlTextReaderLocatorLineNumber(locator: TxmlTextReaderLocatorPtr): longint; cdecl; external libxml2;
function xmlTextReaderLocatorBaseURI(locator: TxmlTextReaderLocatorPtr): PxmlChar; cdecl; external libxml2;
procedure xmlTextReaderSetErrorHandler(reader: TxmlTextReaderPtr; f: TxmlTextReaderErrorFunc; arg: pointer); cdecl; external libxml2;
procedure xmlTextReaderSetStructuredErrorHandler(reader: TxmlTextReaderPtr; f: TxmlStructuredErrorFunc; arg: pointer); cdecl; external libxml2;
procedure xmlTextReaderGetErrorHandler(reader: TxmlTextReaderPtr; f: PxmlTextReaderErrorFunc; arg: Ppointer); cdecl; external libxml2;

// === Konventiert am: 2-3-25 19:31:26 ===


implementation



end.
