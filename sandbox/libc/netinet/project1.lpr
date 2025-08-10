program project1;

uses
  ether,
  icmp6,
  if_ether,
  if_fddi,
  if_tr,
  igmp,
  in_,
  in_systm,
  ip,
  ip6,
  ip_icmp,
  tcp,
  udp,


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
