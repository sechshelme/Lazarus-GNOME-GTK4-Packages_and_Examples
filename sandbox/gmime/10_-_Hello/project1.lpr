program project1;

uses
  gmime_version,
  gmime_error,
  gmime_filter,
  gmime_filter_openpgp,
  gmime_format_options,      // gmime_filter
  internet_address,          // gmime_format_options,
  gmime_autocrypt,               // internet_address
  gmime_stream,
  gmime_charset,
  gmime_iconv,               // MAKRO !!!
  gmime_iconv_utils,
  gmime_parser_options,
  gmime_param,               // gmime_format_options, gmime_parser_options
  gmime_content_type,        // gmime_param, gmime_parser_options, gmime_format_options
  gmime_disposition,         // gmime_param, gmime_parser_options, gmime_format_options
  gmime_encodings,
  gmime_data_wrapper,        // gmime_encodings
  gmime_header,              // gmime_parser_options, gmime_stream
  gmime_object,              // gmime_disposition, gmime_content_type, gmime_header, gmime_stream, gmime_encodings, gmime_parser_options, internet_address, gmime_autocrypt
  gmime_certificate,
  gmime_signature,               // gmime_certificate
  gmime_crypto_context,          // gmime_stream, gmime_certificate, gmime_signature
  gmime_part,                // gmime_object, gmime_encodings, gmime_filter_openpgp, gmime_data_wrapper, gmime_crypto_context, gmime_signature
  gmime_text_part,           // gmime_part
  gmime_part_iter,
  gmime_application_pkcs7_mime,  // gmime_part, gmime_object, gmime_crypto_context, gmime_signature
  gmime_multipart,           // gmime_object, gmime_crypto_context
  gmime_multipart_encrypted, // gmime_crypto_context, gmime_object
  gmime_multipart_signed,    // gmime_multipart, gmime_object, gmime_signature
  gmime_message,             // gmime_object, internet_address, gmime_autocrypt, gmime_crypto_context
  gmime_message_part,        // gmime_object
  gmime_message_partial,     // gmime_part
  gmime_parser,              // gmime_stream, gmime_parser_options, gmime_object, gmime_message
  gmime_utils,               // gmime_parser_options, gmime_format_options, gmime_encodings
  gmime_references,          // gmime_parser_options
  gmime_stream_buffer,
  gmime_stream_cat,
  gmime_stream_file,
  gmime_stream_filter,
  gmime_stream_fs,
  gmime_stream_gio,
  gmime_stream_mem,
  gmime_stream_mmap,
  gmime_stream_null,
  gmime_stream_pipe,              // gmime_stream
  gmime_filter_basic,             // gmime_encodings
  gmime_filter_best,              // gmime_charset, gmime_encodings
  gmime_filter_charset,
  gmime_filter_checksum,
  gmime_filter_dos2unix,
  gmime_filter_enriched,
  gmime_filter_from,
  gmime_filter_gzip,
  gmime_filter_html,
  gmime_filter_smtp_data,
  gmime_filter_strip,
  gmime_filter_unix2dos,         // gmime_filter
  gmime_filter_windows,          // gmime_filter
  gmime_filter_yenc,             // gmime_filter

  gmime_pkcs7_context,           // gmime_crypto_context
  gmime_gpg_context,             // gmime_crypto_context



  fp_glib2,
  fp_gmime3;

  procedure main;
  begin
    GMimeMessage *message;
        GMimeTextPart *body;
        GMimeDataWrapper *wrapper;
        const char *text = "Hallo Alice, wie geht's?\n";
        GMimeStream *stream;

        /* GMime initialisieren */
        g_mime_init();

        /* Neue Nachricht erzeugen */
        message = g_mime_message_new(TRUE);

        /* Absender und Empfänger setzen */
        g_mime_message_add_mailbox(message, GMIME_ADDRESS_TYPE_FROM, "Joey", "joey@friends.com");
        g_mime_message_add_mailbox(message, GMIME_ADDRESS_TYPE_TO, "Alice", "alice@wonderland.com");

        /* Betreff setzen */
        g_mime_message_set_subject(message, "How you doin?", NULL);

        /* Textpart mit Subtyp "plain" erzeugen */
        body = g_mime_text_part_new_with_subtype("plain");

        /* Memory-Stream mit Inhalt anlegen */
        stream = g_mime_stream_mem_new_with_buffer((guchar *)text, strlen(text));
        wrapper = g_mime_data_wrapper_new_with_stream(stream, GMIME_CONTENT_ENCODING_DEFAULT);
        g_object_unref(stream);

        /* Daten-Wrapper als Inhalt am Textpart setzen */
        g_mime_part_set_content((GMimePart *)body, wrapper);

        /* Textpart als Mime-Part der Nachricht setzen */
        g_mime_message_set_mime_part(message, (GMimeObject *)body);

        /* Nachricht auf stdout serialisieren */
        GMimeStream *outstream = g_mime_stream_file_new(stdout);
        g_mime_object_write_to_stream((GMimeObject *)message, NULL, outstream);
    g_mime_stream_printf(outstream, "Hallo Welt!\n");

    g_printf("Text: %s\n", outstream);
        g_mime_stream_flush(outstream);

    g_printf("Text: %s\n", outstream);


        /* Aufräumen */
        g_object_unref(wrapper);
        g_object_unref(body);
        g_object_unref(message);
        g_object_unref(outstream);

        /* GMime beenden */
        g_mime_shutdown();
  end;

begin
  main;
end.
