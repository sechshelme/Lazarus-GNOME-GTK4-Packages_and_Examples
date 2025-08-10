unit ip6;

interface

uses
  clib, in_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tip6_hdr = record
    ip6_ctlun: record
      case longint of
        0: (ip6_un1: record
            ip6_un1_flow: Tuint32_t;
            ip6_un1_plen: Tuint16_t;
            ip6_un1_nxt: Tuint8_t;
            ip6_un1_hlim: Tuint8_t;
            end);
        1: (ip6_un2_vfc: Tuint8_t);
      end;
    ip6_src: Tin6_addr;
    ip6_dst: Tin6_addr;
  end;
  Pip6_hdr = ^Tip6_hdr;

type
  Tip6_ext = record
    ip6e_nxt: Tuint8_t;
    ip6e_len: Tuint8_t;
  end;
  Pip6_ext = ^Tip6_ext;

  Tip6_hbh = record
    ip6h_nxt: Tuint8_t;
    ip6h_len: Tuint8_t;
  end;
  Pip6_hbh = ^Tip6_hbh;

  Tip6_dest = record
    ip6d_nxt: Tuint8_t;
    ip6d_len: Tuint8_t;
  end;
  Pip6_dest = ^Tip6_dest;

  Tip6_rthdr = record
    ip6r_nxt: Tuint8_t;
    ip6r_len: Tuint8_t;
    ip6r_type: Tuint8_t;
    ip6r_segleft: Tuint8_t;
  end;
  Pip6_rthdr = ^Tip6_rthdr;

  Tip6_rthdr0 = record
    ip6r0_nxt: Tuint8_t;
    ip6r0_len: Tuint8_t;
    ip6r0_type: Tuint8_t;
    ip6r0_segleft: Tuint8_t;
    ip6r0_reserved: Tuint8_t;
    ip6r0_slmap: array[0..2] of Tuint8_t;
    ip6r0_addr: array[0.. -1] of Tin6_addr;
  end;
  Pip6_rthdr0 = ^Tip6_rthdr0;

  Tip6_frag = record
    ip6f_nxt: Tuint8_t;
    ip6f_reserved: Tuint8_t;
    ip6f_offlg: Tuint16_t;
    ip6f_ident: Tuint32_t;
  end;
  Pip6_frag = ^Tip6_frag;

const
  IP6F_OFF_MASK = $fff8;
  IP6F_RESERVED_MASK = $0006;
  IP6F_MORE_FRAG = $0001;

const
  IP6F_OFF_MASK = $f8ff;
  IP6F_RESERVED_MASK = $0600;
  IP6F_MORE_FRAG = $0100;

type
  Tip6_opt = record
    ip6o_type: Tuint8_t;
    ip6o_len: Tuint8_t;
  end;
  Pip6_opt = ^Tip6_opt;

function IP6OPT_TYPE(obj: DWord): DWord;

const
  IP6OPT_TYPE_SKIP = $00;
  IP6OPT_TYPE_DISCARD = $40;
  IP6OPT_TYPE_FORCEICMP = $80;
  IP6OPT_TYPE_ICMP = $c0;
  IP6OPT_TYPE_MUTABLE = $20;
  IP6OPT_PAD1 = 0;
  IP6OPT_PADN = 1;
  IP6OPT_JUMBO = $c2;
  IP6OPT_NSAP_ADDR = $c3;
  IP6OPT_TUNNEL_LIMIT = $04;
  IP6OPT_ROUTER_ALERT = $05;

type
  Tip6_opt_jumbo = record
    ip6oj_type: Tuint8_t;
    ip6oj_len: Tuint8_t;
    ip6oj_jumbo_len: array[0..3] of Tuint8_t;
  end;
  Pip6_opt_jumbo = ^Tip6_opt_jumbo;

const
  IP6OPT_JUMBO_LEN = 6;

type
  Tip6_opt_nsap = record
    ip6on_type: Tuint8_t;
    ip6on_len: Tuint8_t;
    ip6on_src_nsap_len: Tuint8_t;
    ip6on_dst_nsap_len: Tuint8_t;
  end;
  Pip6_opt_nsap = ^Tip6_opt_nsap;

  Tip6_opt_tunnel = record
    ip6ot_type: Tuint8_t;
    ip6ot_len: Tuint8_t;
    ip6ot_encap_limit: Tuint8_t;
  end;
  Pip6_opt_tunnel = ^Tip6_opt_tunnel;

  Tip6_opt_router = record
    ip6or_type: Tuint8_t;
    ip6or_len: Tuint8_t;
    ip6or_value: array[0..1] of Tuint8_t;
  end;
  Pip6_opt_router = ^Tip6_opt_router;

const
  IP6_ALERT_MLD = $0000;
  IP6_ALERT_RSVP = $0100;
  IP6_ALERT_AN = $0200;

  // === Konventiert am: 10-8-25 17:28:20 ===


implementation


function IP6OPT_TYPE(obj: DWord): DWord;
begin
  IP6OPT_TYPE := obj and $c0;
end;


end.
