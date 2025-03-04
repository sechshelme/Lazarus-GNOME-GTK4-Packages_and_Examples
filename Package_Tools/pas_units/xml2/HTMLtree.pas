unit HTMLtree;

interface

uses
  ctypes, xml2_common, xmlstring, tree, HTMLparser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  HTML_TEXT_NODE = XML_TEXT_NODE;
  HTML_ENTITY_REF_NODE = XML_ENTITY_REF_NODE;
  HTML_COMMENT_NODE = XML_COMMENT_NODE;
  HTML_PRESERVE_NODE = XML_CDATA_SECTION_NODE;
  HTML_PI_NODE = XML_PI_NODE;

function htmlNewDoc(URI: PxmlChar; ExternalID: PxmlChar): PhtmlDoc; cdecl; external libxml2;
function htmlNewDocNoDtD(URI: PxmlChar; ExternalID: PxmlChar): PhtmlDoc; cdecl; external libxml2;
function htmlGetMetaEncoding(doc: PhtmlDoc): PxmlChar; cdecl; external libxml2;
function htmlSetMetaEncoding(doc: PhtmlDoc; encoding: PxmlChar): longint; cdecl; external libxml2;
procedure htmlDocDumpMemory(cur: PxmlDoc; mem: PPxmlChar; size: Plongint); cdecl; external libxml2;
procedure htmlDocDumpMemoryFormat(cur: PxmlDoc; mem: PPxmlChar; size: Plongint; format: longint); cdecl; external libxml2;
function htmlDocDump(f: PFILE; cur: PxmlDoc): longint; cdecl; external libxml2;
function htmlSaveFile(filename: pchar; cur: PxmlDoc): longint; cdecl; external libxml2;
function htmlNodeDump(buf: PxmlBuffer; doc: PxmlDoc; cur: PxmlNode): longint; cdecl; external libxml2;
procedure htmlNodeDumpFile(out_: PFILE; doc: PxmlDoc; cur: PxmlNode); cdecl; external libxml2;
function htmlNodeDumpFileFormat(out_: PFILE; doc: PxmlDoc; cur: PxmlNode; encoding: pchar; format: longint): longint; cdecl; external libxml2;
function htmlSaveFileEnc(filename: pchar; cur: PxmlDoc; encoding: pchar): longint; cdecl; external libxml2;
function htmlSaveFileFormat(filename: pchar; cur: PxmlDoc; encoding: pchar; format: longint): longint; cdecl; external libxml2;
procedure htmlNodeDumpFormatOutput(buf: PxmlOutputBuffer; doc: PxmlDoc; cur: PxmlNode; encoding: pchar; format: longint); cdecl; external libxml2;
procedure htmlDocContentDumpOutput(buf: PxmlOutputBuffer; cur: PxmlDoc; encoding: pchar); cdecl; external libxml2;
procedure htmlDocContentDumpFormatOutput(buf: PxmlOutputBuffer; cur: PxmlDoc; encoding: pchar; format: longint); cdecl; external libxml2;
procedure htmlNodeDumpOutput(buf: PxmlOutputBuffer; doc: PxmlDoc; cur: PxmlNode; encoding: pchar); cdecl; external libxml2;
function htmlIsBooleanAttr(Name: PxmlChar): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:06 ===


implementation



end.
