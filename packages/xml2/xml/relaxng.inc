{$IFDEF read_interface}


type
  TxmlRelaxNG = record
  end;
  PxmlRelaxNG = ^TxmlRelaxNG;

  TxmlRelaxNGValidityErrorFunc = procedure(ctx: Pointer; const msg: pchar; args: array of const);
  PxmlRelaxNGValidityErrorFunc = ^TxmlRelaxNGValidityErrorFunc;
  TxmlRelaxNGValidityWarningFunc = procedure(ctx: Pointer; const msg: pchar; args: array of const);
  PxmlRelaxNGValidityWarningFunc = ^TxmlRelaxNGValidityWarningFunc;

  TxmlRelaxNGParserCtxt = record
  end;
  PxmlRelaxNGParserCtxt = ^TxmlRelaxNGParserCtxt;

  TxmlRelaxNGValidCtxt = record
  end;
  PxmlRelaxNGValidCtxt = ^TxmlRelaxNGValidCtxt;

type
  PxmlRelaxNGValidErr = ^TxmlRelaxNGValidErr;
  TxmlRelaxNGValidErr = longint;

const
  XML_RELAXNG_OK = 0;
  XML_RELAXNG_ERR_MEMORY = 1;
  XML_RELAXNG_ERR_TYPE = 2;
  XML_RELAXNG_ERR_TYPEVAL = 3;
  XML_RELAXNG_ERR_DUPID = 4;
  XML_RELAXNG_ERR_TYPECMP = 5;
  XML_RELAXNG_ERR_NOSTATE = 6;
  XML_RELAXNG_ERR_NODEFINE = 7;
  XML_RELAXNG_ERR_LISTEXTRA = 8;
  XML_RELAXNG_ERR_LISTEMPTY = 9;
  XML_RELAXNG_ERR_INTERNODATA = 10;
  XML_RELAXNG_ERR_INTERSEQ = 11;
  XML_RELAXNG_ERR_INTEREXTRA = 12;
  XML_RELAXNG_ERR_ELEMNAME = 13;
  XML_RELAXNG_ERR_ATTRNAME = 14;
  XML_RELAXNG_ERR_ELEMNONS = 15;
  XML_RELAXNG_ERR_ATTRNONS = 16;
  XML_RELAXNG_ERR_ELEMWRONGNS = 17;
  XML_RELAXNG_ERR_ATTRWRONGNS = 18;
  XML_RELAXNG_ERR_ELEMEXTRANS = 19;
  XML_RELAXNG_ERR_ATTREXTRANS = 20;
  XML_RELAXNG_ERR_ELEMNOTEMPTY = 21;
  XML_RELAXNG_ERR_NOELEM = 22;
  XML_RELAXNG_ERR_NOTELEM = 23;
  XML_RELAXNG_ERR_ATTRVALID = 24;
  XML_RELAXNG_ERR_CONTENTVALID = 25;
  XML_RELAXNG_ERR_EXTRACONTENT = 26;
  XML_RELAXNG_ERR_INVALIDATTR = 27;
  XML_RELAXNG_ERR_DATAELEM = 28;
  XML_RELAXNG_ERR_VALELEM = 29;
  XML_RELAXNG_ERR_LISTELEM = 30;
  XML_RELAXNG_ERR_DATATYPE = 31;
  XML_RELAXNG_ERR_VALUE = 32;
  XML_RELAXNG_ERR_LIST = 33;
  XML_RELAXNG_ERR_NOGRAMMAR = 34;
  XML_RELAXNG_ERR_EXTRADATA = 35;
  XML_RELAXNG_ERR_LACKDATA = 36;
  XML_RELAXNG_ERR_INTERNAL = 37;
  XML_RELAXNG_ERR_ELEMWRONG = 38;
  XML_RELAXNG_ERR_TEXTWRONG = 39;

type
  PxmlRelaxNGParserFlag = ^TxmlRelaxNGParserFlag;
  TxmlRelaxNGParserFlag = longint;

