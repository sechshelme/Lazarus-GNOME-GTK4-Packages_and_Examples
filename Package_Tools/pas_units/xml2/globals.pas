unit globals;

interface

uses
  ctypes, xml2_common, tree, encoding, parser, xmlerror, xmlmemory, xmlIO;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure xmlInitGlobals; cdecl; external libxml2;
procedure xmlCleanupGlobals; cdecl; external libxml2;

type

  TxmlParserInputBufferCreateFilenameFunc = function(URI: pchar; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl;
  PxmlParserInputBufferCreateFilenameFunc = ^TxmlParserInputBufferCreateFilenameFunc;
  TxmlOutputBufferCreateFilenameFunc = function(URI: pchar; encoder: PxmlCharEncodingHandler; compression: longint): PxmlOutputBuffer; cdecl;
  PxmlOutputBufferCreateFilenameFunc = ^TxmlOutputBufferCreateFilenameFunc;

function xmlParserInputBufferCreateFilenameDefault(func: TxmlParserInputBufferCreateFilenameFunc): TxmlParserInputBufferCreateFilenameFunc; cdecl; external libxml2;
function xmlOutputBufferCreateFilenameDefault(func: TxmlOutputBufferCreateFilenameFunc): TxmlOutputBufferCreateFilenameFunc; cdecl; external libxml2;

type
  TxmlRegisterNodeFunc = procedure(node: PxmlNode); cdecl;
  PxmlRegisterNodeFunc = ^TxmlRegisterNodeFunc;
  TxmlDeregisterNodeFunc = procedure(node: PxmlNode); cdecl;
  PxmlDeregisterNodeFunc = ^TxmlDeregisterNodeFunc;

  TxmlGlobalState = record
    xmlParserVersion: pchar;
    xmlDefaultSAXLocator: TxmlSAXLocator;
    xmlDefaultSAXHandler: TxmlSAXHandlerV1;
    docbDefaultSAXHandler: TxmlSAXHandlerV1;
    htmlDefaultSAXHandler: TxmlSAXHandlerV1;
    xmlFree: TxmlFreeFunc;
    xmlMalloc: TxmlMallocFunc;
    xmlMemStrdup: TxmlStrdupFunc;
    xmlRealloc: TxmlReallocFunc;
    xmlGenericError: TxmlGenericErrorFunc;
    xmlStructuredError: TxmlStructuredErrorFunc;
    xmlGenericErrorContext: pointer;
    oldXMLWDcompatibility: longint;
    xmlBufferAllocScheme: TxmlBufferAllocationScheme;
    xmlDefaultBufferSize: longint;
    xmlSubstituteEntitiesDefaultValue: longint;
    xmlDoValidityCheckingDefaultValue: longint;
    xmlGetWarningsDefaultValue: longint;
    xmlKeepBlanksDefaultValue: longint;
    xmlLineNumbersDefaultValue: longint;
    xmlLoadExtDtdDefaultValue: longint;
    xmlParserDebugEntities: longint;
    xmlPedanticParserDefaultValue: longint;
    xmlSaveNoEmptyTags: longint;
    xmlIndentTreeOutput: longint;
    xmlTreeIndentString: pchar;
    xmlRegisterNodeDefaultValue: TxmlRegisterNodeFunc;
    xmlDeregisterNodeDefaultValue: TxmlDeregisterNodeFunc;
    xmlMallocAtomic: TxmlMallocFunc;
    xmlLastError: TxmlError;
    xmlParserInputBufferCreateFilenameValue: TxmlParserInputBufferCreateFilenameFunc;
    xmlOutputBufferCreateFilenameValue: TxmlOutputBufferCreateFilenameFunc;
    xmlStructuredErrorContext: pointer;
  end;
  PxmlGlobalState = ^TxmlGlobalState;

procedure xmlInitializeGlobalState(gs: PxmlGlobalState); cdecl; external libxml2;
procedure xmlThrDefSetGenericErrorFunc(ctx: pointer; handler: TxmlGenericErrorFunc); cdecl; external libxml2;
procedure xmlThrDefSetStructuredErrorFunc(ctx: pointer; handler: TxmlStructuredErrorFunc); cdecl; external libxml2;
function xmlRegisterNodeDefault(func: TxmlRegisterNodeFunc): TxmlRegisterNodeFunc; cdecl; external libxml2;
function xmlThrDefRegisterNodeDefault(func: TxmlRegisterNodeFunc): TxmlRegisterNodeFunc; cdecl; external libxml2;
function xmlDeregisterNodeDefault(func: TxmlDeregisterNodeFunc): TxmlDeregisterNodeFunc; cdecl; external libxml2;
function xmlThrDefDeregisterNodeDefault(func: TxmlDeregisterNodeFunc): TxmlDeregisterNodeFunc; cdecl; external libxml2;
function xmlThrDefOutputBufferCreateFilenameDefault(func: TxmlOutputBufferCreateFilenameFunc): TxmlOutputBufferCreateFilenameFunc; cdecl; external libxml2;
function xmlThrDefParserInputBufferCreateFilenameDefault(func: TxmlParserInputBufferCreateFilenameFunc): TxmlParserInputBufferCreateFilenameFunc; cdecl; external libxml2;

var
  xmlMalloc: TxmlMallocFunc; cvar;external libxml2;
  xmlMallocAtomic: TxmlMallocFunc; cvar;external libxml2;
  xmlRealloc: TxmlReallocFunc; cvar;external libxml2;
  xmlFree: TxmlFreeFunc; cvar;external libxml2;
  xmlMemStrdup: TxmlStrdupFunc; cvar;external libxml2;
  docbDefaultSAXHandler: TxmlSAXHandlerV1; cvar;external libxml2;
  htmlDefaultSAXHandler: TxmlSAXHandlerV1; cvar;external libxml2;
  xmlLastError: TxmlError; cvar;external libxml2;
  oldXMLWDcompatibility: longint; cvar;external libxml2;
  xmlBufferAllocScheme: TxmlBufferAllocationScheme; cvar;external libxml2;

function xmlThrDefBufferAllocScheme(v: TxmlBufferAllocationScheme): TxmlBufferAllocationScheme; cdecl; external libxml2;

var
  xmlDefaultBufferSize: longint; cvar;external libxml2;

function xmlThrDefDefaultBufferSize(v: longint): longint; cdecl; external libxml2;

var
  xmlDefaultSAXHandler: TxmlSAXHandlerV1; cvar;external libxml2;
  xmlDefaultSAXLocator: TxmlSAXLocator; cvar;external libxml2;
  xmlDoValidityCheckingDefaultValue: longint; cvar;external libxml2;

function xmlThrDefDoValidityCheckingDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlGenericError: TxmlGenericErrorFunc; cvar;external libxml2;
  xmlStructuredError: TxmlStructuredErrorFunc; cvar;external libxml2;
  xmlGenericErrorContext: pointer; cvar;external libxml2;
  xmlStructuredErrorContext: pointer; cvar;external libxml2;
  xmlGetWarningsDefaultValue: longint; cvar;external libxml2;

function xmlThrDefGetWarningsDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlIndentTreeOutput: longint; cvar;external libxml2;

function xmlThrDefIndentTreeOutput(v: longint): longint; cdecl; external libxml2;

var
  xmlTreeIndentString: pchar; cvar;external libxml2;

function xmlThrDefTreeIndentString(v: pchar): pchar; cdecl; external libxml2;

var
  xmlKeepBlanksDefaultValue: longint; cvar;external libxml2;

function xmlThrDefKeepBlanksDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlLineNumbersDefaultValue: longint; cvar;external libxml2;

function xmlThrDefLineNumbersDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlLoadExtDtdDefaultValue: longint; cvar;external libxml2;

function xmlThrDefLoadExtDtdDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlParserDebugEntities: longint; cvar;external libxml2;

function xmlThrDefParserDebugEntities(v: longint): longint; cdecl; external libxml2;

var
  xmlParserVersion: pchar; cvar;external libxml2;
  xmlPedanticParserDefaultValue: longint; cvar;external libxml2;

function xmlThrDefPedanticParserDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlSaveNoEmptyTags: longint; cvar;external libxml2;

function xmlThrDefSaveNoEmptyTags(v: longint): longint; cdecl; external libxml2;

var
  xmlSubstituteEntitiesDefaultValue: longint; cvar;external libxml2;

function xmlThrDefSubstituteEntitiesDefaultValue(v: longint): longint; cdecl; external libxml2;

var
  xmlRegisterNodeDefaultValue: TxmlRegisterNodeFunc; cvar;external libxml2;
  xmlDeregisterNodeDefaultValue: TxmlDeregisterNodeFunc; cvar;external libxml2;
  xmlParserInputBufferCreateFilenameValue: TxmlParserInputBufferCreateFilenameFunc; cvar;external libxml2;
  xmlOutputBufferCreateFilenameValue: TxmlOutputBufferCreateFilenameFunc; cvar;external libxml2;

  // === Konventiert am: 28-2-25 17:50:37 ===


implementation



end.
