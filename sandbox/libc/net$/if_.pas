unit if_;

interface

uses
  clib, fp_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  IF_NAMESIZE = 16;

type
  Tif_nameindex = record
    if_index: dword;
    if_name: pchar;
  end;
  Pif_nameindex = ^Tif_nameindex;

const
  IFF_UP = $1;
  IFF_BROADCAST = $2;
  IFF_DEBUG = $4;
  IFF_LOOPBACK = $8;
  IFF_POINTOPOINT = $10;
  IFF_NOTRAILERS = $20;
  IFF_RUNNING = $40;
  IFF_NOARP = $80;
  IFF_PROMISC = $100;
  IFF_ALLMULTI = $200;
  IFF_MASTER = $400;
  IFF_SLAVE = $800;
  IFF_MULTICAST = $1000;
  IFF_PORTSEL = $2000;
  IFF_AUTOMEDIA = $4000;
  IFF_DYNAMIC = $8000;

type
  Pifaddr = ^Tifaddr;

  Tifaddr = record
    ifa_addr: Tsockaddr;
    ifa_ifu: record
      case longint of
        0: (ifu_broadaddr: Tsockaddr);
        1: (ifu_dstaddr: Tsockaddr);
      end;
    ifa_ifp: Piface;
    ifa_next: Pifaddr;
  end;

type
  Tifmap = record
    mem_start: dword;
    mem_end: dword;
    base_addr: word;
    irq: byte;
    dma: byte;
    port: byte;
  end;
  Pifmap = ^Tifmap;

const
  IFHWADDRLEN = 6;
  IFNAMSIZ = IF_NAMESIZE;

type
  Tifreq = record
    ifr_ifrn: record
      case longint of
        0: (ifrn_name: array[0..(IFNAMSIZ) - 1] of char);
      end;
    ifr_ifru: record
      case longint of
        0: (ifru_addr: Tsockaddr);
        1: (ifru_dstaddr: Tsockaddr);
        2: (ifru_broadaddr: Tsockaddr);
        3: (ifru_netmask: Tsockaddr);
        4: (ifru_hwaddr: Tsockaddr);
        5: (ifru_flags: smallint);
        6: (ifru_ivalue: longint);
        7: (ifru_mtu: longint);
        8: (ifru_map: Tifmap);
        9: (ifru_slave: array[0..(IFNAMSIZ) - 1] of char);
        10: (ifru_newname: array[0..(IFNAMSIZ) - 1] of char);
        11: (ifru_data: Tcaddr_t);
      end;
  end;
  Pifreq = ^Tifreq;

type
  Tifconf = record
    ifc_len: longint;
    ifc_ifcu: record
      case longint of
        0: (ifcu_buf: Tcaddr_t);
        1: (ifcu_req: Pifreq);
      end;
  end;
  Pifconf = ^Tifconf;

function if_nametoindex(__ifname: pchar): dword; cdecl; external libc;
function if_indextoname(__ifindex: dword; __ifname: pchar): pchar; cdecl; external libc;
function if_nameindex: Pif_nameindex; cdecl; external libc;
procedure if_freenameindex(__ptr: Pif_nameindex); cdecl; external libc;

// === Konventiert am: 12-8-25 17:05:47 ===


implementation


end.
