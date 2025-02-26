unit valid;

interface

uses
  ctypes, xml2_common, tree, list, xmlstring, xmlautomata;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlValidState = record
  end;
  PxmlValidState = ^TxmlValidState;

  PxmlValidStatePtr = ^TxmlValidStatePtr;
  TxmlValidStatePtr = PxmlValidState;

  TxmlValidityErrorFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  TxmlValidityWarningFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;

const
  XML_CTXT_FINISH_DTD_0 = $abcd1234;
  XML_CTXT_FINISH_DTD_1 = $abcd1235;

type
  PxmlValidCtxtPtr = ^TxmlValidCtxtPtr;
  PxmlValidCtxt = ^TxmlValidCtxt;
  TxmlValidCtxtPtr = PxmlValidCtxt;

  TxmlValidCtxt = record
    userData: pointer;
    error: TxmlValidityErrorFunc;
    warning: TxmlValidityWarningFunc;
    node: TxmlNodePtr;
    nodeNr: longint;
    nodeMax: longint;
    nodeTab: PxmlNodePtr;
    finishDtd: dword;
    doc: TxmlDocPtr;
    valid: longint;
    vstate: PxmlValidState;
    vstateNr: longint;
    vstateMax: longint;
    vstateTab: PxmlValidState;
    //    am: TxmlAutomataPtr;
    //    state: TxmlAutomataStatePtr;
    am: pointer;
    state: pointer;
  end;

  TxmlHashTable = record
  end;

  TxmlNotationTablePtr = ^TxmlHashTable;
  PxmlNotationTablePtr = ^TxmlNotationTablePtr;

  TxmlElementTablePtr = ^TxmlHashTable;
  PxmlElementTablePtr = ^TxmlElementTablePtr;

  TxmlAttributeTablePtr = ^TxmlHashTable;
  PxmlAttributeTablePtr = ^TxmlAttributeTablePtr;

  TxmlIDTablePtr = ^TxmlHashTable;
  PxmlIDTablePtr = ^TxmlIDTablePtr;

  TxmlRefTablePtr = ^TxmlHashTable;
  PxmlRefTablePtr = ^TxmlRefTablePtr;

function xmlAddNotationDecl(ctxt: TxmlValidCtxtPtr; dtd: TxmlDtdPtr; Name: PxmlChar; PublicID: PxmlChar; SystemID: PxmlChar): TxmlNotationPtr; cdecl; external libxml2;
function xmlCopyNotationTable(table: TxmlNotationTablePtr): TxmlNotationTablePtr; cdecl; external libxml2;

procedure xmlFreeNotationTable(table: TxmlNotationTablePtr); cdecl; external libxml2;
procedure xmlDumpNotationDecl(buf: TxmlBufferPtr; nota: TxmlNotationPtr); cdecl; external libxml2;
procedure xmlDumpNotationTable(buf: TxmlBufferPtr; table: TxmlNotationTablePtr); cdecl; external libxml2;
function xmlNewElementContent(Name: PxmlChar; _type: TxmlElementContentType): TxmlElementContentPtr; cdecl; external libxml2;
function xmlCopyElementContent(content: TxmlElementContentPtr): TxmlElementContentPtr; cdecl; external libxml2;
procedure xmlFreeElementContent(cur: TxmlElementContentPtr); cdecl; external libxml2;
function xmlNewDocElementContent(doc: TxmlDocPtr; Name: PxmlChar; _type: TxmlElementContentType): TxmlElementContentPtr; cdecl; external libxml2;
function xmlCopyDocElementContent(doc: TxmlDocPtr; content: TxmlElementContentPtr): TxmlElementContentPtr; cdecl; external libxml2;
procedure xmlFreeDocElementContent(doc: TxmlDocPtr; cur: TxmlElementContentPtr); cdecl; external libxml2;
procedure xmlSnprintfElementContent(buf: pchar; size: longint; content: TxmlElementContentPtr; englob: longint); cdecl; external libxml2;
procedure xmlSprintfElementContent(buf: pchar; content: TxmlElementContentPtr; englob: longint); cdecl; external libxml2; deprecated;
function xmlAddElementDecl(ctxt: TxmlValidCtxtPtr; dtd: TxmlDtdPtr; Name: PxmlChar; _type: TxmlElementTypeVal; content: TxmlElementContentPtr): TxmlElementPtr; cdecl; external libxml2;
function xmlCopyElementTable(table: TxmlElementTablePtr): TxmlElementTablePtr; cdecl; external libxml2;
procedure xmlFreeElementTable(table: TxmlElementTablePtr); cdecl; external libxml2;
procedure xmlDumpElementTable(buf: TxmlBufferPtr; table: TxmlElementTablePtr); cdecl; external libxml2;
procedure xmlDumpElementDecl(buf: TxmlBufferPtr; elem: TxmlElementPtr); cdecl; external libxml2;
function xmlCreateEnumeration(Name: PxmlChar): TxmlEnumerationPtr; cdecl; external libxml2;
procedure xmlFreeEnumeration(cur: TxmlEnumerationPtr); cdecl; external libxml2;
function xmlCopyEnumeration(cur: TxmlEnumerationPtr): TxmlEnumerationPtr; cdecl; external libxml2;
function xmlAddAttributeDecl(ctxt: TxmlValidCtxtPtr; dtd: TxmlDtdPtr; elem: PxmlChar; Name: PxmlChar; ns: PxmlChar;
  _type: TxmlAttributeType; def: TxmlAttributeDefault; defaultValue: PxmlChar; tree: TxmlEnumerationPtr): TxmlAttributePtr; cdecl; external libxml2;
