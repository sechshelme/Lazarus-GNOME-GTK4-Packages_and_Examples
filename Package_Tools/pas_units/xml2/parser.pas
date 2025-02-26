unit parser;

interface

uses
  ctypes, xml2_common, xmlstring, tree;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  XML_DEFAULT_VERSION = '1.0';  
type
  TxmlParserInputDeallocate = procedure (str:PxmlChar);cdecl;
  PxmlParserInput = ^TxmlParserInput;
  TxmlParserInput = record
      buf : TxmlParserInputBufferPtr;
      filename : Pchar;
      directory : Pchar;
      base : PxmlChar;
      cur : PxmlChar;
      end_ : PxmlChar;
      length : longint;
      line : longint;
      col : longint;
      consumed : dword;
      free : TxmlParserInputDeallocate;
      encoding : PxmlChar;
      version : PxmlChar;
      standalone : longint;
      id : longint;
    end;

  PxmlParserNodeInfoPtr = ^TxmlParserNodeInfoPtr;
  TxmlParserNodeInfoPtr = PxmlParserNodeInfo;
  PxmlParserNodeInfo = ^TxmlParserNodeInfo;
  TxmlParserNodeInfo = record
      node : PxmlNode;
      begin_pos : dword;
      begin_line : dword;
      end_pos : dword;
      end_line : dword;
    end;

  PxmlParserNodeInfoSeqPtr = ^TxmlParserNodeInfoSeqPtr;
  TxmlParserNodeInfoSeqPtr = PxmlParserNodeInfoSeq;
  PxmlParserNodeInfoSeq = ^TxmlParserNodeInfoSeq;
  TxmlParserNodeInfoSeq = record
      maximum : dword;
      length : dword;
      buffer : PxmlParserNodeInfo;
    end;


  PxmlParserInputState = ^TxmlParserInputState;
  TxmlParserInputState =  Longint;
  Const
    XML_PARSER_EOF = -(1);
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

const    XML_DETECT_IDS = 2;
  XML_COMPLETE_ATTRS = 4;
  XML_SKIP_IDS = 8;
type
  PxmlParserMode = ^TxmlParserMode;
  TxmlParserMode =  Longint;
  Const
    XML_PARSE_UNKNOWN = 0;
    XML_PARSE_DOM = 1;
    XML_PARSE_SAX = 2;
    XML_PARSE_PUSH_DOM = 3;
    XML_PARSE_PUSH_SAX = 4;
    XML_PARSE_READER = 5;

