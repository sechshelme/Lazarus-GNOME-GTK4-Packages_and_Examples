{$IFDEF read_interface}



function avahi_malloc(size: Tsize_t): pointer; cdecl; external libavahi_common;
function avahi_malloc0(size: Tsize_t): pointer; cdecl; external libavahi_common;
procedure avahi_free(p: pointer); cdecl; external libavahi_common;
function avahi_realloc(p: pointer; size: Tsize_t): pointer; cdecl; external libavahi_common;
function avahi_strdup(s: pchar): pchar; cdecl; external libavahi_common;
function avahi_strndup(s: pchar; l: Tsize_t): pchar; cdecl; external libavahi_common;
function avahi_memdup(s: pointer; l: Tsize_t): pointer; cdecl; external libavahi_common;

type
  TAvahiAllocator = record
    malloc: function(size: Tsize_t): pointer; cdecl;
    free: procedure(p: pointer); cdecl;
    realloc: function(p: pointer; size: Tsize_t): pointer; cdecl;
    calloc: function(nmemb: Tsize_t; size: Tsize_t): pointer; cdecl;
  end;
  PAvahiAllocator = ^TAvahiAllocator;

procedure avahi_set_allocator(a: PAvahiAllocator); cdecl; external libavahi_common;
function avahi_strdup_printf(fmt: pchar): pchar; cdecl; varargs; external libavahi_common;
function avahi_strdup_vprintf(fmt: pchar; ap: Tva_list): pchar; cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:59:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
