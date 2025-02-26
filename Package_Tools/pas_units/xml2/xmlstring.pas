unit xmlstring;

interface

uses
  ctypes, xml2_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  //  TxmlChar = byte;
  TxmlChar = char;
  PxmlChar = ^TxmlChar;
  PPxmlChar = ^PxmlChar;

  {#define BAD_CAST (xmlChar *) }
  BAD_CAST = PxmlChar;

function xmlStrdup(cur: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStrndup(cur: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlCharStrndup(cur: pchar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlCharStrdup(cur: pchar): PxmlChar; cdecl; external libxml2;
function xmlStrsub(str: PxmlChar; start: longint; len: longint): PxmlChar; cdecl; external libxml2;
function xmlStrchr(str: PxmlChar; val: TxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStrstr(str: PxmlChar; val: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStrcasestr(str: PxmlChar; val: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStrcmp(str1: PxmlChar; str2: PxmlChar): longint; cdecl; external libxml2;
function xmlStrncmp(str1: PxmlChar; str2: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlStrcasecmp(str1: PxmlChar; str2: PxmlChar): longint; cdecl; external libxml2;
function xmlStrncasecmp(str1: PxmlChar; str2: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlStrEqual(str1: PxmlChar; str2: PxmlChar): longint; cdecl; external libxml2;
function xmlStrQEqual(pref: PxmlChar; Name: PxmlChar; str: PxmlChar): longint; cdecl; external libxml2;
function xmlStrlen(str: PxmlChar): longint; cdecl; external libxml2;
function xmlStrcat(cur: PxmlChar; add: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStrncat(cur: PxmlChar; add: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlStrncatNew(str1: PxmlChar; str2: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlStrPrintf(buf: PxmlChar; len: longint; msg: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlStrPrintf(buf: PxmlChar; len: longint; msg: pchar): longint; cdecl; external libxml2;
function xmlStrVPrintf(buf: PxmlChar; len: longint; msg: pchar; ap: Tva_list): longint; cdecl; external libxml2;
function xmlGetUTF8Char(utf: pbyte; len: Plongint): longint; cdecl; external libxml2;
function xmlCheckUTF8(utf: pbyte): longint; cdecl; external libxml2;
function xmlUTF8Strsize(utf: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlUTF8Strndup(utf: PxmlChar; len: longint): PxmlChar; cdecl; external libxml2;
function xmlUTF8Strpos(utf: PxmlChar; pos: longint): PxmlChar; cdecl; external libxml2;
function xmlUTF8Strloc(utf: PxmlChar; utfchar: PxmlChar): longint; cdecl; external libxml2;
function xmlUTF8Strsub(utf: PxmlChar; start: longint; len: longint): PxmlChar; cdecl; external libxml2;
function xmlUTF8Strlen(utf: PxmlChar): longint; cdecl; external libxml2;
function xmlUTF8Size(utf: PxmlChar): longint; cdecl; external libxml2;
function xmlUTF8Charcmp(utf1: PxmlChar; utf2: PxmlChar): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 16:06:12 ===


implementation



end.
