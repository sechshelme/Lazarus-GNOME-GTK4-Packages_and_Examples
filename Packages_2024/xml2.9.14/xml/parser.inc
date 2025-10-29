{$IFDEF read_interface}


const
  XML_DEFAULT_VERSION = '1.0';

const
  XML_SAX2_MAGIC = $DEEDBEAF;

type
  TxmlParserInputDeallocate = procedure(str: PxmlChar); cdecl;

  TxmlParserInput = record
    buf: PxmlParserInputBuffer;
    filename: pchar;
    directory: pchar;
    base: PxmlChar;
    cur: PxmlChar;
    end_: PxmlChar;
    length: longint;
    line: longint;
    col: longint;
    consumed: Tculong;
    Free: TxmlParserInputDeallocate;
    encoding: PxmlChar;
    version: PxmlChar;
    standalone: longint;
    id: longint;
  end;
  PxmlParserInput = ^TxmlParserInput;

  TxmlParserNodeInfo = record
    node: PxmlNode;
    begin_pos: Tculong;
    begin_line: Tculong;
    end_pos: Tculong;
    end_line: Tculong;
  end;
  PxmlParserNodeInfo = ^TxmlParserNodeInfo;

  TxmlParserNodeInfoSeq = record
    maximum: Tculong;
    length: Tculong;
    buffer: PxmlParserNodeInfo;
  end;
  PxmlParserNodeInfoSeq = ^TxmlParserNodeInfoSeq;

  PxmlParserInputState = ^TxmlParserInputState;
  TxmlParserInputState = longint;

const
  XML_PARSER_EOF = -1;
  XML_PARSER_START = 0;
  XML_PARSER_MISC = 1;
  XML_PARSER_PI = 2;
  XML_PARSER_DTD = 3;
  XML_PARSER_PROLOG = 4;
  XML_PARSER_COMMENT = 5;
  XML_PARSER_START_TAG = 6;
  XML_PARSER_CONTENT = 7;
  XML_PARSER_CDATA_SECTION = 8;
  XML_PARSER_END_TAG = 9;
  XML_PARSER_ENTITY_DECL = 10;
  XML_PARSER_ENTITY_VALUE = 11;
  XML_PARSER_ATTRIBUTE_VALUE = 12;
  XML_PARSER_SYSTEM_LITERAL = 13;
  XML_PARSER_EPILOG = 14;
  XML_PARSER_IGNORE = 15;
  XML_PARSER_PUBLIC_LITERAL = 16;

const
  XML_DETECT_IDS = 2;
  XML_COMPLETE_ATTRS = 4;
  XML_SKIP_IDS = 8;

type
  PxmlParserMode = ^TxmlParserMode;
  TxmlParserMode = longint;

const
  XML_PARSE_UNKNOWN = 0;
  XML_PARSE_DOM = 1;
  XML_PARSE_SAX = 2;
  XML_PARSE_PUSH_DOM = 3;
  XML_PARSE_PUSH_SAX = 4;
  XML_PARSE_READER = 5;

