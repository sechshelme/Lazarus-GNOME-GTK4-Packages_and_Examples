unit globals;

interface

uses
  ctypes, xml2_common, tree, encoding, parser, xmlerror, xmlmemory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure xmlInitGlobals; cdecl; external libxml2;
procedure xmlCleanupGlobals; cdecl; external libxml2;

type

  TxmlParserInputBufferCreateFilenameFunc = function(URI: pchar; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl;
  PxmlParserInputBufferCreateFilenameFunc=^TxmlParserInputBufferCreateFilenameFunc;
  TxmlOutputBufferCreateFilenameFunc = function(URI: pchar; encoder: TxmlCharEncodingHandlerPtr; compression: longint): TxmlOutputBufferPtr; cdecl;
  PxmlOutputBufferCreateFilenameFunc=^TxmlOutputBufferCreateFilenameFunc;

function xmlParserInputBufferCreateFilenameDefault(func: TxmlParserInputBufferCreateFilenameFunc): TxmlParserInputBufferCreateFilenameFunc; cdecl; external libxml2;
function xmlOutputBufferCreateFilenameDefault(func: TxmlOutputBufferCreateFilenameFunc): TxmlOutputBufferCreateFilenameFunc; cdecl; external libxml2;

type
  TxmlRegisterNodeFunc = procedure(node: TxmlNodePtr); cdecl;
  PxmlRegisterNodeFunc=^TxmlRegisterNodeFunc;
  TxmlDeregisterNodeFunc = procedure(node: TxmlNodePtr); cdecl;
  PxmlDeregisterNodeFunc=^TxmlDeregisterNodeFunc;

  PxmlGlobalStatePtr = ^TxmlGlobalStatePtr;
  TxmlGlobalStatePtr = ^TxmlGlobalState;
  //  PxmlGlobalState = ^TxmlGlobalState;
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

procedure xmlInitializeGlobalState(gs: TxmlGlobalStatePtr); cdecl; external libxml2;
procedure xmlThrDefSetGenericErrorFunc(ctx: pointer; handler: TxmlGenericErrorFunc); cdecl; external libxml2;
procedure xmlThrDefSetStructuredErrorFunc(ctx: pointer; handler: TxmlStructuredErrorFunc); cdecl; external libxml2;
function xmlRegisterNodeDefault(func: TxmlRegisterNodeFunc): TxmlRegisterNodeFunc; cdecl; external libxml2;
function xmlThrDefRegisterNodeDefault(func: TxmlRegisterNodeFunc): TxmlRegisterNodeFunc; cdecl; external libxml2;
function xmlDeregisterNodeDefault(func: TxmlDeregisterNodeFunc): TxmlDeregisterNodeFunc; cdecl; external libxml2;
function xmlThrDefDeregisterNodeDefault(func: TxmlDeregisterNodeFunc): TxmlDeregisterNodeFunc; cdecl; external libxml2;
function xmlThrDefOutputBufferCreateFilenameDefault(func: TxmlOutputBufferCreateFilenameFunc): TxmlOutputBufferCreateFilenameFunc; cdecl; external libxml2;
function xmlThrDefParserInputBufferCreateFilenameDefault(func: TxmlParserInputBufferCreateFilenameFunc): TxmlParserInputBufferCreateFilenameFunc; cdecl; external libxml2;


{#ifdef LIBXML_THREAD_ALLOC_ENABLED }
{#ifdef LIBXML_THREAD_ENABLED }
//function __xmlMalloc: PxmlMallocFunc; cdecl; external libxml2;
{#define xmlMalloc \ }
{(*(__xmlMalloc())) }
{#else }
var
  xmlMalloc: TxmlMallocFunc; cvar;external libxml2;
  {#endif }
  {#ifdef LIBXML_THREAD_ENABLED }

//function __xmlMallocAtomic: PxmlMallocFunc; cdecl; external libxml2;
{#define xmlMallocAtomic \ }
{(*(__xmlMallocAtomic())) }
{#else }
var
  xmlMallocAtomic: TxmlMallocFunc; cvar;external libxml2;
  {#endif }
  {#ifdef LIBXML_THREAD_ENABLED }

//function __xmlRealloc: PxmlReallocFunc; cdecl; external libxml2;
{#define xmlRealloc \ }
{(*(__xmlRealloc())) }
{#else }
var
  xmlRealloc: TxmlReallocFunc; cvar;external libxml2;
  {#endif }
  {#ifdef LIBXML_THREAD_ENABLED }

//function __xmlFree: PxmlFreeFunc; cdecl; external libxml2;
{#define xmlFree \ }
{(*(__xmlFree())) }
{#else }
var
  xmlFree: TxmlFreeFunc; cvar;external libxml2;
  {#endif }
  {#ifdef LIBXML_THREAD_ENABLED }

//function __xmlMemStrdup: PxmlStrdupFunc; cdecl; external libxml2;
{#define xmlMemStrdup \ }
{(*(__xmlMemStrdup())) }
{#else }
var
  xmlMemStrdup: TxmlStrdupFunc; cvar;external libxml2;
  {#endif }
  //{$else}
  { !LIBXML_THREAD_ALLOC_ENABLED  }
//var
//  xmlMalloc: TxmlMallocFunc; cvar;external libxml2;
//  xmlMallocAtomic: TxmlMallocFunc; cvar;external libxml2;
//  xmlRealloc: TxmlReallocFunc; cvar;external libxml2;
//  xmlFree: TxmlFreeFunc; cvar;external libxml2;
//  xmlMemStrdup: TxmlStrdupFunc; cvar;external libxml2;
  //{$endif}
  { LIBXML_THREAD_ALLOC_ENABLED  }
  {#ifdef LIBXML_DOCB_ENABLED }

//function __docbDefaultSAXHandler: PxmlSAXHandlerV1; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define docbDefaultSAXHandler \ }
{(*(__docbDefaultSAXHandler())) }
{#else }
var
  docbDefaultSAXHandler: TxmlSAXHandlerV1; cvar;external libxml2;
  {#endif }
  {#endif }
  {#ifdef LIBXML_HTML_ENABLED }

//function __htmlDefaultSAXHandler: PxmlSAXHandlerV1; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define htmlDefaultSAXHandler \ }
{(*(__htmlDefaultSAXHandler())) }
{#else }
var
  htmlDefaultSAXHandler: TxmlSAXHandlerV1; cvar;external libxml2;
  {#endif }
//((  {$endif}

//function __xmlLastError: PxmlError; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlLastError \ }
{(*(__xmlLastError())) }
{#else }
var
  xmlLastError: TxmlError; cvar;external libxml2;
  {#endif }
{
 * Everything starting from the line below is
 * Automatically generated by build_glob.py.
 * Do not modify the previous line.
  }

//function __oldXMLWDcompatibility: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define oldXMLWDcompatibility \ }
{(*(__oldXMLWDcompatibility())) }
{#else }
var
  oldXMLWDcompatibility: longint; cvar;external libxml2;
  {#endif }

//function __xmlBufferAllocScheme: PxmlBufferAllocationScheme; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlBufferAllocScheme \ }
{(*(__xmlBufferAllocScheme())) }
{#else }
var
  xmlBufferAllocScheme: TxmlBufferAllocationScheme; cvar;external libxml2;
  {#endif }

function xmlThrDefBufferAllocScheme(v: TxmlBufferAllocationScheme): TxmlBufferAllocationScheme; cdecl; external libxml2;
//function __xmlDefaultBufferSize: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlDefaultBufferSize \ }
{(*(__xmlDefaultBufferSize())) }
{#else }
var
  xmlDefaultBufferSize: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefDefaultBufferSize(v: longint): longint; cdecl; external libxml2;
//function __xmlDefaultSAXHandler: PxmlSAXHandlerV1; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlDefaultSAXHandler \ }
{(*(__xmlDefaultSAXHandler())) }
{#else }
var
  xmlDefaultSAXHandler: TxmlSAXHandlerV1; cvar;external libxml2;
  {#endif }

//function __xmlDefaultSAXLocator: PxmlSAXLocator; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlDefaultSAXLocator \ }
{(*(__xmlDefaultSAXLocator())) }
{#else }
var
  xmlDefaultSAXLocator: TxmlSAXLocator; cvar;external libxml2;
  {#endif }

//function __xmlDoValidityCheckingDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlDoValidityCheckingDefaultValue \ }
{(*(__xmlDoValidityCheckingDefaultValue())) }
{#else }
var
  xmlDoValidityCheckingDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefDoValidityCheckingDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlGenericError: PxmlGenericErrorFunc; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlGenericError \ }
{(*(__xmlGenericError())) }
{#else }
var
  xmlGenericError: TxmlGenericErrorFunc; cvar;external libxml2;
  {#endif }

//function __xmlStructuredError: PxmlStructuredErrorFunc; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlStructuredError \ }
{(*(__xmlStructuredError())) }
{#else }
var
  xmlStructuredError: TxmlStructuredErrorFunc; cvar;external libxml2;
  {#endif }

//function __xmlGenericErrorContext: Ppointer; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlGenericErrorContext \ }
{(*(__xmlGenericErrorContext())) }
{#else }
var
  xmlGenericErrorContext: pointer; cvar;external libxml2;
  {#endif }

//function __xmlStructuredErrorContext: Ppointer; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlStructuredErrorContext \ }
{(*(__xmlStructuredErrorContext())) }
{#else }
var
  xmlStructuredErrorContext: pointer; cvar;external libxml2;
  {#endif }

//function __xmlGetWarningsDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlGetWarningsDefaultValue \ }
{(*(__xmlGetWarningsDefaultValue())) }
{#else }
var
  xmlGetWarningsDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefGetWarningsDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlIndentTreeOutput: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlIndentTreeOutput \ }
{(*(__xmlIndentTreeOutput())) }
{#else }
var
  xmlIndentTreeOutput: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefIndentTreeOutput(v: longint): longint; cdecl; external libxml2;
//function __xmlTreeIndentString: PPChar; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlTreeIndentString \ }
{(*(__xmlTreeIndentString())) }
{#else }
var
  xmlTreeIndentString: pchar; cvar;external libxml2;
  {#endif }

function xmlThrDefTreeIndentString(v: pchar): pchar; cdecl; external libxml2;
//function __xmlKeepBlanksDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlKeepBlanksDefaultValue \ }
{(*(__xmlKeepBlanksDefaultValue())) }
{#else }
var
  xmlKeepBlanksDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefKeepBlanksDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlLineNumbersDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlLineNumbersDefaultValue \ }
{(*(__xmlLineNumbersDefaultValue())) }
{#else }
var
  xmlLineNumbersDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefLineNumbersDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlLoadExtDtdDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlLoadExtDtdDefaultValue \ }
{(*(__xmlLoadExtDtdDefaultValue())) }
{#else }
var
  xmlLoadExtDtdDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefLoadExtDtdDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlParserDebugEntities: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlParserDebugEntities \ }
{(*(__xmlParserDebugEntities())) }
{#else }
var
  xmlParserDebugEntities: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefParserDebugEntities(v: longint): longint; cdecl; external libxml2;
//function __xmlParserVersion: PPchar; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlParserVersion \ }
{(*(__xmlParserVersion())) }
{#else }
var
  xmlParserVersion: pchar; cvar;external libxml2;
  {#endif }

//function __xmlPedanticParserDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlPedanticParserDefaultValue \ }
{(*(__xmlPedanticParserDefaultValue())) }
{#else }
var
  xmlPedanticParserDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefPedanticParserDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlSaveNoEmptyTags: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlSaveNoEmptyTags \ }
{(*(__xmlSaveNoEmptyTags())) }
{#else }
var
  xmlSaveNoEmptyTags: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefSaveNoEmptyTags(v: longint): longint; cdecl; external libxml2;
//function __xmlSubstituteEntitiesDefaultValue: Plongint; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlSubstituteEntitiesDefaultValue \ }
{(*(__xmlSubstituteEntitiesDefaultValue())) }
{#else }
var
  xmlSubstituteEntitiesDefaultValue: longint; cvar;external libxml2;
  {#endif }

function xmlThrDefSubstituteEntitiesDefaultValue(v: longint): longint; cdecl; external libxml2;
//function __xmlRegisterNodeDefaultValue: PxmlRegisterNodeFunc; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlRegisterNodeDefaultValue \ }
{(*(__xmlRegisterNodeDefaultValue())) }
{#else }
var
  xmlRegisterNodeDefaultValue: TxmlRegisterNodeFunc; cvar;external libxml2;
  {#endif }

//function __xmlDeregisterNodeDefaultValue: PxmlDeregisterNodeFunc; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlDeregisterNodeDefaultValue \ }
{(*(__xmlDeregisterNodeDefaultValue())) }
{#else }
var
  xmlDeregisterNodeDefaultValue: TxmlDeregisterNodeFunc; cvar;external libxml2;
  {#endif }

//function __xmlParserInputBufferCreateFilenameValue: PxmlParserInputBufferCreateFilenameFunc; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlParserInputBufferCreateFilenameValue \ }
{(*(__xmlParserInputBufferCreateFilenameValue())) }
{#else }
var
  xmlParserInputBufferCreateFilenameValue: TxmlParserInputBufferCreateFilenameFunc; cvar;external libxml2;
  {#endif }

//function __xmlOutputBufferCreateFilenameValue: PxmlOutputBufferCreateFilenameFunc; cdecl; external libxml2;
{#ifdef LIBXML_THREAD_ENABLED }
{#define xmlOutputBufferCreateFilenameValue \ }
{(*(__xmlOutputBufferCreateFilenameValue())) }
{#else }
var
  xmlOutputBufferCreateFilenameValue: TxmlOutputBufferCreateFilenameFunc; cvar;external libxml2;
  {#endif }
  { C++ end of extern C conditionnal removed }
//  {$endif}
  { __XML_GLOBALS_H  }

  // === Konventiert am: 28-2-25 17:50:37 ===


implementation



end.
