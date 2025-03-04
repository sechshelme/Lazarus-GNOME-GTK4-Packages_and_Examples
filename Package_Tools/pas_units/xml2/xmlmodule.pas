unit xmlmodule;

interface

uses
  ctypes, xml2_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlModule = record
  end;
  PxmlModule = ^TxmlModule;

  PxmlModulePtr = ^TxmlModulePtr;
  TxmlModulePtr = PxmlModule;

  PxmlModuleOption = ^TxmlModuleOption;
  TxmlModuleOption = longint;

const
  XML_MODULE_LAZY = 1;
  XML_MODULE_LOCAL = 2;

function xmlModuleOpen(filename: pchar; options: longint): TxmlModulePtr; cdecl; external libxml2;
function xmlModuleSymbol(module: TxmlModulePtr; Name: pchar; Result: Ppointer): longint; cdecl; external libxml2;
function xmlModuleClose(module: TxmlModulePtr): longint; cdecl; external libxml2;
function xmlModuleFree(module: TxmlModulePtr): longint; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:49:52 ===


implementation



end.
