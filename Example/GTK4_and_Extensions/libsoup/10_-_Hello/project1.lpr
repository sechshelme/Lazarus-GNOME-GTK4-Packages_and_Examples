program project1;

uses
  //soup_types,                            // --- makro
  //soup_version,
  //soup_enum_types,
  //soup_status,
  //soup_content_decoder,
  //soup_date_utils,
  //soup_headers,                          // soup_status
  //soup_hsts_enforcer,
  //soup_hsts_enforcer_db,                 // soup_hsts_enforcer
  //soup_hsts_policy,
  //soup_method,                           // --- makro
  //soup_message_body,
  //soup_server_message,                   // soup_message_body, soup_status
  //soup_server,                           // soup_server_message
  //soup_auth_domain,                      // soup_server_message
  //soup_auth_domain_basic,                // soup_auth_domain, soup_server_message
  //soup_auth_domain_digest,               // soup_auth_domain, soup_server_message
  //soup_message_headers,
  //soup_message_metrics,
  //soup_multipart,                        // soup_message_headers
  //soup_form,                             // soup_multipart
  //soup_message,                          // soup_multipart, soup_status
  //soup_cache,                            // soup_message
  //soup_content_sniffer,                  // soup_message
  //soup_logger,                           // soup_message
  //soup_auth,                             // soup_message
  //soup_auth_manager,
  //soup_cookie,                           // soup_message
  //soup_cookie_jar,
  //soup_cookie_jar_db,                    // soup_cookie_jar
  //soup_cookie_jar_text,                  // soup_cookie_jar
  //soup_session_feature,
  //soup_session,                          // soup_message, soup_session_feature
  //soup_multipart_input_stream,           // soup_message
  //soup_tld,
  //soup_uri_utils,
  //soup_websocket,                        // soup_message, soup_server_message
  //soup_websocket_connection,             // soup_websocket
  //soup_websocket_extension,              // soup_websocket
  //soup_websocket_extension_deflate,      // soup_websocket_extension
  //soup_websocket_extension_manager,


  fp_soup3,
  fp_glib2;

  function main(argc: integer; argv: PPChar): integer;
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
    Result := 0;
  end;

begin
  writeln(' SOUP_METHOD_OPTIONS   : ', SOUP_METHOD_OPTIONS);
  writeln(' SOUP_METHOD_GET       : ', SOUP_METHOD_GET);
  writeln(' SOUP_METHOD_HEAD      : ', SOUP_METHOD_HEAD);
  writeln(' SOUP_METHOD_POST      : ', SOUP_METHOD_POST);
  writeln(' SOUP_METHOD_PUT       : ', SOUP_METHOD_PUT);
  writeln(' SOUP_METHOD_DELETE    : ', SOUP_METHOD_DELETE);
  writeln(' SOUP_METHOD_TRACE     : ', SOUP_METHOD_TRACE);
  writeln(' SOUP_METHOD_CONNECT   : ', SOUP_METHOD_CONNECT);
  writeln(' SOUP_METHOD_PROPFIND  : ', SOUP_METHOD_PROPFIND);
  writeln(' SOUP_METHOD_PROPPATCH : ', SOUP_METHOD_PROPPATCH);
  writeln(' SOUP_METHOD_MKCOL     : ', SOUP_METHOD_MKCOL);
  writeln(' SOUP_METHOD_COPY      : ', SOUP_METHOD_COPY);
  writeln(' SOUP_METHOD_MOVE      : ', SOUP_METHOD_MOVE);
  writeln(' SOUP_METHOD_LOCK      : ', SOUP_METHOD_LOCK);
  writeln(' SOUP_METHOD_UNLOCK    : ', SOUP_METHOD_UNLOCK);

  main(argc, argv);
end.
