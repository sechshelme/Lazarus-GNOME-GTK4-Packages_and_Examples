unit schematron;

interface

uses
  ctypes, xml2_common, xmlerror, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlSchematronValidOptions = ^TxmlSchematronValidOptions;
  TxmlSchematronValidOptions = longint;

const
  XML_SCHEMATRON_OUT_QUIET = 1 shl 0;
  XML_SCHEMATRON_OUT_TEXT = 1 shl 1;
  XML_SCHEMATRON_OUT_XML = 1 shl 2;
  XML_SCHEMATRON_OUT_ERROR = 1 shl 3;
  XML_SCHEMATRON_OUT_FILE = 1 shl 8;
  XML_SCHEMATRON_OUT_BUFFER = 1 shl 9;
  XML_SCHEMATRON_OUT_IO = 1 shl 10;

type
  TxmlSchematron = record
  end;
  PxmlSchematron = ^TxmlSchematron;

  PxmlSchematronPtr = ^TxmlSchematronPtr;
  TxmlSchematronPtr = PxmlSchematron;

  TxmlSchematronValidityErrorFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;
  TxmlSchematronValidityWarningFunc = procedure(ctx: pointer; msg: pchar; args: array of const); cdecl;

  TxmlSchematronParserCtxt = record
  end;
  PxmlSchematronParserCtxt = ^TxmlSchematronParserCtxt;

  PxmlSchematronParserCtxtPtr = ^TxmlSchematronParserCtxtPtr;
  TxmlSchematronParserCtxtPtr = PxmlSchematronParserCtxt;

  TxmlSchematronValidCtxt = record
  end;
  PxmlSchematronValidCtxt = ^TxmlSchematronValidCtxt;

  PxmlSchematronValidCtxtPtr = ^TxmlSchematronValidCtxtPtr;
  TxmlSchematronValidCtxtPtr = PxmlSchematronValidCtxt;

function xmlSchematronNewParserCtxt(URL: pchar): TxmlSchematronParserCtxtPtr; cdecl; external libxml2;
function xmlSchematronNewMemParserCtxt(buffer: pchar; size: longint): TxmlSchematronParserCtxtPtr; cdecl; external libxml2;
function xmlSchematronNewDocParserCtxt(doc: TxmlDocPtr): TxmlSchematronParserCtxtPtr; cdecl; external libxml2;
procedure xmlSchematronFreeParserCtxt(ctxt: TxmlSchematronParserCtxtPtr); cdecl; external libxml2;
function xmlSchematronParse(ctxt: TxmlSchematronParserCtxtPtr): TxmlSchematronPtr; cdecl; external libxml2;
procedure xmlSchematronFree(schema: TxmlSchematronPtr); cdecl; external libxml2;
procedure xmlSchematronSetValidStructuredErrors(ctxt: TxmlSchematronValidCtxtPtr; serror: TxmlStructuredErrorFunc; ctx: pointer); cdecl; external libxml2;
function xmlSchematronNewValidCtxt(schema: TxmlSchematronPtr; options: longint): TxmlSchematronValidCtxtPtr; cdecl; external libxml2;
procedure xmlSchematronFreeValidCtxt(ctxt: TxmlSchematronValidCtxtPtr); cdecl; external libxml2;
function xmlSchematronValidateDoc(ctxt: TxmlSchematronValidCtxtPtr; instance: TxmlDocPtr): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:33:52 ===


implementation



end.
