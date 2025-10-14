{$IFDEF read_interface}

type
  Plibvlc_dialog_id = type Pointer;

type
  Plibvlc_dialog_question_type = ^Tlibvlc_dialog_question_type;
  Tlibvlc_dialog_question_type = longint;

const
  LIBVLC_DIALOG_QUESTION_NORMAL = 0;
  LIBVLC_DIALOG_QUESTION_WARNING = 1;
  LIBVLC_DIALOG_QUESTION_CRITICAL = 2;

type
  Tlibvlc_dialog_cbs = record
    pf_display_error: procedure(p_data: pointer; psz_title: pchar; psz_text: pchar); cdecl;
    pf_display_login: procedure(p_data: pointer; p_id: Plibvlc_dialog_id; psz_title: pchar; psz_text: pchar; psz_default_username: pchar;      b_ask_store: Boolean); cdecl;
    pf_display_question: procedure(p_data: pointer; p_id: Plibvlc_dialog_id; psz_title: pchar; psz_text: pchar; i_type: Tlibvlc_dialog_question_type;      psz_cancel: pchar; psz_action1: pchar; psz_action2: pchar); cdecl;
    pf_display_progress: procedure(p_data: pointer; p_id: Plibvlc_dialog_id; psz_title: pchar; psz_text: pchar; b_indeterminate: Boolean;      f_position: single; psz_cancel: pchar); cdecl;
    pf_cancel: procedure(p_data: pointer; p_id: Plibvlc_dialog_id); cdecl;
    pf_update_progress: procedure(p_data: pointer; p_id: Plibvlc_dialog_id; f_position: single; psz_text: pchar); cdecl;
  end;
  Plibvlc_dialog_cbs = ^Tlibvlc_dialog_cbs;

procedure libvlc_dialog_set_callbacks(p_instance: Plibvlc_instance_t; p_cbs: Plibvlc_dialog_cbs; p_data: pointer); cdecl; external libvlc;
procedure libvlc_dialog_set_context(p_id: Plibvlc_dialog_id; p_context: pointer); cdecl; external libvlc;
function libvlc_dialog_get_context(p_id: Plibvlc_dialog_id): pointer; cdecl; external libvlc;
function libvlc_dialog_post_login(p_id: Plibvlc_dialog_id; psz_username: pchar; psz_password: pchar; b_store: Boolean): longint; cdecl; external libvlc;
function libvlc_dialog_post_action(p_id: Plibvlc_dialog_id; i_action: longint): longint; cdecl; external libvlc;
function libvlc_dialog_dismiss(p_id: Plibvlc_dialog_id): longint; cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
