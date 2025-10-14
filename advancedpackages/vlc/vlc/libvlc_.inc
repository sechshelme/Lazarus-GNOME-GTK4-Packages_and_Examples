{$IFDEF read_interface}


type
  Plibvlc_instance_t = type Pointer;

  Plibvlc_time_t = ^Tlibvlc_time_t;
  Tlibvlc_time_t = Tint64_t;

function libvlc_errmsg: pchar; cdecl; external libvlc;
procedure libvlc_clearerr; cdecl; external libvlc;
function libvlc_vprinterr(fmt: pchar; ap: Tva_list): pchar; cdecl; external libvlc;
function libvlc_printerr(fmt: pchar): pchar; cdecl; varargs; external libvlc;
function libvlc_new(argc: longint; argv: PPchar): Plibvlc_instance_t; cdecl; external libvlc;
procedure libvlc_release(p_instance: Plibvlc_instance_t); cdecl; external libvlc;
procedure libvlc_retain(p_instance: Plibvlc_instance_t); cdecl; external libvlc;
function libvlc_add_intf(p_instance: Plibvlc_instance_t; name: pchar): longint; cdecl; external libvlc;

type
  TExit_Hanler_proc = procedure(para1: pointer);

procedure libvlc_set_exit_handler(p_instance: Plibvlc_instance_t; cb: TExit_Hanler_proc; opaque: pointer); cdecl; external libvlc;
procedure libvlc_set_user_agent(p_instance: Plibvlc_instance_t; name: pchar; http: pchar); cdecl; external libvlc;
procedure libvlc_set_app_id(p_instance: Plibvlc_instance_t; id: pchar; version: pchar; icon: pchar); cdecl; external libvlc;
function libvlc_get_version: pchar; cdecl; external libvlc;
function libvlc_get_compiler: pchar; cdecl; external libvlc;
function libvlc_get_changeset: pchar; cdecl; external libvlc;
procedure libvlc_free(ptr: pointer); cdecl; external libvlc;

type
  Plibvlc_event_manager_t = type Pointer;
  Plibvlc_event_t_ = type Pointer;

  Plibvlc_event_type_t = ^Tlibvlc_event_type_t;
  Tlibvlc_event_type_t = longint;

  Tlibvlc_callback_t = procedure(p_event: Plibvlc_event_t_; p_data: pointer); cdecl;

function libvlc_event_attach(p_event_manager: Plibvlc_event_manager_t; i_event_type: Tlibvlc_event_type_t; f_callback: Tlibvlc_callback_t; user_data: pointer): longint; cdecl; external libvlc;
procedure libvlc_event_detach(p_event_manager: Plibvlc_event_manager_t; i_event_type: Tlibvlc_event_type_t; f_callback: Tlibvlc_callback_t; p_user_data: pointer); cdecl; external libvlc;
function libvlc_event_type_name(event_type: Tlibvlc_event_type_t): pchar; cdecl; external libvlc;

type
  Tlibvlc_log_level = longint;

const
  LIBVLC_DEBUG = 0;
  LIBVLC_NOTICE = 2;
  LIBVLC_WARNING = 3;
  LIBVLC_ERROR_ = 4;

type
  Plibvlc_log_t = type Pointer;

procedure libvlc_log_get_context(ctx: Plibvlc_log_t; module: PPchar; file_: PPchar; line: Pdword); cdecl; external libvlc;
procedure libvlc_log_get_object(ctx: Plibvlc_log_t; name: PPchar; header: PPchar; id: Puintptr_t); cdecl; external libvlc;

type
  Tlibvlc_log_cb = procedure(data: pointer; level: longint; ctx: Plibvlc_log_t; fmt: pchar; args: Tva_list); cdecl;

procedure libvlc_log_unset(p_instance: Plibvlc_instance_t); cdecl; external libvlc;
procedure libvlc_log_set(p_instance: Plibvlc_instance_t; cb: Tlibvlc_log_cb; data: pointer); cdecl; external libvlc;
procedure libvlc_log_set_file(p_instance: Plibvlc_instance_t; stream: PFILE); cdecl; external libvlc;

type
  Plibvlc_module_description_t = ^Tlibvlc_module_description_t;

  Tlibvlc_module_description_t = record
    psz_name: pchar;
    psz_shortname: pchar;
    psz_longname: pchar;
    psz_help: pchar;
    p_next: Plibvlc_module_description_t;
  end;

procedure libvlc_module_description_list_release(p_list: Plibvlc_module_description_t); cdecl; external libvlc;
function libvlc_audio_filter_list_get(p_instance: Plibvlc_instance_t): Plibvlc_module_description_t; cdecl; external libvlc;
function libvlc_video_filter_list_get(p_instance: Plibvlc_instance_t): Plibvlc_module_description_t; cdecl; external libvlc;
function libvlc_clock: Tint64_t; cdecl; external libvlc;

function libvlc_delay(pts: Tint64_t): Tint64_t;

// === Konventiert am: 13-10-25 19:24:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function libvlc_delay(pts: Tint64_t): Tint64_t;
begin
  Result := pts - libvlc_clock;
end;



{$ENDIF read_implementation}
