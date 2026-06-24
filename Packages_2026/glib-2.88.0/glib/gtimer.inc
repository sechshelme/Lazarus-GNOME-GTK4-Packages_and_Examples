{$IFDEF read_interface}


type
  PGTimer = type Pointer;

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
procedure g_time_val_add(time_: PGTimeVal; microseconds: Tglong); cdecl; external libglib2; deprecated;
function g_time_val_from_iso8601(iso_date: Pgchar; time_: PGTimeVal): Tgboolean; cdecl; external libglib2; deprecated;
function g_time_val_to_iso8601(time_: PGTimeVal): Pgchar; cdecl; external libglib2; deprecated;

function G_NSEC_PER_SEC: uint64;

// === Konventiert am: 22-6-26 19:40:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function G_NSEC_PER_SEC: uint64;
begin
  G_NSEC_PER_SEC := G_GUINT64_CONSTANT(1000000000);
end;


{$ENDIF read_implementation}
