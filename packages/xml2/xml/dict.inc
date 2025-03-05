{$IFDEF read_interface}

type
  TxmlDict = record
  end;
  PxmlDict = ^TxmlDict;

function xmlInitializeDict: longint; cdecl; external libxml2;
function xmlDictCreate: PxmlDict; cdecl; external libxml2;
function xmlDictSetLimit(dict: PxmlDict; limit: Tsize_t): Tsize_t; cdecl; external libxml2;
function xmlDictGetUsage(dict: PxmlDict): Tsize_t; cdecl; external libxml2;
function xmlDictCreateSub(sub: PxmlDict): PxmlDict; cdecl; external libxml2;
function xmlDictReference(dict: PxmlDict): longint; cdecl; external libxml2;
procedure xmlDictFree(dict: PxmlDict); cdecl; external libxml2;
function xmlDictLookup(dict: PxmlDict; Name: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlDictExists(dict: PxmlDict; Name: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlDictQLookup(dict: PxmlDict; prefix: PxmlChar; Name: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlDictOwns(dict: PxmlDict; str: PxmlChar): longint; cdecl; external libxml2;
function xmlDictSize(dict: PxmlDict): longint; cdecl; external libxml2;
procedure xmlDictCleanup; cdecl; external libxml2;

// === Konventiert am: 26-2-25 17:31:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
