program project1;

uses
  clib,

  fp_netdb,
  netdb_bit,

  fp_arpa,

  fp_ifaddrs,
  fp_net,
  fp_socket,
  fp_stdio,
  fp_string,
  fp_stdlib,
  fp_netinet;

  procedure main;
  var
    he: Phostent;
    addr_list: PPin_addr;
    i: integer = 0;
  const
    host = 'amazon.com';
  begin
//    getaddrinfo();

    he := gethostbyname(host);
    if he = nil then  begin
      herror('gethostbyname');
    end;

    addr_list := PPin_addr(he^.h_addr_list);
    printf('IP Liste:'#10);
    while addr_list[i] <> nil do begin
      printf('%3d. %s has IP address : %s'#10, i, host, inet_ntoa(addr_list[i]^));
      Inc(i);
    end;
  end;


begin
  main;
end.
