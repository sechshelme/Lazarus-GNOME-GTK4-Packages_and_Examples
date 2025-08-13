unit fp_ifaddrs;

interface

uses
  clib, fp_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPifaddrs = ^Pifaddrs;
  Pifaddrs = ^Tifaddrs;
  Tifaddrs = record
    ifa_next: Pifaddrs;
    ifa_name: pchar;
    ifa_flags: dword;
    ifa_addr: Psockaddr;
    ifa_netmask: Psockaddr;
    ifa_ifu: record
      case longint of
        0: (ifu_broadaddr: Psockaddr);
        1: (ifu_dstaddr: Psockaddr);
      end;
    ifa_data: pointer;
  end;

function getifaddrs(__ifap: PPifaddrs): longint; cdecl; external libc;
procedure freeifaddrs(__ifa: Pifaddrs); cdecl; external libc;

// === Konventiert am: 13-8-25 19:18:07 ===


implementation



end.
