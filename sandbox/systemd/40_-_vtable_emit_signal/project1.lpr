program project1;

uses
  fp_systemd,
  fp_string,
  fp_signal,
  fp_stdlib,
  fp_unistd,
  fp_stdio;


  // busctl --user introspect org.ex /org/ex org.ex
  // busctl --user call org.ex /org/ex org.ex add dd 22 33

  // busctl --user monitor org.ex


var
  quit: boolean = False;

  procedure handler(para1: longint); cdecl;
  begin
    case para1 of
      SIGINT: begin
        quit := True;
      end;
    end;
  end;

  function method(m: Psd_bus_message; userdata: Pointer; error: Psd_bus_error): integer; cdecl;
  var
    s: string = '';
    arithmetic:PChar=nil;
    msg: string;
    r: longint;
    operand1, operand2, res: double;

    bus: Psd_bus;
  begin
    msg := string(sd_bus_message_get_member(m));

    case msg of
      'quit': begin
        quit := True;
        sd_bus_reply_method_return(m, 's', 'Programm beendet');
      end;
      'add', 'sub', 'mul', 'div': begin
        r := sd_bus_message_read(m, 'dd', @operand1, @operand2);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;
        case msg of
          'add': begin
            res := operand1 + operand2;
            WriteStr(s, 'Die Rechung: ', operand1: 4: 2, ' + ', operand2: 4: 2, ' = ', res: 4: 2);
            arithmetic:='Addition';
          end;
          'sub': begin
            res := operand1 - operand2;
            WriteStr(s, 'Die Rechung: ', operand1: 4: 2, ' - ', operand2: 4: 2, ' = ', res: 4: 2);
            arithmetic:='Subtraction';
          end;
          'mul': begin
            res := operand1 * operand2;
            WriteStr(s, 'Die Rechung: ', operand1: 4: 2, ' * ', operand2: 4: 2, ' = ', res: 4: 2);
            arithmetic:='Multiplikation';
          end;
          'div': begin
            if operand2 = 0.0 then begin
              res := 0.0;
              s := 'Division by Zero';
            end else begin
              res := operand1 / operand2;
              WriteStr(s, 'Die Rechung: ', operand1: 4: 2, ' / ', operand2: 4: 2, ' = ', res: 4: 2);
              arithmetic:='Division';
            end;
          end;
        end;

        bus := sd_bus_message_get_bus(m);
        r := sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'sum', 'sddd', arithmetic, operand1, operand2, res);
        if r < 0 then begin
          WriteLn('sd_bus_emit_signal() failure ', strerror(-r));
          Exit(0);
        end else begin
          WriteLn('sd_bus_emit_signal()  [io]');
        end;

        r := sd_bus_reply_method_return(m, 's', pchar(s));
        if r < 0 then begin
          WriteLn('sd_bus_reply_method_return() failed: ', strerror(-r));
          Exit(0);
        end;
      end;
    end;

    Exit(1);
  end;

  function main: integer;
  var
    bus: Psd_bus = nil;
    r: longint;
    vtable: Tsd_bus_vtables = nil;
  begin
    signal(SIGINT, @handler);

    Add_bus_vtable(vtable, SD_BUS_VTABLE_START(0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('quit', '', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('add', 'dd', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('sub', 'dd', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('mul', 'dd', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('div', 'dd', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_SIGNAL_WITH_NAMES('calc', 'sddd', 'calc'#0'operand1'#0'operand2'#0'result'#0, 0));
    Add_bus_vtable(vtable, SD_BUS_VTABLE_END);

    //    vtable[3] := SD_BUS_WRITABLE_PROPERTY('Name', 's', nil, nil, 0, SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE);

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
