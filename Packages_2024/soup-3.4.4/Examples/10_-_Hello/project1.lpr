program project1;

uses
  fp_soup3,
  fp_glib2;

  procedure PrintSpupsMethods;
  begin
    g_printf('SOUP_METHOD_OPTIONS   : %s'#10, SOUP_METHOD_OPTIONS);
    g_printf('SOUP_METHOD_GET       : %s'#10, SOUP_METHOD_GET);
    g_printf('SOUP_METHOD_HEAD      : %s'#10, SOUP_METHOD_HEAD);
    g_printf('SOUP_METHOD_POST      : %s'#10, SOUP_METHOD_POST);
    g_printf('SOUP_METHOD_PUT       : %s'#10, SOUP_METHOD_PUT);
    g_printf('SOUP_METHOD_DELETE    : %s'#10, SOUP_METHOD_DELETE);
    g_printf('SOUP_METHOD_TRACE     : %s'#10, SOUP_METHOD_TRACE);
    g_printf('SOUP_METHOD_CONNECT   : %s'#10, SOUP_METHOD_CONNECT);
    g_printf('SOUP_METHOD_PROPFIND  : %s'#10, SOUP_METHOD_PROPFIND);
    g_printf('SOUP_METHOD_PROPPATCH : %s'#10, SOUP_METHOD_PROPPATCH);
    g_printf('SOUP_METHOD_MKCOL     : %s'#10, SOUP_METHOD_MKCOL);
    g_printf('SOUP_METHOD_COPY      : %s'#10, SOUP_METHOD_COPY);
    g_printf('SOUP_METHOD_MOVE      : %s'#10, SOUP_METHOD_MOVE);
    g_printf('SOUP_METHOD_LOCK      : %s'#10, SOUP_METHOD_LOCK);
    g_printf('SOUP_METHOD_UNLOCK    : %s'#10, SOUP_METHOD_UNLOCK);
    g_printf(#10#10);
  end;

  procedure main;
  const
    URL = 'https://www.example.com';
  var
    session: PSoupSession;
    msg: PSoupMessage;
    bytes: PGBytes;
    err: PGError = nil;
    data: Pgchar;
    len: Tgsize;
  begin
    PrintSpupsMethods;

    session := soup_session_new;
    msg := soup_message_new('GET', URL);

    bytes := soup_session_send_and_read(session, msg, nil, @err);

    if err <> nil then begin
      g_printerr('Request failed: %s'#10, err^.message);
      g_error_free(err);
    end else begin
      data := g_bytes_get_data(bytes, @len);

      g_print('Response (%zu bytes):'#10'%.*s'#10, len, len, data);
      g_bytes_unref(bytes);
    end;

    g_object_unref(msg);
    g_object_unref(session);
  end;

begin
  main;
end.
