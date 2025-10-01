unit xb_stack;

interface

uses
  fp_glib2, fp_xmlb, xb_opcode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXbStack = type Pointer;

function xb_stack_get_type: TGType; cdecl; external libxmlb;
function xb_stack_to_string(self: PXbStack): Pgchar; cdecl; external libxmlb;
function xb_stack_pop(self: PXbStack; opcode_out: PXbOpcode; error: PPGError): Tgboolean; cdecl; external libxmlb;
function xb_stack_push(self: PXbStack; opcode_out: PPXbOpcode; error: PPGError): Tgboolean; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:51 ===


implementation



end.
