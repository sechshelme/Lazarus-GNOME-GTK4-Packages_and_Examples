{$IFDEF read_interface}


const
  AVAHI_DNS_TYPE_ANY = $FF;
  AVAHI_DNS_TYPE_OPT = 41;
  AVAHI_DNS_TYPE_TKEY = 249;
  AVAHI_DNS_TYPE_TSIG = 250;
  AVAHI_DNS_TYPE_IXFR = 251;
  AVAHI_DNS_TYPE_AXFR = 252;

const
  AVAHI_DNS_CLASS_ANY = $FF;
  AVAHI_DNS_CACHE_FLUSH = $8000;
  AVAHI_DNS_UNICAST_RESPONSE = $8000;

type
  TAvahiKey = record
    ref: longint;
    name: pchar;
    clazz: Tuint16_t;
    _type: Tuint16_t;
  end;
  PAvahiKey = ^TAvahiKey;

  TAvahiRecord = record
    ref: longint;
    key: PAvahiKey;
    ttl: Tuint32_t;
    data: record
      case longint of
        0: (generic: record
            data: pointer;
            size: Tuint16_t;
            end);
        1: (srv: record
            priority: Tuint16_t;
            weight: Tuint16_t;
            port: Tuint16_t;
            name: pchar;
            end);
        2: (ptr: record
            name: pchar;
            end);
        3: (ns: record
            name: pchar;
            end);
        4: (cname: record
            name: pchar;
            end);
        5: (hinfo: record
            cpu: pchar;
            os: pchar;
            end);
        6: (txt: record
            string_list: PAvahiStringList;
            end);
        7: (a: record
            address: TAvahiIPv4Address;
            end);
        8: (aaaa: record
            address: TAvahiIPv6Address;
            end);
      end;
  end;
  PAvahiRecord = ^TAvahiRecord;

function avahi_key_new(name: pchar; clazz: Tuint16_t; _type: Tuint16_t): PAvahiKey; cdecl; external libavahi_core;
function avahi_key_ref(k: PAvahiKey): PAvahiKey; cdecl; external libavahi_core;
procedure avahi_key_unref(k: PAvahiKey); cdecl; external libavahi_core;
function avahi_key_equal(a: PAvahiKey; b: PAvahiKey): longint; cdecl; external libavahi_core;
function avahi_key_hash(k: PAvahiKey): dword; cdecl; external libavahi_core;
function avahi_record_new(k: PAvahiKey; ttl: Tuint32_t): PAvahiRecord; cdecl; external libavahi_core;
function avahi_record_new_full(name: pchar; clazz: Tuint16_t; _type: Tuint16_t; ttl: Tuint32_t): PAvahiRecord; cdecl; external libavahi_core;
function avahi_record_ref(r: PAvahiRecord): PAvahiRecord; cdecl; external libavahi_core;
procedure avahi_record_unref(r: PAvahiRecord); cdecl; external libavahi_core;
function avahi_dns_class_to_string(clazz: Tuint16_t): pchar; cdecl; external libavahi_core;
function avahi_dns_type_to_string(_type: Tuint16_t): pchar; cdecl; external libavahi_core;
function avahi_key_to_string(k: PAvahiKey): pchar; cdecl; external libavahi_core;
function avahi_record_to_string(r: PAvahiRecord): pchar; cdecl; external libavahi_core;
function avahi_record_equal_no_ttl(a: PAvahiRecord; b: PAvahiRecord): longint; cdecl; external libavahi_core;
function avahi_key_is_valid(k: PAvahiKey): longint; cdecl; external libavahi_core;
function avahi_record_is_valid(r: PAvahiRecord): longint; cdecl; external libavahi_core;
function avahi_rdata_parse(_record: PAvahiRecord; rdata: pointer; size: Tsize_t): longint; cdecl; external libavahi_core;
function avahi_rdata_serialize(_record: PAvahiRecord; rdata: pointer; max_size: Tsize_t): Tsize_t; cdecl; external libavahi_core;
function avahi_record_is_link_local_address(r: PAvahiRecord): longint; cdecl; external libavahi_core;

// === Konventiert am: 25-12-25 17:10:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
