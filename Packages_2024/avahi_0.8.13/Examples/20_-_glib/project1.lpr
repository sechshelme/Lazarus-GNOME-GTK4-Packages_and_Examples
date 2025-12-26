program project1;

uses
  fp_glib2,
  fp_avahi_common,
  fp_avahi_client,
  fp_avahi_glib;

type
  Tavahi_data = record
    poll_api: PAvahiPoll;
    glib_poll: PAvahiGLibPoll;
    global_loop: PGMainLoop;
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
    if ad.glib_poll <> nil then begin
      avahi_glib_poll_free(ad.glib_poll);
    end;
    if ad.global_loop <> nil then begin
      g_main_loop_unref(ad.global_loop);
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
        if ad^.global_loop <> nil then begin
          g_main_loop_quit(ad^.global_loop);
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

    g_log_set_fatal_mask(nil, G_LOG_LEVEL_WARNING);

    avahi_set_allocator(avahi_glib_allocator);
    ad.global_loop := g_main_loop_new(nil, False);

    ad.glib_poll := avahi_glib_poll_new(nil, G_PRIORITY_DEFAULT);
    ad.poll_api := avahi_glib_poll_get(ad.glib_poll);

    ad.client := avahi_client_new(ad.poll_api, 0, @client_cb, @ad, @err);
    if ad.client = nil then begin
      g_printf('💥 Avahi init Fehler: %s'#10, avahi_strerror(err));
      cleanup(ad);
    end else begin
      g_printf('🎬 Avahi GLib Demo gestartet - CTRL+C zum Beenden'#10);
      g_main_loop_run(ad.global_loop);
    end;
    cleanup(ad);
  end;

begin
  main;
end.
