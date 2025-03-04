unit tree;

interface

uses
  ctypes, xml2_common, xmlstring, dict;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // --- Pointer wegen circular
type
//  PxmlParserInputBufferPtr = ^TxmlParserInputBufferPtr;
  //  TxmlParserInputBufferPtr = PxmlParserInputBuffer;
  TxmlParserInputBufferPtr = Pointer;

//  PxmlOutputBufferPtr = ^TxmlOutputBufferPtr;
  //  TxmlOutputBufferPtr = PxmlOutputBuffer;
  TxmlOutputBufferPtr = Pointer;

  PxmlParserInputPtr = ^TxmlParserInputPtr;
  //  TxmlParserInputPtr = PxmlParserInput;
  TxmlParserInputPtr = Pointer;

//  PxmlParserCtxtPtr = ^TxmlParserCtxtPtr;
  //  TxmlParserCtxtPtr = PxmlParserCtxt;
  TxmlParserCtxtPtr = Pointer;

//  PxmlSAXLocatorPtr = ^TxmlSAXLocatorPtr;
  //  TxmlSAXLocatorPtr = PxmlSAXLocator;
  TxmlSAXLocatorPtr = Pointer;

  PxmlSAXHandlerPtr = ^TxmlSAXHandlerPtr;
  //  TxmlSAXHandlerPtr = PxmlSAXHandler;
  TxmlSAXHandlerPtr = Pointer;

//  PxmlEntityPtr = ^TxmlEntityPtr;
  //  TxmlEntityPtr = PxmlEntity;
  TxmlEntityPtr = Pointer;


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
  PxmlBuffer = ^TxmlBuffer;
  PxmlBufferPtr = ^TxmlBufferPtr;
  TxmlBufferPtr = PxmlBuffer;

  TxmlBuffer = record
    content: PxmlChar;
    use: dword;
    size: dword;
    alloc: TxmlBufferAllocationScheme;
    contentIO: PxmlChar;
  end;

  TxmlBuf = record
  end;
  PxmlBuf = ^TxmlBuf;

  PxmlBufPtr = ^TxmlBufPtr;
  TxmlBufPtr = PxmlBuf;

function xmlBufContent(buf: PxmlBuf): PxmlChar; cdecl; external libxml2;
function xmlBufEnd(buf: TxmlBufPtr): PxmlChar; cdecl; external libxml2;
function xmlBufUse(buf: TxmlBufPtr): Tsize_t; cdecl; external libxml2;
function xmlBufShrink(buf: TxmlBufPtr; len: Tsize_t): Tsize_t; cdecl; external libxml2;

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
  // -----------
