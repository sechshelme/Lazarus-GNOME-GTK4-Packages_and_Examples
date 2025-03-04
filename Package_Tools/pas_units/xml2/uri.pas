unit uri;

interface

uses
  ctypes, xml2_common, xmlstring;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlURIPtr = ^TxmlURIPtr;
  TxmlURIPtr = ^TxmlURI;
  PxmlURI = ^TxmlURI;

  TxmlURI = record
    scheme: pchar;
    opaque: pchar;
    authority: pchar;
    server: pchar;
    user: pchar;
    port: longint;
    path: pchar;
    query: pchar;
    fragment: pchar;
    cleanup: longint;
    query_raw: pchar;
  end;

function xmlCreateURI: TxmlURIPtr; cdecl; external libxml2;
function xmlBuildURI(URI: PxmlChar; base: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlBuildRelativeURI(URI: PxmlChar; base: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseURI(str: pchar): TxmlURIPtr; cdecl; external libxml2;
function xmlParseURIRaw(str: pchar; raw: longint): TxmlURIPtr; cdecl; external libxml2;
function xmlParseURIReference(uri: TxmlURIPtr; str: pchar): longint; cdecl; external libxml2;
function xmlSaveUri(uri: TxmlURIPtr): PxmlChar; cdecl; external libxml2;
procedure xmlPrintURI(stream: PFILE; uri: TxmlURIPtr); cdecl; external libxml2;
function xmlURIEscapeStr(str: PxmlChar; list: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlURIUnescapeString(str: pchar; len: longint; target: pchar): pchar; cdecl; external libxml2;
function xmlNormalizeURIPath(path: pchar): longint; cdecl; external libxml2;
function xmlURIEscape(str: PxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlFreeURI(uri: TxmlURIPtr); cdecl; external libxml2;
function xmlCanonicPath(path: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlPathToURI(path: PxmlChar): PxmlChar; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:30:10 ===


implementation



end.
