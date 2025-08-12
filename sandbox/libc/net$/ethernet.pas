unit ethernet;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tether_addr = record
    ether_addr_octet: array[0..(ETH_ALEN) - 1] of Tuint8_t;
  end;
  Pether_addr = ^Tether_addr;

  Tether_header = record
    ether_dhost: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    ether_shost: array[0..(ETH_ALEN) - 1] of Tuint8_t;
    ether_type: Tuint16_t;
  end;
  Pether_header = ^Tether_header;

const
  ETHERTYPE_PUP = $0200;
  ETHERTYPE_SPRITE = $0500;
  ETHERTYPE_IP = $0800;
  ETHERTYPE_ARP = $0806;
  ETHERTYPE_REVARP = $8035;
  ETHERTYPE_AT = $809B;
  ETHERTYPE_AARP = $80F3;
  ETHERTYPE_VLAN = $8100;
  ETHERTYPE_IPX = $8137;
  ETHERTYPE_IPV6 = $86dd;
  ETHERTYPE_LOOPBACK = $9000;
  ETHER_ADDR_LEN = ETH_ALEN;
  ETHER_TYPE_LEN = 2;
  ETHER_CRC_LEN = 4;
  ETHER_HDR_LEN = ETH_HLEN;
  ETHER_MIN_LEN = ETH_ZLEN + ETHER_CRC_LEN;
  ETHER_MAX_LEN = ETH_FRAME_LEN + ETHER_CRC_LEN;

function ETHER_IS_VALID_LEN(foo: longint): boolean;

const
  ETHERTYPE_TRAIL = $1000;
  ETHERTYPE_NTRAILER = 16;
  ETHERMTU = ETH_DATA_LEN;
  ETHERMIN = (ETHER_MIN_LEN - ETHER_HDR_LEN) - ETHER_CRC_LEN;

  // === Konventiert am: 12-8-25 17:05:44 ===


implementation


function ETHER_IS_VALID_LEN(foo: longint): boolean;
begin
  ETHER_IS_VALID_LEN := (foo >= ETHER_MIN_LEN) and (foo <= ETHER_MAX_LEN);
end;


end.
