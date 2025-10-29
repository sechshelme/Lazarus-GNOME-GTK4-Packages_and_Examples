{$IFDEF read_interface}

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
  TxmlSchemaValidityErrorFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  PxmlSchemaValidityErrorFunc = ^TxmlSchemaValidityErrorFunc;
  TxmlSchemaValidityWarningFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  PxmlSchemaValidityWarningFunc = ^txmlSchemaValidityWarningFunc;

  TxmlSchemaParserCtxt = record
  end;
  PxmlSchemaParserCtxt = ^TxmlSchemaParserCtxt;

  TxmlSchemaValidCtxt = record
  end;
  PxmlSchemaValidCtxt = ^TxmlSchemaValidCtxt;

  TxmlSchemaValidityLocatorFunc = function(ctx: pointer; file_: PPchar; line: Pculong): longint; cdecl;

function xmlSchemaNewParserCtxt(URL: pchar): PxmlSchemaParserCtxt; cdecl; external libxml2;
function xmlSchemaNewMemParserCtxt(buffer: pchar; size: longint): PxmlSchemaParserCtxt; cdecl; external libxml2;
function xmlSchemaNewDocParserCtxt(doc: PxmlDoc): PxmlSchemaParserCtxt; cdecl; external libxml2;
procedure xmlSchemaFreeParserCtxt(ctxt: PxmlSchemaParserCtxt); cdecl; external libxml2;
procedure xmlSchemaSetParserErrors(ctxt: PxmlSchemaParserCtxt; err: TxmlSchemaValidityErrorFunc; warn: TxmlSchemaValidityWarningFunc; ctx: pointer); cdecl; external libxml2;
procedure xmlSchemaSetParserStructuredErrors(ctxt: PxmlSchemaParserCtxt; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlSchemaGetParserErrors(ctxt: PxmlSchemaParserCtxt; err: PxmlSchemaValidityErrorFunc; warn: PxmlSchemaValidityWarningFunc; ctx: Ppointer): longint; cdecl; external libxml2;
function xmlSchemaIsValid(ctxt: PxmlSchemaValidCtxt): longint; cdecl; external libxml2;
function xmlSchemaParse(ctxt: PxmlSchemaParserCtxt): PxmlSchema; cdecl; external libxml2;
procedure xmlSchemaFree(schema: PxmlSchema); cdecl; external libxml2;
procedure xmlSchemaDump(output: PFILE; schema: PxmlSchema); cdecl; external libxml2;

procedure xmlSchemaSetValidErrors(ctxt: PxmlSchemaValidCtxt; err: TxmlSchemaValidityErrorFunc; warn: TxmlSchemaValidityWarningFunc; ctx: pointer); cdecl; external libxml2;
procedure xmlSchemaSetValidStructuredErrors(ctxt: PxmlSchemaValidCtxt; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlSchemaGetValidErrors(ctxt: PxmlSchemaValidCtxt; err: PxmlSchemaValidityErrorFunc; warn: PxmlSchemaValidityWarningFunc; ctx: Ppointer): longint; cdecl; external libxml2;
function xmlSchemaSetValidOptions(ctxt: PxmlSchemaValidCtxt; options: longint): longint; cdecl; external libxml2;
procedure xmlSchemaValidateSetFilename(vctxt: PxmlSchemaValidCtxt; filename: pchar); cdecl; external libxml2;
function xmlSchemaValidCtxtGetOptions(ctxt: PxmlSchemaValidCtxt): longint; cdecl; external libxml2;
function xmlSchemaNewValidCtxt(schema: PxmlSchema): PxmlSchemaValidCtxt; cdecl; external libxml2;
procedure xmlSchemaFreeValidCtxt(ctxt: PxmlSchemaValidCtxt); cdecl; external libxml2;
function xmlSchemaValidateDoc(ctxt: PxmlSchemaValidCtxt; instance: PxmlDoc): longint; cdecl; external libxml2;
function xmlSchemaValidateOneElement(ctxt: PxmlSchemaValidCtxt; elem: PxmlNode): longint; cdecl; external libxml2;
function xmlSchemaValidateStream(ctxt: PxmlSchemaValidCtxt; input: PxmlParserInputBuffer; enc: TxmlCharEncoding; sax: PxmlSAXHandler; user_data: pointer): longint; cdecl; external libxml2;
function xmlSchemaValidateFile(ctxt: PxmlSchemaValidCtxt; filename: pchar; options: longint): longint; cdecl; external libxml2;
function xmlSchemaValidCtxtGetParserCtxt(ctxt: PxmlSchemaValidCtxt): PxmlParserCtxt; cdecl; external libxml2;

type
  TxmlSchemaSAXPlugStruct = record
  end;
  PxmlSchemaSAXPlugStruct = ^TxmlSchemaSAXPlugStruct;

  TxmlSchemaSAXPlug = TxmlSchemaSAXPlugStruct;
  PxmlSchemaSAXPlug = PxmlSchemaSAXPlugStruct;

function xmlSchemaSAXPlug(ctxt: PxmlSchemaValidCtxt; sax: PPxmlSAXHandler; user_data: Ppointer): PxmlSchemaSAXPlug; cdecl; external libxml2;
function xmlSchemaSAXUnplug(plug: PxmlSchemaSAXPlug): longint; cdecl; external libxml2;
procedure xmlSchemaValidateSetLocator(vctxt: PxmlSchemaValidCtxt; f: TxmlSchemaValidityLocatorFunc; ctxt: pointer); cdecl; external libxml2;

// === Konventiert am: 2-3-25 19:52:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
