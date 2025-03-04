unit SAX;

interface

uses
  ctypes, xml2_common, xmlstring, tree, parser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function getPublicId(ctx: pointer): PxmlChar; cdecl; external libxml2;
function getSystemId(ctx: pointer): PxmlChar; cdecl; external libxml2;
procedure setDocumentLocator(ctx: pointer; loc: TxmlSAXLocatorPtr); cdecl; external libxml2;
function getLineNumber(ctx: pointer): longint; cdecl; external libxml2;
function getColumnNumber(ctx: pointer): longint; cdecl; external libxml2;
function isStandalone(ctx: pointer): longint; cdecl; external libxml2;
function hasInternalSubset(ctx: pointer): longint; cdecl; external libxml2;
function hasExternalSubset(ctx: pointer): longint; cdecl; external libxml2;
procedure internalSubset(ctx: pointer; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl; external libxml2;
procedure externalSubset(ctx: pointer; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl; external libxml2;
function getEntity(ctx: pointer; Name: PxmlChar): TxmlEntityPtr; cdecl; external libxml2;
function getParameterEntity(ctx: pointer; Name: PxmlChar): TxmlEntityPtr; cdecl; external libxml2;
function resolveEntity(ctx: pointer; publicId: PxmlChar; systemId: PxmlChar): TxmlParserInputPtr; cdecl; external libxml2;
procedure entityDecl(ctx: pointer; Name: PxmlChar; _type: longint; publicId: PxmlChar; systemId: PxmlChar;
  content: PxmlChar); cdecl; external libxml2;
procedure attributeDecl(ctx: pointer; elem: PxmlChar; fullname: PxmlChar; _type: longint; def: longint;
  defaultValue: PxmlChar; tree: TxmlEnumerationPtr); cdecl; external libxml2;
procedure elementDecl(ctx: pointer; Name: PxmlChar; _type: longint; content: TxmlElementContentPtr); cdecl; external libxml2;
procedure notationDecl(ctx: pointer; Name: PxmlChar; publicId: PxmlChar; systemId: PxmlChar); cdecl; external libxml2;
procedure unparsedEntityDecl(ctx: pointer; Name: PxmlChar; publicId: PxmlChar; systemId: PxmlChar; notationName: PxmlChar); cdecl; external libxml2;
procedure startDocument(ctx: pointer); cdecl; external libxml2;
procedure endDocument(ctx: pointer); cdecl; external libxml2;
procedure attribute(ctx: pointer; fullname: PxmlChar; Value: PxmlChar); cdecl; external libxml2;
procedure startElement(ctx: pointer; fullname: PxmlChar; atts: PPxmlChar); cdecl; external libxml2;
procedure endElement(ctx: pointer; Name: PxmlChar); cdecl; external libxml2;
procedure reference(ctx: pointer; Name: PxmlChar); cdecl; external libxml2;
procedure characters(ctx: pointer; ch: PxmlChar; len: longint); cdecl; external libxml2;
procedure ignorableWhitespace(ctx: pointer; ch: PxmlChar; len: longint); cdecl; external libxml2;
procedure processingInstruction(ctx: pointer; target: PxmlChar; Data: PxmlChar); cdecl; external libxml2;
procedure globalNamespace(ctx: pointer; href: PxmlChar; prefix: PxmlChar); cdecl; external libxml2;
procedure setNamespace(ctx: pointer; Name: PxmlChar); cdecl; external libxml2;
function getNamespace(ctx: pointer): TxmlNsPtr; cdecl; external libxml2;
function checkNamespace(ctx: pointer; nameSpace: PxmlChar): longint; cdecl; external libxml2;
procedure namespaceDecl(ctx: pointer; href: PxmlChar; prefix: PxmlChar); cdecl; external libxml2;
procedure comment(ctx: pointer; Value: PxmlChar); cdecl; external libxml2;
procedure cdataBlock(ctx: pointer; Value: PxmlChar; len: longint); cdecl; external libxml2;
procedure initxmlDefaultSAXHandler(hdlr: PxmlSAXHandlerV1; warning: longint); cdecl; external libxml2;
procedure inithtmlDefaultSAXHandler(hdlr: PxmlSAXHandlerV1); cdecl; external libxml2;
procedure initdocbDefaultSAXHandler(hdlr: PxmlSAXHandlerV1); cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:33:48 ===


implementation



end.
