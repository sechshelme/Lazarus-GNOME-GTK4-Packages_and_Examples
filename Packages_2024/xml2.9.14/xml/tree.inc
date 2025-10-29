{$IFDEF read_interface}

const
  BASE_BUFFER_SIZE = 4096;

type
  PxmlBufferAllocationScheme = ^TxmlBufferAllocationScheme;
  TxmlBufferAllocationScheme = longint;

const
  XML_BUFFER_ALLOC_DOUBLEIT = 0;
  XML_BUFFER_ALLOC_EXACT = 1;
  XML_BUFFER_ALLOC_IMMUTABLE = 2;
  XML_BUFFER_ALLOC_IO = 3;
  XML_BUFFER_ALLOC_HYBRID = 4;
  XML_BUFFER_ALLOC_BOUNDED = 5;

type
  TxmlBuffer = record
    content: PxmlChar;
    use: dword;
    size: dword;
    alloc: TxmlBufferAllocationScheme;
    contentIO: PxmlChar;
  end;
  PxmlBuffer = ^TxmlBuffer;

  TxmlBuf = record
  end;
  PxmlBuf = ^TxmlBuf;

function xmlBufContent(buf: PxmlBuf): PxmlChar; cdecl; external libxml2;
function xmlBufEnd(buf: PxmlBuf): PxmlChar; cdecl; external libxml2;
function xmlBufUse(buf: PxmlBuf): Tsize_t; cdecl; external libxml2;
function xmlBufShrink(buf: PxmlBuf; len: Tsize_t): Tsize_t; cdecl; external libxml2;

type
  PxmlElementType = ^TxmlElementType;
  TxmlElementType = longint;

const
  XML_ELEMENT_NODE = 1;
  XML_ATTRIBUTE_NODE = 2;
  XML_TEXT_NODE = 3;
  XML_CDATA_SECTION_NODE = 4;
  XML_ENTITY_REF_NODE = 5;
  XML_ENTITY_NODE = 6;
  XML_PI_NODE = 7;
  XML_COMMENT_NODE = 8;
  XML_DOCUMENT_NODE = 9;
  XML_DOCUMENT_TYPE_NODE = 10;
  XML_DOCUMENT_FRAG_NODE = 11;
  XML_NOTATION_NODE = 12;
  XML_HTML_DOCUMENT_NODE = 13;
  XML_DTD_NODE = 14;
  XML_ELEMENT_DECL = 15;
  XML_ATTRIBUTE_DECL = 16;
  XML_ENTITY_DECL = 17;
  XML_NAMESPACE_DECL = 18;
  XML_XINCLUDE_START = 19;
  XML_XINCLUDE_END = 20;
  XML_DOCB_DOCUMENT_NODE = 21;

const
  XML_LOCAL_NAMESPACE = XML_NAMESPACE_DECL;

type
  PxmlAttributeType = ^TxmlAttributeType;
  TxmlAttributeType = longint;

const
  XML_ATTRIBUTE_CDATA = 1;
  XML_ATTRIBUTE_ID = 2;
  XML_ATTRIBUTE_IDREF = 3;
  XML_ATTRIBUTE_IDREFS = 4;
  XML_ATTRIBUTE_ENTITY = 5;
  XML_ATTRIBUTE_ENTITIES = 6;
  XML_ATTRIBUTE_NMTOKEN = 7;
  XML_ATTRIBUTE_NMTOKENS = 8;
  XML_ATTRIBUTE_ENUMERATION = 9;
  XML_ATTRIBUTE_NOTATION = 10;

type
  PxmlAttributeDefault = ^TxmlAttributeDefault;
  TxmlAttributeDefault = longint;

const
  XML_ATTRIBUTE_NONE = 1;
  XML_ATTRIBUTE_REQUIRED = 2;
  XML_ATTRIBUTE_IMPLIED = 3;
  XML_ATTRIBUTE_FIXED = 4;

type
  PxmlElementContentType = ^TxmlElementContentType;
  TxmlElementContentType = longint;

const
  XML_ELEMENT_CONTENT_PCDATA = 1;
  XML_ELEMENT_CONTENT_ELEMENT = 2;
  XML_ELEMENT_CONTENT_SEQ = 3;
  XML_ELEMENT_CONTENT_OR = 4;

