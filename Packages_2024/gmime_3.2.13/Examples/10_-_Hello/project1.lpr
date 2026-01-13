program project1;

uses
  fp_glib2,
  fp_gmime3;

  // Muss zwingen so aufgerufen werden: ./project1 > test.txt

var
  stdout: PFILE; cvar;external 'c';

  procedure main;
  const
    text: pchar = 'Hallo Alice, wie geht''s?'#10;
  var
    message: PGMimeMessage;
    body: PGMimeTextPart;
    stream, outstream: PGMimeStream;
    wrapper: PGMimeDataWrapper;
  begin
    g_mime_init;

    message := g_mime_message_new(True);

    g_mime_message_add_mailbox(message, GMIME_ADDRESS_TYPE_FROM, 'Joey', 'joey@friends.com');
    g_mime_message_add_mailbox(message, GMIME_ADDRESS_TYPE_TO, 'Alice', 'alice@wonderland.com');

    g_mime_message_set_subject(message, 'How you doin?', nil);

    body := g_mime_text_part_new_with_subtype('plain');

    stream := g_mime_stream_mem_new_with_buffer(text, Length(text));
    wrapper := g_mime_data_wrapper_new_with_stream(stream, GMIME_CONTENT_ENCODING_DEFAULT);
    g_object_unref(stream);

    g_mime_part_set_content(PGMimePart(body), wrapper);

    g_mime_message_set_mime_part(message, PGMimeObject(body));

    outstream := g_mime_stream_file_new(stdout);
    g_mime_object_write_to_stream(PGMimeObject(message), nil, outstream);
    g_mime_stream_printf(outstream, 'Hallo Welt!'#10);

    g_object_unref(wrapper);
    g_object_unref(body);
    g_object_unref(message);
    g_object_unref(outstream);

    g_mime_shutdown();
  end;

begin
  main;
end.
