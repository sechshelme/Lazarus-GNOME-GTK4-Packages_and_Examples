{$IFDEF read_interface}


type
  PPAvahiStringList = ^PAvahiStringList;
  PAvahiStringList = ^TAvahiStringList;
  TAvahiStringList = record
    next: PAvahiStringList;
    size: Tsize_t;
    text: array[0..0] of Tuint8_t;
  end;

function avahi_string_list_new(txt: pchar): PAvahiStringList; cdecl; varargs; external libavahi_common;
function avahi_string_list_new_va(va: Tva_list): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_new_from_array(arr: PPchar; length: longint): PAvahiStringList; cdecl; external libavahi_common;
procedure avahi_string_list_free(l: PAvahiStringList); cdecl; external libavahi_common;
function avahi_string_list_add(l: PAvahiStringList; text: pchar): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_add_printf(l: PAvahiStringList; format: pchar): PAvahiStringList; cdecl; varargs; external libavahi_common;
function avahi_string_list_add_vprintf(l: PAvahiStringList; format: pchar; va: Tva_list): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_add_arbitrary(l: PAvahiStringList; text: Puint8_t; size: Tsize_t): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_add_anonymous(l: PAvahiStringList; size: Tsize_t): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_add_many(r: PAvahiStringList): PAvahiStringList; cdecl; varargs; external libavahi_common;
function avahi_string_list_add_many_va(r: PAvahiStringList; va: Tva_list): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_to_string(l: PAvahiStringList): pchar; cdecl; external libavahi_common;
function avahi_string_list_serialize(l: PAvahiStringList; data: pointer; size: Tsize_t): Tsize_t; cdecl; external libavahi_common;
function avahi_string_list_parse(data: pointer; size: Tsize_t; ret: PPAvahiStringList): longint; cdecl; external libavahi_common;
function avahi_string_list_equal(a: PAvahiStringList; b: PAvahiStringList): longint; cdecl; external libavahi_common;
function avahi_string_list_copy(l: PAvahiStringList): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_reverse(l: PAvahiStringList): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_length(l: PAvahiStringList): dword; cdecl; external libavahi_common;
function avahi_string_list_get_next(l: PAvahiStringList): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_get_text(l: PAvahiStringList): Puint8_t; cdecl; external libavahi_common;
function avahi_string_list_get_size(l: PAvahiStringList): Tsize_t; cdecl; external libavahi_common;
function avahi_string_list_find(l: PAvahiStringList; key: pchar): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_get_pair(l: PAvahiStringList; key: PPchar; value: PPchar; size: Psize_t): longint; cdecl; external libavahi_common;
function avahi_string_list_add_pair(l: PAvahiStringList; key: pchar; value: pchar): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_add_pair_arbitrary(l: PAvahiStringList; key: pchar; value: Puint8_t; size: Tsize_t): PAvahiStringList; cdecl; external libavahi_common;
function avahi_string_list_get_service_cookie(l: PAvahiStringList): Tuint32_t; cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:59:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
