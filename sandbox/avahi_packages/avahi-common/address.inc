{$IFDEF read_interface}


type
  PAvahiProtocol = ^TAvahiProtocol;
  TAvahiProtocol = longint;

  PAvahiIfIndex = ^TAvahiIfIndex;
  TAvahiIfIndex = longint;

const
  AVAHI_PROTO_INET = 0;
  AVAHI_PROTO_INET6 = 1;
  AVAHI_PROTO_UNSPEC = -(1);

const
  AVAHI_IF_UNSPEC = -(1);

  AVAHI_ADDRESS_STR_MAX = 40;

type
  TAvahiIPv4Address = record
    address: Tuint32_t;
  end;
  PAvahiIPv4Address = ^TAvahiIPv4Address;

  TAvahiIPv6Address = record
    address: array[0..15] of Tuint8_t;
  end;
  PAvahiIPv6Address = ^TAvahiIPv6Address;

  TAvahiAddress = record
    proto: TAvahiProtocol;
    data: record
      case longint of
        0: (ipv6: TAvahiIPv6Address);
        1: (ipv4: TAvahiIPv4Address);
        2: (data: array[0..0] of Tuint8_t);
      end;
  end;
  PAvahiAddress = ^TAvahiAddress;

function avahi_address_cmp(a: PAvahiAddress; b: PAvahiAddress): longint; cdecl; external libavahi_common;
function avahi_address_snprint(ret_s: pchar; length: Tsize_t; a: PAvahiAddress): pchar; cdecl; external libavahi_common;
function avahi_address_parse(s: pchar; af: TAvahiProtocol; ret_addr: PAvahiAddress): PAvahiAddress; cdecl; external libavahi_common;
function avahi_reverse_lookup_name(a: PAvahiAddress; ret_s: pchar; length: Tsize_t): pchar; cdecl; external libavahi_common;
function avahi_proto_to_af(proto: TAvahiProtocol): longint; cdecl; external libavahi_common;
function avahi_af_to_proto(af: longint): TAvahiProtocol; cdecl; external libavahi_common;
function avahi_proto_to_string(proto: TAvahiProtocol): pchar; cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:58:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
