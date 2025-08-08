program project1;

uses
  fp_stdlib,
  fp_unistd,
  fp_signal,
  fp_time,
  clib,
  fp_pidfd,
  fp_systemd;

const
  TimeSize = 1000000;
var
  timer_source: Psd_event_source = nil;

  function timer_handle(s: Psd_event_source; usec: uint64; userdata: pointer): longint; cdecl;
  const
    count: integer = 5;
  begin
    WriteLn('Counter: ', count);
    if count <= 0 then  begin
      sd_event_source_set_enabled(s, SD_EVENT_OFF);
      sd_event_exit(sd_event_source_get_event(s), 0);
    end else begin
      sd_event_source_set_enabled(s, SD_EVENT_ON);
      sd_event_source_set_time(timer_source, TimeSize + usec);
    end;
    dec(count);
    Result := 0;
  end;

  function signal_handle(s: Psd_event_source; si: Psignalfd_siginfo; userdata: pointer): longint; cdecl;
  begin
    WriteLn('Programm mit <Ctrl+C> abgewürgt !');
    sd_event_exit(sd_event_source_get_event(s), 0);
  end;

  procedure main;
  var
    event: Psd_event = nil;
    r: longint;
    mask: Tsigset_t;
  begin
    r := sd_event_new(@event);
    if r < 0 then begin
      WriteLn('sd_event_new()  fehler');
      Exit;
    end;

    sigemptyset(@mask);
    sigaddset(@mask, SIGINT);
    sigprocmask(SIG_BLOCK, @mask, nil);

    r := sd_event_add_signal(event, @timer_source, SIGINT, @signal_handle, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_signal()  fehler');
      Exit;
    end;

    r := sd_event_add_time_relative(event, @timer_source, CLOCK_MONOTONIC, TimeSize, 0, @timer_handle, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_time_relative()  fehler');
      Exit;
    end;

    WriteLn('Timer gestartet');

    r := sd_event_loop(event);
    if r < 0 then begin
      WriteLn('sd_event_loop()  fehler');
      Exit;
    end;

    sd_event_unref(event);
  end;

begin
  main;
end.
