unit hash;

interface

uses
  ctypes, xml2_common, xmlstring, dict;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlHashTable = record
  end;
  PxmlHashTable = ^TxmlHashTable;

  PxmlHashTablePtr = ^TxmlHashTablePtr;
  TxmlHashTablePtr = PxmlHashTable;

  TxmlHashDeallocator = procedure(payload: pointer; Name: PxmlChar); cdecl;

  PxmlHashCopier = ^TxmlHashCopier;
  TxmlHashCopier = function(payload: pointer; Name: PxmlChar): pointer; cdecl;

  TxmlHashScanner = procedure(payload: pointer; Data: pointer; Name: PxmlChar); cdecl;
  TxmlHashScannerFull = procedure(payload: pointer; Data: pointer; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar); cdecl;

function xmlHashCreate(size: longint): TxmlHashTablePtr; cdecl; external libxml2;
function xmlHashCreateDict(size: longint; dict: TxmlDictPtr): TxmlHashTablePtr; cdecl; external libxml2;
procedure xmlHashFree(table: TxmlHashTablePtr; f: TxmlHashDeallocator); cdecl; external libxml2;
procedure xmlHashDefaultDeallocator(entry: pointer; Name: PxmlChar); cdecl; external libxml2;
function xmlHashAddEntry(table: TxmlHashTablePtr; Name: PxmlChar; userdata: pointer): longint; cdecl; external libxml2;
function xmlHashUpdateEntry(table: TxmlHashTablePtr; Name: PxmlChar; userdata: pointer; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashAddEntry2(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; userdata: pointer): longint; cdecl; external libxml2;
function xmlHashUpdateEntry2(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; userdata: pointer; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashAddEntry3(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; userdata: pointer): longint; cdecl; external libxml2;
function xmlHashUpdateEntry3(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; userdata: pointer;
  f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashRemoveEntry(table: TxmlHashTablePtr; Name: PxmlChar; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashRemoveEntry2(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashRemoveEntry3(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; f: TxmlHashDeallocator): longint; cdecl; external libxml2;
function xmlHashLookup(table: TxmlHashTablePtr; Name: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashLookup2(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashLookup3(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashQLookup(table: TxmlHashTablePtr; Name: PxmlChar; prefix: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashQLookup2(table: TxmlHashTablePtr; Name: PxmlChar; prefix: PxmlChar; name2: PxmlChar; prefix2: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashQLookup3(table: TxmlHashTablePtr; Name: PxmlChar; prefix: PxmlChar; name2: PxmlChar; prefix2: PxmlChar;
  name3: PxmlChar; prefix3: PxmlChar): pointer; cdecl; external libxml2;
function xmlHashCopy(table: TxmlHashTablePtr; f: TxmlHashCopier): TxmlHashTablePtr; cdecl; external libxml2;
function xmlHashSize(table: TxmlHashTablePtr): longint; cdecl; external libxml2;
procedure xmlHashScan(table: TxmlHashTablePtr; f: TxmlHashScanner; Data: pointer); cdecl; external libxml2;
procedure xmlHashScan3(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; f: TxmlHashScanner;
  Data: pointer); cdecl; external libxml2;
procedure xmlHashScanFull(table: TxmlHashTablePtr; f: TxmlHashScannerFull; Data: pointer); cdecl; external libxml2;
procedure xmlHashScanFull3(table: TxmlHashTablePtr; Name: PxmlChar; name2: PxmlChar; name3: PxmlChar; f: TxmlHashScannerFull;
  Data: pointer); cdecl; external libxml2;

function XML_CAST_FPTR(fptr: Pointer): Pointer;

// === Konventiert am: 26-2-25 19:57:23 ===

implementation


function XML_CAST_FPTR(fptr: Pointer): Pointer;
begin
  XML_CAST_FPTR := fptr;
end;


end.