type
  TxmlStartTag = record
  end;
  PxmlStartTag = ^TxmlStartTag;

  PxmlSAXHandler = ^TxmlSAXHandler;
  PPxmlSAXHandler = ^PxmlSAXHandler;

  TxmlParserCtxt = record
    sax: PxmlSAXHandler;
    userData: pointer;
    myDoc: PxmlDoc;
    wellFormed: longint;
    replaceEntities: longint;
    version: PxmlChar;
    encoding: PxmlChar;
    standalone: longint;
    html: longint;
    input: PxmlParserInput;
    inputNr: longint;
    inputMax: longint;
    inputTab: ^PxmlParserInput;
    node: PxmlNode;
    nodeNr: longint;
    nodeMax: longint;
    nodeTab: PPxmlNode;
    record_info: longint;
    node_seq: TxmlParserNodeInfoSeq;
    errNo: longint;
    hasExternalSubset: longint;
    hasPErefs: longint;
    external: longint;
    valid: longint;
    validate: longint;
    vctxt: TxmlValidCtxt;
    instate: TxmlParserInputState;
    token: longint;
    directory: pchar;
    Name: PxmlChar;
    nameNr: longint;
    nameMax: longint;
    nameTab: ^PxmlChar;
    nbChars: Tclong;
    checkIndex: Tclong;
    keepBlanks: longint;
    disableSAX: longint;
    inSubset: longint;
    intSubName: PxmlChar;
    extSubURI: PxmlChar;
    extSubSystem: PxmlChar;
    space: Plongint;
    spaceNr: longint;
    spaceMax: longint;
    spaceTab: Plongint;
    depth: longint;
    entity: PxmlParserInput;
    charset: longint;
    nodelen: longint;
    nodemem: longint;
    pedantic: longint;
    _private: pointer;
    loadsubset: longint;
    linenumbers: longint;
    catalogs: pointer;
    recovery: longint;
    progressive: longint;
    dict: PxmlDict;
    atts: ^PxmlChar;
    maxatts: longint;
    docdict: longint;
    str_xml: PxmlChar;
    str_xmlns: PxmlChar;
    str_xml_ns: PxmlChar;
    sax2: longint;
    nsNr: longint;
    nsMax: longint;
    nsTab: ^PxmlChar;
    attallocs: Plongint;
    pushTab: PxmlStartTag;
    attsDefault: PxmlHashTable;
    attsSpecial: PxmlHashTable;
    nsWellFormed: longint;
    options: longint;
    dictNames: longint;
    freeElemsNr: longint;
    freeElems: PxmlNode;
    freeAttrsNr: longint;
    freeAttrs: PxmlAttr;
    lastError: TxmlError;
    parseMode: TxmlParserMode;
    nbentities: Tculong;
    sizeentities: Tculong;
    nodeInfo: PxmlParserNodeInfo;
    nodeInfoNr: longint;
    nodeInfoMax: longint;
    nodeInfoTab: PxmlParserNodeInfo;
    input_id: longint;
    sizeentcopy: Tculong;
  end;
  PxmlParserCtxt = ^TxmlParserCtxt;

  TxmlSAXLocator = record
    getPublicId: function(ctx: pointer): PxmlChar; cdecl;
    getSystemId: function(ctx: pointer): PxmlChar; cdecl;
    getLineNumber: function(ctx: pointer): longint; cdecl;
    getColumnNumber: function(ctx: pointer): longint; cdecl;
  end;
  PxmlSAXLocator = ^TxmlSAXLocator;

  TresolveEntitySAXFunc = function(ctx: pointer; publicId: PxmlChar; systemId: PxmlChar): PxmlParserInput; cdecl;
  TinternalSubsetSAXFunc = procedure(ctx: pointer; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl;
  TexternalSubsetSAXFunc = procedure(ctx: pointer; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl;
  TgetEntitySAXFunc = function(ctx: pointer; Name: PxmlChar): PxmlEntity; cdecl;
  TgetParameterEntitySAXFunc = function(ctx: pointer; Name: PxmlChar): PxmlEntity; cdecl;
  TentityDeclSAXFunc = procedure(ctx: pointer; Name: PxmlChar; _type: longint; publicId: PxmlChar; systemId: PxmlChar; content: PxmlChar); cdecl;
  TnotationDeclSAXFunc = procedure(ctx: pointer; Name: PxmlChar; publicId: PxmlChar; systemId: PxmlChar); cdecl;
  TattributeDeclSAXFunc = procedure(ctx: pointer; elem: PxmlChar; fullname: PxmlChar; _type: longint; def: longint; defaultValue: PxmlChar; tree: PxmlEnumeration); cdecl;
  TelementDeclSAXFunc = procedure(ctx: pointer; Name: PxmlChar; _type: longint; content: PxmlElementContent); cdecl;
  TunparsedEntityDeclSAXFunc = procedure(ctx: pointer; Name: PxmlChar; publicId: PxmlChar; systemId: PxmlChar; notationName: PxmlChar); cdecl;
  TsetDocumentLocatorSAXFunc = procedure(ctx: pointer; loc: PxmlSAXLocator); cdecl;
  TstartDocumentSAXFunc = procedure(ctx: pointer); cdecl;
  TendDocumentSAXFunc = procedure(ctx: pointer); cdecl;
  TstartElementSAXFunc = procedure(ctx: pointer; Name: PxmlChar; atts: PPxmlChar); cdecl;
  TendElementSAXFunc = procedure(ctx: pointer; Name: PxmlChar); cdecl;
  TattributeSAXFunc = procedure(ctx: pointer; Name: PxmlChar; Value: PxmlChar); cdecl;
  TreferenceSAXFunc = procedure(ctx: pointer; Name: PxmlChar); cdecl;
  TcharactersSAXFunc = procedure(ctx: pointer; ch: PxmlChar; len: longint); cdecl;
  TignorableWhitespaceSAXFunc = procedure(ctx: pointer; ch: PxmlChar; len: longint); cdecl;
  TprocessingInstructionSAXFunc = procedure(ctx: pointer; target: PxmlChar; Data: PxmlChar); cdecl;
  TcommentSAXFunc = procedure(ctx: pointer; Value: PxmlChar); cdecl;
  TcdataBlockSAXFunc = procedure(ctx: pointer; Value: PxmlChar; len: longint); cdecl;
  TwarningSAXFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  TerrorSAXFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  TfatalErrorSAXFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  TisStandaloneSAXFunc = function(ctx: pointer): longint; cdecl;
  ThasInternalSubsetSAXFunc = function(ctx: pointer): longint; cdecl;
  ThasExternalSubsetSAXFunc = function(ctx: pointer): longint; cdecl;

  TstartElementNsSAX2Func = procedure(ctx: pointer; localname: PxmlChar; prefix: PxmlChar; URI: PxmlChar; nb_namespaces: longint; namespaces: PPxmlChar; nb_attributes: longint; nb_defaulted: longint; attributes: PPxmlChar); cdecl;
  TendElementNsSAX2Func = procedure(ctx: pointer; localname: PxmlChar; prefix: PxmlChar; URI: PxmlChar); cdecl;

  TxmlSAXHandler = record
    internalSubset: TinternalSubsetSAXFunc;
    isStandalone: TisStandaloneSAXFunc;
    hasInternalSubset: ThasInternalSubsetSAXFunc;
    hasExternalSubset: ThasExternalSubsetSAXFunc;
    resolveEntity: TresolveEntitySAXFunc;
    getEntity: TgetEntitySAXFunc;
    entityDecl: TentityDeclSAXFunc;
    notationDecl: TnotationDeclSAXFunc;
    attributeDecl: TattributeDeclSAXFunc;
    elementDecl: TelementDeclSAXFunc;
    unparsedEntityDecl: TunparsedEntityDeclSAXFunc;
    setDocumentLocator: TsetDocumentLocatorSAXFunc;
    startDocument: TstartDocumentSAXFunc;
    endDocument: TendDocumentSAXFunc;
    startElement: TstartElementSAXFunc;
    endElement: TendElementSAXFunc;
    reference: TreferenceSAXFunc;
    characters: TcharactersSAXFunc;
    ignorableWhitespace: TignorableWhitespaceSAXFunc;
    processingInstruction: TprocessingInstructionSAXFunc;
    comment: TcommentSAXFunc;
    warning: TwarningSAXFunc;
    error: TerrorSAXFunc;
    fatalError: TfatalErrorSAXFunc;
    getParameterEntity: TgetParameterEntitySAXFunc;
    cdataBlock: TcdataBlockSAXFunc;
    externalSubset: TexternalSubsetSAXFunc;
    initialized: dword;
    _private: pointer;
    startElementNs: TstartElementNsSAX2Func;
    endElementNs: TendElementNsSAX2Func;
    serror: TxmlStructuredErrorFunc;
  end;

  TxmlSAXHandlerV1 = record
    internalSubset: TinternalSubsetSAXFunc;
    isStandalone: TisStandaloneSAXFunc;
    hasInternalSubset: ThasInternalSubsetSAXFunc;
    hasExternalSubset: ThasExternalSubsetSAXFunc;
    resolveEntity: TresolveEntitySAXFunc;
    getEntity: TgetEntitySAXFunc;
    entityDecl: TentityDeclSAXFunc;
    notationDecl: TnotationDeclSAXFunc;
    attributeDecl: TattributeDeclSAXFunc;
    elementDecl: TelementDeclSAXFunc;
    unparsedEntityDecl: TunparsedEntityDeclSAXFunc;
    setDocumentLocator: TsetDocumentLocatorSAXFunc;
    startDocument: TstartDocumentSAXFunc;
    endDocument: TendDocumentSAXFunc;
    startElement: TstartElementSAXFunc;
    endElement: TendElementSAXFunc;
    reference: TreferenceSAXFunc;
    characters: TcharactersSAXFunc;
    ignorableWhitespace: TignorableWhitespaceSAXFunc;
    processingInstruction: TprocessingInstructionSAXFunc;
    comment: TcommentSAXFunc;
    warning: TwarningSAXFunc;
    error: TerrorSAXFunc;
    fatalError: TfatalErrorSAXFunc;
    getParameterEntity: TgetParameterEntitySAXFunc;
    cdataBlock: TcdataBlockSAXFunc;
    externalSubset: TexternalSubsetSAXFunc;
    initialized: dword;
  end;
  PxmlSAXHandlerV1 = ^TxmlSAXHandlerV1;


  TxmlExternalEntityLoader = function(URL: pchar; ID: pchar; context: PxmlParserCtxt): PxmlParserInput; cdecl;

procedure xmlInitParser; cdecl; external libxml2;
procedure xmlCleanupParser; cdecl; external libxml2;
function xmlParserInputRead(in_: PxmlParserInput; len: longint): longint; cdecl; external libxml2;
function xmlParserInputGrow(in_: PxmlParserInput; len: longint): longint; cdecl; external libxml2;

function xmlParseDoc(cur: PxmlChar): PxmlDoc; cdecl; external libxml2;
function xmlParseFile(filename: pchar): PxmlDoc; cdecl; external libxml2;
function xmlParseMemory(buffer: pchar; size: longint): PxmlDoc; cdecl; external libxml2;

function xmlSubstituteEntitiesDefault(val: longint): longint; cdecl; external libxml2;
function xmlKeepBlanksDefault(val: longint): longint; cdecl; external libxml2;
procedure xmlStopParser(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlPedanticParserDefault(val: longint): longint; cdecl; external libxml2;
function xmlLineNumbersDefault(val: longint): longint; cdecl; external libxml2;

function xmlRecoverDoc(cur: PxmlChar): PxmlDoc; cdecl; external libxml2;
function xmlRecoverMemory(buffer: pchar; size: longint): PxmlDoc; cdecl; external libxml2;
function xmlRecoverFile(filename: pchar): PxmlDoc; cdecl; external libxml2;

function xmlParseDocument(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;
function xmlParseExtParsedEnt(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;

function xmlSAXUserParseFile(sax: PxmlSAXHandler; user_data: pointer; filename: pchar): longint; cdecl; external libxml2;
function xmlSAXUserParseMemory(sax: PxmlSAXHandler; user_data: pointer; buffer: pchar; size: longint): longint; cdecl; external libxml2;
function xmlSAXParseDoc(sax: PxmlSAXHandler; cur: PxmlChar; recovery: longint): PxmlDoc; cdecl; external libxml2;
function xmlSAXParseMemory(sax: PxmlSAXHandler; buffer: pchar; size: longint; recovery: longint): PxmlDoc; cdecl; external libxml2;
function xmlSAXParseMemoryWithData(sax: PxmlSAXHandler; buffer: pchar; size: longint; recovery: longint; Data: pointer): PxmlDoc; cdecl; external libxml2;
function xmlSAXParseFile(sax: PxmlSAXHandler; filename: pchar; recovery: longint): PxmlDoc; cdecl; external libxml2;
function xmlSAXParseFileWithData(sax: PxmlSAXHandler; filename: pchar; recovery: longint; Data: pointer): PxmlDoc; cdecl; external libxml2;
function xmlSAXParseEntity(sax: PxmlSAXHandler; filename: pchar): PxmlDoc; cdecl; external libxml2;
function xmlParseEntity(filename: pchar): PxmlDoc; cdecl; external libxml2;

function xmlSAXParseDTD(sax: PxmlSAXHandler; ExternalID: PxmlChar; SystemID: PxmlChar): PxmlDtd; cdecl; external libxml2;
function xmlParseDTD(ExternalID: PxmlChar; SystemID: PxmlChar): PxmlDtd; cdecl; external libxml2;
function xmlIOParseDTD(sax: PxmlSAXHandler; input: PxmlParserInputBuffer; enc: TxmlCharEncoding): PxmlDtd; cdecl; external libxml2;

function xmlParseBalancedChunkMemory(doc: PxmlDoc; sax: PxmlSAXHandler; user_data: pointer; depth: longint; _string: PxmlChar; lst: PPxmlNode): longint; cdecl; external libxml2;

function xmlParseInNodeContext(node: PxmlNode; Data: pchar; datalen: longint; options: longint; lst: PPxmlNode): TxmlParserErrors; cdecl; external libxml2;

function xmlParseBalancedChunkMemoryRecover(doc: PxmlDoc; sax: PxmlSAXHandler; user_data: pointer; depth: longint; _string: PxmlChar; lst: PPxmlNode; recover: longint): longint; cdecl; external libxml2;
function xmlParseExternalEntity(doc: PxmlDoc; sax: PxmlSAXHandler; user_data: pointer; depth: longint; URL: PxmlChar; ID: PxmlChar; lst: PPxmlNode): longint; cdecl; external libxml2;

function xmlParseCtxtExternalEntity(ctx: PxmlParserCtxt; URL: PxmlChar; ID: PxmlChar; lst: PPxmlNode): longint; cdecl; external libxml2;
function xmlNewParserCtxt: PxmlParserCtxt; cdecl; external libxml2;
function xmlInitParserCtxt(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;
procedure xmlClearParserCtxt(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlFreeParserCtxt(ctxt: PxmlParserCtxt); cdecl; external libxml2;

procedure xmlSetupParserForBuffer(ctxt: PxmlParserCtxt; buffer: PxmlChar; filename: pchar); cdecl; external libxml2;

function xmlCreateDocParserCtxt(cur: PxmlChar): PxmlParserCtxt; cdecl; external libxml2;

function xmlGetFeaturesList(len: Plongint; Result: PPchar): longint; cdecl; external libxml2;
function xmlGetFeature(ctxt: PxmlParserCtxt; Name: pchar; Result: pointer): longint; cdecl; external libxml2;
function xmlSetFeature(ctxt: PxmlParserCtxt; Name: pchar; Value: pointer): longint; cdecl; external libxml2;

function xmlCreatePushParserCtxt(sax: PxmlSAXHandler; user_data: pointer; chunk: pchar; size: longint; filename: pchar): PxmlParserCtxt; cdecl; external libxml2;
function xmlParseChunk(ctxt: PxmlParserCtxt; chunk: pchar; size: longint; terminate: longint): longint; cdecl; external libxml2;

function xmlCreateIOParserCtxt(sax: PxmlSAXHandler; user_data: pointer; ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; enc: TxmlCharEncoding): PxmlParserCtxt; cdecl; external libxml2;
function xmlNewIOInputStream(ctxt: PxmlParserCtxt; input: PxmlParserInputBuffer; enc: TxmlCharEncoding): PxmlParserInput; cdecl; external libxml2;
function xmlParserFindNodeInfo(ctxt: PxmlParserCtxt; node: PxmlNode): PxmlParserNodeInfo; cdecl; external libxml2;
procedure xmlInitNodeInfoSeq(seq: PxmlParserNodeInfoSeq); cdecl; external libxml2;
procedure xmlClearNodeInfoSeq(seq: PxmlParserNodeInfoSeq); cdecl; external libxml2;
function xmlParserFindNodeInfoIndex(seq: PxmlParserNodeInfoSeq; node: PxmlNode): Tculong; cdecl; external libxml2;
procedure xmlParserAddNodeInfo(ctxt: PxmlParserCtxt; info: PxmlParserNodeInfo); cdecl; external libxml2;
procedure xmlSetExternalEntityLoader(f: TxmlExternalEntityLoader); cdecl; external libxml2;
function xmlGetExternalEntityLoader: TxmlExternalEntityLoader; cdecl; external libxml2;
function xmlLoadExternalEntity(URL: pchar; ID: pchar; ctxt: PxmlParserCtxt): PxmlParserInput; cdecl; external libxml2;
function xmlByteConsumed(ctxt: PxmlParserCtxt): Tclong; cdecl; external libxml2;

type
  PxmlParserOption = ^TxmlParserOption;
  TxmlParserOption = longint;

const
  XML_PARSE_RECOVER = 1 shl 0;
  XML_PARSE_NOENT = 1 shl 1;
  XML_PARSE_DTDLOAD = 1 shl 2;
  XML_PARSE_DTDATTR = 1 shl 3;
  XML_PARSE_DTDVALID = 1 shl 4;
  XML_PARSE_NOERROR = 1 shl 5;
  XML_PARSE_NOWARNING = 1 shl 6;
  XML_PARSE_PEDANTIC = 1 shl 7;
  XML_PARSE_NOBLANKS = 1 shl 8;
  XML_PARSE_SAX1 = 1 shl 9;
  XML_PARSE_XINCLUDE = 1 shl 10;
  XML_PARSE_NONET = 1 shl 11;
  XML_PARSE_NODICT = 1 shl 12;
  XML_PARSE_NSCLEAN = 1 shl 13;
  XML_PARSE_NOCDATA = 1 shl 14;
  XML_PARSE_NOXINCNODE = 1 shl 15;
  XML_PARSE_COMPACT = 1 shl 16;
  XML_PARSE_OLD10 = 1 shl 17;
  XML_PARSE_NOBASEFIX = 1 shl 18;
  XML_PARSE_HUGE = 1 shl 19;
  XML_PARSE_OLDSAX = 1 shl 20;
  XML_PARSE_IGNORE_ENC = 1 shl 21;
  XML_PARSE_BIG_LINES = 1 shl 22;

procedure xmlCtxtReset(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlCtxtResetPush(ctxt: PxmlParserCtxt; chunk: pchar; size: longint; filename: pchar; encoding: pchar): longint; cdecl; external libxml2;
function xmlCtxtUseOptions(ctxt: PxmlParserCtxt; options: longint): longint; cdecl; external libxml2;
function xmlReadDoc(cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlReadFile(URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlReadMemory(buffer: pchar; size: longint; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlReadFd(fd: longint; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlReadIO(ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlCtxtReadDoc(ctxt: PxmlParserCtxt; cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlCtxtReadFile(ctxt: PxmlParserCtxt; filename: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlCtxtReadMemory(ctxt: PxmlParserCtxt; buffer: pchar; size: longint; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlCtxtReadFd(ctxt: PxmlParserCtxt; fd: longint; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;
function xmlCtxtReadIO(ctxt: PxmlParserCtxt; ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar; encoding: pchar; options: longint): PxmlDoc; cdecl; external libxml2;

type
  PxmlFeature = ^TxmlFeature;
  TxmlFeature = longint;

const
  XML_WITH_THREAD = 1;
  XML_WITH_TREE = 2;
  XML_WITH_OUTPUT = 3;
  XML_WITH_PUSH = 4;
  XML_WITH_READER = 5;
  XML_WITH_PATTERN = 6;
  XML_WITH_WRITER = 7;
  XML_WITH_SAX1 = 8;
  XML_WITH_FTP = 9;
  XML_WITH_HTTP = 10;
  XML_WITH_VALID = 11;
  XML_WITH_HTML = 12;
  XML_WITH_LEGACY = 13;
  XML_WITH_C14N = 14;
  XML_WITH_CATALOG = 15;
  XML_WITH_XPATH = 16;
  XML_WITH_XPTR = 17;
  XML_WITH_XINCLUDE = 18;
  XML_WITH_ICONV = 19;
  XML_WITH_ISO8859X = 20;
  XML_WITH_UNICODE = 21;
  XML_WITH_REGEXP = 22;
  XML_WITH_AUTOMATA = 23;
  XML_WITH_EXPR = 24;
  XML_WITH_SCHEMAS = 25;
  XML_WITH_SCHEMATRON = 26;
  XML_WITH_MODULES = 27;
  XML_WITH_DEBUG = 28;
  XML_WITH_DEBUG_MEM = 29;
  XML_WITH_DEBUG_RUN = 30;
  XML_WITH_ZLIB = 31;
  XML_WITH_ICU = 32;
  XML_WITH_LZMA = 33;
  XML_WITH_NONE = 99999;


function xmlHasFeature(feature: TxmlFeature): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 15:33:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
