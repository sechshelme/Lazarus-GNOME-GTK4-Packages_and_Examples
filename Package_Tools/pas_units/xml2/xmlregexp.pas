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

  PxmlRegexpPtr = ^TxmlRegexpPtr;
  TxmlRegexpPtr = PxmlRegexp;

  PxmlRegExecCtxtPtr = ^TxmlRegExecCtxtPtr;
  TxmlRegExecCtxtPtr = PxmlRegExecCtxt;

function xmlRegexpCompile(regexp: PxmlChar): TxmlRegexpPtr; cdecl; external libxml2;
procedure xmlRegFreeRegexp(regexp: TxmlRegexpPtr); cdecl; external libxml2;
function xmlRegexpExec(comp: TxmlRegexpPtr; Value: PxmlChar): longint; cdecl; external libxml2;
procedure xmlRegexpPrint(output: PFILE; regexp: TxmlRegexpPtr); cdecl; external libxml2;
function xmlRegexpIsDeterminist(comp: TxmlRegexpPtr): longint; cdecl; external libxml2;

type
  TxmlRegExecCallbacks = procedure(exec: TxmlRegExecCtxtPtr; token: PxmlChar; transdata: pointer; inputdata: pointer); cdecl;

function xmlRegNewExecCtxt(comp: TxmlRegexpPtr; callback: TxmlRegExecCallbacks; Data: pointer): TxmlRegExecCtxtPtr; cdecl; external libxml2;
procedure xmlRegFreeExecCtxt(exec: TxmlRegExecCtxtPtr); cdecl; external libxml2;
function xmlRegExecPushString(exec: TxmlRegExecCtxtPtr; Value: PxmlChar; Data: pointer): longint; cdecl; external libxml2;
function xmlRegExecPushString2(exec: TxmlRegExecCtxtPtr; Value: PxmlChar; value2: PxmlChar; Data: pointer): longint; cdecl; external libxml2;
function xmlRegExecNextValues(exec: TxmlRegExecCtxtPtr; nbval: Plongint; nbneg: Plongint; values: PPxmlChar; terminal: Plongint): longint; cdecl; external libxml2;
function xmlRegExecErrInfo(exec: TxmlRegExecCtxtPtr; _string: PPxmlChar; nbval: Plongint; nbneg: Plongint; values: PPxmlChar;
  terminal: Plongint): longint; cdecl; external libxml2;

type
  TxmlExpCtxt = record
  end;
  PxmlExpCtxt = ^TxmlExpCtxt;

  PxmlExpCtxtPtr = ^TxmlExpCtxtPtr;
  TxmlExpCtxtPtr = PxmlExpCtxt;

procedure xmlExpFreeCtxt(ctxt: TxmlExpCtxtPtr); cdecl; external libxml2;
function xmlExpNewCtxt(maxNodes: longint; dict: TxmlDictPtr): TxmlExpCtxtPtr; cdecl; external libxml2;
function xmlExpCtxtNbNodes(ctxt: TxmlExpCtxtPtr): longint; cdecl; external libxml2;
function xmlExpCtxtNbCons(ctxt: TxmlExpCtxtPtr): longint; cdecl; external libxml2;

type
  TxmlExpNode = record
  end;
  PxmlExpNode = ^TxmlExpNode;

  PxmlExpNodePtr = ^TxmlExpNodePtr;
  TxmlExpNodePtr = PxmlExpNode;

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
  forbiddenExp: TxmlExpNodePtr; cvar;external libxml2;
  emptyExp: TxmlExpNodePtr; cvar;external libxml2;

procedure xmlExpFree(ctxt: TxmlExpCtxtPtr; expr: TxmlExpNodePtr); cdecl; external libxml2;
procedure xmlExpRef(expr: TxmlExpNodePtr); cdecl; external libxml2;
function xmlExpParse(ctxt: TxmlExpCtxtPtr; expr: pchar): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpNewAtom(ctxt: TxmlExpCtxtPtr; Name: PxmlChar; len: longint): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpNewOr(ctxt: TxmlExpCtxtPtr; left: TxmlExpNodePtr; right: TxmlExpNodePtr): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpNewSeq(ctxt: TxmlExpCtxtPtr; left: TxmlExpNodePtr; right: TxmlExpNodePtr): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpNewRange(ctxt: TxmlExpCtxtPtr; subset: TxmlExpNodePtr; min: longint; max: longint): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpIsNillable(expr: TxmlExpNodePtr): longint; cdecl; external libxml2;
function xmlExpMaxToken(expr: TxmlExpNodePtr): longint; cdecl; external libxml2;
function xmlExpGetLanguage(ctxt: TxmlExpCtxtPtr; expr: TxmlExpNodePtr; langList: PPxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlExpGetStart(ctxt: TxmlExpCtxtPtr; expr: TxmlExpNodePtr; tokList: PPxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlExpStringDerive(ctxt: TxmlExpCtxtPtr; expr: TxmlExpNodePtr; str: PxmlChar; len: longint): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpExpDerive(ctxt: TxmlExpCtxtPtr; expr: TxmlExpNodePtr; sub: TxmlExpNodePtr): TxmlExpNodePtr; cdecl; external libxml2;
function xmlExpSubsume(ctxt: TxmlExpCtxtPtr; expr: TxmlExpNodePtr; sub: TxmlExpNodePtr): longint; cdecl; external libxml2;
procedure xmlExpDump(buf: TxmlBufferPtr; expr: TxmlExpNodePtr); cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:26:00 ===


implementation



end.
