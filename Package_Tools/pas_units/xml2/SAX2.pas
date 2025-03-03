unit SAX2;

interface

uses
  ctypes, xml2_common, xmlstring, tree, parser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function xmlSAX2GetPublicId(ctx: pointer): PxmlChar; cdecl; external libxml2;
function xmlSAX2GetSystemId(ctx: pointer): PxmlChar; cdecl; external libxml2;
procedure xmlSAX2SetDocumentLocator(ctx: pointer; loc: TxmlSAXLocatorPtr); cdecl; external libxml2;
function xmlSAX2GetLineNumber(ctx: pointer): longint; cdecl; external libxml2;
function xmlSAX2GetColumnNumber(ctx: pointer): longint; cdecl; external libxml2;
function xmlSAX2IsStandalone(ctx: pointer): longint; cdecl; external libxml2;
function xmlSAX2HasInternalSubset(ctx: pointer): longint; cdecl; external libxml2;
function xmlSAX2HasExternalSubset(ctx: pointer): longint; cdecl; external libxml2;
procedure xmlSAX2InternalSubset(ctx: pointer; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2ExternalSubset(ctx: pointer; Name: PxmlChar; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl; external libxml2;
function xmlSAX2GetEntity(ctx: pointer; Name: PxmlChar): TxmlEntityPtr; cdecl; external libxml2;
function xmlSAX2GetParameterEntity(ctx: pointer; Name: PxmlChar): TxmlEntityPtr; cdecl; external libxml2;
function xmlSAX2ResolveEntity(ctx: pointer; publicId: PxmlChar; systemId: PxmlChar): TxmlParserInputPtr; cdecl; external libxml2;
procedure xmlSAX2EntityDecl(ctx: pointer; Name: PxmlChar; _type: longint; publicId: PxmlChar; systemId: PxmlChar;
  content: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2AttributeDecl(ctx: pointer; elem: PxmlChar; fullname: PxmlChar; _type: longint; def: longint;
  defaultValue: PxmlChar; tree: TxmlEnumerationPtr); cdecl; external libxml2;
procedure xmlSAX2ElementDecl(ctx: pointer; Name: PxmlChar; _type: longint; content: TxmlElementContentPtr); cdecl; external libxml2;
procedure xmlSAX2NotationDecl(ctx: pointer; Name: PxmlChar; publicId: PxmlChar; systemId: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2UnparsedEntityDecl(ctx: pointer; Name: PxmlChar; publicId: PxmlChar; systemId: PxmlChar; notationName: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2StartDocument(ctx: pointer); cdecl; external libxml2;
procedure xmlSAX2EndDocument(ctx: pointer); cdecl; external libxml2;
procedure xmlSAX2StartElement(ctx: pointer; fullname: PxmlChar; atts: PPxmlChar); cdecl; external libxml2;
procedure xmlSAX2EndElement(ctx: pointer; Name: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2StartElementNs(ctx: pointer; localname: PxmlChar; prefix: PxmlChar; URI: PxmlChar; nb_namespaces: longint;
  namespaces: PPxmlChar; nb_attributes: longint; nb_defaulted: longint; attributes: PPxmlChar); cdecl; external libxml2;
procedure xmlSAX2EndElementNs(ctx: pointer; localname: PxmlChar; prefix: PxmlChar; URI: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2Reference(ctx: pointer; Name: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2Characters(ctx: pointer; ch: PxmlChar; len: longint); cdecl; external libxml2;
procedure xmlSAX2IgnorableWhitespace(ctx: pointer; ch: PxmlChar; len: longint); cdecl; external libxml2;
procedure xmlSAX2ProcessingInstruction(ctx: pointer; target: PxmlChar; Data: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2Comment(ctx: pointer; Value: PxmlChar); cdecl; external libxml2;
procedure xmlSAX2CDataBlock(ctx: pointer; Value: PxmlChar; len: longint); cdecl; external libxml2;
function xmlSAXDefaultVersion(version: longint): longint; cdecl; external libxml2;
function xmlSAXVersion(hdlr: PxmlSAXHandler; version: longint): longint; cdecl; external libxml2;
procedure xmlSAX2InitDefaultSAXHandler(hdlr: PxmlSAXHandler; warning: longint); cdecl; external libxml2;
procedure xmlSAX2InitHtmlDefaultSAXHandler(hdlr: PxmlSAXHandler); cdecl; external libxml2;
procedure htmlDefaultSAXHandlerInit; cdecl; external libxml2;
procedure xmlSAX2InitDocbDefaultSAXHandler(hdlr: PxmlSAXHandler); cdecl; external libxml2;
procedure docbDefaultSAXHandlerInit; cdecl; external libxml2;
procedure xmlDefaultSAXHandlerInit; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:17:13 ===


implementation



end.
