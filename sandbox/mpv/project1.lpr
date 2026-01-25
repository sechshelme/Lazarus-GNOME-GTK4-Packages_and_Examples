program project1;

uses
  client,
  stream_cb,
  render,
  render_gl,


  fp_mpv;

  procedure check_error(status: integer);
  begin
    if status < 0 then begin
      WriteLn('mpv API error: ', mpv_error_string(status));
      Halt(1);
    end;
  end;

  procedure main;
  const
    cmd: array[0..2] of pchar = ('loadfile', '/home/tux/Schreibtisch/sound/test.mp3', nil);
  var
    ctx: Pmpv_handle;
    time_buf, duration_buf: array[0..31] of char;
    time_pos: double = 0;
    duration: double = 0;
    first_run: integer = 1;
    event: Pmpv_event;
    prop: Pmpv_event_property;
    percent: double;

  begin
    ctx := mpv_create;
    if ctx = nil then begin
      WriteLn('failed creating context');
      Exit;;
    end;

    check_error(mpv_set_option_string(ctx, 'vo', 'null'));
    check_error(mpv_set_option_string(ctx, 'audio-display', 'no'));
    check_error(mpv_set_option_string(ctx, 'osc', 'no'));
    check_error(mpv_set_option_string(ctx, 'input-default-bindings', 'yes'));

    check_error(mpv_initialize(ctx));
    check_error(mpv_command(ctx, cmd));

    check_error(mpv_observe_property(ctx, 0, 'duration', MPV_FORMAT_DOUBLE));
    check_error(mpv_observe_property(ctx, 0, 'time-pos', MPV_FORMAT_DOUBLE));

    WriteLn('Drücke CTRL+C zum Beenden...');

    while True do begin
      event := mpv_wait_event(ctx, 250);

      case event^.event_id of
        MPV_EVENT_SHUTDOWN: begin
          break;
        end;

        MPV_EVENT_FILE_LOADED: begin
          if first_run <> 0 then begin
            first_run := 0;
            mpv_get_property(ctx, 'duration', MPV_FORMAT_DOUBLE, @duration);
            WriteLn('Datei geladen: ', duration: 2: 1);
          end;
        end;
        MPV_EVENT_PROPERTY_CHANGE: begin
          prop := Pmpv_event_property(event^.data);
          if (prop = nil) or (prop^.data = nil) then begin
            continue;
          end;

          if (prop^.name = 'duration') and (prop^.format = MPV_FORMAT_DOUBLE) then begin
            duration := PDouble(prop^.data)^;
          end;

          if (prop^.name = 'time-pos') and (prop^.format = MPV_FORMAT_DOUBLE) then begin
            time_pos := PDouble(prop^.data)^;
          end;
        end;

      end;
      mpv_get_property(ctx, 'duration', MPV_FORMAT_DOUBLE, @duration);
      mpv_get_property(ctx, 'time-pos', MPV_FORMAT_DOUBLE, @time_pos);
      if duration = 0 then begin
        percent := 0;
      end else begin
        percent := time_pos / duration;
      end;
      WriteLn(time_pos: 2: 1, ' / ', duration: 2: 1, '(', percent: 2: 1, ')');
    end;

    WriteLn(#10'Fertig!');
    mpv_terminate_destroy(ctx);
  end;

begin

  WriteLn(mpv_client_api_version);

  main;
end.
