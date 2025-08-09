program project1;

uses
  fp_systemd;

  // busctl --user

  // busctl --user introspect org.ex /org/ex org.ex
  // busctl --user call org.ex /org/ex org.ex add dd 22 33
  // busctl --user call org.ex /org/ex org.ex all dd 22 33

  // busctl --user call org.ex /org/ex org.ex quit
  // busctl --user call org.ex /org/ex org.ex hello

  // busctl --user monitor org.ex

  // busctl --user call org.ex /org/ex org.ex intarrout
  // busctl --user call org.ex /org/ex org.ex strarrout

  // busctl --user get-property org.ex /org/ex org.ex lastresult

  // busctl --user set-property org.ex /org/ex org.ex formatoptions '(ii)' 6 3
  // busctl --user get-property org.ex /org/ex org.ex formatoptions


const
  WhiteText = #27'[1;37m';
  YellowText = #27'[33m';
  ResetText = #27'[0m';

const   CLOCK_MONOTONIC = 1;

type
  Tformat = record
    fw: integer;
    dp: integer;
  end;

var
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
    event:Psd_event absolute userdata;
  begin
    msg := string(sd_bus_message_get_member(m));

    case msg of
      'quit': begin
         sd_event_exit(event, 0);
        sd_bus_reply_method_return(m, 's', 'Programm beendet');
      end;
      'hello': begin
        WriteLn('Hello World');
        sd_bus_reply_method_return(m, 's', 'Hello World');
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

  function method_calc_all(m: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  var
    s: string = '';
    arithmetic: record
    text: pchar;
    symbol: char;
      end
    = (text: nil; symbol: #0);
    operand1, operand2: double;
    res: record
    add_, sub_, mul_, div_: double;
      end;

    bus: Psd_bus;
  begin
    if CommandTest(sd_bus_message_read(m, 'dd', @operand1, @operand2), 'sd_bus_message_read') < 0 then  begin
      Exit(0);
    end;
    res.add_ := operand1 + operand2;
    res.sub_ := operand1 - operand2;
    res.mul_ := operand1 * operand2;
    res.div_ := operand1 / operand2;

    bus := sd_bus_message_get_bus(m);
    with formOpti do begin
      WriteStr(s, #10,
        operand1: fw: dp, ' + ', operand2: fw: dp, ' = ', res.add_: fw: dp, #10,
        operand1: fw: dp, ' - ', operand2: fw: dp, ' = ', res.sub_: fw: dp, #10,
        operand1: fw: dp, ' * ', operand2: fw: dp, ' = ', res.mul_: fw: dp, #10,
        operand1: fw: dp, ' / ', operand2: fw: dp, ' = ', res.div_: fw: dp);
    end;

    if CommandTest(sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'calc_all', 'ss', arithmetic.text, pchar(s)), 'sd_bus_emit_signal') < 0 then begin
      Exit(0);
    end;

    if CommandTest(sd_bus_reply_method_return(m, 'dddd', res.add_, res.sub_, res.mul_, res.div_), 'sd_bus_reply_method_return') < 0 then begin
      Exit(0);
    end;
    Exit(1);
  end;

  function method_multiout(m: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  const
    d1: double = 11.11;
    d2: double = 22.22;
  begin
    if CommandTest(sd_bus_reply_method_return(m, 'dsdi', d1, 'Hello World', d2, 123), 'sd_bus_reply_method_return') < 0 then begin
      Exit(0);
    end;
    Exit(1);
  end;

  function method_numarrout(m: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  var
    ia: array of int32;
    da: array of double;
    reply: Psd_bus_message = nil;
    len: int64;
    i: integer;
  begin
    len := random(20) + 8;
    SetLength(ia, len);
    for i := 0 to len - 1 do begin
      ia[i] := random(100);
    end;

    len := random(20) + 8;
    SetLength(da, len);
    for i := 0 to len - 1 do begin
      da[i] := random * 10;
    end;

    if CommandTest(sd_bus_message_new_method_return(m, @reply), 'sd_bus_message_new_method_return()') < 0 then begin
      Exit(0);
    end;

    if CommandTest(sd_bus_message_append_array(reply, 'i', PInt32(ia), Length(ia) * SizeOf(int32)), 'sd_bus_message_append_array()') < 0 then begin
      Exit(0);
    end;

    if CommandTest(sd_bus_message_append_array(reply, 'd', PDouble(da), Length(da) * SizeOf(double)), 'sd_bus_message_append_array()') < 0 then begin
      Exit(0);
    end;

    if CommandTest(sd_bus_send(nil, reply, nil), 'sd_bus_send()') < 0 then begin
      Exit(0);
    end;

    sd_bus_message_unref(reply);
    Exit(1);
  end;

  function method_strarrout(m: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  const
    sa: array of pchar = ('Fritz', 'Max', 'Franz', 'Bruno', 'Joel');
  var
    reply: Psd_bus_message = nil;
    i: integer;
  begin
    if CommandTest(sd_bus_message_new_method_return(m, @reply), 'sd_bus_message_new_method_return()') < 0 then begin
      Exit(0);
    end;

    if CommandTest(sd_bus_message_open_container(reply, 'a', 's' + ''), 'sd_bus_message_open_container()') < 0 then begin
      Exit(0);
    end;

    for i := 0 to Length(sa) - 1 do begin
      if CommandTest(sd_bus_message_append(reply, 's', pchar(sa[i])), 'sd_bus_message_append()') < 0 then begin
        Exit(0);
      end;
    end;

    if CommandTest(sd_bus_message_close_container(reply), 'sd_bus_message_close_container()') < 0 then begin
      Exit(0);
    end;

    if CommandTest(sd_bus_send(nil, reply, nil), 'sd_bus_send()') < 0 then begin
      Exit(0);
    end;

    sd_bus_message_unref(reply);
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
    CommandTest(sd_bus_emit_properties_changed(bus, path, iface, 'formatoptions', nil), 'sd_bus_emit_properties_changed');
  end;

  function timer_cp(s: Psd_event_source; usec: uint64; userdata: pointer    ): longint; cdecl;
  const
    font:array [0..3]of char ='\-/|';
    p:Integer=0;
  begin
    Write(    '  (',font[p mod 4],')');
    Inc(p);
    Write(#27'[1G');
    sd_event_source_set_time(s, usec+10000);
    sd_event_source_set_enabled(s, SD_EVENT_ON);

    Result:=0;
  end;

  function main: integer;
  var
    bus: Psd_bus = nil;
    vtable: Tsd_bus_vtables = nil;
    event: Psd_event;
  begin
    Randomize;
    Writeln();
    WriteLn(YellowText, 'Mit folgenden Kommandos, in einem 2. Termin,'#10'kann das Programm gesteuert werden:', ResetText);
    WriteLn();
    WriteLn(WhiteText, 'Listet alle Austausche auf. (im seperaten Terminal)', ResetText);
    Writeln('  busctl --user monitor org.ex');
    Writeln('');
    WriteLn(WhiteText, 'Infos auslesesen:', ResetText);
    Writeln('  busctl --user introspect org.ex /org/ex org.ex');
    Writeln('');
    WriteLn(WhiteText, 'Mit dem Programm rechnen:', ResetText);
    Writeln('  busctl --user call org.ex /org/ex org.ex add dd 22 33');
    Writeln('  busctl --user call org.ex /org/ex org.ex all dd 22 33');
    Writeln('');
    WriteLn(WhiteText, 'Beenden oder Hello World Ausgabe:', ResetText);
    Writeln('  busctl --user call org.ex /org/ex org.ex quit');
    Writeln('  busctl --user call org.ex /org/ex org.ex hello');
    Writeln('');
    WriteLn(WhiteText, 'Property einlesen und schreiben:', ResetText);
    Writeln('  busctl --user get-property org.ex /org/ex org.ex lastresult');
    Writeln('  busctl --user set-property org.ex /org/ex org.ex formatoptions ''(ii)'' 6 3');
    Writeln('  busctl --user get-property org.ex /org/ex org.ex formatoptions');
    Writeln('');
    WriteLn(WhiteText, 'Sonstiges:', ResetText);
    Writeln('  busctl --user call org.ex /org/ex org.ex numarrout');
    Writeln('  busctl --user call org.ex /org/ex org.ex strarrout');
    Writeln('');

    if CommandTest(sd_bus_default(@bus), 'sd_bus_default') < 0 then begin
  Exit;
  end;

    if CommandTest(sd_event_default(@event), 'sd_event_default') < 0 then begin
  Exit;
  end;

    if CommandTest(sd_bus_attach_event(bus, event, 0), 'sd_bus_attach_event') < 0 then begin
  Exit;
  end;

    if CommandTest(sd_event_add_time_relative( event, nil, CLOCK_MONOTONIC, 10000, 0,@timer_cp,nil), 'sd_event_add_time_relative') < 0 then begin
  Exit;
  end;

    Add_bus_vtable(vtable, SD_BUS_VTABLE_START(0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('quit', '', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('hello', '', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('add', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('sub', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('mul', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('div', 'dd', 'd', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('all', 'dd', 'dddd', @method_calc_all, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('multiout', '', 'dsdi', @method_multiout, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('numarrout', '', 'aiad', @method_numarrout, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('strarrout', '', 'as', @method_strarrout, 0));
    Add_bus_vtable(vtable, SD_BUS_SIGNAL_WITH_NAMES('calc', 'ss', 'calc'#0'result'#0, 0));
    Add_bus_vtable(vtable, SD_BUS_SIGNAL_WITH_NAMES('calc_all', 'ss', 'calc_all'#0'result'#0, 0));
    Add_bus_vtable(vtable, SD_BUS_PROPERTY('lastresult', 'd', @prop_get_last_result, 0, 0));
    Add_bus_vtable(vtable, SD_BUS_WRITABLE_PROPERTY('formatoptions', '(ii)', @prop_get_format_options, @prop_set_format_options, 0, SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE));
    Add_bus_vtable(vtable, SD_BUS_VTABLE_END);

    if CommandTest(sd_bus_add_object_vtable(bus, nil, '/org/ex', 'org.ex', Psd_bus_vtable(vtable), event), 'sd_bus_add_object_vtable') < 0 then begin
      Exit;
    end;
    if CommandTest(sd_bus_request_name(bus, 'org.ex', 0), 'sd_bus_request_name') < 0 then begin
      Exit;
    end;

    WriteLn();
    WriteLn('dbus gestartet.');
    WriteLn();
    WriteLn('    <CTRL+C> = Abbruch');
    WriteLn();

    if CommandTest(sd_event_loop(event), 'sd_event_loop()') < 0 then begin
  Exit;
  end;

    sd_bus_unref(bus);
    sd_event_unref(event);


    //repeat
    //  if CommandTest(sd_bus_wait(bus, 100), 'sd_bus_wait') < 0 then begin
    //    Exit;
    //  end;
    //  if CommandTest(sd_bus_process(bus, nil), 'sd_bus_process') < 0 then begin
    //    Exit;
    //  end;
    //
    //  if KeyPressed then begin
    //    ch := ReadKey;
    //    case ch of
    //      #27: begin
    //        quit := True;
    //      end;
    //      #32: begin
    //        CommandTest(sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'calc', 's', 'Es wurde Space gedrückt'), 'sd_bus_emit_signal');
    //      end
    //    end;
    //  end;
    //until quit;

    //if CommandTest(sd_bus_release_name(bus, 'org.ex'), 'sd_bus_release_name') < 0 then begin
    //  Exit;
    //end;
    WriteLn('Program end [io]');

    Result := 0;
  end;

begin
  main;
end.