function xmlCopyAttributeTable(table: TxmlAttributeTablePtr): TxmlAttributeTablePtr; cdecl; external libxml2;
procedure xmlFreeAttributeTable(table: TxmlAttributeTablePtr); cdecl; external libxml2;
procedure xmlDumpAttributeTable(buf: TxmlBufferPtr; table: TxmlAttributeTablePtr); cdecl; external libxml2;
procedure xmlDumpAttributeDecl(buf: TxmlBufferPtr; attr: TxmlAttributePtr); cdecl; external libxml2;
function xmlAddID(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; Value: PxmlChar; attr: TxmlAttrPtr): TxmlIDPtr; cdecl; external libxml2;
procedure xmlFreeIDTable(table: TxmlIDTablePtr); cdecl; external libxml2;
function xmlGetID(doc: TxmlDocPtr; ID: PxmlChar): TxmlAttrPtr; cdecl; external libxml2;
function xmlIsID(doc: TxmlDocPtr; elem: TxmlNodePtr; attr: TxmlAttrPtr): longint; cdecl; external libxml2;
function xmlRemoveID(doc: TxmlDocPtr; attr: TxmlAttrPtr): longint; cdecl; external libxml2;
function xmlAddRef(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; Value: PxmlChar; attr: TxmlAttrPtr): TxmlRefPtr; cdecl; external libxml2;
procedure xmlFreeRefTable(table: TxmlRefTablePtr); cdecl; external libxml2;
function xmlIsRef(doc: TxmlDocPtr; elem: TxmlNodePtr; attr: TxmlAttrPtr): longint; cdecl; external libxml2;
function xmlRemoveRef(doc: TxmlDocPtr; attr: TxmlAttrPtr): longint; cdecl; external libxml2;
function xmlGetRefs(doc: TxmlDocPtr; ID: PxmlChar): TxmlListPtr; cdecl; external libxml2;
function xmlNewValidCtxt: TxmlValidCtxtPtr; cdecl; external libxml2;
procedure xmlFreeValidCtxt(para1: TxmlValidCtxtPtr); cdecl; external libxml2;
function xmlValidateRoot(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlValidateElementDecl(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlElementPtr): longint; cdecl; external libxml2;
function xmlValidNormalizeAttributeValue(doc: TxmlDocPtr; elem: TxmlNodePtr; Name: PxmlChar; Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlValidCtxtNormalizeAttributeValue(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr; Name: PxmlChar; Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlValidateAttributeDecl(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; attr: TxmlAttributePtr): longint; cdecl; external libxml2;
function xmlValidateAttributeValue(_type: TxmlAttributeType; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNotationDecl(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; nota: TxmlNotationPtr): longint; cdecl; external libxml2;
function xmlValidateDtd(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; dtd: TxmlDtdPtr): longint; cdecl; external libxml2;
function xmlValidateDtdFinal(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlValidateDocument(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlValidateElement(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlValidateOneElement(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlValidateOneAttribute(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr; attr: TxmlAttrPtr; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateOneNamespace(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr; prefix: PxmlChar; ns: TxmlNsPtr;
  Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateDocumentFinal(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlValidateNotationUse(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; notationName: PxmlChar): longint; cdecl; external libxml2;
function xmlIsMixedElement(doc: TxmlDocPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlGetDtdAttrDesc(dtd: TxmlDtdPtr; elem: PxmlChar; Name: PxmlChar): TxmlAttributePtr; cdecl; external libxml2;
function xmlGetDtdQAttrDesc(dtd: TxmlDtdPtr; elem: PxmlChar; Name: PxmlChar; prefix: PxmlChar): TxmlAttributePtr; cdecl; external libxml2;
function xmlGetDtdNotationDesc(dtd: TxmlDtdPtr; Name: PxmlChar): TxmlNotationPtr; cdecl; external libxml2;
function xmlGetDtdQElementDesc(dtd: TxmlDtdPtr; Name: PxmlChar; prefix: PxmlChar): TxmlElementPtr; cdecl; external libxml2;
function xmlGetDtdElementDesc(dtd: TxmlDtdPtr; Name: PxmlChar): TxmlElementPtr; cdecl; external libxml2;
function xmlValidGetPotentialChildren(ctree: PxmlElementContent; names: PPxmlChar; len: Plongint; max: longint): longint; cdecl; external libxml2;
function xmlValidGetValidElements(prev: PxmlNode; Next: PxmlNode; names: PPxmlChar; max: longint): longint; cdecl; external libxml2;
function xmlValidateNameValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNamesValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNmtokenValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidateNmtokensValue(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlValidBuildContentModel(ctxt: TxmlValidCtxtPtr; elem: TxmlElementPtr): longint; cdecl; external libxml2;
function xmlValidatePushElement(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr; qname: PxmlChar): longint; cdecl; external libxml2;
function xmlValidatePushCData(ctxt: TxmlValidCtxtPtr; Data: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlValidatePopElement(ctxt: TxmlValidCtxtPtr; doc: TxmlDocPtr; elem: TxmlNodePtr; qname: PxmlChar): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:14:16 ===


implementation



end.
