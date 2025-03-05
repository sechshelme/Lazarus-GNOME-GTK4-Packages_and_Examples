{$IFDEF read_interface}

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

function xmlNewTextReader(input: PxmlParserInputBuffer; URI: pchar): PxmlTextReader; cdecl; external libxml2;
function xmlNewTextReaderFilename(URI: pchar): PxmlTextReader; cdecl; external libxml2;
procedure xmlFreeTextReader(reader: PxmlTextReader); cdecl; external libxml2;
function xmlTextReaderSetup(reader: PxmlTextReader; input: PxmlParserInputBuffer; URL: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlTextReaderRead(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderReadInnerXml(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderReadOuterXml(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;

function xmlTextReaderReadString(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderReadAttributeValue(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderAttributeCount(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderDepth(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderHasAttributes(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderHasValue(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderIsDefault(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderIsEmptyElement(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderNodeType(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderQuoteChar(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderReadState(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderIsNamespaceDecl(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderConstBaseUri(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstLocalName(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstName(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstNamespaceUri(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstPrefix(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstXmlLang(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstString(reader: PxmlTextReader; str: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderConstValue(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderBaseUri(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderLocalName(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderName(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderNamespaceUri(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderPrefix(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderXmlLang(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderValue(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderClose(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderGetAttributeNo(reader: PxmlTextReader; no: longint): PxmlChar; cdecl; external libxml2;
function xmlTextReaderGetAttribute(reader: PxmlTextReader; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderGetAttributeNs(reader: PxmlTextReader; localName: PxmlChar; namespaceURI: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderGetRemainder(reader: PxmlTextReader): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlTextReaderLookupNamespace(reader: PxmlTextReader; prefix: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlTextReaderMoveToAttributeNo(reader: PxmlTextReader; no: longint): longint; cdecl; external libxml2;
function xmlTextReaderMoveToAttribute(reader: PxmlTextReader; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextReaderMoveToAttributeNs(reader: PxmlTextReader; localName: PxmlChar; namespaceURI: PxmlChar): longint; cdecl; external libxml2;
function xmlTextReaderMoveToFirstAttribute(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderMoveToNextAttribute(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderMoveToElement(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderNormalization(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderConstEncoding(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderSetParserProp(reader: PxmlTextReader; prop: longint; Value: longint): longint; cdecl; external libxml2;
function xmlTextReaderGetParserProp(reader: PxmlTextReader; prop: longint): longint; cdecl; external libxml2;
function xmlTextReaderCurrentNode(reader: PxmlTextReader): PxmlNode; cdecl; external libxml2;
function xmlTextReaderGetParserLineNumber(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderGetParserColumnNumber(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderPreserve(reader: PxmlTextReader): PxmlNode; cdecl; external libxml2;
function xmlTextReaderPreservePattern(reader: PxmlTextReader; pattern: PxmlChar; namespaces: PPxmlChar): longint; cdecl; external libxml2;
function xmlTextReaderCurrentDoc(reader: PxmlTextReader): PxmlDoc; cdecl; external libxml2;
function xmlTextReaderExpand(reader: PxmlTextReader): PxmlNode; cdecl; external libxml2;
function xmlTextReaderNext(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderNextSibling(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderIsValid(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderRelaxNGValidate(reader: PxmlTextReader; rng: pchar): longint; cdecl; external libxml2;
function xmlTextReaderRelaxNGValidateCtxt(reader: PxmlTextReader; ctxt: PxmlRelaxNGValidCtxt; options: longint): longint; cdecl; external libxml2;
function xmlTextReaderRelaxNGSetSchema(reader: PxmlTextReader; schema: PxmlRelaxNG): longint; cdecl; external libxml2;
function xmlTextReaderSchemaValidate(reader: PxmlTextReader; xsd: pchar): longint; cdecl; external libxml2;
function xmlTextReaderSchemaValidateCtxt(reader: PxmlTextReader; ctxt: PxmlSchemaValidCtxt; options: longint): longint; cdecl; external libxml2;
function xmlTextReaderSetSchema(reader: PxmlTextReader; schema: PxmlSchema): longint; cdecl; external libxml2;

function xmlTextReaderConstXmlVersion(reader: PxmlTextReader): PxmlChar; cdecl; external libxml2;
function xmlTextReaderStandalone(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlTextReaderByteConsumed(reader: PxmlTextReader): longint; cdecl; external libxml2;
function xmlReaderWalker(doc: PxmlDoc): PxmlTextReader; cdecl; external libxml2;
function xmlReaderForDoc(cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): PxmlTextReader; cdecl; external libxml2;
function xmlReaderForFile(filename: pchar; encoding: pchar; options: longint): PxmlTextReader; cdecl; external libxml2;
function xmlReaderForMemory(buffer: pchar; size: longint; URL: pchar; encoding: pchar; options: longint): PxmlTextReader; cdecl; external libxml2;
function xmlReaderForFd(fd: longint; URL: pchar; encoding: pchar; options: longint): PxmlTextReader; cdecl; external libxml2;
function xmlReaderForIO(ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar; encoding: pchar;
  options: longint): PxmlTextReader; cdecl; external libxml2;
function xmlReaderNewWalker(reader: PxmlTextReader; doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlReaderNewDoc(reader: PxmlTextReader; cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlReaderNewFile(reader: PxmlTextReader; filename: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlReaderNewMemory(reader: PxmlTextReader; buffer: pchar; size: longint; URL: pchar; encoding: pchar;
  options: longint): longint; cdecl; external libxml2;
function xmlReaderNewFd(reader: PxmlTextReader; fd: longint; URL: pchar; encoding: pchar; options: longint): longint; cdecl; external libxml2;
function xmlReaderNewIO(reader: PxmlTextReader; ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar;
  encoding: pchar; options: longint): longint; cdecl; external libxml2;

type
  PxmlTextReaderLocator = pointer;

  TxmlTextReaderErrorFunc = procedure(arg: pointer; msg: pchar; severity: TxmlParserSeverities; locator: PxmlTextReaderLocator); cdecl;
  PxmlTextReaderErrorFunc = ^TxmlTextReaderErrorFunc;

function xmlTextReaderLocatorLineNumber(locator: PxmlTextReaderLocator): longint; cdecl; external libxml2;
function xmlTextReaderLocatorBaseURI(locator: PxmlTextReaderLocator): PxmlChar; cdecl; external libxml2;
procedure xmlTextReaderSetErrorHandler(reader: PxmlTextReader; f: TxmlTextReaderErrorFunc; arg: pointer); cdecl; external libxml2;
procedure xmlTextReaderSetStructuredErrorHandler(reader: PxmlTextReader; f: TxmlStructuredErrorFunc; arg: pointer); cdecl; external libxml2;
procedure xmlTextReaderGetErrorHandler(reader: PxmlTextReader; f: PxmlTextReaderErrorFunc; arg: Ppointer); cdecl; external libxml2;

// === Konventiert am: 2-3-25 19:31:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