type
  PxmlElementContentOccur = ^TxmlElementContentOccur;
  TxmlElementContentOccur = longint;

const
  XML_ELEMENT_CONTENT_ONCE = 1;
  XML_ELEMENT_CONTENT_OPT = 2;
  XML_ELEMENT_CONTENT_MULT = 3;
  XML_ELEMENT_CONTENT_PLUS = 4;

type
  PxmlElementTypeVal = ^TxmlElementTypeVal;
  TxmlElementTypeVal = longint;

const
  XML_ELEMENT_TYPE_UNDEFINED = 0;
  XML_ELEMENT_TYPE_EMPTY = 1;
  XML_ELEMENT_TYPE_ANY = 2;
  XML_ELEMENT_TYPE_MIXED = 3;
  XML_ELEMENT_TYPE_ELEMENT = 4;

type
  PxmlDocProperties = ^TxmlDocProperties;
  TxmlDocProperties = longint;

const
  XML_DOC_WELLFORMED = 1 shl 0;
  XML_DOC_NSVALID = 1 shl 1;
  XML_DOC_OLD10 = 1 shl 2;
  XML_DOC_DTDVALID = 1 shl 3;
  XML_DOC_XINCLUDE = 1 shl 4;
  XML_DOC_USERBUILT = 1 shl 5;
  XML_DOC_INTERNAL = 1 shl 6;
  XML_DOC_HTML = 1 shl 7;