type
  PxmlParserCtxt = ^TxmlParserCtxt;
  TxmlParserCtxt = record
      sax : PxmlSAXHandler;
      userData : pointer;
      myDoc : TxmlDocPtr;
      wellFormed : longint;
      replaceEntities : longint;
      version : PxmlChar;
      encoding : PxmlChar;
      standalone : longint;
      html : longint;
      input : TxmlParserInputPtr;
      inputNr : longint;
      inputMax : longint;
      inputTab : PxmlParserInputPtr;
      node : TxmlNodePtr;
      nodeNr : longint;
      nodeMax : longint;
      nodeTab : PxmlNodePtr;
      record_info : longint;
      node_seq : TxmlParserNodeInfoSeq;
      errNo : longint;
      hasExternalSubset : longint;
      hasPErefs : longint;
      external : longint;
      valid : longint;
      validate : longint;
      vctxt : TxmlValidCtxt;
      instate : TxmlParserInputState;
      token : longint;
      directory : Pchar;
      name : PxmlChar;
      nameNr : longint;
      nameMax : longint;
      nameTab : ^PxmlChar;
      nbChars : longint;
      checkIndex : longint;
      keepBlanks : longint;
      disableSAX : longint;
      inSubset : longint;
      intSubName : PxmlChar;
      extSubURI : PxmlChar;
      extSubSystem : PxmlChar;
      space : Plongint;
      spaceNr : longint;
      spaceMax : longint;
      spaceTab : Plongint;
      depth : longint;
      entity : TxmlParserInputPtr;
      charset : longint;
      nodelen : longint;
      nodemem : longint;
      pedantic : longint;
      _private : pointer;
      loadsubset : longint;
      linenumbers : longint;
      catalogs : pointer;
      recovery : longint;
      progressive : longint;
      dict : TxmlDictPtr;
      atts : ^PxmlChar;
      maxatts : longint;
      docdict : longint;
      str_xml : PxmlChar;
      str_xmlns : PxmlChar;
      str_xml_ns : PxmlChar;
      sax2 : longint;
      nsNr : longint;
      nsMax : longint;
      nsTab : ^PxmlChar;
      attallocs : Plongint;
      pushTab : PxmlStartTag;
      attsDefault : TxmlHashTablePtr;
      attsSpecial : TxmlHashTablePtr;
      nsWellFormed : longint;
      options : longint;
      dictNames : longint;
      freeElemsNr : longint;
      freeElems : TxmlNodePtr;
      freeAttrsNr : longint;
      freeAttrs : TxmlAttrPtr;
      lastError : TxmlError;
      parseMode : TxmlParserMode;
      nbentities : dword;
      sizeentities : dword;
      nodeInfo : PxmlParserNodeInfo;
      nodeInfoNr : longint;
      nodeInfoMax : longint;
      nodeInfoTab : PxmlParserNodeInfo;
      input_id : longint;
      sizeentcopy : dword;
    end;

  PxmlSAXLocator = ^TxmlSAXLocator;
  TxmlSAXLocator = record
      getPublicId : function (ctx:pointer):PxmlChar;cdecl;
      getSystemId : function (ctx:pointer):PxmlChar;cdecl;
      getLineNumber : function (ctx:pointer):longint;cdecl;
      getColumnNumber : function (ctx:pointer):longint;cdecl;
    end;

  TresolveEntitySAXFunc = function (ctx:pointer; publicId:PxmlChar; systemId:PxmlChar):TxmlParserInputPtr;cdecl;
  TinternalSubsetSAXFunc = procedure (ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;
  TexternalSubsetSAXFunc = procedure (ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;
  TgetEntitySAXFunc = function (ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;
  TgetParameterEntitySAXFunc = function (ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;
  TentityDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; _type:longint; publicId:PxmlChar; systemId:PxmlChar;                content:PxmlChar);cdecl;
  TnotationDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar);cdecl;
  TattributeDeclSAXFunc = procedure (ctx:pointer; elem:PxmlChar; fullname:PxmlChar; _type:longint; def:longint;                defaultValue:PxmlChar; tree:TxmlEnumerationPtr);cdecl;
  TelementDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; _type:longint; content:TxmlElementContentPtr);cdecl;
  TunparsedEntityDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar; notationName:PxmlChar);cdecl;
  TsetDocumentLocatorSAXFunc = procedure (ctx:pointer; loc:TxmlSAXLocatorPtr);cdecl;
  TstartDocumentSAXFunc = procedure (ctx:pointer);cdecl;
  TendDocumentSAXFunc = procedure (ctx:pointer);cdecl;
  TstartElementSAXFunc = procedure (ctx:pointer; name:PxmlChar; atts:PPxmlChar);cdecl;
  TendElementSAXFunc = procedure (ctx:pointer; name:PxmlChar);cdecl;
  TattributeSAXFunc = procedure (ctx:pointer; name:PxmlChar; value:PxmlChar);cdecl;
  TreferenceSAXFunc = procedure (ctx:pointer; name:PxmlChar);cdecl;
  TcharactersSAXFunc = procedure (ctx:pointer; ch:PxmlChar; len:longint);cdecl;
  TignorableWhitespaceSAXFunc = procedure (ctx:pointer; ch:PxmlChar; len:longint);cdecl;
  TprocessingInstructionSAXFunc = procedure (ctx:pointer; target:PxmlChar; data:PxmlChar);cdecl;
  TcommentSAXFunc = procedure (ctx:pointer; value:PxmlChar);cdecl;
  TcdataBlockSAXFunc = procedure (ctx:pointer; value:PxmlChar; len:longint);cdecl;
  TwarningSAXFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
  TerrorSAXFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
  TfatalErrorSAXFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
  TisStandaloneSAXFunc = function (ctx:pointer):longint;cdecl;
  ThasInternalSubsetSAXFunc = function (ctx:pointer):longint;cdecl;
  ThasExternalSubsetSAXFunc = function (ctx:pointer):longint;cdecl;

const
  XML_SAX2_MAGIC = $DEEDBEAF;  
