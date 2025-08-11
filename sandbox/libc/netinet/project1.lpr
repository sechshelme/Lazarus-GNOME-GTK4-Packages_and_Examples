program project1;

uses
  // fp_socket
  ether,               // io.
  if_fddi,             // io.
  if_tr,               // io.
  igmp,                // io.
  ip,                  // io.
  tcp,                 // io.
  udp,                 // io.
  in_,                 // io.
  in_systm,            // io.
  ip6,                 // io. -> in_
  icmp6,               // io. -> in_
  if_ether,            // io. -> in_
  ip_icmp,             // io. -> ip, in_systm

  fp_stdio,
  clib,
  fp_time;


  procedure main;
  var
    my_now: Ttime_t;
    loctime: Ptm;
  begin
    time(@my_now);
    printf(#10'Aktuelle Zeit: %s'#10, ctime(@my_now));

    loctime := localtime(@my_now);
    printf('Aktuelle Uhrzeit: %02d:%02d:%02d'#10, loctime^.tm_hour, loctime^.tm_min, loctime^.tm_sec);
  end;

begin
  main;
end.
