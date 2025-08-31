program project1;

// export http_proxy="http://proxy.example.com:8080"

uses
  pcap_inttypes,
  vlan,
  usb,
  socket_,
  sll,
  bluetooth,
  can_socketcan,
  dlt,
  ipnet,
  bpf,
  namedb,
  nflog,
  pcap,



  fp_stdio,

  fp_arpa,
  fp_netinet,
  fp_pcap;

  procedure packet_handler(args: Pu_char; header: Ppcap_pkthdr; packet: Pu_char    ); cdecl;
  var
      eth: Pethhdr *eth = (struct ethhdr *)packet;

  begin
//    WriteLn('Packet captured: length ', header^.len);

    struct ethhdr *eth = (struct ethhdr *)packet;

    if (ntohs(eth->h_proto) == ETH_P_IP) {
        struct iphdr *ip = (struct iphdr *)(packet + sizeof(struct ethhdr));

        char src_ip[INET_ADDRSTRLEN];
        char dst_ip[INET_ADDRSTRLEN];

        inet_ntop(AF_INET, &(ip->saddr), src_ip, INET_ADDRSTRLEN);
        inet_ntop(AF_INET, &(ip->daddr), dst_ip, INET_ADDRSTRLEN);

        printf("IP Packet: %s -> %s, length: %d bytes\n", src_ip, dst_ip, header->len);
    } else {
        printf("Nicht-IP Paket, EtherType: 0x%x\n", ntohs(eth->h_proto));
    }
  end;

  procedure main;
  var
    alldevs, d: Ppcap_if_t;
    i: integer = 0;
    j: integer = 1;
    dev_num: integer;
    errbuf: array  [0..PCAP_ERRBUF_SIZE - 1] of char;
    handle: Ppcap_t;
  begin
    if pcap_findalldevs(@alldevs, errbuf) = -1 then begin
      WriteLn('Error finding devices: ', errbuf);
      Exit;
    end;

    WriteLn('Available devices:');
    d := alldevs;
    while d <> nil do begin
      inc(i);
      Write(i: 3, '. ', d^.name);

      if d^.description <> nil then begin
        Write(' - ', d^.description);
      end;
      WriteLn();

      d := d^.next;
    end;

    WriteLn('Select device number: ');
    ReadLn(dev_num);

    d := alldevs;
    while (j < dev_num) and (d <> nil) do begin
      d := d^.next;
    end;

    if d = nil then begin
      WriteLn('Invalid device number.');
      pcap_freealldevs(alldevs);
      Exit;
    end;

    handle := pcap_open_live(d^.name, BUFSIZ, 1, 1000, errbuf);
    if handle = nil then begin
      WriteLn('Could not open device ', d^.name, ': ', errbuf);
      pcap_freealldevs(alldevs);
      Exit;
    end;

    WriteLn('Listening on ', d^.name, '...');
    pcap_loop(handle, 10, @packet_handler, nil);

    pcap_close(handle);
    pcap_freealldevs(alldevs);
  end;

begin
  main;
end.