type
  PxmlNode = ^TxmlNode;
  PxmlDtd = ^TxmlDtd;
  PxmlDoc = ^TxmlDoc;
  PxmlNs = ^TxmlNs;
  // ----

  PxmlNotation = ^TxmlNotation;
  PxmlNotationPtr = ^TxmlNotationPtr;
  TxmlNotationPtr = PxmlNotation;

  TxmlNotation = record
    Name: PxmlChar;
    PublicID: PxmlChar;
    SystemID: PxmlChar;
  end;

  PxmlEnumeration = ^TxmlEnumeration;
  PxmlEnumerationPtr = ^TxmlEnumerationPtr;
  TxmlEnumerationPtr = PxmlEnumeration;

  TxmlEnumeration = record
    Next: PxmlEnumeration;
    Name: PxmlChar;
  end;

  PxmlAttribute = ^TxmlAttribute;
  PxmlAttributePtr = ^TxmlAttributePtr;
  TxmlAttributePtr = PxmlAttribute;

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
    tree: TxmlEnumerationPtr;
    prefix: PxmlChar;
    elem: PxmlChar;
  end;

  PxmlElementContent = ^TxmlElementContent;
  PxmlElementContentPtr = ^TxmlElementContentPtr;
  TxmlElementContentPtr = PxmlElementContent;

  TxmlElementContent = record
    _type: TxmlElementContentType;
    ocur: TxmlElementContentOccur;
    Name: PxmlChar;
    c1: PxmlElementContent;
    c2: PxmlElementContent;
    parent: PxmlElementContent;
    prefix: PxmlChar;
  end;

  PxmlElement = ^TxmlElement;
  PxmlElementPtr = ^TxmlElementPtr;
  TxmlElementPtr = PxmlElement;

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
    content: TxmlElementContentPtr;
    attributes: TxmlAttributePtr;
    prefix: PxmlChar;
    //      contModel : TxmlRegexpPtr;
    contModel: pointer;
  end;

  PxmlNsType = ^TxmlNsType;
  TxmlNsType = TxmlElementType;

  PxmlNsPtr = ^TxmlNsPtr;
  TxmlNsPtr = PxmlNs;

  TxmlNs = record
    Next: PxmlNs;
    _type: TxmlNsType;
    href: PxmlChar;
    prefix: PxmlChar;
    _private: pointer;
    context: PxmlDoc;
  end;

  PxmlDtdPtr = ^TxmlDtdPtr;
  TxmlDtdPtr = PxmlDtd;

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
  PxmlAttrPtr = ^TxmlAttrPtr;
  TxmlAttrPtr = PxmlAttr;

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
  PxmlIDPtr = ^TxmlIDPtr;
  TxmlIDPtr = PxmlID;

  TxmlID = record
    Next: PxmlID;
    Value: PxmlChar;
    attr: TxmlAttrPtr;
    Name: PxmlChar;
    lineno: longint;
    doc: PxmlDoc;
  end;

  PxmlRef = ^TxmlRef;
  PxmlRefPtr = ^TxmlRefPtr;
  TxmlRefPtr = PxmlRef;

  TxmlRef = record
    Next: PxmlRef;
    Value: PxmlChar;
    attr: TxmlAttrPtr;
    Name: PxmlChar;
    lineno: longint;
  end;

  PxmlNodePtr = ^TxmlNodePtr;
  TxmlNodePtr = PxmlNode;

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

  PxmlDocPtr = ^TxmlDocPtr;
  TxmlDocPtr = PxmlDoc;

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
  TxmlDOMWrapCtxtPtr = PxmlDOMWrapCtxt;
  TxmlDOMWrapAcquireNsFunction = function(ctxt: TxmlDOMWrapCtxtPtr; node: TxmlNodePtr; nsName: PxmlChar; nsPrefix: PxmlChar): TxmlNsPtr; cdecl;

  TxmlDOMWrapCtxt = record
    _private: pointer;
    _type: longint;
    namespaceMap: pointer;
    getNsForNodeFunc: TxmlDOMWrapAcquireNsFunction;
  end;
  PxmlDOMWrapCtxtPtr = ^TxmlDOMWrapCtxtPtr;