const
  XML_RELAXNGP_NONE = 0;
  XML_RELAXNGP_FREE_DOC = 1;
  XML_RELAXNGP_CRNG = 2;

function xmlRelaxNGInitTypes: longint; cdecl; external libxml2;
procedure xmlRelaxNGCleanupTypes; cdecl; external libxml2;
function xmlRelaxNGNewParserCtxt(URL: pchar): PxmlRelaxNGParserCtxt; cdecl; external libxml2;
function xmlRelaxNGNewMemParserCtxt(buffer: pchar; size: longint): PxmlRelaxNGParserCtxt; cdecl; external libxml2;
function xmlRelaxNGNewDocParserCtxt(doc: PxmlDoc): PxmlRelaxNGParserCtxt; cdecl; external libxml2;
function xmlRelaxParserSetFlag(ctxt: PxmlRelaxNGParserCtxt; flag: longint): longint; cdecl; external libxml2;
procedure xmlRelaxNGFreeParserCtxt(ctxt: PxmlRelaxNGParserCtxt); cdecl; external libxml2;
procedure xmlRelaxNGSetParserErrors(ctxt: PxmlRelaxNGParserCtxt; err: TxmlRelaxNGValidityErrorFunc; warn: TxmlRelaxNGValidityWarningFunc; ctx: pointer); cdecl; external libxml2;
function xmlRelaxNGGetParserErrors(ctxt: PxmlRelaxNGParserCtxt; err: PxmlRelaxNGValidityErrorFunc; warn: PxmlRelaxNGValidityWarningFunc; ctx: Ppointer): longint; cdecl; external libxml2;
procedure xmlRelaxNGSetParserStructuredErrors(ctxt: PxmlRelaxNGParserCtxt; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlRelaxNGParse(ctxt: PxmlRelaxNGParserCtxt): PxmlRelaxNG; cdecl; external libxml2;
procedure xmlRelaxNGFree(schema: PxmlRelaxNG); cdecl; external libxml2;
procedure xmlRelaxNGDump(output: PFILE; schema: PxmlRelaxNG); cdecl; external libxml2;
procedure xmlRelaxNGDumpTree(output: PFILE; schema: PxmlRelaxNG); cdecl; external libxml2;
procedure xmlRelaxNGSetValidErrors(ctxt: PxmlRelaxNGValidCtxt; err: TxmlRelaxNGValidityErrorFunc; warn: TxmlRelaxNGValidityWarningFunc; ctx: pointer); cdecl; external libxml2;
function xmlRelaxNGGetValidErrors(ctxt: PxmlRelaxNGValidCtxt; err: PxmlRelaxNGValidityErrorFunc; warn: PxmlRelaxNGValidityWarningFunc; ctx: Ppointer): longint; cdecl; external libxml2;
procedure xmlRelaxNGSetValidStructuredErrors(ctxt: PxmlRelaxNGValidCtxt; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlRelaxNGNewValidCtxt(schema: PxmlRelaxNG): PxmlRelaxNGValidCtxt; cdecl; external libxml2;
procedure xmlRelaxNGFreeValidCtxt(ctxt: PxmlRelaxNGValidCtxt); cdecl; external libxml2;
function xmlRelaxNGValidateDoc(ctxt: PxmlRelaxNGValidCtxt; doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlRelaxNGValidatePushElement(ctxt: PxmlRelaxNGValidCtxt; doc: PxmlDoc; elem: PxmlNode): longint; cdecl; external libxml2;
function xmlRelaxNGValidatePushCData(ctxt: PxmlRelaxNGValidCtxt; Data: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlRelaxNGValidatePopElement(ctxt: PxmlRelaxNGValidCtxt; doc: PxmlDoc; elem: PxmlNode): longint; cdecl; external libxml2;
function xmlRelaxNGValidateFullElement(ctxt: PxmlRelaxNGValidCtxt; doc: PxmlDoc; elem: PxmlNode): longint; cdecl; external libxml2;

// === Konventiert am: 2-3-25 19:42:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
