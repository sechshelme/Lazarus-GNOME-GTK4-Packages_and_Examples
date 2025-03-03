unit debugXML;

interface

uses
  ctypes, xml2_common, xmlstring, tree, xpath;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure xmlDebugDumpString(output: PFILE; str: PxmlChar); cdecl; external libxml2;
procedure xmlDebugDumpAttr(output: PFILE; attr: TxmlAttrPtr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpAttrList(output: PFILE; attr: TxmlAttrPtr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpOneNode(output: PFILE; node: TxmlNodePtr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpNode(output: PFILE; node: TxmlNodePtr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpNodeList(output: PFILE; node: TxmlNodePtr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpDocumentHead(output: PFILE; doc: TxmlDocPtr); cdecl; external libxml2;
procedure xmlDebugDumpDocument(output: PFILE; doc: TxmlDocPtr); cdecl; external libxml2;
procedure xmlDebugDumpDTD(output: PFILE; dtd: TxmlDtdPtr); cdecl; external libxml2;
procedure xmlDebugDumpEntities(output: PFILE; doc: TxmlDocPtr); cdecl; external libxml2;
function xmlDebugCheckDocument(output: PFILE; doc: TxmlDocPtr): longint; cdecl; external libxml2;
procedure xmlLsOneNode(output: PFILE; node: TxmlNodePtr); cdecl; external libxml2;
function xmlLsCountNode(node: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlBoolToText(boolval: longint): pchar; cdecl; external libxml2;

type
  PxmlShellReadlineFunc = ^TxmlShellReadlineFunc;
  TxmlShellReadlineFunc = function(prompt: pchar): pchar; cdecl;

  PxmlShellCtxtPtr = ^TxmlShellCtxtPtr;
  TxmlShellCtxtPtr = ^TxmlShellCtxt;
  PxmlShellCtxt = ^TxmlShellCtxt;

  TxmlShellCtxt = record
    filename: pchar;
    doc: TxmlDocPtr;
    node: TxmlNodePtr;
    pctxt: TxmlXPathContextPtr;
    loaded: longint;
    output: PFILE;
    input: TxmlShellReadlineFunc;
  end;

  TxmlShellCmd = function(ctxt: TxmlShellCtxtPtr; arg: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl;

procedure xmlShellPrintXPathError(errorType: longint; arg: pchar); cdecl; external libxml2;
procedure xmlShellPrintXPathResult(list: TxmlXPathObjectPtr); cdecl; external libxml2;
function xmlShellList(ctxt: TxmlShellCtxtPtr; arg: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellBase(ctxt: TxmlShellCtxtPtr; arg: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellDir(ctxt: TxmlShellCtxtPtr; arg: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellLoad(ctxt: TxmlShellCtxtPtr; filename: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
procedure xmlShellPrintNode(node: TxmlNodePtr); cdecl; external libxml2;
function xmlShellCat(ctxt: TxmlShellCtxtPtr; arg: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellWrite(ctxt: TxmlShellCtxtPtr; filename: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellSave(ctxt: TxmlShellCtxtPtr; filename: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellValidate(ctxt: TxmlShellCtxtPtr; dtd: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellDu(ctxt: TxmlShellCtxtPtr; arg: pchar; tree: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlShellPwd(ctxt: TxmlShellCtxtPtr; buffer: pchar; node: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
procedure xmlShell(doc: TxmlDocPtr; filename: pchar; input: TxmlShellReadlineFunc; output: PFILE); cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:17:05 ===


implementation



end.
