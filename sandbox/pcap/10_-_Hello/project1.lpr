program project1;

uses
  fp_stdio,
  fp_socket,
  fp_arpa,
  fp_netinet,
  fp_pcap;

  procedure packet_handler(args: Pu_char; header: Ppcap_pkthdr; packet: Pu_char); cdecl;
  var
    eth: Pethhdr absolute packet;
    ip: Piphdr;
    src_ip: array[0..INET_ADDRSTRLEN - 1] of char;
    dst_ip: array[0..INET_ADDRSTRLEN - 1] of char;

  begin
    WriteLn('length: ', header^.len);

    if ntohs(eth^.h_proto) = ETH_P_IP then begin
      ip := Piphdr(packet + SizeOf(Tethhdr));

      inet_ntop(AF_INET, @ip^.saddr, src_ip, INET_ADDRSTRLEN);
      inet_ntop(AF_INET, @ip^.daddr, dst_ip, INET_ADDRSTRLEN);

      printf('IP Packet: %s -> %s, length: %d bytes'#10, src_ip, dst_ip, header^.len);
    end else begin
      printf('Nicht-IP Paket, EtherType: 0x%x'#10, ntohs(eth^.h_proto));
    end;
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
      Inc(j);
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
