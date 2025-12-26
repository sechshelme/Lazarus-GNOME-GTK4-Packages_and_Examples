program project1;

uses
  fp_avahi_common,
  fp_avahi_client;

type
  Tavahi_data = record
    poll_api: PAvahiSimplePoll;
    client: PAvahiClient;
    browser_http, browser_workstation, browser_ipp, browser_services: PAvahiServiceBrowser;
  end;
  Pavahi_data = ^Tavahi_data;

  procedure cleanup(const ad: Tavahi_data);
  begin
    if ad.browser_http <> nil then begin
      avahi_service_browser_free(ad.browser_http);
    end;
    if ad.browser_workstation <> nil then begin
      avahi_service_browser_free(ad.browser_workstation);
    end;
    if ad.browser_ipp <> nil then begin
      avahi_service_browser_free(ad.browser_ipp);
    end;
    if ad.browser_services <> nil then begin
      avahi_service_browser_free(ad.browser_services);
    end;
    if ad.client <> nil then begin
      avahi_client_free(ad.client);
    end;
    if ad.poll_api <> nil then begin
      avahi_simple_poll_free(ad.poll_api);
    end;
  end;

  procedure browse_cb(b: PAvahiServiceBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; name: pchar;
    _type: pchar; domain: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;
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
  var
    ad: Pavahi_data absolute userdata;
  begin
    case state of
      AVAHI_CLIENT_S_RUNNING: begin
        WriteLn('🚀 CLIENT RUNNING - 4 Browser starten...');

        ad^.browser_http := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_http._tcp', 'local', 0, @browse_cb, c);
        ad^.browser_workstation := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_workstation._tcp', 'local', 0, @browse_cb, c);
        ad^.browser_ipp := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_ipp._tcp', 'local', 0, @browse_cb, c);
        ad^.browser_services := avahi_service_browser_new(c, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, '_services._dns-sd._udp', 'local', 0, @browse_cb, c);
      end;
      AVAHI_CLIENT_FAILURE: begin
        WriteLn('💥 CLIENT FAILURE: ', avahi_strerror(avahi_client_errno(c)));
        if ad^.poll_api <> nil then begin
          avahi_simple_poll_quit(ad^.poll_api);
        end;
      end;
    end;
  end;

  procedure main;
  var
    err: longint;
    ad: Tavahi_data;
  begin
    ad := default(Tavahi_data);

    ad.poll_api := avahi_simple_poll_new;
    if ad.poll_api = nil then begin
      WriteLn('Failed to create simple poll');
      Exit;
    end;

    ad.client := avahi_client_new(avahi_simple_poll_get(ad.poll_api), 0, @client_cb, @ad, @err);
    if ad.client = nil then begin
      WriteLn('Client error: ', avahi_strerror(err));
      cleanup(ad);
      Exit;;
    end;

    WriteLn('🎬 Avahi Common FULL Monitor läuft... (CTRL+C beenden)');
    avahi_simple_poll_loop(ad.poll_api);

    cleanup(ad);
  end;

begin
  main;
end.
