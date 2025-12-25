{$IFDEF read_interface}


type
  PAvahiEntryGroup=type Pointer;

  TAvahiEntryGroupCallback = procedure (g:PAvahiEntryGroup; state:TAvahiEntryGroupState; userdata:pointer);cdecl;
function avahi_entry_group_new(c:PAvahiClient; callback:TAvahiEntryGroupCallback; userdata:pointer):PAvahiEntryGroup;cdecl;external libavahi_client;
function avahi_entry_group_free(para1:PAvahiEntryGroup):longint;cdecl;external libavahi_client;
function avahi_entry_group_commit(para1:PAvahiEntryGroup):longint;cdecl;external libavahi_client;
function avahi_entry_group_reset(para1:PAvahiEntryGroup):longint;cdecl;external libavahi_client;
function avahi_entry_group_get_state(para1:PAvahiEntryGroup):longint;cdecl;external libavahi_client;
function avahi_entry_group_is_empty(para1:PAvahiEntryGroup):longint;cdecl;external libavahi_client;
function avahi_entry_group_get_client(para1:PAvahiEntryGroup):PAvahiClient;cdecl;external libavahi_client;
function avahi_entry_group_add_service(group:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           _type:Pchar; domain:Pchar; host:Pchar; port:Tuint16_t):longint;cdecl;varargs;external libavahi_client;
function avahi_entry_group_add_service_strlst(group:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           _type:Pchar; domain:Pchar; host:Pchar; port:Tuint16_t; txt:PAvahiStringList):longint;cdecl;external libavahi_client;
function avahi_entry_group_add_service_subtype(group:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           _type:Pchar; domain:Pchar; subtype:Pchar):longint;cdecl;external libavahi_client;
function avahi_entry_group_update_service_txt(g:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           _type:Pchar; domain:Pchar):longint;cdecl;varargs;external libavahi_client;
function avahi_entry_group_update_service_txt_strlst(g:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           _type:Pchar; domain:Pchar; strlst:PAvahiStringList):longint;cdecl;external libavahi_client;
function avahi_entry_group_add_address(group:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           a:PAvahiAddress):longint;cdecl;external libavahi_client;
function avahi_entry_group_add_record(group:PAvahiEntryGroup; iface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar;
           clazz:Tuint16_t; _type:Tuint16_t; ttl:Tuint32_t; rdata:pointer; size:Tsize_t):longint;cdecl;external libavahi_client;

// === Konventiert am: 24-12-25 19:23:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
