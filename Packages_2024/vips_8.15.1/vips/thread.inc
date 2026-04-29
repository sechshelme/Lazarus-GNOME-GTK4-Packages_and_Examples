

{$IFDEF read_function}
function vips_g_mutex_new: PGMutex; cdecl; external libvips;
procedure vips_g_mutex_free(para1: PGMutex); cdecl; external libvips;

function vips_g_cond_new: PGCond; cdecl; external libvips;
procedure vips_g_cond_free(para1: PGCond); cdecl; external libvips;

function vips_g_thread_new(para1: pchar; para2: TGThreadFunc; para3: Tgpointer): PGThread; cdecl; external libvips;
function vips_thread_isvips: Tgboolean; cdecl; external libvips;
function vips_thread_execute(domain: pchar; func: TGFunc; data: Tgpointer): longint; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PVipsThreadset = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_threadset_new(max_threads: longint): PVipsThreadset; cdecl; external libvips;
function vips_threadset_run(set_: PVipsThreadset; domain: pchar; func: TGFunc; data: Tgpointer): longint; cdecl; external libvips;
procedure vips_threadset_free(set_: PVipsThreadset); cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:09:54 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
