program project1;

uses
  crt,
  fp_systemd,
  fp_string,
  fp_stdlib,
  fp_unistd,
  fp_stdio;

// busctl --user monitor org.ex

var
  quit: boolean = False;

  function main: integer;
  var
    bus: Psd_bus = nil;
    r: longint;
    ch: AnsiChar;
    s: String;
    counter:Integer=0;
  begin
    sd_bus_default(@bus);

    r := sd_bus_request_name(bus, 'org.ex', 0);
    if r < 0 then begin
      WriteLn('sd_bus_request_name() failure ', strerror(-r));
      Exit(EXIT_FAILURE);
    end else begin
      WriteLn('sd_bus_request_name()  [io]');
    end;

    repeat
      ch:=ReadKey;
      case ch of
      #27:   quit:=True;
      else
        s:='Es wurde die Taste <'+ch+'> gedrückt';
        r := sd_bus_emit_signal(bus, '/org/ex', 'org.ex', 'Hello', 'ssi', PChar(s), 'counter: ', counter);
        if r < 0 then begin
          WriteLn('sd_bus_emit_signal() failure ', strerror(-r));
          Exit(EXIT_FAILURE);
        end else begin
          WriteLn('sd_bus_emit_signal()  [io]');
        end;
        Inc(counter);
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

    sd_bus_unref(bus);
  end;

begin
  main;
end.
