program project1;

uses
  fp_systemd,
  fp_string,
  fp_signal,
  fp_stdlib,
  fp_unistd,
  fp_stdio;


  // busctl --user introspect org.ex /org/ex org.ex
  // busctl --user call org.ex /org/ex org.ex add ii 22 33

  // busctl --user monitor org.ex


var
  quit: boolean = False;

  function method(m: Psd_bus_message; userdata: Pointer; error: Psd_bus_error): integer; cdecl;
  var
    s: string;
    r: longint;
    sum1, sum2: int32;
    bus: Psd_bus;
  begin

    case string(sd_bus_message_get_member(m)) of
      'quit': begin
        quit := True;
      end;
      'add': begin
        r := sd_bus_message_read(m, 'ii', @sum1, @sum2);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;

        bus:=sd_bus_message_get_bus(m);
        r := sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'sum', 'siii', 'Rechnung ', sum1, sum2, sum1 + sum2);
        if r < 0 then begin
          WriteLn('sd_bus_emit_signal() failure ', strerror(-r));
          Exit(EXIT_FAILURE);
        end else begin
          WriteLn('sd_bus_emit_signal()  [io]');
        end;
      end;
    end;

    WriteStr(s, 'Die Rechung: ', sum1, ' + ', sum2, ' = ', sum1 + sum2);

    r := sd_bus_reply_method_return(m, 's', pchar(s));
    if r < 0 then begin
      WriteLn('sd_bus_reply_method_return() failed: ', strerror(-r));
      Exit(0);
    end;

    Exit(1);
  end;

type
  Tvtables = array of Tsd_bus_vtable;


  procedure handler(para1: longint); cdecl;
  begin
    quit := True;
  end;

  procedure AddVtable(Tables: Tvtables; t: Tsd_bus_vtable);
  var
    len: SizeInt;
  begin
    len := Length(Tables);
    SetLength(Tables, len + 1);
    Tables[len] := t;
  end;

  function main: integer;
  var
    bus: Psd_bus = nil;
    r: longint;
    vtable: Tvtables = nil;

  begin
    signal(SIGINT, @handler);

    SetLength(vtable, 21);

    vtable[0] := SD_BUS_VTABLE_START(0);
    vtable[1] := SD_BUS_METHOD('quit', '', 's', @method, 0);
    vtable[2] := SD_BUS_METHOD('add', 'ii', 's', @method, 0);
    vtable[3] := SD_BUS_SIGNAL_WITH_NAMES('sum', 's', 'text'#0, 0);
    vtable[4] := SD_BUS_VTABLE_END;

    //    vtable[0] := SD_BUS_VTABLE_START(0);
    //    vtable[1] := SD_BUS_METHOD('Hello', 'ssu', 's', @method, 0);

    //    vtable[2] := SD_BUS_SIGNAL_WITH_NAMES('Message', 's', 'text'#0, 0);
    //    vtable[3] := SD_BUS_WRITABLE_PROPERTY('Name', 's', nil, nil, 0, SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE);
    //    vtable[2] := SD_BUS_VTABLE_END;

    sd_bus_default(@bus);

    r := sd_bus_add_object_vtable(bus, nil, '/org/ex', 'org.ex', Psd_bus_vtable(vtable), nil);
    if r < 0 then begin
      WriteLn('sd_bus_add_fallback_vtable() failure ', strerror(-r));
      Exit(EXIT_FAILURE);
    end else begin
      WriteLn('sd_bus_add_fallback()  [io]');
    end;

    r := sd_bus_request_name(bus, 'org.ex', 0);
    if r < 0 then begin
      WriteLn('sd_bus_request_name() failure ', strerror(-r));
      Exit(EXIT_FAILURE);
    end else begin
      WriteLn('sd_bus_request_name()  [io]');
    end;

    repeat
      r := sd_bus_wait(bus, uint64(-1));
      WriteLn(r);
      if r < 0 then begin
        WriteLn('sd_bus_wait() failure ', strerror(-r));
        Exit(EXIT_FAILURE);
      end else begin
        WriteLn('sd_bus_wait()  [io]');
      end;

      r := sd_bus_process(bus, nil);
      if r < 0 then begin
        WriteLn('sd_bus_process() failure ', strerror(-r));
        Exit(EXIT_FAILURE);
      end else begin
        WriteLn('sd_bus_process()  [io]');
      end;
    until quit;

    r := sd_bus_release_name(bus, 'org.freedesktop.systemd.VtableExample');
    if r < 0 then begin
      WriteLn('sd_bus_release_name() failure ', strerror(-r));
      Exit(EXIT_FAILURE);
    end else begin
      WriteLn('sd_bus_release_name()  [io]');
    end;

    WriteLn('Program end [io]');
  end;

begin
  main;
end.