function xmlValidateNCName(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;

function xmlValidateQName(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;
function xmlValidateName(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;
function xmlValidateNMToken(Value: PxmlChar; space: longint): longint; cdecl; external libxml2;

function xmlBuildQName(ncname: PxmlChar; prefix: PxmlChar; memory: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlSplitQName2(Name: PxmlChar; prefix: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlSplitQName3(Name: PxmlChar; len: Plongint): PxmlChar; cdecl; external libxml2;

procedure xmlSetBufferAllocationScheme(scheme: TxmlBufferAllocationScheme); cdecl; external libxml2;
function xmlGetBufferAllocationScheme: TxmlBufferAllocationScheme; cdecl; external libxml2;
function xmlBufferCreate: TxmlBufferPtr; cdecl; external libxml2;
function xmlBufferCreateSize(size: Tsize_t): TxmlBufferPtr; cdecl; external libxml2;
function xmlBufferCreateStatic(mem: pointer; size: Tsize_t): TxmlBufferPtr; cdecl; external libxml2;
function xmlBufferResize(buf: TxmlBufferPtr; size: dword): longint; cdecl; external libxml2;
procedure xmlBufferFree(buf: TxmlBufferPtr); cdecl; external libxml2;
function xmlBufferDump(file_: PFILE; buf: TxmlBufferPtr): longint; cdecl; external libxml2;
function xmlBufferAdd(buf: TxmlBufferPtr; str: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlBufferAddHead(buf: TxmlBufferPtr; str: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlBufferCat(buf: TxmlBufferPtr; str: PxmlChar): longint; cdecl; external libxml2;
function xmlBufferCCat(buf: TxmlBufferPtr; str: pchar): longint; cdecl; external libxml2;
function xmlBufferShrink(buf: TxmlBufferPtr; len: dword): longint; cdecl; external libxml2;
function xmlBufferGrow(buf: TxmlBufferPtr; len: dword): longint; cdecl; external libxml2;
procedure xmlBufferEmpty(buf: TxmlBufferPtr); cdecl; external libxml2;
function xmlBufferContent(buf: PxmlBuffer): PxmlChar; cdecl; external libxml2;
function xmlBufferDetach(buf: TxmlBufferPtr): PxmlChar; cdecl; external libxml2;
procedure xmlBufferSetAllocationScheme(buf: TxmlBufferPtr; scheme: TxmlBufferAllocationScheme); cdecl; external libxml2;
function xmlBufferLength(buf: PxmlBuffer): longint; cdecl; external libxml2;
function xmlCreateIntSubset(doc: TxmlDocPtr; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar): TxmlDtdPtr; cdecl; external libxml2;
function xmlNewDtd(doc: TxmlDocPtr; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar): TxmlDtdPtr; cdecl; external libxml2;
function xmlGetIntSubset(doc: PxmlDoc): TxmlDtdPtr; cdecl; external libxml2;
procedure xmlFreeDtd(cur: TxmlDtdPtr); cdecl; external libxml2;
function xmlNewGlobalNs(doc: TxmlDocPtr; href: PxmlChar; prefix: PxmlChar): TxmlNsPtr; cdecl; external libxml2;

function xmlNewNs(node: TxmlNodePtr; href: PxmlChar; prefix: PxmlChar): TxmlNsPtr; cdecl; external libxml2;
procedure xmlFreeNs(cur: TxmlNsPtr); cdecl; external libxml2;
procedure xmlFreeNsList(cur: TxmlNsPtr); cdecl; external libxml2;
function xmlNewDoc(version: PxmlChar): TxmlDocPtr; cdecl; external libxml2;
procedure xmlFreeDoc(cur: TxmlDocPtr); cdecl; external libxml2;
function xmlNewDocProp(doc: TxmlDocPtr; Name: PxmlChar; Value: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlNewProp(node: TxmlNodePtr; Name: PxmlChar; Value: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;

function xmlNewNsProp(node: TxmlNodePtr; ns: TxmlNsPtr; Name: PxmlChar; Value: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlNewNsPropEatName(node: TxmlNodePtr; ns: TxmlNsPtr; Name: PxmlChar; Value: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
procedure xmlFreePropList(cur: TxmlAttrPtr); cdecl; external libxml2;
procedure xmlFreeProp(cur: TxmlAttrPtr); cdecl; external libxml2;
function xmlCopyProp(target: TxmlNodePtr; cur: TxmlAttrPtr): TxmlAttrPtr; cdecl; external libxml2;
function xmlCopyPropList(target: TxmlNodePtr; cur: TxmlAttrPtr): TxmlAttrPtr; cdecl; external libxml2;
function xmlCopyDtd(dtd: TxmlDtdPtr): TxmlDtdPtr; cdecl; external libxml2;
function xmlCopyDoc(doc: TxmlDocPtr; recursive: longint): TxmlDocPtr; cdecl; external libxml2;

function xmlNewDocNode(doc: TxmlDocPtr; ns: TxmlNsPtr; Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocNodeEatName(doc: TxmlDocPtr; ns: TxmlNsPtr; Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewNode(ns: TxmlNsPtr; Name: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewNodeEatName(ns: TxmlNsPtr; Name: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewChild(parent: TxmlNodePtr; ns: TxmlNsPtr; Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocText(doc: PxmlDoc; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewText(content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocPI(doc: TxmlDocPtr; Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewPI(Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocTextLen(doc: TxmlDocPtr; content: PxmlChar; len: longint): TxmlNodePtr; cdecl; external libxml2;
function xmlNewTextLen(content: PxmlChar; len: longint): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocComment(doc: TxmlDocPtr; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewComment(content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewCDataBlock(doc: TxmlDocPtr; content: PxmlChar; len: longint): TxmlNodePtr; cdecl; external libxml2;
function xmlNewCharRef(doc: TxmlDocPtr; Name: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewReference(doc: PxmlDoc; Name: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlCopyNode(node: TxmlNodePtr; recursive: longint): TxmlNodePtr; cdecl; external libxml2;
function xmlDocCopyNode(node: TxmlNodePtr; doc: TxmlDocPtr; recursive: longint): TxmlNodePtr; cdecl; external libxml2;
function xmlDocCopyNodeList(doc: TxmlDocPtr; node: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlCopyNodeList(node: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlNewTextChild(parent: TxmlNodePtr; ns: TxmlNsPtr; Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocRawNode(doc: TxmlDocPtr; ns: TxmlNsPtr; Name: PxmlChar; content: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlNewDocFragment(doc: TxmlDocPtr): TxmlNodePtr; cdecl; external libxml2;

function xmlGetLineNo(node: PxmlNode): longint; cdecl; external libxml2;
function xmlGetNodePath(node: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlDocGetRootElement(doc: PxmlDoc): TxmlNodePtr; cdecl; external libxml2;
function xmlGetLastChild(parent: PxmlNode): TxmlNodePtr; cdecl; external libxml2;
function xmlNodeIsText(node: PxmlNode): longint; cdecl; external libxml2;
function xmlIsBlankNode(node: PxmlNode): longint; cdecl; external libxml2;
function xmlDocSetRootElement(doc: TxmlDocPtr; root: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
procedure xmlNodeSetName(cur: TxmlNodePtr; Name: PxmlChar); cdecl; external libxml2;
function xmlAddChild(parent: TxmlNodePtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlAddChildList(parent: TxmlNodePtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlReplaceNode(old: TxmlNodePtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlAddPrevSibling(cur: TxmlNodePtr; elem: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlAddSibling(cur: TxmlNodePtr; elem: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlAddNextSibling(cur: TxmlNodePtr; elem: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
procedure xmlUnlinkNode(cur: TxmlNodePtr); cdecl; external libxml2;
function xmlTextMerge(First: TxmlNodePtr; second: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlTextConcat(node: TxmlNodePtr; content: PxmlChar; len: longint): longint; cdecl; external libxml2;
procedure xmlFreeNodeList(cur: TxmlNodePtr); cdecl; external libxml2;
procedure xmlFreeNode(cur: TxmlNodePtr); cdecl; external libxml2;
procedure xmlSetTreeDoc(tree: TxmlNodePtr; doc: TxmlDocPtr); cdecl; external libxml2;
procedure xmlSetListDoc(list: TxmlNodePtr; doc: TxmlDocPtr); cdecl; external libxml2;
function xmlSearchNs(doc: TxmlDocPtr; node: TxmlNodePtr; nameSpace: PxmlChar): TxmlNsPtr; cdecl; external libxml2;
function xmlSearchNsByHref(doc: TxmlDocPtr; node: TxmlNodePtr; href: PxmlChar): TxmlNsPtr; cdecl; external libxml2;
function xmlGetNsList(doc: PxmlDoc; node: PxmlNode): PxmlNsPtr; cdecl; external libxml2;
procedure xmlSetNs(node: TxmlNodePtr; ns: TxmlNsPtr); cdecl; external libxml2;
function xmlCopyNamespace(cur: TxmlNsPtr): TxmlNsPtr; cdecl; external libxml2;
function xmlCopyNamespaceList(cur: TxmlNsPtr): TxmlNsPtr; cdecl; external libxml2;
function xmlSetProp(node: TxmlNodePtr; Name: PxmlChar; Value: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlSetNsProp(node: TxmlNodePtr; ns: TxmlNsPtr; Name: PxmlChar; Value: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlGetNoNsProp(node: PxmlNode; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlGetProp(node: PxmlNode; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlHasProp(node: PxmlNode; Name: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlHasNsProp(node: PxmlNode; Name: PxmlChar; nameSpace: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlGetNsProp(node: PxmlNode; Name: PxmlChar; nameSpace: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStringGetNodeList(doc: PxmlDoc; Value: PxmlChar): TxmlNodePtr; cdecl; external libxml2;
function xmlStringLenGetNodeList(doc: PxmlDoc; Value: PxmlChar; len: longint): TxmlNodePtr; cdecl; external libxml2;
function xmlNodeListGetString(doc: TxmlDocPtr; list: PxmlNode; inLine_: longint): PxmlChar; cdecl; external libxml2;
function xmlNodeListGetRawString(doc: PxmlDoc; list: PxmlNode; inLine_: longint): PxmlChar; cdecl; external libxml2;
procedure xmlNodeSetContent(cur: TxmlNodePtr; content: PxmlChar); cdecl; external libxml2;
procedure xmlNodeSetContentLen(cur: TxmlNodePtr; content: PxmlChar; len: longint); cdecl; external libxml2;
procedure xmlNodeAddContent(cur: TxmlNodePtr; content: PxmlChar); cdecl; external libxml2;
procedure xmlNodeAddContentLen(cur: TxmlNodePtr; content: PxmlChar; len: longint); cdecl; external libxml2;
function xmlNodeGetContent(cur: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlNodeBufGetContent(buffer: TxmlBufferPtr; cur: PxmlNode): longint; cdecl; external libxml2;
function xmlBufGetNodeContent(buf: TxmlBufPtr; cur: PxmlNode): longint; cdecl; external libxml2;
function xmlNodeGetLang(cur: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlNodeGetSpacePreserve(cur: PxmlNode): longint; cdecl; external libxml2;
procedure xmlNodeSetLang(cur: TxmlNodePtr; lang: PxmlChar); cdecl; external libxml2;
procedure xmlNodeSetSpacePreserve(cur: TxmlNodePtr; val: longint); cdecl; external libxml2;
function xmlNodeGetBase(doc: PxmlDoc; cur: PxmlNode): PxmlChar; cdecl; external libxml2;
procedure xmlNodeSetBase(cur: TxmlNodePtr; uri: PxmlChar); cdecl; external libxml2;
function xmlRemoveProp(cur: TxmlAttrPtr): longint; cdecl; external libxml2;
function xmlUnsetNsProp(node: TxmlNodePtr; ns: TxmlNsPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlUnsetProp(node: TxmlNodePtr; Name: PxmlChar): longint; cdecl; external libxml2;
procedure xmlBufferWriteCHAR(buf: TxmlBufferPtr; _string: PxmlChar); cdecl; external libxml2;
procedure xmlBufferWriteChar(buf: TxmlBufferPtr; _string: pchar); cdecl; external libxml2;
procedure xmlBufferWriteQuotedString(buf: TxmlBufferPtr; _string: PxmlChar); cdecl; external libxml2;
procedure xmlAttrSerializeTxtContent(buf: TxmlBufferPtr; doc: TxmlDocPtr; attr: TxmlAttrPtr; _string: PxmlChar); cdecl; external libxml2;
function xmlReconciliateNs(doc: TxmlDocPtr; tree: TxmlNodePtr): longint; cdecl; external libxml2;
procedure xmlDocDumpFormatMemory(cur: TxmlDocPtr; mem: PPxmlChar; size: Plongint; format: longint); cdecl; external libxml2;
procedure xmlDocDumpMemory(cur: TxmlDocPtr; mem: PPxmlChar; size: Plongint); cdecl; external libxml2;
procedure xmlDocDumpMemoryEnc(out_doc: TxmlDocPtr; doc_txt_ptr: PPxmlChar; doc_txt_len: Plongint; txt_encoding: pchar); cdecl; external libxml2;
procedure xmlDocDumpFormatMemoryEnc(out_doc: TxmlDocPtr; doc_txt_ptr: PPxmlChar; doc_txt_len: Plongint; txt_encoding: pchar; format: longint); cdecl; external libxml2;
function xmlDocFormatDump(f: PFILE; cur: TxmlDocPtr; format: longint): longint; cdecl; external libxml2;
function xmlDocDump(f: PFILE; cur: TxmlDocPtr): longint; cdecl; external libxml2;
procedure xmlElemDump(f: PFILE; doc: TxmlDocPtr; cur: TxmlNodePtr); cdecl; external libxml2;
function xmlSaveFile(filename: pchar; cur: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlSaveFormatFile(filename: pchar; cur: TxmlDocPtr; format: longint): longint; cdecl; external libxml2;
function xmlBufNodeDump(buf: TxmlBufPtr; doc: TxmlDocPtr; cur: TxmlNodePtr; level: longint; format: longint): Tsize_t; cdecl; external libxml2;
function xmlNodeDump(buf: TxmlBufferPtr; doc: TxmlDocPtr; cur: TxmlNodePtr; level: longint; format: longint): longint; cdecl; external libxml2;
function xmlSaveFileTo(buf: TxmlOutputBufferPtr; cur: TxmlDocPtr; encoding: pchar): longint; cdecl; external libxml2;
function xmlSaveFormatFileTo(buf: TxmlOutputBufferPtr; cur: TxmlDocPtr; encoding: pchar; format: longint): longint; cdecl; external libxml2;
procedure xmlNodeDumpOutput(buf: TxmlOutputBufferPtr; doc: TxmlDocPtr; cur: TxmlNodePtr; level: longint; format: longint; encoding: pchar); cdecl; external libxml2;
function xmlSaveFormatFileEnc(filename: pchar; cur: TxmlDocPtr; encoding: pchar; format: longint): longint; cdecl; external libxml2;
function xmlSaveFileEnc(filename: pchar; cur: TxmlDocPtr; encoding: pchar): longint; cdecl; external libxml2;
function xmlIsXHTML(systemID: PxmlChar; publicID: PxmlChar): longint; cdecl; external libxml2;
function xmlGetDocCompressMode(doc: PxmlDoc): longint; cdecl; external libxml2;
procedure xmlSetDocCompressMode(doc: TxmlDocPtr; mode: longint); cdecl; external libxml2;
function xmlGetCompressMode: longint; cdecl; external libxml2;
procedure xmlSetCompressMode(mode: longint); cdecl; external libxml2;
function xmlDOMWrapNewCtxt: TxmlDOMWrapCtxtPtr; cdecl; external libxml2;
procedure xmlDOMWrapFreeCtxt(ctxt: TxmlDOMWrapCtxtPtr); cdecl; external libxml2;
function xmlDOMWrapReconcileNamespaces(ctxt: TxmlDOMWrapCtxtPtr; elem: TxmlNodePtr; options: longint): longint; cdecl; external libxml2;
function xmlDOMWrapAdoptNode(ctxt: TxmlDOMWrapCtxtPtr; sourceDoc: TxmlDocPtr; node: TxmlNodePtr; destDoc: TxmlDocPtr; destParent: TxmlNodePtr;
  options: longint): longint; cdecl; external libxml2;
function xmlDOMWrapRemoveNode(ctxt: TxmlDOMWrapCtxtPtr; doc: TxmlDocPtr; node: TxmlNodePtr; options: longint): longint; cdecl; external libxml2;
function xmlDOMWrapCloneNode(ctxt: TxmlDOMWrapCtxtPtr; sourceDoc: TxmlDocPtr; node: TxmlNodePtr; clonedNode: PxmlNodePtr; destDoc: TxmlDocPtr;
  destParent: TxmlNodePtr; deep: longint; options: longint): longint; cdecl; external libxml2;
function xmlChildElementCount(parent: TxmlNodePtr): dword; cdecl; external libxml2;
function xmlNextElementSibling(node: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlFirstElementChild(parent: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlLastElementChild(parent: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlPreviousElementSibling(node: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;

const
  XML_XML_NAMESPACE: PxmlChar = 'http://www.w3.org/XML/1998/namespace';
  XML_XML_ID: PxmlChar = 'xml:id';

function XML_GET_CONTENT(n: PxmlNode): PxmlChar;
function XML_GET_LINE(n: PxmlNode): longint;


// === Konventiert am: 26-2-25 16:28:21 ===


implementation

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


end.