type
  PxmlNode = ^TxmlNode;
  PxmlDtd = ^TxmlDtd;
  PxmlDoc = ^TxmlDoc;
  PPxmlDoc = ^PxmlDoc;
  PxmlNs = ^TxmlNs;
  PPxmlNs = ^PxmlNs;

  TxmlNotation = record
    Name: PxmlChar;
    PublicID: PxmlChar;
    SystemID: PxmlChar;
  end;
  PxmlNotation = ^TxmlNotation;

  PxmlEnumeration = ^TxmlEnumeration;
  PPxmlEnumeration = ^PxmlEnumeration;
  TxmlEnumeration = record
    Next: PxmlEnumeration;
    Name: PxmlChar;
  end;

  PxmlAttribute = ^TxmlAttribute;
  TxmlAttribute = record
    _private: pointer;
    _type: TxmlElementType;
    Name: PxmlChar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlDtd;
    Next: PxmlNode;
    prev: PxmlNode;
    doc: PxmlDoc;
    nexth: PxmlAttribute;
    atype: TxmlAttributeType;
    def: TxmlAttributeDefault;
    defaultValue: PxmlChar;
    tree: PxmlEnumeration;
    prefix: PxmlChar;
    elem: PxmlChar;
  end;

  PxmlElementContent = ^TxmlElementContent;
  PPxmlElementContent = ^PxmlElementContent;
  TxmlElementContent = record
    _type: TxmlElementContentType;
    ocur: TxmlElementContentOccur;
    Name: PxmlChar;
    c1: PxmlElementContent;
    c2: PxmlElementContent;
    parent: PxmlElementContent;
    prefix: PxmlChar;
  end;

  TxmlElement = record
    _private: pointer;
    _type: TxmlElementType;
    Name: PxmlChar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlDtd;
    Next: PxmlNode;
    prev: PxmlNode;
    doc: PxmlDoc;
    etype: TxmlElementTypeVal;
    content: PxmlElementContent;
    attributes: PxmlAttribute;
    prefix: PxmlChar;
    contModel: pointer;
  end;
  PxmlElement = ^TxmlElement;

  PxmlNsType = ^TxmlNsType;
  TxmlNsType = TxmlElementType;

  TxmlNs = record
    Next: PxmlNs;
    _type: TxmlNsType;
    href: PxmlChar;
    prefix: PxmlChar;
    _private: pointer;
    context: PxmlDoc;
  end;

  TxmlDtd = record
    _private: pointer;
    _type: TxmlElementType;
    Name: PxmlChar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlDoc;
    Next: PxmlNode;
    prev: PxmlNode;
    doc: PxmlDoc;
    notations: pointer;
    elements: pointer;
    attributes: pointer;
    entities: pointer;
    ExternalID: PxmlChar;
    SystemID: PxmlChar;
    pentities: pointer;
  end;

  PxmlAttr = ^TxmlAttr;
  TxmlAttr = record
    _private: pointer;
    _type: TxmlElementType;
    Name: PxmlChar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlNode;
    Next: PxmlAttr;
    prev: PxmlAttr;
    doc: PxmlDoc;
    ns: PxmlNs;
    atype: TxmlAttributeType;
    psvi: pointer;
  end;

  PxmlID = ^TxmlID;
  TxmlID = record
    Next: PxmlID;
    Value: PxmlChar;
    attr: PxmlAttr;
    Name: PxmlChar;
    lineno: longint;
    doc: PxmlDoc;
  end;

  PxmlRef = ^TxmlRef;
  TxmlRef = record
    Next: PxmlRef;
    Value: PxmlChar;
    attr: PxmlAttr;
    Name: PxmlChar;
    lineno: longint;
  end;

  PPxmlNode = ^PxmlNode;
  TxmlNode = record
    _private: pointer;
    _type: TxmlElementType;
    Name: PxmlChar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlNode;
    Next: PxmlNode;
    prev: PxmlNode;
    doc: PxmlDoc;
    ns: PxmlNs;
    content: PxmlChar;
    properties: PxmlAttr;
    nsDef: PxmlNs;
    psvi: pointer;
    line: word;
    extra: word;
  end;

  TxmlDoc = record
    _private: pointer;
    _type: TxmlElementType;
    Name: pchar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlNode;
    Next: PxmlNode;
    prev: PxmlNode;
    doc: PxmlDoc;
    compression: longint;
    standalone: longint;
    intSubset: PxmlDtd;
    extSubset: PxmlDtd;
    oldNs: PxmlNs;
    version: PxmlChar;
    encoding: PxmlChar;
    ids: pointer;
    refs: pointer;
    URL: PxmlChar;
    charset: longint;
    dict: PxmlDict;
    psvi: pointer;
    parseFlags: longint;
    properties: longint;
  end;

  PxmlDOMWrapCtxt = ^TxmlDOMWrapCtxt;
  TxmlDOMWrapAcquireNsFunction = function(ctxt: PxmlDOMWrapCtxt; node: PxmlNode; nsName: PxmlChar; nsPrefix: PxmlChar): PxmlNs; cdecl;
  TxmlDOMWrapCtxt = record
    _private: pointer;
    _type: longint;
    namespaceMap: pointer;
    getNsForNodeFunc: TxmlDOMWrapAcquireNsFunction;
  end;

