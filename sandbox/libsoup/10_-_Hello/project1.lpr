program project1;

uses
  soup_types,                           // --- makro
  soup_version,
  soup_auth,
  soup_auth_domain,
  soup_auth_domain_basic,
  soup_auth_domain_digest,
  soup_auth_manager,
  soup_cache,
  soup_content_decoder,
  soup_content_sniffer,
  soup_cookie,
  soup_cookie_jar,
  soup_cookie_jar_db,
  soup_cookie_jar_text,
  soup_date_utils,
  soup_enum_types,
  soup_form,
  soup_headers,
  soup_hsts_enforcer,
  soup_hsts_enforcer_db,
  soup_hsts_policy,
  soup_logger,
  soup_method,
  soup_server,
  soup_server_message,
  soup_session,
  soup_session_feature,
  soup_status,
  soup_message_body,
  soup_message_headers,
  soup_message_metrics,
  soup_multipart,                        // soup_message_headers
  soup_message,                          // soup_multipart, soup_status
  soup_multipart_input_stream,           // soup_message
  soup_tld,
  soup_uri_utils,
  soup_websocket,                        // soup_message, soup_server_message
  soup_websocket_connection,             // soup_websocket
  soup_websocket_extension,              // soup_websocket
  soup_websocket_extension_deflate,      // soup_websocket_extension
  soup_websocket_extension_manager,


  fp_glib2, fp_soup;

  function main(argc: cint; argv: PPChar): cint;
  begin
    SoupSession *session = soup_session_new();
    SoupMessage *msg = soup_message_new("GET", URL);
    GError *error = NULL;

    // Synchron senden und Antwort lesen
    GBytes *bytes = soup_session_send_and_read(session, msg, NULL, &error);

    if (error != NULL) {
        g_printerr("Request failed: %s\n", error->message);
        g_error_free(error);
    } else {
        // Datenlänge auslesen
        gsize length;
        const char *data = (const char*)g_bytes_get_data(bytes, &length);

        g_print("Response (%zu bytes):\n%.*s\n", length, (int)length, data);
        g_bytes_unref(bytes);
    }

    g_object_unref(msg);
    g_object_unref(session);
    return 0;
  end;

begin
  main(argc, argv);
end.
