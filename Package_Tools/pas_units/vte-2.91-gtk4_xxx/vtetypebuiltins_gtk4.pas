unit vtetypebuiltins_gtk4;

interface

uses
  fp_glib2, fp_GTK4, vte;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function vte_cursor_blink_mode_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_CURSOR_BLINK_MODE: TGType;

function vte_cursor_shape_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_CURSOR_SHAPE: TGType;

function vte_text_blink_mode_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_TEXT_BLINK_MODE: TGType;

function vte_erase_binding_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_ERASE_BINDING: TGType;

function vte_pty_error_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_PTY_ERROR: TGType;

function vte_pty_flags_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_PTY_FLAGS: TGType;

function vte_write_flags_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_WRITE_FLAGS: TGType;

function vte_regex_error_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_REGEX_ERROR: TGType;

function vte_format_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_FORMAT: TGType;

function vte_align_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function VTE_TYPE_ALIGN: TGType;


// === Konventiert am: 3-5-25 17:07:03 ===


implementation


function VTE_TYPE_CURSOR_BLINK_MODE: TGType;
begin
  VTE_TYPE_CURSOR_BLINK_MODE := vte_cursor_blink_mode_get_type;
end;

function VTE_TYPE_CURSOR_SHAPE: TGType;
begin
  VTE_TYPE_CURSOR_SHAPE := vte_cursor_shape_get_type;
end;

function VTE_TYPE_TEXT_BLINK_MODE: TGType;
begin
  VTE_TYPE_TEXT_BLINK_MODE := vte_text_blink_mode_get_type;
end;

function VTE_TYPE_ERASE_BINDING: TGType;
begin
  VTE_TYPE_ERASE_BINDING := vte_erase_binding_get_type;
end;

function VTE_TYPE_PTY_ERROR: TGType;
begin
  VTE_TYPE_PTY_ERROR := vte_pty_error_get_type;
end;

function VTE_TYPE_PTY_FLAGS: TGType;
begin
  VTE_TYPE_PTY_FLAGS := vte_pty_flags_get_type;
end;

function VTE_TYPE_WRITE_FLAGS: TGType;
begin
  VTE_TYPE_WRITE_FLAGS := vte_write_flags_get_type;
end;

function VTE_TYPE_REGEX_ERROR: TGType;
begin
  VTE_TYPE_REGEX_ERROR := vte_regex_error_get_type;
end;

function VTE_TYPE_FORMAT: TGType;
begin
  VTE_TYPE_FORMAT := vte_format_get_type;
end;

function VTE_TYPE_ALIGN: TGType;
begin
  VTE_TYPE_ALIGN := vte_align_get_type;
end;


end.
