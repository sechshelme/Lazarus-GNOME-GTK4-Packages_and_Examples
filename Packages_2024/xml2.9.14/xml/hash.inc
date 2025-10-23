{$IFDEF read_interface}

type
  TxmlHashTable = record
  end;
  PxmlHashTable = ^TxmlHashTable;

  TxmlHashDeallocator = procedure(payload: pointer; Name: PxmlChar); cdecl;

  TxmlHashCopier = function(payload: pointer; Name: PxmlChar): pointer; cdecl;
  PxmlHashCopier = ^TxmlHashCopier;

  TxmlHashScanner = procedure(payload: pointer; Data: pointer; Name: PxmlChar); cdecl;
  TxmlHashScannerFull = procedure(payload: pointer; Data: pointer; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar); cdecl;

function xmlHashCreate(size: longint): PxmlHashTable; cdecl; external libxml2;
function xmlHashCreateDict(size: longint; dict: PxmlDict): PxmlHashTable; cdecl; external libxml2;
procedure xmlHashFree(table: PxmlHashTable; f: TxmlHashDeallocator); cdecl; external libxml2;
procedure xmlHashDefaultDeallocator(entry: pointer; Name: PxmlChar); cdecl; external libxml2;
function xmlHashAddEntry(table: PxmlHashTable; Name: PxmlChar; userdata: pointer): longint; cdecl; external libxml2;
function xmlHashUpdateEntry(table: PxmlHashTable; Name: PxmlChar; userdata: pointer; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashAddEntry2(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; userdata: pointer): longint; cdecl; external libxml2;
function xmlHashUpdateEntry2(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; userdata: pointer; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashAddEntry3(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; userdata: pointer): longint; cdecl; external libxml2;
function xmlHashUpdateEntry3(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; userdata: pointer;
  f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashRemoveEntry(table: PxmlHashTable; Name: PxmlChar; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashRemoveEntry2(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashRemoveEntry3(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashLookup(table: PxmlHashTable; Name: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashLookup2(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashLookup3(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashQLookup(table: PxmlHashTable; Name: PxmlChar; prefix: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashQLookup2(table: PxmlHashTable; Name: PxmlChar; prefix: PxmlChar; name2: PxmlChar; prefix2: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashQLookup3(table: PxmlHashTable; Name: PxmlChar; prefix: PxmlChar; name2: PxmlChar; prefix2: PxmlChar;
  name3: PxmlChar; prefix3: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashCopy(table: PxmlHashTable; f: TxmlHashCopier): PxmlHashTable; cdecl; external libxml2;
function xmlHashSize(table: PxmlHashTable): longint; cdecl; external libxml2;
procedure xmlHashScan(table: PxmlHashTable; f: TxmlHashScanner; Data: pointer); cdecl; external libxml2;
procedure xmlHashScan3(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; f: TxmlHashScanner;
  Data: pointer); cdecl; external libxml2;
procedure xmlHashScanFull(table: PxmlHashTable; f: TxmlHashScannerFull; Data: pointer); cdecl; external libxml2;
procedure xmlHashScanFull3(table: PxmlHashTable; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; f: TxmlHashScannerFull;
  Data: pointer); cdecl; external libxml2;

function XML_CAST_FPTR(fptr: Pointer): Pointer;

// === Konventiert am: 26-2-25 19:57:23 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}


function XML_CAST_FPTR(fptr: Pointer): Pointer;
begin
  XML_CAST_FPTR := fptr;
end;


{$ENDIF read_implementation}