type
  TstartElementNsSAX2Func = procedure (ctx:pointer; localname:PxmlChar; prefix:PxmlChar; URI:PxmlChar; nb_namespaces:longint;                namespaces:PPxmlChar; nb_attributes:longint; nb_defaulted:longint; attributes:PPxmlChar);cdecl;
  TendElementNsSAX2Func = procedure (ctx:pointer; localname:PxmlChar; prefix:PxmlChar; URI:PxmlChar);cdecl;
  PxmlSAXHandler = ^TxmlSAXHandler;
  TxmlSAXHandler = record
      internalSubset : TinternalSubsetSAXFunc;cdecl;
      isStandalone : TisStandaloneSAXFunc;
      hasInternalSubset : ThasInternalSubsetSAXFunc;
      hasExternalSubset : ThasExternalSubsetSAXFunc;
      resolveEntity : TresolveEntitySAXFunc;
      getEntity : TgetEntitySAXFunc;
      entityDecl : TentityDeclSAXFunc;
      notationDecl : TnotationDeclSAXFunc;
      attributeDecl : TattributeDeclSAXFunc;
      elementDecl : TelementDeclSAXFunc;
      unparsedEntityDecl : TunparsedEntityDeclSAXFunc;
      setDocumentLocator : TsetDocumentLocatorSAXFunc;
      startDocument : TstartDocumentSAXFunc;
      endDocument : TendDocumentSAXFunc;
      startElement : TstartElementSAXFunc;
      endElement : TendElementSAXFunc;
      reference : TreferenceSAXFunc;
      characters : TcharactersSAXFunc;
      ignorableWhitespace : TignorableWhitespaceSAXFunc;
      processingInstruction : TprocessingInstructionSAXFunc;
      comment : TcommentSAXFunc;
      warning : TwarningSAXFunc;
      error : TerrorSAXFunc;
      fatalError : TfatalErrorSAXFunc;
      getParameterEntity : TgetParameterEntitySAXFunc;
      cdataBlock : TcdataBlockSAXFunc;
      externalSubset : TexternalSubsetSAXFunc;
      initialized : dword;
      _private : pointer;
      startElementNs : TstartElementNsSAX2Func;
      endElementNs : TendElementNsSAX2Func;
      serror : TxmlStructuredErrorFunc;
    end;

  PxmlSAXHandlerV1Ptr = ^TxmlSAXHandlerV1Ptr;
  TxmlSAXHandlerV1Ptr = PxmlSAXHandlerV1;
  PxmlSAXHandlerV1 = ^TxmlSAXHandlerV1;
  TxmlSAXHandlerV1 = record
      internalSubset : TinternalSubsetSAXFunc;
      isStandalone : TisStandaloneSAXFunc;
      hasInternalSubset : ThasInternalSubsetSAXFunc;
      hasExternalSubset : ThasExternalSubsetSAXFunc;
      resolveEntity : TresolveEntitySAXFunc;
      getEntity : TgetEntitySAXFunc;
      entityDecl : TentityDeclSAXFunc;
      notationDecl : TnotationDeclSAXFunc;
      attributeDecl : TattributeDeclSAXFunc;
      elementDecl : TelementDeclSAXFunc;
      unparsedEntityDecl : TunparsedEntityDeclSAXFunc;
      setDocumentLocator : TsetDocumentLocatorSAXFunc;
      startDocument : TstartDocumentSAXFunc;
      endDocument : TendDocumentSAXFunc;
      startElement : TstartElementSAXFunc;
      endElement : TendElementSAXFunc;
      reference : TreferenceSAXFunc;
      characters : TcharactersSAXFunc;
      ignorableWhitespace : TignorableWhitespaceSAXFunc;
      processingInstruction : TprocessingInstructionSAXFunc;
      comment : TcommentSAXFunc;
      warning : TwarningSAXFunc;
      error : TerrorSAXFunc;
      fatalError : TfatalErrorSAXFunc;
      getParameterEntity : TgetParameterEntitySAXFunc;
      cdataBlock : TcdataBlockSAXFunc;
      externalSubset : TexternalSubsetSAXFunc;
      initialized : dword;
    end;


  TxmlExternalEntityLoader = function (URL:Pchar; ID:Pchar; context:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;

procedure xmlInitParser;cdecl;external libxml2;
procedure xmlCleanupParser;cdecl;external libxml2;
function xmlParserInputRead(in_:TxmlParserInputPtr; len:longint):longint;cdecl;external libxml2;
function xmlParserInputGrow(in_:TxmlParserInputPtr; len:longint):longint;cdecl;external libxml2;

{$ifdef LIBXML_SAX1_ENABLED}
function xmlParseDoc(cur:PxmlChar):TxmlDocPtr;cdecl;external libxml2;
function xmlParseFile(filename:Pchar):TxmlDocPtr;cdecl;external libxml2;
function xmlParseMemory(buffer:Pchar; size:longint):TxmlDocPtr;cdecl;external libxml2;
{$endif}

function xmlSubstituteEntitiesDefault(val:longint):longint;cdecl;external libxml2;
function xmlKeepBlanksDefault(val:longint):longint;cdecl;external libxml2;
procedure xmlStopParser(ctxt:TxmlParserCtxtPtr);cdecl;external libxml2;
function xmlPedanticParserDefault(val:longint):longint;cdecl;external libxml2;
function xmlLineNumbersDefault(val:longint):longint;cdecl;external libxml2;

{$ifdef LIBXML_SAX1_ENABLED}
function xmlRecoverDoc(cur:PxmlChar):TxmlDocPtr;cdecl;external libxml2;
function xmlRecoverMemory(buffer:Pchar; size:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlRecoverFile(filename:Pchar):TxmlDocPtr;cdecl;external libxml2;
{$endif}

function xmlParseDocument(ctxt:TxmlParserCtxtPtr):longint;cdecl;external libxml2;
function xmlParseExtParsedEnt(ctxt:TxmlParserCtxtPtr):longint;cdecl;external libxml2;
{$ifdef LIBXML_SAX1_ENABLED}
function xmlSAXUserParseFile(sax:TxmlSAXHandlerPtr; user_data:pointer; filename:Pchar):longint;cdecl;external libxml2;
function xmlSAXUserParseMemory(sax:TxmlSAXHandlerPtr; user_data:pointer; buffer:Pchar; size:longint):longint;cdecl;external libxml2;
function xmlSAXParseDoc(sax:TxmlSAXHandlerPtr; cur:PxmlChar; recovery:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlSAXParseMemory(sax:TxmlSAXHandlerPtr; buffer:Pchar; size:longint; recovery:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlSAXParseMemoryWithData(sax:TxmlSAXHandlerPtr; buffer:Pchar; size:longint; recovery:longint; data:pointer):TxmlDocPtr;cdecl;external libxml2;
function xmlSAXParseFile(sax:TxmlSAXHandlerPtr; filename:Pchar; recovery:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlSAXParseFileWithData(sax:TxmlSAXHandlerPtr; filename:Pchar; recovery:longint; data:pointer):TxmlDocPtr;cdecl;external libxml2;
function xmlSAXParseEntity(sax:TxmlSAXHandlerPtr; filename:Pchar):TxmlDocPtr;cdecl;external libxml2;
function xmlParseEntity(filename:Pchar):TxmlDocPtr;cdecl;external libxml2;
{$endif}

{$ifdef LIBXML_VALID_ENABLED}
function xmlSAXParseDTD(sax:TxmlSAXHandlerPtr; ExternalID:PxmlChar; SystemID:PxmlChar):TxmlDtdPtr;cdecl;external libxml2;
function xmlParseDTD(ExternalID:PxmlChar; SystemID:PxmlChar):TxmlDtdPtr;cdecl;external libxml2;
function xmlIOParseDTD(sax:TxmlSAXHandlerPtr; input:TxmlParserInputBufferPtr; enc:TxmlCharEncoding):TxmlDtdPtr;cdecl;external libxml2;
{$endif}

{$ifdef LIBXML_SAX1_ENABLED}
function xmlParseBalancedChunkMemory(doc:TxmlDocPtr; sax:TxmlSAXHandlerPtr; user_data:pointer; depth:longint; _string:PxmlChar;           lst:PxmlNodePtr):longint;cdecl;external libxml2;
{$endif}

function xmlParseInNodeContext(node:TxmlNodePtr; data:Pchar; datalen:longint; options:longint; lst:PxmlNodePtr):TxmlParserErrors;cdecl;external libxml2;
{$ifdef LIBXML_SAX1_ENABLED}
function xmlParseBalancedChunkMemoryRecover(doc:TxmlDocPtr; sax:TxmlSAXHandlerPtr; user_data:pointer; depth:longint; _string:PxmlChar;            lst:PxmlNodePtr; recover:longint):longint;cdecl;external libxml2;
function xmlParseExternalEntity(doc:TxmlDocPtr; sax:TxmlSAXHandlerPtr; user_data:pointer; depth:longint; URL:PxmlChar;                            ID:PxmlChar; lst:PxmlNodePtr):longint;cdecl;external libxml2;
{$endif}

function xmlParseCtxtExternalEntity(ctx:TxmlParserCtxtPtr; URL:PxmlChar; ID:PxmlChar; lst:PxmlNodePtr):longint;cdecl;external libxml2;
function xmlNewParserCtxt:TxmlParserCtxtPtr;cdecl;external libxml2;
function xmlInitParserCtxt(ctxt:TxmlParserCtxtPtr):longint;cdecl;external libxml2;
procedure xmlClearParserCtxt(ctxt:TxmlParserCtxtPtr);cdecl;external libxml2;
procedure xmlFreeParserCtxt(ctxt:TxmlParserCtxtPtr);cdecl;external libxml2;

{$ifdef LIBXML_SAX1_ENABLED}
procedure xmlSetupParserForBuffer(ctxt:TxmlParserCtxtPtr; buffer:PxmlChar; filename:Pchar);cdecl;external libxml2;
{$endif}

function xmlCreateDocParserCtxt(cur:PxmlChar):TxmlParserCtxtPtr;cdecl;external libxml2;
{$ifdef LIBXML_LEGACY_ENABLED}
function xmlGetFeaturesList(len:Plongint; result:PPchar):longint;cdecl;external libxml2;
function xmlGetFeature(ctxt:TxmlParserCtxtPtr; name:Pchar; result:pointer):longint;cdecl;external libxml2;
function xmlSetFeature(ctxt:TxmlParserCtxtPtr; name:Pchar; value:pointer):longint;cdecl;external libxml2;
{$endif}

{$ifdef LIBXML_PUSH_ENABLED}
function xmlCreatePushParserCtxt(sax:TxmlSAXHandlerPtr; user_data:pointer; chunk:Pchar; size:longint; filename:Pchar):TxmlParserCtxtPtr;cdecl;external libxml2;
function xmlParseChunk(ctxt:TxmlParserCtxtPtr; chunk:Pchar; size:longint; terminate:longint):longint;cdecl;external libxml2;
{$endif}

function xmlCreateIOParserCtxt(sax:TxmlSAXHandlerPtr; user_data:pointer; ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer;            enc:TxmlCharEncoding):TxmlParserCtxtPtr;cdecl;external libxml2;
function xmlNewIOInputStream(ctxt:TxmlParserCtxtPtr; input:TxmlParserInputBufferPtr; enc:TxmlCharEncoding):TxmlParserInputPtr;cdecl;external libxml2;
function xmlParserFindNodeInfo(ctxt:TxmlParserCtxtPtr; node:TxmlNodePtr):PxmlParserNodeInfo;cdecl;external libxml2;
procedure xmlInitNodeInfoSeq(seq:TxmlParserNodeInfoSeqPtr);cdecl;external libxml2;
procedure xmlClearNodeInfoSeq(seq:TxmlParserNodeInfoSeqPtr);cdecl;external libxml2;
function xmlParserFindNodeInfoIndex(seq:TxmlParserNodeInfoSeqPtr; node:TxmlNodePtr):dword;cdecl;external libxml2;
procedure xmlParserAddNodeInfo(ctxt:TxmlParserCtxtPtr; info:TxmlParserNodeInfoPtr);cdecl;external libxml2;
procedure xmlSetExternalEntityLoader(f:TxmlExternalEntityLoader);cdecl;external libxml2;
function xmlGetExternalEntityLoader:TxmlExternalEntityLoader;cdecl;external libxml2;
function xmlLoadExternalEntity(URL:Pchar; ID:Pchar; ctxt:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;external libxml2;
function xmlByteConsumed(ctxt:TxmlParserCtxtPtr):longint;cdecl;external libxml2;
type
  PxmlParserOption = ^TxmlParserOption;
  TxmlParserOption =  Longint;
  Const
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

procedure xmlCtxtReset(ctxt:TxmlParserCtxtPtr);cdecl;external libxml2;
function xmlCtxtResetPush(ctxt:TxmlParserCtxtPtr; chunk:Pchar; size:longint; filename:Pchar; encoding:Pchar):longint;cdecl;external libxml2;
function xmlCtxtUseOptions(ctxt:TxmlParserCtxtPtr; options:longint):longint;cdecl;external libxml2;
function xmlReadDoc(cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlReadFile(URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlReadMemory(buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlReadFd(fd:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlReadIO(ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; encoding:Pchar;            options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlCtxtReadDoc(ctxt:TxmlParserCtxtPtr; cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlCtxtReadFile(ctxt:TxmlParserCtxtPtr; filename:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlCtxtReadMemory(ctxt:TxmlParserCtxtPtr; buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar;                             options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlCtxtReadFd(ctxt:TxmlParserCtxtPtr; fd:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
function xmlCtxtReadIO(ctxt:TxmlParserCtxtPtr; ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar;            encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external libxml2;
type
  PxmlFeature = ^TxmlFeature;
  TxmlFeature =  Longint;
  Const
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


function xmlHasFeature(feature:TxmlFeature):longint;cdecl;external libxml2;

// === Konventiert am: 26-2-25 15:33:01 ===


implementation



end.
