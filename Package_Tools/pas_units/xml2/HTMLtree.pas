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

function htmlNewDoc(URI: PxmlChar; ExternalID: PxmlChar): ThtmlDocPtr; cdecl; external libxml2;
function htmlNewDocNoDtD(URI: PxmlChar; ExternalID: PxmlChar): ThtmlDocPtr; cdecl; external libxml2;
function htmlGetMetaEncoding(doc: ThtmlDocPtr): PxmlChar; cdecl; external libxml2;
function htmlSetMetaEncoding(doc: ThtmlDocPtr; encoding: PxmlChar): longint; cdecl; external libxml2;
procedure htmlDocDumpMemory(cur: TxmlDocPtr; mem: PPxmlChar; size: Plongint); cdecl; external libxml2;
procedure htmlDocDumpMemoryFormat(cur: TxmlDocPtr; mem: PPxmlChar; size: Plongint; format: longint); cdecl; external libxml2;
function htmlDocDump(f: PFILE; cur: TxmlDocPtr): longint; cdecl; external libxml2;
function htmlSaveFile(filename: pchar; cur: TxmlDocPtr): longint; cdecl; external libxml2;
function htmlNodeDump(buf: TxmlBufferPtr; doc: TxmlDocPtr; cur: TxmlNodePtr): longint; cdecl; external libxml2;
procedure htmlNodeDumpFile(out_: PFILE; doc: TxmlDocPtr; cur: TxmlNodePtr); cdecl; external libxml2;
function htmlNodeDumpFileFormat(out_: PFILE; doc: TxmlDocPtr; cur: TxmlNodePtr; encoding: pchar; format: longint): longint; cdecl; external libxml2;
function htmlSaveFileEnc(filename: pchar; cur: TxmlDocPtr; encoding: pchar): longint; cdecl; external libxml2;
function htmlSaveFileFormat(filename: pchar; cur: TxmlDocPtr; encoding: pchar; format: longint): longint; cdecl; external libxml2;
procedure htmlNodeDumpFormatOutput(buf: TxmlOutputBufferPtr; doc: TxmlDocPtr; cur: TxmlNodePtr; encoding: pchar; format: longint); cdecl; external libxml2;
procedure htmlDocContentDumpOutput(buf: TxmlOutputBufferPtr; cur: TxmlDocPtr; encoding: pchar); cdecl; external libxml2;
procedure htmlDocContentDumpFormatOutput(buf: TxmlOutputBufferPtr; cur: TxmlDocPtr; encoding: pchar; format: longint); cdecl; external libxml2;
procedure htmlNodeDumpOutput(buf: TxmlOutputBufferPtr; doc: TxmlDocPtr; cur: TxmlNodePtr; encoding: pchar); cdecl; external libxml2;
function htmlIsBooleanAttr(Name: PxmlChar): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:06 ===


implementation



end.
