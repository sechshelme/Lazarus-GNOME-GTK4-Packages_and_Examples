unit xmlautomata;

interface

uses
  ctypes, xml2_common, xmlstring, xmlregexp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlAutomata = record
  end;
  PxmlAutomata = ^TxmlAutomata;

  TxmlAutomataState = record
  end;
  PxmlAutomataState = ^TxmlAutomataState;

function xmlNewAutomata: PxmlAutomata; cdecl; external libxml2;
procedure xmlFreeAutomata(am: PxmlAutomata); cdecl; external libxml2;
function xmlAutomataGetInitState(am: PxmlAutomata): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataSetFinalState(am: PxmlAutomata; state: PxmlAutomataState): longint; cdecl; external libxml2;
function xmlAutomataNewState(am: PxmlAutomata): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewTransition(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewTransition2(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; token2: PxmlChar;
  Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewNegTrans(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; token2: PxmlChar;
  Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewCountTrans(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; min: longint;
  max: longint; Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewCountTrans2(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; token2: PxmlChar;
  min: longint; max: longint; Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewOnceTrans(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; min: longint;
  max: longint; Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewOnceTrans2(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; token: PxmlChar; token2: PxmlChar;
  min: longint; max: longint; Data: pointer): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewAllTrans(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; lax: longint): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewEpsilon(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewCountedTrans(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; counter: longint): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewCounterTrans(am: PxmlAutomata; from: PxmlAutomataState; to_: PxmlAutomataState; counter: longint): PxmlAutomataState; cdecl; external libxml2;
function xmlAutomataNewCounter(am: PxmlAutomata; min: longint; max: longint): longint; cdecl; external libxml2;
function xmlAutomataCompile(am: PxmlAutomata): PxmlRegexp; cdecl; external libxml2;
function xmlAutomataIsDeterminist(am: PxmlAutomata): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:20:39 ===


implementation



end.
