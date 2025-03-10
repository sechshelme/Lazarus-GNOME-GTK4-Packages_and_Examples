{$IFDEF read_interface}

type
  TxmlValidState = record
  end;
  PxmlValidState = ^TxmlValidState;

  TxmlValidityErrorFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  TxmlValidityWarningFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;

const
  XML_CTXT_FINISH_DTD_0 = $abcd1234;
  XML_CTXT_FINISH_DTD_1 = $abcd1235;

type
  TxmlValidCtxt = record
    userData: pointer;
    error: TxmlValidityErrorFunc;
    warning: TxmlValidityWarningFunc;
    node: PxmlNode;
    nodeNr: longint;
    nodeMax: longint;
    nodeTab: PPxmlNode;
    finishDtd: dword;
    doc: PxmlDoc;
    valid: longint;
    vstate: PxmlValidState;
    vstateNr: longint;
    vstateMax: longint;
    vstateTab: PxmlValidState;
    am: PxmlAutomata;
    state: PxmlAutomataState;
  end;
  PxmlValidCtxt = ^TxmlValidCtxt;

  PxmlNotationTable = PxmlHashTable;
  PxmlElementTable = PxmlHashTable;
  PxmlAttributeTable = PxmlHashTable;
  PxmlIDTable = PxmlHashTable;
  PxmlRefTable = PxmlHashTable;

function xmlAddNotationDecl(ctxt: PxmlValidCtxt; dtd: PxmlDtd; Name: PxmlChar; PublicID: PxmlChar; SystemID: PxmlChar): PxmlNotation; cdecl; external libxml2;
function xmlCopyNotationTable(table: PxmlNotationTable): PxmlNotationTable; cdecl; external libxml2;

procedure xmlFreeNotationTable(table: PxmlNotationTable); cdecl; external libxml2;
procedure xmlDumpNotationDecl(buf: PxmlBuffer; nota: PxmlNotation); cdecl; external libxml2;
procedure xmlDumpNotationTable(buf: PxmlBuffer; table: PxmlNotationTable); cdecl; external libxml2;
function xmlNewElementContent(Name: PxmlChar; _type: TxmlElementContentType): PxmlElementContent; cdecl; external libxml2;
function xmlCopyElementContent(content: PxmlElementContent): PxmlElementContent; cdecl; external libxml2;
procedure xmlFreeElementContent(cur: PxmlElementContent); cdecl; external libxml2;
function xmlNewDocElementContent(doc: PxmlDoc; Name: PxmlChar; _type: TxmlElementContentType): PxmlElementContent; cdecl; external libxml2;
function xmlCopyDocElementContent(doc: PxmlDoc; content: PxmlElementContent): PxmlElementContent; cdecl; external libxml2;
procedure xmlFreeDocElementContent(doc: PxmlDoc; cur: PxmlElementContent); cdecl; external libxml2;
procedure xmlSnprintfElementContent(buf: pchar; size: longint; content: PxmlElementContent; englob: longint); cdecl; external libxml2;
procedure xmlSprintfElementContent(buf: pchar; content: PxmlElementContent; englob: longint); cdecl; external libxml2; deprecated;
function xmlAddElementDecl(ctxt: PxmlValidCtxt; dtd: PxmlDtd; Name: PxmlChar; _type: TxmlElementTypeVal; content: PxmlElementContent): PxmlElement; cdecl; external libxml2;
function xmlCopyElementTable(table: PxmlElementTable): PxmlElementTable; cdecl; external libxml2;
procedure xmlFreeElementTable(table: PxmlElementTable); cdecl; external libxml2;
procedure xmlDumpElementTable(buf: PxmlBuffer; table: PxmlElementTable); cdecl; external libxml2;
procedure xmlDumpElementDecl(buf: PxmlBuffer; elem: PxmlElement); cdecl; external libxml2;
function xmlCreateEnumeration(Name: PxmlChar): PxmlEnumeration; cdecl; external libxml2;
procedure xmlFreeEnumeration(cur: PxmlEnumeration); cdecl; external libxml2;
function xmlCopyEnumeration(cur: PxmlEnumeration): PxmlEnumeration; cdecl; external libxml2;
function xmlAddAttributeDecl(ctxt: PxmlValidCtxt; dtd: PxmlDtd; elem: PxmlChar; Name: PxmlChar; ns: PxmlChar;
  _type: TxmlAttributeType; def: TxmlAttributeDefault; defaultValue: PxmlChar; tree: PxmlEnumeration): PxmlAttribute; cdecl; external libxml2;
