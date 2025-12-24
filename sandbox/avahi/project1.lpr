program project1;

uses
  fp_avahi_common,
  fp_avahi_client;

var
  poll_api: PAvahiSimplePoll;
  client: PAvahiClient;
  browser_http, browser_workstation, browser_ipp, browser_services: PAvahiServiceBrowser;

  procedure cleanup;
  begin
    if browser_http <> nil then begin
      avahi_service_browser_free(browser_http);
    end;
    if browser_workstation <> nil then begin
      avahi_service_browser_free(browser_workstation);
    end;
    if browser_ipp <> nil then begin
      avahi_service_browser_free(browser_ipp);
    end;
    if browser_services <> nil then begin
      avahi_service_browser_free(browser_services);
    end;
    if client <> nil then begin
      avahi_client_free(client);
    end;
    if poll_api <> nil then begin
      avahi_simple_poll_free(poll_api);
    end;
  end;

  procedure browse_cb(b: PAvahiServiceBrowser; iface: TAvahiIfIndex;
    protocol: TAvahiProtocol; event: TAvahiBrowserEvent; name: pchar;
    _type: pchar; domain: pchar; flags: TAvahiLookupResultFlags;
    userdata: pointer); cdecl;
  begin
    case event of
      AVAHI_BROWSER_NEW: begin
        WriteLn('➕ NEW: ', name, ' (', _type, '/', domain, ')');
      end;
      AVAHI_BROWSER_REMOVE: begin
        WriteLn('➖ REMOVE: ', name, ' (', _type, ')', name, _type);
      end;
      AVAHI_BROWSER_ALL_FOR_NOW: begin
        WriteLn('✅ ALL CACHED');
      end;
      AVAHI_BROWSER_CACHE_EXHAUSTED: begin
        WriteLn('📦 CACHE EMPTY');
      end;
      AVAHI_BROWSER_FAILURE: begin
        WriteLn('💥 BROWSER FAILURE');
      end;
    end;
  end;

  procedure client_cb(c: PAvahiClient; state: TAvahiClientState; userdata: pointer); cdecl;
  begin
    case state of
      AVAHI_CLIENT_S_RUNNING: begin
        WriteLn('🚀 CLIENT RUNNING - 4 Browser starten...');

        browser_http := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_http._tcp', 'local', 0, @browse_cb, c);
        browser_workstation := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_workstation._tcp', 'local', 0, @browse_cb, c);
        browser_ipp := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_ipp._tcp', 'local', 0, @browse_cb, c);
        browser_services := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_services._dns-sd._udp', 'local', 0, @browse_cb, c);
      end;
      AVAHI_CLIENT_FAILURE: begin
        WriteLn('💥 CLIENT FAILURE: ', avahi_strerror(avahi_client_errno(c)));
        if poll_api <> nil then begin
          avahi_simple_poll_quit(poll_api);
        end;
      end;
    end;
  end;

  procedure main;
  var
    err: longint;
  begin

    poll_api := avahi_simple_poll_new;
    if poll_api = nil then begin
      WriteLn('Failed to create simple poll');
      Exit;
    end;

    client := avahi_client_new(avahi_simple_poll_get(poll_api), 0, @client_cb, nil, @err);
    if client = nil then begin
      WriteLn('Client error: ', avahi_strerror(err));
      cleanup;
      Exit;;
    end;

    WriteLn('🎬 Avahi Common FULL Monitor läuft... (CTRL+C beenden)');
    avahi_simple_poll_loop(poll_api);

    cleanup;
  end;

begin
  main;
end.
