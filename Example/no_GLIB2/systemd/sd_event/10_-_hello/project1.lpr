program project1;

uses
  fp_signal,
  fp_time,
  clib,
  fp_systemd;

type
  TTimerData = record
    Number, Countdown, Time: SizeInt;
    TimerCount: PSizeInt;
  end;
  PTimerDate = ^TTimerData;

  procedure TextColor(color: byte);
  begin
    Write(#27'[9' + char(48 + color) + 'm');
  end;

  function timer_handle(s: Psd_event_source; usec: uint64; userdata: pointer): longint; cdecl;
  var
    TimerData: PTimerDate absolute userdata;
  begin
    TextColor(1 + TimerData^.Number);
    WriteLn('Number: ', TimerData^.Number, '  Counter: ', TimerData^.Countdown);
    if TimerData^.Countdown <= 0 then  begin
      sd_event_source_set_enabled(s, SD_EVENT_OFF);
      Dec(TimerData^.TimerCount^);
      if TimerData^.TimerCount^ = 0 then  begin
        sd_event_exit(sd_event_source_get_event(s), 0);
      end;
    end else begin
      sd_event_source_set_enabled(s, SD_EVENT_ON);
      sd_event_source_set_time_relative(s, TimerData^.Time);
      dec(TimerData^.Countdown);
    end;
    Result := 0;
  end;

  function signal_handle(s: Psd_event_source; si: Psignalfd_siginfo; userdata: pointer): longint; cdecl;
  begin
    WriteLn('Programm mit <Ctrl+C> abgewürgt !');
    sd_event_exit(sd_event_source_get_event(s), 0);
  end;

  procedure main;
  const
    TimerCount = 7;
  var
    TimerDatas: array [0..TimerCount - 1] of TTimerData;
    TimerCounter: SizeInt = TimerCount;

    event: Psd_event = nil;
    r: longint;
    mask: Tsigset_t;
    i: integer;
  begin
    for i := 0 to TimerCount - 1 do begin
      TimerDatas[i].Number := i;
      TimerDatas[i].Countdown := 5;
      TimerDatas[i].Time := 1000000 + i * 300000;
      TimerDatas[i].TimerCount := @TimerCounter;
    end;
    r := sd_event_new(@event);
    if r < 0 then begin
      WriteLn('sd_event_new()  fehler');
      Exit;
    end;

    sigemptyset(@mask);
    sigaddset(@mask, SIGINT);
    sigprocmask(SIG_BLOCK, @mask, nil);

    r := sd_event_add_signal(event, nil, SIGINT, @signal_handle, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_signal()  fehler');
      Exit;
    end;

    for i := 0 to TimerCount - 1 do begin
      r := sd_event_add_time_relative(event, nil, CLOCK_MONOTONIC, TimerDatas[i].Time, 0, @timer_handle, @TimerDatas[i]);
      if r < 0 then begin
        WriteLn('sd_event_add_time_relative()  fehler');
        Exit;
      end;
    end;

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
