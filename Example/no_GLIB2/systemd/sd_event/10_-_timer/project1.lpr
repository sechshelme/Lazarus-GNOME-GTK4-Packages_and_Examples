program project1;

uses
  fp_signal,
  fp_time,
  clib,
  fp_systemd;

const
  StartCountdown = 20;
  TimerCount = 7;

  procedure TextColor(color: byte);
  begin
    if color < 8 then begin
      Write(#27'[', 30 + color, 'm');
    end else begin
      Write(#27'[', 90 + (color - 8), 'm');
    end;
  end;

  procedure GotoXY(x, y: integer);
  begin
    Write(#27'[', y, ';', x, 'H');
  end;

  procedure ClrScr;
  begin
    Write(#27'[2J', #27'[H');
  end;

  procedure CursorHiden;
  begin
    Write(#27'[?25l');
  end;

  procedure CursorShow;
  begin
    Write(#27'[?25h');
  end;


type
  TTimerData = record
    Number, Countdown, Time: SizeInt;
    TimerCount: PSizeInt;
  end;
  PTimerDate = ^TTimerData;

  function timer_cp(s: Psd_event_source; usec: uint64; userdata: pointer): longint; cdecl;
  var
    TimerData: PTimerDate absolute userdata;
    x, y: integer;
  begin
    x := TimerData^.Number;
    y := TimerData^.Countdown;
    GotoXY(x * 18, StartCountdown - y - 1);
    TextColor(1 + x + 8);
    WriteLn('Num: ', x: 2, '  Cnt: ', y: 2);
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
    Result := 0;
  end;

  procedure main;
  var
    TimerDatas: array [0..TimerCount - 1] of TTimerData;
    TimerCounter: SizeInt = TimerCount;

    event: Psd_event = nil;
    r: longint;
    mask: Tsigset_t;
    i: integer;
  begin
    ClrScr;
    CursorHiden;

    for i := 0 to TimerCount - 1 do begin
      TimerDatas[i].Number := i;
      TimerDatas[i].Countdown := 15;
      TimerDatas[i].Time := 500000 + i * 150000;
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
      r := sd_event_add_time_relative(event, nil, CLOCK_MONOTONIC, TimerDatas[i].Time, 0, @timer_cp, @TimerDatas[i]);
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
    CursorShow;
  end;

begin
  main;
end.
