{$IFDEF read_interface}


const
  AVAHI_DOMAIN_NAME_MAX = 1014;
  AVAHI_LABEL_MAX = 64;

function avahi_normalize_name(s: pchar; ret_s: pchar; size: Tsize_t): pchar; cdecl; external libavahi_common;
function avahi_normalize_name_strdup(s: pchar): pchar; cdecl; external libavahi_common;
function avahi_domain_equal(a: pchar; b: pchar): longint; cdecl; external libavahi_common;
function avahi_domain_hash(name: pchar): dword; cdecl; external libavahi_common;
function avahi_unescape_label(name: PPchar; dest: pchar; size: Tsize_t): pchar; cdecl; external libavahi_common;
function avahi_escape_label(src: pchar; src_length: Tsize_t; ret_name: PPchar; ret_size: Psize_t): pchar; cdecl; external libavahi_common;
function avahi_is_valid_service_type_generic(t: pchar): longint; cdecl; external libavahi_common;
function avahi_is_valid_service_type_strict(t: pchar): longint; cdecl; external libavahi_common;
function avahi_is_valid_service_subtype(t: pchar): longint; cdecl; external libavahi_common;
function avahi_is_valid_domain_name(t: pchar): longint; cdecl; external libavahi_common;
function avahi_is_valid_service_name(t: pchar): longint; cdecl; external libavahi_common;
function avahi_is_valid_host_name(t: pchar): longint; cdecl; external libavahi_common;
function avahi_is_valid_fqdn(t: pchar): longint; cdecl; external libavahi_common;
function avahi_service_name_join(p: pchar; size: Tsize_t; name: pchar; _type: pchar; domain: pchar): longint; cdecl; external libavahi_common;
function avahi_service_name_split(p: pchar; name: pchar; name_size: Tsize_t; _type: pchar; type_size: Tsize_t; domain: pchar; domain_size: Tsize_t): longint; cdecl; external libavahi_common;
function avahi_get_type_from_subtype(t: pchar): pchar; cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:59:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
