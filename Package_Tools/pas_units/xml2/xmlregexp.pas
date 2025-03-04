unit xmlregexp;

interface

uses
  ctypes, xml2_common, xmlstring, dict, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TxmlRegexp = record
  end;
  PxmlRegexp = ^TxmlRegexp;

  txmlRegExecCtxt = record
  end;
  PxmlRegExecCtxt = ^TxmlRegExecCtxt;

function xmlRegexpCompile(regexp: PxmlChar): PxmlRegexp; cdecl; external libxml2;
procedure xmlRegFreeRegexp(regexp: PxmlRegexp); cdecl; external libxml2;
function xmlRegexpExec(comp: PxmlRegexp; Value: PxmlChar): longint; cdecl; external libxml2;
procedure xmlRegexpPrint(output: PFILE; regexp: PxmlRegexp); cdecl; external libxml2;
function xmlRegexpIsDeterminist(comp: PxmlRegexp): longint; cdecl; external libxml2;

type
  TxmlRegExecCallbacks = procedure(exec: PxmlRegExecCtxt; token: PxmlChar; transdata: pointer; inputdata: pointer); cdecl;

function xmlRegNewExecCtxt(comp: PxmlRegexp; callback: TxmlRegExecCallbacks; Data: pointer): PxmlRegExecCtxt; cdecl; external libxml2;
procedure xmlRegFreeExecCtxt(exec: PxmlRegExecCtxt); cdecl; external libxml2;
function xmlRegExecPushString(exec: PxmlRegExecCtxt; Value: PxmlChar; Data: pointer): longint; cdecl; external libxml2;
function xmlRegExecPushString2(exec: PxmlRegExecCtxt; Value: PxmlChar; value2: PxmlChar; Data: pointer): longint; cdecl; external libxml2;
function xmlRegExecNextValues(exec: PxmlRegExecCtxt; nbval: Plongint; nbneg: Plongint; values: PPxmlChar; terminal: Plongint): longint; cdecl; external libxml2;
function xmlRegExecErrInfo(exec: PxmlRegExecCtxt; _string: PPxmlChar; nbval: Plongint; nbneg: Plongint; values: PPxmlChar;
  terminal: Plongint): longint; cdecl; external libxml2;

type
  TxmlExpCtxt = record
  end;
  PxmlExpCtxt = ^TxmlExpCtxt;

procedure xmlExpFreeCtxt(ctxt: PxmlExpCtxt); cdecl; external libxml2;
function xmlExpNewCtxt(maxNodes: longint; dict: PxmlDict): PxmlExpCtxt; cdecl; external libxml2;
function xmlExpCtxtNbNodes(ctxt: PxmlExpCtxt): longint; cdecl; external libxml2;
function xmlExpCtxtNbCons(ctxt: PxmlExpCtxt): longint; cdecl; external libxml2;

type
  TxmlExpNode = record
  end;
  PxmlExpNode = ^TxmlExpNode;

type
  PxmlExpNodeType = ^TxmlExpNodeType;
  TxmlExpNodeType = longint;

const
  XML_EXP_EMPTY = 0;
  XML_EXP_FORBID = 1;
  XML_EXP_ATOM = 2;
  XML_EXP_SEQ = 3;
  XML_EXP_OR = 4;
  XML_EXP_COUNT = 5;

var
  forbiddenExp: PxmlExpNode; cvar;external libxml2;
  emptyExp: PxmlExpNode; cvar;external libxml2;

procedure xmlExpFree(ctxt: PxmlExpCtxt; expr: PxmlExpNode); cdecl; external libxml2;
procedure xmlExpRef(expr: PxmlExpNode); cdecl; external libxml2;
function xmlExpParse(ctxt: PxmlExpCtxt; expr: pchar): PxmlExpNode; cdecl; external libxml2;
function xmlExpNewAtom(ctxt: PxmlExpCtxt; Name: PxmlChar; len: longint): PxmlExpNode; cdecl; external libxml2;
function xmlExpNewOr(ctxt: PxmlExpCtxt; left: PxmlExpNode; right: PxmlExpNode): PxmlExpNode; cdecl; external libxml2;
function xmlExpNewSeq(ctxt: PxmlExpCtxt; left: PxmlExpNode; right: PxmlExpNode): PxmlExpNode; cdecl; external libxml2;
function xmlExpNewRange(ctxt: PxmlExpCtxt; subset: PxmlExpNode; min: longint; max: longint): PxmlExpNode; cdecl; external libxml2;
function xmlExpIsNillable(expr: PxmlExpNode): longint; cdecl; external libxml2;
function xmlExpMaxToken(expr: PxmlExpNode): longint; cdecl; external libxml2;
function xmlExpGetLanguage(ctxt: PxmlExpCtxt; expr: PxmlExpNode; langList: PPxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlExpGetStart(ctxt: PxmlExpCtxt; expr: PxmlExpNode; tokList: PPxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlExpStringDerive(ctxt: PxmlExpCtxt; expr: PxmlExpNode; str: PxmlChar; len: longint): PxmlExpNode; cdecl; external libxml2;
function xmlExpExpDerive(ctxt: PxmlExpCtxt; expr: PxmlExpNode; sub: PxmlExpNode): PxmlExpNode; cdecl; external libxml2;
function xmlExpSubsume(ctxt: PxmlExpCtxt; expr: PxmlExpNode; sub: PxmlExpNode): longint; cdecl; external libxml2;
procedure xmlExpDump(buf: PxmlBuffer; expr: PxmlExpNode); cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:26:00 ===


implementation



end.
