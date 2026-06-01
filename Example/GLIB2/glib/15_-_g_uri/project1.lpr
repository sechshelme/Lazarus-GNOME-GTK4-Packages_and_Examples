program project1;

uses
  fp_glib2;

  procedure main;
  const
    uriString = 'blabla://blibli:pass1234@clus.sqci.blublu.net:1234/?retryWrites=true&w=majority';
  var
    uri: PGUri;
    err: PGError = nil;
  begin
    uri := g_uri_parse(uriString, G_URI_FLAGS_HAS_PASSWORD, @err);

    if err <> nil then begin
      g_print('Fehler: '#10, err^.message);
      g_error_free(err);
    end;

    g_print('Schema:   %s'#10, g_uri_get_scheme(uri));
    g_print('Host:     %s'#10, g_uri_get_host(uri));
    g_print('Port:     %d'#10, g_uri_get_port(uri));
    g_print('User:     %s'#10, g_uri_get_user(uri));
    g_print('Passwort: %s'#10, g_uri_get_password(uri));
    g_print('Query:    %s'#10, g_uri_get_query(uri));

    g_uri_unref(uri);
  end;

begin
  main;
end.
