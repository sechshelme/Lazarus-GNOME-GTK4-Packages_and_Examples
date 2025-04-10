
{$IFDEF read_interface}

type
  TGTimer = record
  end;
  PGTimer = ^TGTimer;

const
  G_USEC_PER_SEC = 1000000;

function g_timer_new: PGTimer; cdecl; external libglib2;
procedure g_timer_destroy(timer: PGTimer); cdecl; external libglib2;
procedure g_timer_start(timer: PGTimer); cdecl; external libglib2;
procedure g_timer_stop(timer: PGTimer); cdecl; external libglib2;
procedure g_timer_reset(timer: PGTimer); cdecl; external libglib2;
procedure g_timer_continue(timer: PGTimer); cdecl; external libglib2;
function g_timer_elapsed(timer: PGTimer; microseconds: Pgulong): Tgdouble; cdecl; external libglib2;
function g_timer_is_active(timer: PGTimer): Tgboolean; cdecl; external libglib2;
procedure g_usleep(microseconds: Tgulong); cdecl; external libglib2;
procedure g_time_val_add(time_: PGTimeVal; microseconds: Tglong); cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_62';
function g_time_val_from_iso8601(iso_date: Pgchar; time_: PGTimeVal): Tgboolean; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_62_FOR(g_date_time_new_from_iso8601)';
function g_time_val_to_iso8601(time_: PGTimeVal): Pgchar; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_62_FOR(g_date_time_format)';

// === Konventiert am: 7-8-24 16:06:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
