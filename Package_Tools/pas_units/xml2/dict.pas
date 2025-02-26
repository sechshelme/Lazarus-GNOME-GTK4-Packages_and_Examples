unit dict;

interface

uses
  ctypes, xml2_common, xmlstring;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlDict = record
  end;
  PxmlDict = ^TxmlDict;

  PxmlDictPtr = ^TxmlDictPtr;
  TxmlDictPtr = PxmlDict;

function xmlInitializeDict: longint; cdecl; external libxml2;
function xmlDictCreate: TxmlDictPtr; cdecl; external libxml2;
function xmlDictSetLimit(dict: TxmlDictPtr; limit: Tsize_t): Tsize_t; cdecl; external libxml2;
function xmlDictGetUsage(dict: TxmlDictPtr): Tsize_t; cdecl; external libxml2;
function xmlDictCreateSub(sub: TxmlDictPtr): TxmlDictPtr; cdecl; external libxml2;
function xmlDictReference(dict: TxmlDictPtr): longint; cdecl; external libxml2;
procedure xmlDictFree(dict: TxmlDictPtr); cdecl; external libxml2;
function xmlDictLookup(dict: TxmlDictPtr; Name: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlDictExists(dict: TxmlDictPtr; Name: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlDictQLookup(dict: TxmlDictPtr; prefix: PxmlChar; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlDictOwns(dict: TxmlDictPtr; str: PxmlChar): longint; cdecl; external libxml2;
function xmlDictSize(dict: TxmlDictPtr): longint; cdecl; external libxml2;
procedure xmlDictCleanup; cdecl; external libxml2;

// === Konventiert am: 26-2-25 17:31:17 ===


implementation



end.
