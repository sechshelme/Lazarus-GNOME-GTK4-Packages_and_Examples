unit xmlschemas;

interface

uses
  ctypes, xml2_common, xmlerror, tree, encoding, schemasInternals;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlSchemaValidError = ^TxmlSchemaValidError;
  TxmlSchemaValidError = longint;

const
  XML_SCHEMAS_ERR_OK = 0;
  XML_SCHEMAS_ERR_NOROOT = 1;
  XML_SCHEMAS_ERR_UNDECLAREDELEM = 2;
  XML_SCHEMAS_ERR_NOTTOPLEVEL = 3;
  XML_SCHEMAS_ERR_MISSING = 4;
  XML_SCHEMAS_ERR_WRONGELEM = 5;
  XML_SCHEMAS_ERR_NOTYPE = 6;
  XML_SCHEMAS_ERR_NOROLLBACK = 7;
  XML_SCHEMAS_ERR_ISABSTRACT = 8;
  XML_SCHEMAS_ERR_NOTEMPTY = 9;
  XML_SCHEMAS_ERR_ELEMCONT = 10;
  XML_SCHEMAS_ERR_HAVEDEFAULT = 11;
  XML_SCHEMAS_ERR_NOTNILLABLE = 12;
  XML_SCHEMAS_ERR_EXTRACONTENT = 13;
  XML_SCHEMAS_ERR_INVALIDATTR = 14;
  XML_SCHEMAS_ERR_INVALIDELEM = 15;
  XML_SCHEMAS_ERR_NOTDETERMINIST = 16;
  XML_SCHEMAS_ERR_CONSTRUCT = 17;
  XML_SCHEMAS_ERR_INTERNAL = 18;
  XML_SCHEMAS_ERR_NOTSIMPLE = 19;
  XML_SCHEMAS_ERR_ATTRUNKNOWN = 20;
  XML_SCHEMAS_ERR_ATTRINVALID = 21;
  XML_SCHEMAS_ERR_VALUE = 22;
  XML_SCHEMAS_ERR_FACET = 23;
  XML_SCHEMAS_ERR_ = 24;
  XML_SCHEMAS_ERR_XXX = 25;

type
  PxmlSchemaValidOption = ^TxmlSchemaValidOption;
  TxmlSchemaValidOption = longint;

const
  XML_SCHEMA_VAL_VC_I_CREATE = 1 shl 0;

type
  PxmlSchemaPtr = ^TxmlSchemaPtr;
  TxmlSchemaPtr = PxmlSchema;

  TxmlSchemaValidityErrorFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  PxmlSchemaValidityErrorFunc = ^TxmlSchemaValidityErrorFunc;
  TxmlSchemaValidityWarningFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  PxmlSchemaValidityWarningFunc = ^txmlSchemaValidityWarningFunc;

  TxmlSchemaParserCtxt = record
  end;
  PxmlSchemaParserCtxt = ^TxmlSchemaParserCtxt;

  PxmlSchemaParserCtxtPtr = ^TxmlSchemaParserCtxtPtr;
  TxmlSchemaParserCtxtPtr = PxmlSchemaParserCtxt;

  TxmlSchemaValidCtxt = record
  end;
  PxmlSchemaValidCtxt = ^TxmlSchemaValidCtxt;

  PxmlSchemaValidCtxtPtr = ^TxmlSchemaValidCtxtPtr;
  TxmlSchemaValidCtxtPtr = PxmlSchemaValidCtxt;

  TxmlSchemaValidityLocatorFunc = function(ctx: pointer; file_: PPchar; line: Pdword): longint; cdecl;

