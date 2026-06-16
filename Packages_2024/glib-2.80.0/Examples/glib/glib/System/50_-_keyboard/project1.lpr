program project1;

uses
  fp_glib2;

  function keypress_cp(Source: PGIOChannel; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute Data;
    len, term_pos: SizeUInt;
    status: TGIOStatus;
    error_: PGError = nil;
    buffer: Pgchar = nil;
  begin
    status := g_io_channel_read_line(Source, @buffer, @len, @term_pos, @error_);
    if status = G_IO_STATUS_NORMAL then begin
      buffer[term_pos] := #0;

      WriteLn('len:    ', len);
      WriteLn('terpos: ', term_pos);
      WriteLn('Buffer: ', buffer);
      if g_strcmp0(buffer, 'q') = 0 then begin
        g_main_loop_quit(loop);
      end;
    end;
    g_free(buffer);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure main;
  var
    loop: PGMainLoop;
    channel: PGIOChannel;
  begin
    loop := g_main_loop_new(nil, False);

    channel := g_io_channel_unix_new(0);
    g_io_add_watch(channel, G_IO_IN, @keypress_cp, loop);

    g_main_loop_run(loop);

    g_io_channel_unref(channel);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
