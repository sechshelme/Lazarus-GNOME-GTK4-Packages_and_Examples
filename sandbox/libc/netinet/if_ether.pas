unit if_ether;

interface

uses
  clib, in_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tether_arp = record
    ea_hdr: Tarphdr;
    arp_sha: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    arp_spa: array[0..3] of Tuint8_t;
    arp_tha: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    arp_tpa: array[0..3] of Tuint8_t;
  end;
  Pether_arp = ^Tether_arp;

procedure ETHER_MAP_IP_MULTICAST(ipaddr: Pin_addr; enaddr: Puint8_t);  // ??????????

{ #define ETHER_MAP_IP_MULTICAST(ipaddr, enaddr) \
 \
  (enaddr)[0] = 0x01; \
  (enaddr)[1] = 0x00; \
  (enaddr)[2] = 0x5e; \
  (enaddr)[3] = ((uint8_t *)ipaddr)[1] & 0x7f; \
  (enaddr)[4] = ((uint8_t *)ipaddr)[2]; \
  (enaddr)[5] = ((uint8_t *)ipaddr)[3]; \

 }

// === Konventiert am: 10-8-25 17:28:02 ===


implementation

procedure ETHER_MAP_IP_MULTICAST(ipaddr: Pin_addr; enaddr: Puint8_t); inline;
var
  p: Puint8_t;
begin
  p := Puint8_t(ipaddr);

  enaddr[0] := $01;
  enaddr[1] := $00;
  enaddr[2] := $5e;
  enaddr[3] := p[1] and $7F;
  enaddr[4] := p[2];
  enaddr[5] := p[3];
end;

end.
