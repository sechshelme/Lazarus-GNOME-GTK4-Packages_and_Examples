unit c14n;

interface

uses
  ctypes, xml2_common, xmlstring, tree, xpath;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlC14NMode = ^TxmlC14NMode;
  TxmlC14NMode = longint;

const
  XML_C14N_1_0 = 0;
  XML_C14N_EXCLUSIVE_1_0 = 1;
  XML_C14N_1_1 = 2;

function xmlC14NDocSaveTo(doc: TxmlDocPtr; nodes: PxmlNodeSet; mode: longint; inclusive_ns_prefixes: PPxmlChar; with_comments: longint;
  buf: TxmlOutputBufferPtr): longint; cdecl; external libxml2;
function xmlC14NDocDumpMemory(doc: TxmlDocPtr; nodes: PxmlNodeSet; mode: longint; inclusive_ns_prefixes: PPxmlChar; with_comments: longint;
  doc_txt_ptr: PPxmlChar): longint; cdecl; external libxml2;
function xmlC14NDocSave(doc: TxmlDocPtr; nodes: PxmlNodeSet; mode: longint; inclusive_ns_prefixes: PPxmlChar; with_comments: longint;
  filename: pchar; compression: longint): longint; cdecl; external libxml2;

type
  TxmlC14NIsVisibleCallback = function(user_data: pointer; node: TxmlNodePtr; parent: TxmlNodePtr): longint; cdecl;

function xmlC14NExecute(doc: TxmlDocPtr; is_visible_callback: TxmlC14NIsVisibleCallback; user_data: pointer; mode: longint; inclusive_ns_prefixes: PPxmlChar;
  with_comments: longint; buf: TxmlOutputBufferPtr): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:00 ===


implementation



end.
