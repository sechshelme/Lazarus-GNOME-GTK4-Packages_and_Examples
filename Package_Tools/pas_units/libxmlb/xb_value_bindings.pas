unit xb_value_bindings;

interface

uses
  fp_glib2, fp_xmlb, xb_opcode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TXbValueBindings = record
    dummy0: Tguint8;
    dummy1: Tguint32;
    dummy2: array[0..1] of Tgpointer;
    dummy3: Tguint8;
    dummy4: Tguint32;
    dummy5: array[0..1] of Tgpointer;
    dummy6: Tguint8;
    dummy7: Tguint32;
    dummy8: array[0..1] of Tgpointer;
    dummy9: Tguint8;
    dummy10: Tguint32;
    dummy11: array[0..1] of Tgpointer;
    dummy12: array[0..2] of Tgpointer;
  end;
  PXbValueBindings = ^TXbValueBindings;

function xb_value_bindings_get_type: TGType; cdecl; external libxmlb;
procedure xb_value_bindings_init(self: PXbValueBindings); cdecl; external libxmlb;
procedure xb_value_bindings_clear(self: PXbValueBindings); cdecl; external libxmlb;
function xb_value_bindings_copy(self: PXbValueBindings): PXbValueBindings; cdecl; external libxmlb;
procedure xb_value_bindings_free(self: PXbValueBindings); cdecl; external libxmlb;
function xb_value_bindings_is_bound(self: PXbValueBindings; idx: Tguint): Tgboolean; cdecl; external libxmlb;
procedure xb_value_bindings_bind_str(self: PXbValueBindings; idx: Tguint; str: Pgchar; destroy_func: TGDestroyNotify); cdecl; external libxmlb;
procedure xb_value_bindings_bind_val(self: PXbValueBindings; idx: Tguint; val: Tguint32); cdecl; external libxmlb;
function xb_value_bindings_lookup_opcode(self: PXbValueBindings; idx: Tguint; opcode_out: PXbOpcode): Tgboolean; cdecl; external libxmlb;
function xb_value_bindings_copy_binding(self: PXbValueBindings; idx: Tguint; dest: PXbValueBindings; dest_idx: Tguint): Tgboolean; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:57 ===


implementation



end.