function xmlValidateNCName(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;

function xmlValidateQName(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;
function xmlValidateName(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;
function xmlValidateNMToken(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;

function xmlBuildQName(ncname: PxmlChar; prefix: PxmlChar; memory: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlSplitQName2(Name: PxmlChar; prefix: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlSplitQName3(Name: PxmlChar; len: Plongint): PxmlChar; cdecl; external libxml2;

procedure xmlSetBufferAllocationScheme(scheme: TxmlBufferAllocationScheme); cdecl; external libxml2;
function xmlGetBufferAllocationScheme: TxmlBufferAllocationScheme; cdecl; external libxml2;
function xmlBufferCreate: PxmlBuffer; cdecl; external libxml2;
function xmlBufferCreateSize(size: Tsize_t): PxmlBuffer; cdecl; external libxml2;
function xmlBufferCreateStatic(mem: pointer; size: Tsize_t): PxmlBuffer; cdecl; external libxml2;
function xmlBufferResize(buf: PxmlBuffer; size: dword): longint; cdecl; external libxml2;
procedure xmlBufferFree(buf: PxmlBuffer); cdecl; external libxml2;
function xmlBufferDump(file_: PFILE; buf: PxmlBuffer): longint; cdecl; external libxml2;
function xmlBufferAdd(buf: PxmlBuffer; str: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlBufferAddHead(buf: PxmlBuffer; str: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlBufferCat(buf: PxmlBuffer; str: PxmlChar): longint; cdecl; external libxml2;
function xmlBufferCCat(buf: PxmlBuffer; str: pchar): longint; cdecl; external libxml2;
function xmlBufferShrink(buf: PxmlBuffer; len: dword): longint; cdecl; external libxml2;
function xmlBufferGrow(buf: PxmlBuffer; len: dword): longint; cdecl; external libxml2;
procedure xmlBufferEmpty(buf: PxmlBuffer); cdecl; external libxml2;
function xmlBufferContent(buf: PxmlBuffer): PxmlChar; cdecl; external libxml2;
function xmlBufferDetach(buf: PxmlBuffer): PxmlChar; cdecl; external libxml2;
procedure xmlBufferSetAllocationScheme(buf: PxmlBuffer; scheme: TxmlBufferAllocationScheme); cdecl; external libxml2;
function xmlBufferLength(buf: PxmlBuffer): longint; cdecl; external libxml2;
function xmlCreateIntSubset(doc: PxmlDoc; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar): PxmlDtd; cdecl; external libxml2;
function xmlNewDtd(doc: PxmlDoc; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar): PxmlDtd; cdecl; external libxml2;
function xmlGetIntSubset(doc: PxmlDoc): PxmlDtd; cdecl; external libxml2;
procedure xmlFreeDtd(cur: PxmlDtd); cdecl; external libxml2;
function xmlNewGlobalNs(doc: PxmlDoc; href: PxmlChar; prefix: PxmlChar): PxmlNs; cdecl; external libxml2;

function xmlNewNs(node: PxmlNode; href: PxmlChar; prefix: PxmlChar): PxmlNs; cdecl; external libxml2;
procedure xmlFreeNs(cur: PxmlNs); cdecl; external libxml2;
procedure xmlFreeNsList(cur: PxmlNs); cdecl; external libxml2;
function xmlNewDoc(version: PxmlChar): PxmlDoc; cdecl; external libxml2;
procedure xmlFreeDoc(cur: PxmlDoc); cdecl; external libxml2;
function xmlNewDocProp(doc: PxmlDoc; Name: PxmlChar; Value: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlNewProp(node: PxmlNode; Name: PxmlChar; Value: PxmlChar): PxmlAttr; cdecl; external libxml2;

function xmlNewNsProp(node: PxmlNode; ns: PxmlNs; Name: PxmlChar; Value: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlNewNsPropEatName(node: PxmlNode; ns: PxmlNs; Name: PxmlChar; Value: PxmlChar): PxmlAttr; cdecl; external libxml2;
procedure xmlFreePropList(cur: PxmlAttr); cdecl; external libxml2;
procedure xmlFreeProp(cur: PxmlAttr); cdecl; external libxml2;
function xmlCopyProp(target: PxmlNode; cur: PxmlAttr): PxmlAttr; cdecl; external libxml2;
function xmlCopyPropList(target: PxmlNode; cur: PxmlAttr): PxmlAttr; cdecl; external libxml2;
function xmlCopyDtd(dtd: PxmlDtd): PxmlDtd; cdecl; external libxml2;
function xmlCopyDoc(doc: PxmlDoc; recursive: longint): PxmlDoc; cdecl; external libxml2;

function xmlNewDocNode(doc: PxmlDoc; ns: PxmlNs; Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewDocNodeEatName(doc: PxmlDoc; ns: PxmlNs; Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewNode(ns: PxmlNs; Name: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewNodeEatName(ns: PxmlNs; Name: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewChild(parent: PxmlNode; ns: PxmlNs; Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewDocText(doc: PxmlDoc; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewText(content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewDocPI(doc: PxmlDoc; Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewPI(Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewDocTextLen(doc: PxmlDoc; content: PxmlChar; len: longint): PxmlNode; cdecl; external libxml2;
function xmlNewTextLen(content: PxmlChar; len: longint): PxmlNode; cdecl; external libxml2;
function xmlNewDocComment(doc: PxmlDoc; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewComment(content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewCDataBlock(doc: PxmlDoc; content: PxmlChar; len: longint): PxmlNode; cdecl; external libxml2;
function xmlNewCharRef(doc: PxmlDoc; Name: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewReference(doc: PxmlDoc; Name: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlCopyNode(node: PxmlNode; recursive: longint): PxmlNode; cdecl; external libxml2;
function xmlDocCopyNode(node: PxmlNode; doc: PxmlDoc; recursive: longint): PxmlNode; cdecl; external libxml2;
function xmlDocCopyNodeList(doc: PxmlDoc; node: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlCopyNodeList(node: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlNewTextChild(parent: PxmlNode; ns: PxmlNs; Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewDocRawNode(doc: PxmlDoc; ns: PxmlNs; Name: PxmlChar; content: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlNewDocFragment(doc: PxmlDoc): PxmlNode; cdecl; external libxml2;

function xmlGetLineNo(node: PxmlNode): Tclong; cdecl; external libxml2;
function xmlGetNodePath(node: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlDocGetRootElement(doc: PxmlDoc): PxmlNode; cdecl; external libxml2;
function xmlGetLastChild(parent: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlNodeIsText(node: PxmlNode): longint; cdecl; external libxml2;
function xmlIsBlankNode(node: PxmlNode): longint; cdecl; external libxml2;
function xmlDocSetRootElement(doc: PxmlDoc; root: PxmlNode): PxmlNode; cdecl; external libxml2;
procedure xmlNodeSetName(cur: PxmlNode; Name: PxmlChar); cdecl; external libxml2;
function xmlAddChild(parent: PxmlNode; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlAddChildList(parent: PxmlNode; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlReplaceNode(old: PxmlNode; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlAddPrevSibling(cur: PxmlNode; elem: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlAddSibling(cur: PxmlNode; elem: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlAddNextSibling(cur: PxmlNode; elem: PxmlNode): PxmlNode; cdecl; external libxml2;
procedure xmlUnlinkNode(cur: PxmlNode); cdecl; external libxml2;
function xmlTextMerge(First: PxmlNode; second: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlTextConcat(node: PxmlNode; content: PxmlChar; len: longint): longint; cdecl; external libxml2;
procedure xmlFreeNodeList(cur: PxmlNode); cdecl; external libxml2;
procedure xmlFreeNode(cur: PxmlNode); cdecl; external libxml2;
procedure xmlSetTreeDoc(tree: PxmlNode; doc: PxmlDoc); cdecl; external libxml2;
procedure xmlSetListDoc(list: PxmlNode; doc: PxmlDoc); cdecl; external libxml2;
function xmlSearchNs(doc: PxmlDoc; node: PxmlNode; nameSpace: PxmlChar): PxmlNs; cdecl; external libxml2;
function xmlSearchNsByHref(doc: PxmlDoc; node: PxmlNode; href: PxmlChar): PxmlNs; cdecl; external libxml2;
function xmlGetNsList(doc: PxmlDoc; node: PxmlNode): PPxmlNs; cdecl; external libxml2;
procedure xmlSetNs(node: PxmlNode; ns: PxmlNs); cdecl; external libxml2;
function xmlCopyNamespace(cur: PxmlNs): PxmlNs; cdecl; external libxml2;
function xmlCopyNamespaceList(cur: PxmlNs): PxmlNs; cdecl; external libxml2;
function xmlSetProp(node: PxmlNode; Name: PxmlChar; Value: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlSetNsProp(node: PxmlNode; ns: PxmlNs; Name: PxmlChar; Value: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlGetNoNsProp(node: PxmlNode; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlGetProp(node: PxmlNode; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlHasProp(node: PxmlNode; Name: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlHasNsProp(node: PxmlNode; Name: PxmlChar; nameSpace: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlGetNsProp(node: PxmlNode; Name: PxmlChar; nameSpace: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStringGetNodeList(doc: PxmlDoc; Value: PxmlChar): PxmlNode; cdecl; external libxml2;
function xmlStringLenGetNodeList(doc: PxmlDoc; Value: PxmlChar; len: longint): PxmlNode; cdecl; external libxml2;
function xmlNodeListGetString(doc: PxmlDoc; list: PxmlNode; inLine_: longint): PxmlChar; cdecl; external libxml2;
function xmlNodeListGetRawString(doc: PxmlDoc; list: PxmlNode; inLine_: longint): PxmlChar; cdecl; external libxml2;
procedure xmlNodeSetContent(cur: PxmlNode; content: PxmlChar); cdecl; external libxml2;
procedure xmlNodeSetContentLen(cur: PxmlNode; content: PxmlChar; len: longint); cdecl; external libxml2;
procedure xmlNodeAddContent(cur: PxmlNode; content: PxmlChar); cdecl; external libxml2;
procedure xmlNodeAddContentLen(cur: PxmlNode; content: PxmlChar; len: longint); cdecl; external libxml2;
function xmlNodeGetContent(cur: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlNodeBufGetContent(buffer: PxmlBuffer; cur: PxmlNode): longint; cdecl; external libxml2;
function xmlBufGetNodeContent(buf: PxmlBuf; cur: PxmlNode): longint; cdecl; external libxml2;
function xmlNodeGetLang(cur: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlNodeGetSpacePreserve(cur: PxmlNode): longint; cdecl; external libxml2;
procedure xmlNodeSetLang(cur: PxmlNode; lang: PxmlChar); cdecl; external libxml2;
procedure xmlNodeSetSpacePreserve(cur: PxmlNode; val: longint); cdecl; external libxml2;
function xmlNodeGetBase(doc: PxmlDoc; cur: PxmlNode): PxmlChar; cdecl; external libxml2;
procedure xmlNodeSetBase(cur: PxmlNode; uri: PxmlChar); cdecl; external libxml2;
function xmlRemoveProp(cur: PxmlAttr): longint; cdecl; external libxml2;
function xmlUnsetNsProp(node: PxmlNode; ns: PxmlNs; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlUnsetProp(node: PxmlNode; Name: PxmlChar): longint; cdecl; external libxml2;
procedure xmlBufferWriteCHAR(buf: PxmlBuffer; _string: PxmlChar); cdecl; external libxml2;
procedure xmlBufferWriteChar(buf: PxmlBuffer; _string: pchar); cdecl; external libxml2;
procedure xmlBufferWriteQuotedString(buf: PxmlBuffer; _string: PxmlChar); cdecl; external libxml2;
procedure xmlAttrSerializeTxtContent(buf: PxmlBuffer; doc: PxmlDoc; attr: PxmlAttr; _string: PxmlChar); cdecl; external libxml2;
function xmlReconciliateNs(doc: PxmlDoc; tree: PxmlNode): longint; cdecl; external libxml2;
procedure xmlDocDumpFormatMemory(cur: PxmlDoc; mem: PPxmlChar; size: Plongint; format: longint); cdecl; external libxml2;
procedure xmlDocDumpMemory(cur: PxmlDoc; mem: PPxmlChar; size: Plongint); cdecl; external libxml2;
procedure xmlDocDumpMemoryEnc(out_doc: PxmlDoc; doc_txt_ptr: PPxmlChar; doc_txt_len: Plongint; txt_encoding: pchar); cdecl; external libxml2;
procedure xmlDocDumpFormatMemoryEnc(out_doc: PxmlDoc; doc_txt_ptr: PPxmlChar; doc_txt_len: Plongint; txt_encoding: pchar; format: longint); cdecl; external libxml2;
function xmlDocFormatDump(f: PFILE; cur: PxmlDoc; format: longint): longint; cdecl; external libxml2;
function xmlDocDump(f: PFILE; cur: PxmlDoc): longint; cdecl; external libxml2;
procedure xmlElemDump(f: PFILE; doc: PxmlDoc; cur: PxmlNode); cdecl; external libxml2;
function xmlSaveFile(filename: pchar; cur: PxmlDoc): longint; cdecl; external libxml2;
function xmlSaveFormatFile(filename: pchar; cur: PxmlDoc; format: longint): longint; cdecl; external libxml2;
function xmlBufNodeDump(buf: PxmlBuf; doc: PxmlDoc; cur: PxmlNode; level: longint; format: longint): Tsize_t; cdecl; external libxml2;
function xmlNodeDump(buf: PxmlBuffer; doc: PxmlDoc; cur: PxmlNode; level: longint; format: longint): longint; cdecl; external libxml2;
// Wegen circular
//function xmlSaveFileTo(buf: PxmlOutputBuffer; cur: PxmlDoc; encoding: pchar): longint; cdecl; external libxml2;
//function xmlSaveFormatFileTo(buf: PxmlOutputBuffer; cur: PxmlDoc; encoding: pchar; format: longint): longint; cdecl; external libxml2;
//procedure xmlNodeDumpOutput(buf: PxmlOutputBuffer; doc: PxmlDoc; cur: PxmlNode; level: longint; format: longint; encoding: pchar); cdecl; external libxml2;
function xmlSaveFileTo(buf: Pointer; cur: PxmlDoc; encoding: pchar): longint; cdecl; external libxml2;
function xmlSaveFormatFileTo(buf: Pointer; cur: PxmlDoc; encoding: pchar; format: longint): longint; cdecl; external libxml2;
procedure xmlNodeDumpOutput(buf: Pointer; doc: PxmlDoc; cur: PxmlNode; level: longint; format: longint; encoding: pchar); cdecl; external libxml2;
function xmlSaveFormatFileEnc(filename: pchar; cur: PxmlDoc; encoding: pchar; format: longint): longint; cdecl; external libxml2;
function xmlSaveFileEnc(filename: pchar; cur: PxmlDoc; encoding: pchar): longint; cdecl; external libxml2;
function xmlIsXHTML(systemID: PxmlChar; publicID: PxmlChar): longint; cdecl; external libxml2;
function xmlGetDocCompressMode(doc: PxmlDoc): longint; cdecl; external libxml2;
procedure xmlSetDocCompressMode(doc: PxmlDoc; mode: longint); cdecl; external libxml2;
function xmlGetCompressMode: longint; cdecl; external libxml2;
procedure xmlSetCompressMode(mode: longint); cdecl; external libxml2;
function xmlDOMWrapNewCtxt: PxmlDOMWrapCtxt; cdecl; external libxml2;
procedure xmlDOMWrapFreeCtxt(ctxt: PxmlDOMWrapCtxt); cdecl; external libxml2;
function xmlDOMWrapReconcileNamespaces(ctxt: PxmlDOMWrapCtxt; elem: PxmlNode; options: longint): longint; cdecl; external libxml2;
function xmlDOMWrapAdoptNode(ctxt: PxmlDOMWrapCtxt; sourceDoc: PxmlDoc; node: PxmlNode; destDoc: PxmlDoc; destParent: PxmlNode;
  options: longint): longint; cdecl; external libxml2;
function xmlDOMWrapRemoveNode(ctxt: PxmlDOMWrapCtxt; doc: PxmlDoc; node: PxmlNode; options: longint): longint; cdecl; external libxml2;
function xmlDOMWrapCloneNode(ctxt: PxmlDOMWrapCtxt; sourceDoc: PxmlDoc; node: PxmlNode; clonedNode: PPxmlNode; destDoc: PxmlDoc;
  destParent: PxmlNode; deep: longint; options: longint): longint; cdecl; external libxml2;
function xmlChildElementCount(parent: PxmlNode): Tculong; cdecl; external libxml2;
function xmlNextElementSibling(node: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlFirstElementChild(parent: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlLastElementChild(parent: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlPreviousElementSibling(node: PxmlNode): PxmlNode; cdecl; external libxml2;

const
  XML_XML_NAMESPACE: PxmlChar = 'http://www.w3.org/XML/1998/namespace';
  XML_XML_ID: PxmlChar = 'xml:id';

function XML_GET_CONTENT(n: PxmlNode): PxmlChar;
function XML_GET_LINE(n: PxmlNode): longint;


// === Konventiert am: 26-2-25 16:28:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function XML_GET_CONTENT(n: PxmlNode): PxmlChar;
begin
  if n^._type = XML_ELEMENT_NODE then begin
    Result := nil;
  end else begin
    Result := n^.content;
  end;
end;

function XML_GET_LINE(n: PxmlNode): longint;
begin
  XML_GET_LINE := xmlGetLineNo(n);
end;


{$ENDIF read_implementation}
