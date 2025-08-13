program project1;

uses
  clib,

  ftp,
  inet,
  nameser,
  nameser_compat,
  telnet,
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
  begin
    if getifaddrs(@ifaddr) = -1 then begin
      WriteLn('getifaddrs()   errror');
      Exit;
    end;

    ifa := ifaddr;
    while ifa <> nil do begin
      familiy := ifa^.ifa_addr^.sa_family;

      case familiy of
        AF_INET: begin
          sa:=Psockaddr_in( ifa^.ifa_addr);
          inet_n
          printf('AF_INET'#10);
        end;
      end;

      ifa := ifa^.ifa_next;
    end;


    printf(#10);
  end;

begin
  PrintAdapterInfo;
  PrintPortInfo;
end.



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <netinet/in.h>

int main() {
    struct ifaddrs *ifaddr, *ifa;
    char addr[INET6_ADDRSTRLEN];

    if (getifaddrs(&ifaddr) == -1) {
        perror("getifaddrs");
        exit(EXIT_FAILURE);
    }

    printf("Liste der Netzwerk-Interfaces und IP-Adressen:\n");
    for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
        if (ifa->ifa_addr == NULL)
            continue;

        int family = ifa->ifa_addr->sa_family;

        if (family == AF_INET) {  // IPv4
            struct sockaddr_in *sa = (struct sockaddr_in *)ifa->ifa_addr;
            inet_ntop(AF_INET, &(sa->sin_addr), addr, sizeof(addr));
            printf("%s IPv4: %s\n", ifa->ifa_name, addr);
        } else if (family == AF_INET6) {  // IPv6
            struct sockaddr_in6 *sa6 = (struct sockaddr_in6 *)ifa->ifa_addr;
            inet_ntop(AF_INET6, &(sa6->sin6_addr), addr, sizeof(addr));
            printf("%s IPv6: %s\n", ifa->ifa_name, addr);
        }
    }

    freeifaddrs(ifaddr);
    return 0;
}

