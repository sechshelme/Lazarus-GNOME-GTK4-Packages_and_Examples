program project1;

uses
  ctypes,
  Strings,
  Math,
  BaseUnix,
  glib280;

const
  lib_stdio = 'c';
type
  TFILE = record
  end;
  PFILE = ^TFILE;
var
  stdin: PFILE; cvar;external lib_stdio;
  stdout: PFILE; cvar;external lib_stdio;
  stderr: PFILE; cvar;external lib_stdio;

  // https://fluendo.com/fluendo-sdk/docs/tutorials/playback_controls.html
  // https://stackoverflow.com/questions/75877505/application-get-100-cpu-after-first-fireing-of-gtk3-g-io-add-watch-of-a-named

  function fileno(f: PFILE): cint; cdecl; external libglib2;

  function onKeyPress(Source: PGIOChannel; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
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
      if strcomp(buffer, 'q') = 0 then begin
        g_main_loop_quit(loop);
      end;
    end;
    g_free(buffer);
    Result := G_SOURCE_CONTINUE;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    loop: PGMainLoop;
    channel: PGIOChannel;
    err: PGError;
  begin
    loop := g_main_loop_new(nil, False);

    channel := g_io_channel_unix_new(fileno(stdin));
//    channel := g_io_channel_new_file('/dev/stdin', 'r', @err);


    g_io_add_watch(channel, G_IO_IN, @onKeyPress, loop);


    g_main_loop_run(loop);

    g_io_channel_unref(channel);
    g_main_loop_unref(loop);
    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
