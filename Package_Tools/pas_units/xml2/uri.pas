unit uri;

interface

uses
  ctypes, xml2_common, xmlstring;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
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
  PxmlURI = ^TxmlURI;

function xmlCreateURI: PxmlURI; cdecl; external libxml2;
function xmlBuildURI(URI: PxmlChar; base: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlBuildRelativeURI(URI: PxmlChar; base: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseURI(str: pchar): PxmlURI; cdecl; external libxml2;
function xmlParseURIRaw(str: pchar; raw: longint): PxmlURI; cdecl; external libxml2;
function xmlParseURIReference(uri: PxmlURI; str: pchar): longint; cdecl; external libxml2;
function xmlSaveUri(uri: PxmlURI): PxmlChar; cdecl; external libxml2;
procedure xmlPrintURI(stream: PFILE; uri: PxmlURI); cdecl; external libxml2;
function xmlURIEscapeStr(str: PxmlChar; list: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlURIUnescapeString(str: pchar; len: longint; target: pchar): pchar; cdecl; external libxml2;
function xmlNormalizeURIPath(path: pchar): longint; cdecl; external libxml2;
function xmlURIEscape(str: PxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlFreeURI(uri: PxmlURI); cdecl; external libxml2;
function xmlCanonicPath(path: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlPathToURI(path: PxmlChar): PxmlChar; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:30:10 ===


implementation



end.
