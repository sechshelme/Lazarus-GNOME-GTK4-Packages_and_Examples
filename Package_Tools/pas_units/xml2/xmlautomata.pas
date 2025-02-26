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

  PxmlAutomataPtr = ^TxmlAutomataPtr;
  TxmlAutomataPtr = PxmlAutomata;

  PxmlAutomataStatePtr = ^TxmlAutomataStatePtr;
  TxmlAutomataStatePtr = PxmlAutomataState;

function xmlNewAutomata: TxmlAutomataPtr; cdecl; external libxml2;
procedure xmlFreeAutomata(am: TxmlAutomataPtr); cdecl; external libxml2;
function xmlAutomataGetInitState(am: TxmlAutomataPtr): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataSetFinalState(am: TxmlAutomataPtr; state: TxmlAutomataStatePtr): longint; cdecl; external libxml2;
function xmlAutomataNewState(am: TxmlAutomataPtr): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewTransition(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewTransition2(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; token2: PxmlChar;
  Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewNegTrans(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; token2: PxmlChar;
  Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewCountTrans(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; min: longint;
  max: longint; Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewCountTrans2(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; token2: PxmlChar;
  min: longint; max: longint; Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewOnceTrans(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; min: longint;
  max: longint; Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewOnceTrans2(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; token: PxmlChar; token2: PxmlChar;
  min: longint; max: longint; Data: pointer): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewAllTrans(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; lax: longint): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewEpsilon(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewCountedTrans(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; counter: longint): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewCounterTrans(am: TxmlAutomataPtr; from: TxmlAutomataStatePtr; to_: TxmlAutomataStatePtr; counter: longint): TxmlAutomataStatePtr; cdecl; external libxml2;
function xmlAutomataNewCounter(am: TxmlAutomataPtr; min: longint; max: longint): longint; cdecl; external libxml2;
function xmlAutomataCompile(am: TxmlAutomataPtr): TxmlRegexpPtr; cdecl; external libxml2;
function xmlAutomataIsDeterminist(am: TxmlAutomataPtr): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 19:20:39 ===


implementation



end.
