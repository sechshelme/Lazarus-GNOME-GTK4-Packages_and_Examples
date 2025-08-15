program project1;

uses
  clib,

  ftp,
  inet,
  nameser,
  nameser_compat,
  telnet,                  // makros
  tftp,

  fp_ifaddrs,
  fp_net,
  fp_socket,
  fp_stdio,
  fp_string,
  fp_stdlib,
  fp_netinet;

  procedure PrintAdapterInfo;
  var
    if_ni, p: Pif_nameindex;
  begin
    if_ni := if_nameindex;
    if if_ni = nil then begin
      WriteLn('if_nameindex   error');
      Exit;
    end;

    WriteLn('Liste der Netzwerk-Interfaces:');
    p := if_ni;
    while p^.if_index <> 0 do begin
      printf('  Index: %u, Name: %s'#10, p^.if_index, p^.if_name);
      Inc(p);
    end;

    if_freenameindex(if_ni);
    printf(#10);
  end;

  procedure PrintPortInfo;
  var
    ifaddr, ifa: Pifaddrs;
    familiy: Tsa_family_t;
    addr: array[0..INET6_ADDRSTRLEN - 1] of char;
    sa: Psockaddr_in;
    sa6: Psockaddr_in6;
  begin
    if getifaddrs(@ifaddr) = -1 then begin
      WriteLn('getifaddrs()   errror');
      Exit;
    end;

    ifa := ifaddr;
    printf('Liste der Netzwerk-Interfaces und IP-Adressen:'#10);
    while ifa <> nil do begin
      familiy := ifa^.ifa_addr^.sa_family;

      case familiy of
      AF_INET: begin
        sa:=Psockaddr_in( ifa^.ifa_addr);
        inet_ntop(AF_INET, @sa^.sin_addr, addr, SizeOf(addr));
        printf('%s IPv4: %s'#10, ifa^.ifa_name, addr);
      end;
      AF_INET6: begin
        sa6:=Psockaddr_in6( ifa^.ifa_addr);
        inet_ntop(AF_INET6, @sa6^.sin6_addr, addr, SizeOf(addr));
        printf('%s IPv6: %s'#10, ifa^.ifa_name, addr);
      end;
      end;

      ifa := ifa^.ifa_next;
    end;
    printf(#10);
  end;

begin
  WriteLn(telcmds[1]);
  WriteLn();

  PrintAdapterInfo;
  PrintPortInfo;
end.


