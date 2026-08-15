program project1;

uses
  version,
  logging,
  headers,
  peer,

  librist,
  librist_config,
  librist_srp,
  oob,
  opt,
  receiver,
  sender,
  stats,
  udpsocket,
  urlparam,

  fp_rist;



  procedure main;
  var
    ret: longint;
    ctx: Prist_ctx = nil;
    peer: Prist_peer = nil;
    peer_config: Trist_peer_config;
    data_block: Trist_data_block;
  const
    payload: pchar = 'Hallo RIST-Netzwerk!';
  begin
    ret := rist_sender_create(@ctx, RIST_PROFILE_MAIN, 0, nil);
    if ret < 0 then begin
      WriteLn('Fehler beim Erstellen des RIST-Senders');
      Exit;
    end;

    FillChar(peer_config, SizeOf(peer_config), 0);
    peer_config.address := 'rist://127.0.0.1:1234';

    ret := rist_peer_create(ctx, @peer, @peer_config);
    if ret < 0 then begin
      WriteLn('Fehler beim Hinzufügen des Peers');
      rist_destroy(ctx);
      Exit;
    end;

    rist_start(ctx);

    FillChar(data_block, SizeOf(data_block), 0);
    data_block.payload := payload;
    data_block.payload_len := Length(payload);

    ret := rist_sender_data_write(ctx, @data_block);
    if ret < 0 then begin
      WriteLn('Fehler beim Senden der Daten');
    end else begin
      WriteLn('Paket erfolgreich gesendet!');
    end;

    rist_destroy(ctx);
  end;

begin
  main;;
end.
