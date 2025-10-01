unit xb_opcode;

interface

uses
  fp_glib2, fp_xmlb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXbOpcodeFlags = ^TXbOpcodeFlags;
  TXbOpcodeFlags = longint;

const
  XB_OPCODE_FLAG_UNKNOWN = $0;
  XB_OPCODE_FLAG_INTEGER = 1 shl 0;
  XB_OPCODE_FLAG_TEXT = 1 shl 1;
  XB_OPCODE_FLAG_FUNCTION = 1 shl 2;
  XB_OPCODE_FLAG_BOUND = 1 shl 3;
  XB_OPCODE_FLAG_BOOLEAN = 1 shl 4;
  XB_OPCODE_FLAG_TOKENIZED = 1 shl 5;
  XB_OPCODE_FLAG_LAST = (1 shl 5) + 1;

type
  PXbOpcodeKind = ^TXbOpcodeKind;
  TXbOpcodeKind = longint;

const
  XB_OPCODE_KIND_UNKNOWN = $0;
  XB_OPCODE_KIND_INTEGER = XB_OPCODE_FLAG_INTEGER;
  XB_OPCODE_KIND_TEXT = XB_OPCODE_FLAG_TEXT;
  XB_OPCODE_KIND_FUNCTION = XB_OPCODE_FLAG_FUNCTION or XB_OPCODE_FLAG_INTEGER;
  XB_OPCODE_KIND_BOUND_UNSET = XB_OPCODE_FLAG_BOUND;
  XB_OPCODE_KIND_BOUND_INTEGER = XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_INTEGER;
  XB_OPCODE_KIND_BOUND_TEXT = XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_TEXT;
  XB_OPCODE_KIND_INDEXED_TEXT = XB_OPCODE_FLAG_INTEGER or XB_OPCODE_FLAG_TEXT;
  XB_OPCODE_KIND_BOOLEAN = XB_OPCODE_FLAG_INTEGER or XB_OPCODE_FLAG_BOOLEAN;
  XB_OPCODE_KIND_BOUND_INDEXED_TEXT = (XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_INTEGER) or XB_OPCODE_FLAG_TEXT;
  XB_OPCODE_KIND_LAST = ((XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_INTEGER) or XB_OPCODE_FLAG_TEXT) + 1;

type
  PXbOpcode = type Pointer;
  PPXbOpcode = ^PXbOpcode;

function xb_opcode_cmp_val(self: PXbOpcode): Tgboolean; cdecl; external libxmlb;
function xb_opcode_cmp_str(self: PXbOpcode): Tgboolean; cdecl; external libxmlb;
function xb_opcode_to_string(self: PXbOpcode): Pgchar; cdecl; external libxmlb;
function xb_opcode_kind_to_string(kind: TXbOpcodeKind): Pgchar; cdecl; external libxmlb;
function xb_opcode_kind_from_string(str: Pgchar): TXbOpcodeKind; cdecl; external libxmlb;
function xb_opcode_get_kind(self: PXbOpcode): TXbOpcodeKind; cdecl; external libxmlb;
function xb_opcode_get_str(self: PXbOpcode): Pgchar; cdecl; external libxmlb;
function xb_opcode_get_val(self: PXbOpcode): Tguint32; cdecl; external libxmlb;
procedure xb_opcode_func_init(self: PXbOpcode; func: Tguint32); cdecl; external libxmlb;
procedure xb_opcode_integer_init(self: PXbOpcode; val: Tguint32); cdecl; external libxmlb;
procedure xb_opcode_text_init(self: PXbOpcode; str: Pgchar); cdecl; external libxmlb;
procedure xb_opcode_text_init_static(self: PXbOpcode; str: Pgchar); cdecl; external libxmlb;
procedure xb_opcode_text_init_steal(self: PXbOpcode; str: Pgchar); cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:32 ===


implementation



end.