function xmlSchemaNewParserCtxt(URL: pchar): TxmlSchemaParserCtxtPtr; cdecl; external libxml2;
function xmlSchemaNewMemParserCtxt(buffer: pchar; size: longint): TxmlSchemaParserCtxtPtr; cdecl; external libxml2;
function xmlSchemaNewDocParserCtxt(doc: TxmlDocPtr): TxmlSchemaParserCtxtPtr; cdecl; external libxml2;
procedure xmlSchemaFreeParserCtxt(ctxt: TxmlSchemaParserCtxtPtr); cdecl; external libxml2;
procedure xmlSchemaSetParserErrors(ctxt: TxmlSchemaParserCtxtPtr; err: TxmlSchemaValidityErrorFunc; warn: TxmlSchemaValidityWarningFunc; ctx: pointer); cdecl; external libxml2;
procedure xmlSchemaSetParserStructuredErrors(ctxt: TxmlSchemaParserCtxtPtr; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlSchemaGetParserErrors(ctxt: TxmlSchemaParserCtxtPtr; err: PxmlSchemaValidityErrorFunc; warn: PxmlSchemaValidityWarningFunc; ctx: Ppointer): longint; cdecl; external libxml2;
function xmlSchemaIsValid(ctxt: TxmlSchemaValidCtxtPtr): longint; cdecl; external libxml2;
function xmlSchemaParse(ctxt: TxmlSchemaParserCtxtPtr): TxmlSchemaPtr; cdecl; external libxml2;
procedure xmlSchemaFree(schema: TxmlSchemaPtr); cdecl; external libxml2;
procedure xmlSchemaDump(output: PFILE; schema: TxmlSchemaPtr); cdecl; external libxml2;

procedure xmlSchemaSetValidErrors(ctxt: TxmlSchemaValidCtxtPtr; err: TxmlSchemaValidityErrorFunc; warn: TxmlSchemaValidityWarningFunc; ctx: pointer); cdecl; external libxml2;
procedure xmlSchemaSetValidStructuredErrors(ctxt: TxmlSchemaValidCtxtPtr; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlSchemaGetValidErrors(ctxt: TxmlSchemaValidCtxtPtr; err: PxmlSchemaValidityErrorFunc; warn: PxmlSchemaValidityWarningFunc; ctx: Ppointer): longint; cdecl; external libxml2;
function xmlSchemaSetValidOptions(ctxt: TxmlSchemaValidCtxtPtr; options: longint): longint; cdecl; external libxml2;
procedure xmlSchemaValidateSetFilename(vctxt: TxmlSchemaValidCtxtPtr; filename: pchar); cdecl; external libxml2;
function xmlSchemaValidCtxtGetOptions(ctxt: TxmlSchemaValidCtxtPtr): longint; cdecl; external libxml2;
function xmlSchemaNewValidCtxt(schema: TxmlSchemaPtr): TxmlSchemaValidCtxtPtr; cdecl; external libxml2;
procedure xmlSchemaFreeValidCtxt(ctxt: TxmlSchemaValidCtxtPtr); cdecl; external libxml2;
function xmlSchemaValidateDoc(ctxt: TxmlSchemaValidCtxtPtr; instance: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlSchemaValidateOneElement(ctxt: TxmlSchemaValidCtxtPtr; elem: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlSchemaValidateStream(ctxt: TxmlSchemaValidCtxtPtr; input: TxmlParserInputBufferPtr; enc: TxmlCharEncoding; sax: TxmlSAXHandlerPtr; user_data: pointer): longint; cdecl; external libxml2;
function xmlSchemaValidateFile(ctxt: TxmlSchemaValidCtxtPtr; filename: pchar; options: longint): longint; cdecl; external libxml2;
function xmlSchemaValidCtxtGetParserCtxt(ctxt: TxmlSchemaValidCtxtPtr): TxmlParserCtxtPtr; cdecl; external libxml2;

type
  TxmlSchemaSAXPlugStruct = record
  end;
  PxmlSchemaSAXPlugStruct = ^TxmlSchemaSAXPlugStruct;

  TxmlSchemaSAXPlug = TxmlSchemaSAXPlugStruct;

  PxmlSchemaSAXPlugPtr = ^TxmlSchemaSAXPlugPtr;
  TxmlSchemaSAXPlugPtr = PxmlSchemaSAXPlugStruct;

function xmlSchemaSAXPlug(ctxt: TxmlSchemaValidCtxtPtr; sax: PxmlSAXHandlerPtr; user_data: Ppointer): TxmlSchemaSAXPlugPtr; cdecl; external libxml2;
function xmlSchemaSAXUnplug(plug: TxmlSchemaSAXPlugPtr): longint; cdecl; external libxml2;
procedure xmlSchemaValidateSetLocator(vctxt: TxmlSchemaValidCtxtPtr; f: TxmlSchemaValidityLocatorFunc; ctxt: pointer); cdecl; external libxml2;

// === Konventiert am: 2-3-25 19:52:02 ===


implementation



end.
