unit debugXML;

interface

uses
  ctypes, xml2_common, xmlstring, tree, xpath;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure xmlDebugDumpString(output: PFILE; str: PxmlChar); cdecl; external libxml2;
procedure xmlDebugDumpAttr(output: PFILE; attr: PxmlAttr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpAttrList(output: PFILE; attr: PxmlAttr; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpOneNode(output: PFILE; node: PxmlNode; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpNode(output: PFILE; node: PxmlNode; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpNodeList(output: PFILE; node: PxmlNode; depth: longint); cdecl; external libxml2;
procedure xmlDebugDumpDocumentHead(output: PFILE; doc: PxmlDoc); cdecl; external libxml2;
procedure xmlDebugDumpDocument(output: PFILE; doc: PxmlDoc); cdecl; external libxml2;
procedure xmlDebugDumpDTD(output: PFILE; dtd: PxmlDtd); cdecl; external libxml2;
procedure xmlDebugDumpEntities(output: PFILE; doc: PxmlDoc); cdecl; external libxml2;
function xmlDebugCheckDocument(output: PFILE; doc: PxmlDoc): longint; cdecl; external libxml2;
procedure xmlLsOneNode(output: PFILE; node: PxmlNode); cdecl; external libxml2;
function xmlLsCountNode(node: PxmlNode): longint; cdecl; external libxml2;
function xmlBoolToText(boolval: longint): pchar; cdecl; external libxml2;

type
  PxmlShellReadlineFunc = ^TxmlShellReadlineFunc;
  TxmlShellReadlineFunc = function(prompt: pchar): pchar; cdecl;

  TxmlShellCtxt = record
    filename: pchar;
    doc: PxmlDoc;
    node: PxmlNode;
    pctxt: PxmlXPathContext;
    loaded: longint;
    output: PFILE;
    input: TxmlShellReadlineFunc;
  end;
  PxmlShellCtxt = ^TxmlShellCtxt;

  TxmlShellCmd = function(ctxt: PxmlShellCtxt; arg: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl;

procedure xmlShellPrintXPathError(errorType: longint; arg: pchar); cdecl; external libxml2;
procedure xmlShellPrintXPathResult(list: PxmlXPathObject); cdecl; external libxml2;
function xmlShellList(ctxt: PxmlShellCtxt; arg: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellBase(ctxt: PxmlShellCtxt; arg: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellDir(ctxt: PxmlShellCtxt; arg: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellLoad(ctxt: PxmlShellCtxt; filename: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
procedure xmlShellPrintNode(node: PxmlNode); cdecl; external libxml2;
function xmlShellCat(ctxt: PxmlShellCtxt; arg: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellWrite(ctxt: PxmlShellCtxt; filename: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellSave(ctxt: PxmlShellCtxt; filename: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellValidate(ctxt: PxmlShellCtxt; dtd: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellDu(ctxt: PxmlShellCtxt; arg: pchar; tree: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlShellPwd(ctxt: PxmlShellCtxt; buffer: pchar; node: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
procedure xmlShell(doc: PxmlDoc; filename: pchar; input: TxmlShellReadlineFunc; output: PFILE); cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:17:05 ===


implementation



end.
