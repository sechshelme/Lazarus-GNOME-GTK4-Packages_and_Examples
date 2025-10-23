{$IFDEF read_interface}



function sd_journal_print(priority: longint; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_journal_printv(priority: longint; format: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_journal_send(format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_journal_sendv(iov: Piovec; n: longint): longint; cdecl; external libsystemd;
function sd_journal_perror(message: pchar): longint; cdecl; external libsystemd;
function sd_journal_print_with_location(priority: longint; file_: pchar; line: pchar; func: pchar; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_journal_printv_with_location(priority: longint; file_: pchar; line: pchar; func: pchar; format: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_journal_send_with_location(file_: pchar; line: pchar; func: pchar; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_journal_sendv_with_location(file_: pchar; line: pchar; func: pchar; iov: Piovec; n: longint): longint; cdecl; external libsystemd;
function sd_journal_perror_with_location(file_: pchar; line: pchar; func: pchar; message: pchar): longint; cdecl; external libsystemd;
function sd_journal_stream_fd(identifier: pchar; priority: longint; level_prefix: longint): longint; cdecl; external libsystemd;

const
  SD_JOURNAL_LOCAL_ONLY = 1 shl 0;
  SD_JOURNAL_RUNTIME_ONLY = 1 shl 1;
  SD_JOURNAL_SYSTEM = 1 shl 2;
  SD_JOURNAL_CURRENT_USER = 1 shl 3;
  SD_JOURNAL_OS_ROOT = 1 shl 4;
  SD_JOURNAL_ALL_NAMESPACES = 1 shl 5;
  SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE = 1 shl 6;
  SD_JOURNAL_TAKE_DIRECTORY_FD = 1 shl 7;
  SD_JOURNAL_SYSTEM_ONLY = SD_JOURNAL_SYSTEM;

const
  SD_JOURNAL_NOP = 0;
  SD_JOURNAL_APPEND = 1;
  SD_JOURNAL_INVALIDATE = 2;

type
  Psd_journal = type Pointer;
  PPsd_journal = ^Psd_journal;

function sd_journal_open(ret: PPsd_journal; flags: longint): longint; cdecl; external libsystemd;
function sd_journal_open_namespace(ret: PPsd_journal; name_space: pchar; flags: longint): longint; cdecl; external libsystemd;
function sd_journal_open_directory(ret: PPsd_journal; path: pchar; flags: longint): longint; cdecl; external libsystemd;
function sd_journal_open_directory_fd(ret: PPsd_journal; fd: longint; flags: longint): longint; cdecl; external libsystemd;
function sd_journal_open_files(ret: PPsd_journal; paths: PPchar; flags: longint): longint; cdecl; external libsystemd;
function sd_journal_open_files_fd(ret: PPsd_journal; fds: Plongint; n_fds: dword; flags: longint): longint; cdecl; external libsystemd;
function sd_journal_open_container(ret: PPsd_journal; machine: pchar; flags: longint): longint; cdecl; external libsystemd; deprecated;
procedure sd_journal_close(j: Psd_journal); cdecl; external libsystemd;
function sd_journal_previous(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_next(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_step_one(j: Psd_journal; advanced: longint): longint; cdecl; external libsystemd;
function sd_journal_previous_skip(j: Psd_journal; skip: uint64): longint; cdecl; external libsystemd;
function sd_journal_next_skip(j: Psd_journal; skip: uint64): longint; cdecl; external libsystemd;
function sd_journal_get_realtime_usec(j: Psd_journal; ret: Puint64): longint; cdecl; external libsystemd;
function sd_journal_get_monotonic_usec(j: Psd_journal; ret: Puint64; ret_boot_id: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_journal_get_seqnum(j: Psd_journal; ret_seqnum: Puint64; ret_seqnum_id: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_journal_set_data_threshold(j: Psd_journal; sz: Tsize_t): longint; cdecl; external libsystemd;
function sd_journal_get_data_threshold(j: Psd_journal; sz: Psize_t): longint; cdecl; external libsystemd;
function sd_journal_get_data(j: Psd_journal; field: pchar; data: Ppointer; l: Psize_t): longint; cdecl; external libsystemd;
function sd_journal_enumerate_data(j: Psd_journal; data: Ppointer; l: Psize_t): longint; cdecl; external libsystemd;
function sd_journal_enumerate_available_data(j: Psd_journal; data: Ppointer; l: Psize_t): longint; cdecl; external libsystemd;
procedure sd_journal_restart_data(j: Psd_journal); cdecl; external libsystemd;
function sd_journal_add_match(j: Psd_journal; data: pointer; size: Tsize_t): longint; cdecl; external libsystemd;
function sd_journal_add_disjunction(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_add_conjunction(j: Psd_journal): longint; cdecl; external libsystemd;
procedure sd_journal_flush_matches(j: Psd_journal); cdecl; external libsystemd;
function sd_journal_seek_head(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_seek_tail(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_seek_monotonic_usec(j: Psd_journal; boot_id: Tsd_id128_t; usec: uint64): longint; cdecl; external libsystemd;
function sd_journal_seek_realtime_usec(j: Psd_journal; usec: uint64): longint; cdecl; external libsystemd;
function sd_journal_seek_cursor(j: Psd_journal; cursor: pchar): longint; cdecl; external libsystemd;
function sd_journal_get_cursor(j: Psd_journal; cursor: PPchar): longint; cdecl; external libsystemd;
function sd_journal_test_cursor(j: Psd_journal; cursor: pchar): longint; cdecl; external libsystemd;
function sd_journal_get_cutoff_realtime_usec(j: Psd_journal; from: Puint64; to_: Puint64): longint; cdecl; external libsystemd;
function sd_journal_get_cutoff_monotonic_usec(j: Psd_journal; boot_id: Tsd_id128_t; from: Puint64; to_: Puint64): longint; cdecl; external libsystemd;
function sd_journal_get_usage(j: Psd_journal; bytes: Puint64): longint; cdecl; external libsystemd;
function sd_journal_query_unique(j: Psd_journal; field: pchar): longint; cdecl; external libsystemd;
function sd_journal_enumerate_unique(j: Psd_journal; data: Ppointer; l: Psize_t): longint; cdecl; external libsystemd;
function sd_journal_enumerate_available_unique(j: Psd_journal; data: Ppointer; l: Psize_t): longint; cdecl; external libsystemd;
procedure sd_journal_restart_unique(j: Psd_journal); cdecl; external libsystemd;
function sd_journal_enumerate_fields(j: Psd_journal; field: PPchar): longint; cdecl; external libsystemd;
procedure sd_journal_restart_fields(j: Psd_journal); cdecl; external libsystemd;
function sd_journal_get_fd(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_get_events(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_get_timeout(j: Psd_journal; timeout_usec: Puint64): longint; cdecl; external libsystemd;
function sd_journal_process(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_wait(j: Psd_journal; timeout_usec: uint64): longint; cdecl; external libsystemd;
function sd_journal_reliable_fd(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_get_catalog(j: Psd_journal; text: PPchar): longint; cdecl; external libsystemd;
function sd_journal_get_catalog_for_message_id(id: Tsd_id128_t; text: PPchar): longint; cdecl; external libsystemd;
function sd_journal_has_runtime_files(j: Psd_journal): longint; cdecl; external libsystemd;
function sd_journal_has_persistent_files(j: Psd_journal): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:04:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
