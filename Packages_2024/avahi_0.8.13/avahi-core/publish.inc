{$IFDEF read_interface}


type
  PAvahiSEntryGroup = type Pointer;
  PPAvahiSEntryGroup = ^PAvahiSEntryGroup;

  TAvahiSEntryGroupCallback = procedure(s: PAvahiServer; g: PAvahiSEntryGroup; state: TAvahiEntryGroupState; userdata: pointer); cdecl;

function avahi_server_iterate(s: PAvahiServer; g: PAvahiSEntryGroup; state: Ppointer): PAvahiRecord; cdecl; external libavahi_core;
function avahi_s_entry_group_new(s: PAvahiServer; callback: TAvahiSEntryGroupCallback; userdata: pointer): PAvahiSEntryGroup; cdecl; external libavahi_core;
procedure avahi_s_entry_group_free(g: PAvahiSEntryGroup); cdecl; external libavahi_core;
function avahi_s_entry_group_commit(g: PAvahiSEntryGroup): longint; cdecl; external libavahi_core;
procedure avahi_s_entry_group_reset(g: PAvahiSEntryGroup); cdecl; external libavahi_core;
function avahi_s_entry_group_is_empty(g: PAvahiSEntryGroup): longint; cdecl; external libavahi_core;
function avahi_s_entry_group_get_state(g: PAvahiSEntryGroup): TAvahiEntryGroupState; cdecl; external libavahi_core;
procedure avahi_s_entry_group_set_data(g: PAvahiSEntryGroup; userdata: pointer); cdecl; external libavahi_core;
function avahi_s_entry_group_get_data(g: PAvahiSEntryGroup): pointer; cdecl; external libavahi_core;
function avahi_server_add(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags; r: PAvahiRecord): longint; cdecl; external libavahi_core;
function avahi_server_add_address(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags; name: pchar; a: PAvahiAddress): longint; cdecl; external libavahi_core;
function avahi_server_add_service(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags;
  name: pchar; _type: pchar; domain: pchar; host: pchar; port: Tuint16_t): longint; cdecl; varargs; external libavahi_core;
function avahi_server_add_service_strlst(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags;
  name: pchar; _type: pchar; domain: pchar; host: pchar; port: Tuint16_t;
  strlst: PAvahiStringList): longint; cdecl; external libavahi_core;
function avahi_server_add_service_subtype(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags;
  name: pchar; _type: pchar; domain: pchar; subtype: pchar): longint; cdecl; external libavahi_core;
function avahi_server_update_service_txt_strlst(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags;
  name: pchar; _type: pchar; domain: pchar; strlst: PAvahiStringList): longint; cdecl; external libavahi_core;
function avahi_server_update_service_txt(s: PAvahiServer; g: PAvahiSEntryGroup; iface: TAvahiIfIndex; protocol: TAvahiProtocol; flags: TAvahiPublishFlags;
  name: pchar; _type: pchar; domain: pchar): longint; cdecl; varargs; external libavahi_core;
function avahi_server_get_group_of_service(s: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: pchar; _type: pchar;
  domain: pchar; ret_group: PPAvahiSEntryGroup): longint; cdecl; external libavahi_core;

// === Konventiert am: 25-12-25 17:10:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
