program project1;

uses
  crt,

  fp_systemd;

  // busctl --user


  // busctl --user introspect org.ex /org/ex org.ex
  // busctl --user call org.ex /org/ex org.ex add dd 22 33

  // busctl --user monitor org.ex

  // busctl --user get-property org.ex /org/ex org.ex lastresult

  // busctl --user set-property org.ex /org/ex org.ex formatoptions '(ii)' 6 3
  // busctl --user get-property org.ex /org/ex org.ex formatoptions


type
  Tformat = record
    fw: integer;
    dp: integer;
  end;

var
  quit: boolean = False;
  last_result: double;
  formOpti: Tformat = (fw: 4; dp: 2);

  function CommandTest(r: integer; text: pchar): integer;
  begin
    Result := r;
    if r < 0 then begin
      WriteLn(text, '(...) failure: ', r);
    end else begin
      //      WriteLn(text, '(...)   [io]');
    end;
  end;

  function method(m: Psd_bus_message; userdata: Pointer; error: Psd_bus_error): integer; cdecl;
  var
    s: string = '';
    arithmetic: record
    text: pchar;
    symbol: char;
      end
    = (text: nil; symbol: #0);
    msg: string;
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
        if CommandTest(sd_bus_message_read(m, 'dd', @operand1, @operand2), 'sd_bus_message_read') < 0 then  begin
          Exit(0);
        end;
        case msg of
          'add': begin
            res := operand1 + operand2;
            arithmetic.text := 'Addition';
            arithmetic.symbol := '+';
          end;
          'sub': begin
            res := operand1 - operand2;
            arithmetic.text := 'Subtraction';
            arithmetic.symbol := '-';
          end;
          'mul': begin
            res := operand1 * operand2;
            arithmetic.text := 'Multiplikation';
            arithmetic.symbol := '*';
          end;
          'div': begin
            arithmetic.symbol := '/';
            if operand2 = 0.0 then begin
              res := 0.0;
              arithmetic.text := 'Division by Zero';
            end else begin
              res := operand1 / operand2;
              arithmetic.text := 'Division';
            end;
          end;
        end;

        bus := sd_bus_message_get_bus(m);
        with formOpti do begin
          WriteStr(s, operand1: fw: dp, ' ', arithmetic.symbol, ' ', operand2: fw: dp, ' = ', res: fw: dp);
        end;

        if CommandTest(sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'calc', 'ss', arithmetic.text, pchar(s)), 'sd_bus_emit_signal') < 0 then begin
          Exit(0);
        end;

        if CommandTest(sd_bus_reply_method_return(m, 'd', res), 'sd_bus_reply_method_return') < 0 then begin
          Exit(0);
        end;
        last_result := res;
      end;
    end;

    Exit(1);
  end;

  function prop_get_last_result(bus: Psd_bus; path: pchar; iface: pchar; _property: pchar; reply: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  begin
    Result := sd_bus_message_append(reply, 'd', last_result);
  end;

  function prop_get_format_options(bus: Psd_bus; path: pchar; iface: pchar; _property: pchar; reply: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  begin
    Result := sd_bus_message_append(reply, '(ii)', formOpti.fw, formOpti.dp);
    if Result < 0 then begin
      WriteLn('sd_bus_message_append() failure ', Result);
      Exit(1);
    end;
  end;

  function prop_set_format_options(bus: Psd_bus; path: pchar; iface: pchar; _property: pchar; value: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  var
    f: Tformat = (fw: 0; dp: 0);
  begin
    Result := sd_bus_message_read(value, '(ii)', @f.fw, @f.dp);
    if Result < 0 then begin
      WriteLn('sd_bus_message_read() failure ', Result);
      Exit(1);
    end else begin
      formOpti := f;
    end;
    WriteLn('Neues Format: ', f.fw, ' : ', f.dp);

    CommandTest(sd_bus_emit_properties_changed(bus, path, iface, 'formatoptions', nil), 'sd_bus_emit_properties_changed');
  end;

  function main: integer;
  var
    bus: Psd_bus = nil;
    vtable: Tsd_bus_vtables = nil;
    ch: ansichar;
  begin
    Add_bus_vtable(vtable, SD_BUS_VTABLE_START(0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('quit', '', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('add', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('sub', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('mul', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('div', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_SIGNAL_WITH_NAMES('calc', 'ss', 'calc'#0'result'#0, 0));
    Add_bus_vtable(vtable, SD_BUS_PROPERTY('lastresult', 'd', @prop_get_last_result, 0, 0));
    Add_bus_vtable(vtable, SD_BUS_WRITABLE_PROPERTY('formatoptions', '(ii)', @prop_get_format_options, @prop_set_format_options, 0, SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE));
    Add_bus_vtable(vtable, SD_BUS_VTABLE_END);

    sd_bus_default(@bus);

    if CommandTest(sd_bus_add_object_vtable(bus, nil, '/org/ex', 'org.ex', Psd_bus_vtable(vtable), nil), 'sd_bus_add_object_vtable') < 0 then begin
      Exit;
    end;
    if CommandTest(sd_bus_request_name(bus, 'org.ex', 0), 'sd_bus_request_name') < 0 then begin
      Exit;
    end;

    repeat
      if CommandTest(sd_bus_wait(bus, 100), 'sd_bus_wait') < 0 then begin
        Exit;
      end;
      if CommandTest(sd_bus_process(bus, nil), 'sd_bus_process') < 0 then begin
        Exit;
      end;
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          #32: begin
            CommandTest(sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'calc', 's', 'Es wurde Space gedrückt'), 'sd_bus_emit_signal');
          end
        end;
      end;
    until quit;

    if CommandTest(sd_bus_release_name(bus, 'org.ex'), 'sd_bus_release_name') < 0 then begin
      Exit;
    end;
    WriteLn('Program end [io]');
  end;

begin
  main;
end.
