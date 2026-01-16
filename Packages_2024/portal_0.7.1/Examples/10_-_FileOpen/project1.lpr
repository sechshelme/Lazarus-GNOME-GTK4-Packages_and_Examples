program project1;

uses
  fp_glib2,
  fp_portal;

  procedure open_file_response(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
  var
    loop: PGMainLoop absolute Data;
    r, uris_variant: PGVariant;
    err: PGError = nil;
    i: integer;
    uri: Pgchar;
  begin
    r := xdp_portal_open_file_finish(XDP_PORTAL(source_object), res, @err);
    if err <> nil then begin
      g_printerr('Fehler beim Öffnen: %s'#10, err^.message);
      g_error_free(err);
      exit;
    end;

    g_print('Ergebnis: %s'#10, g_variant_print(r, gTRUE));

    uris_variant := g_variant_lookup_value(r, 'uris', nil);
    if uris_variant <> nil then begin
      for i := 0 to g_variant_n_children(uris_variant) - 1 do begin
        uri := g_variant_get_string(g_variant_get_child_value(uris_variant, i), nil);
        g_printf('Ausgewählte Datei: %s'#10, uri);
      end;
      g_variant_unref(uris_variant);
    end else begin
      g_print('Keine URIs gefunden.'#10);
    end;

    g_variant_unref(r);
    g_main_loop_quit(loop);
  end;

  procedure main;

  var
    loop: PGMainLoop;
    portal: PXdpPortal;
  begin
    loop := g_main_loop_new(nil, gFALSE);

    portal := xdp_portal_new;
    xdp_portal_open_file(portal, nil, 'Datei öffnen', nil, nil, nil, 0, nil, @open_file_response, loop);

    g_main_loop_run(loop);

    g_object_unref(portal);
    g_main_loop_unref(loop);
  end;


begin
  main;
end.