function xmlCopyAttributeTable(table: PxmlAttributeTable): PxmlAttributeTable; cdecl; external libxml2;
procedure xmlFreeAttributeTable(table: PxmlAttributeTable); cdecl; external libxml2;
procedure xmlDumpAttributeTable(buf: PxmlBuffer; table: PxmlAttributeTable); cdecl; external libxml2;
procedure xmlDumpAttributeDecl(buf: PxmlBuffer; attr: PxmlAttribute); cdecl; external libxml2;
function xmlAddID(ctxt: PxmlValidCtxt; doc: PxmlDoc; Value: PxmlChar; attr: PxmlAttr): PxmlID; cdecl; external libxml2;
procedure xmlFreeIDTable(table: PxmlIDTable); cdecl; external libxml2;
function xmlGetID(doc: PxmlDoc; ID: PxmlChar): PxmlAttr; cdecl; external libxml2;
function xmlIsID(doc: PxmlDoc; elem: PxmlNode; attr: PxmlAttr): longint; cdecl; external libxml2;
function xmlRemoveID(doc: PxmlDoc; attr: PxmlAttr): longint; cdecl; external libxml2;
function xmlAddRef(ctxt: PxmlValidCtxt; doc: PxmlDoc; Value: PxmlChar; attr: PxmlAttr): PxmlRef; cdecl; external libxml2;
procedure xmlFreeRefTable(table: PxmlRefTable); cdecl; external libxml2;
function xmlIsRef(doc: PxmlDoc; elem: PxmlNode; attr: PxmlAttr): longint; cdecl; external libxml2;
function xmlRemoveRef(doc: PxmlDoc; attr: PxmlAttr): longint; cdecl; external libxml2;
function xmlGetRefs(doc: PxmlDoc; ID: PxmlChar): PxmlList; cdecl; external libxml2;
function xmlNewValidCtxt: PxmlValidCtxt; cdecl; external libxml2;
procedure xmlFreeValidCtxt(para1: PxmlValidCtxt); cdecl; external libxml2;
function xmlValidateRoot(ctxt: PxmlValidCtxt; doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlValidateElementDecl(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlElement): longint; cdecl; external libxml2;
function xmlValidNormalizeAttributeValue(doc: PxmlDoc; elem: PxmlNode; Name: PxmlChar; Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlValidCtxtNormalizeAttributeValue(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode; Name: PxmlChar; Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlValidateAttributeDecl(ctxt: PxmlValidCtxt; doc: PxmlDoc; attr: PxmlAttribute): longint; cdecl; external libxml2;
function xmlValidateAttributeValue(_type: TxmlAttributeType; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNotationDecl(ctxt: PxmlValidCtxt; doc: PxmlDoc; nota: PxmlNotation): longint; cdecl; external libxml2;
function xmlValidateDtd(ctxt: PxmlValidCtxt; doc: PxmlDoc; dtd: PxmlDtd): longint; cdecl; external libxml2;
function xmlValidateDtdFinal(ctxt: PxmlValidCtxt; doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlValidateDocument(ctxt: PxmlValidCtxt; doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlValidateElement(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode): longint; cdecl; external libxml2;
function xmlValidateOneElement(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode): longint; cdecl; external libxml2;
function xmlValidateOneAttribute(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode; attr: PxmlAttr; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateOneNamespace(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode; prefix: PxmlChar; ns: PxmlNs;
  Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateDocumentFinal(ctxt: PxmlValidCtxt; doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlValidateNotationUse(ctxt: PxmlValidCtxt; doc: PxmlDoc; notationName: PxmlChar): longint; cdecl; external libxml2;
function xmlIsMixedElement(doc: PxmlDoc; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlGetDtdAttrDesc(dtd: PxmlDtd; elem: PxmlChar; Name: PxmlChar): PxmlAttribute; cdecl; external libxml2;
function xmlGetDtdQAttrDesc(dtd: PxmlDtd; elem: PxmlChar; Name: PxmlChar; prefix: PxmlChar): PxmlAttribute; cdecl; external libxml2;
function xmlGetDtdNotationDesc(dtd: PxmlDtd; Name: PxmlChar): PxmlNotation; cdecl; external libxml2;
function xmlGetDtdQElementDesc(dtd: PxmlDtd; Name: PxmlChar; prefix: PxmlChar): PxmlElement; cdecl; external libxml2;
function xmlGetDtdElementDesc(dtd: PxmlDtd; Name: PxmlChar): PxmlElement; cdecl; external libxml2;
function xmlValidGetPotentialChildren(ctree: PxmlElementContent; names: PPxmlChar; len: Plongint; max: longint): longint; cdecl; external libxml2;
function xmlValidGetValidElements(prev: PxmlNode; Next: PxmlNode; names: PPxmlChar; max: longint): longint; cdecl; external libxml2;
function xmlValidateNameValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNamesValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNmtokenValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNmtokensValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidBuildContentModel(ctxt: PxmlValidCtxt; elem: PxmlElement): longint; cdecl; external libxml2;
function xmlValidatePushElement(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode; qname: PxmlChar): longint; cdecl; external libxml2;
function xmlValidatePushCData(ctxt: PxmlValidCtxt; Data: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlValidatePopElement(ctxt: PxmlValidCtxt; doc: PxmlDoc; elem: PxmlNode; qname: PxmlChar): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:14:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
