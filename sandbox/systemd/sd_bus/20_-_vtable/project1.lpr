program project1;

uses
  fp_systemd,
  fp_string,
  fp_signal,
  fp_stdlib,
  fp_unistd,
  fp_stdio;

  // https://man.archlinux.org/man/SD_BUS_VTABLE_START.3.en

  // busctl --user call org.ex /org/ex org.ex all ssud "Urs" "Furrer" 3 1.75
  // busctl --user call org.ex /org/ex org.ex firstnames "Urs"
  // busctl --user call org.ex /org/ex org.ex lastname s "Furrer"
  // busctl --user call org.ex /org/ex org.ex age u  3
  // busctl --user call org.ex /org/ex org.ex size d  1.63

  // busctl --user call org.ex /org/ex org.ex siblings as 3 "Peter" "Werner" "Bruno"


var
  quit: boolean = False;

type
  THuman = record
    FirstName: pchar;
    LastName: pchar;
    age: uint32;
    size: double;
  end;
  PHuman = ^THuman;

  function method(m: Psd_bus_message; userdata: Pointer; error: Psd_bus_error): integer; cdecl;
  var
    s: string;
    r: longint;
    firstname: pchar;
    lastname: pchar;
    age: uint32;
    size: double;
    siblings: PPChar = nil;
    human: PHuman absolute userdata;
  begin
    WriteLn('--- Old Human ---');
    WriteLn('  FirstName: ', human^.FirstName);
    WriteLn('  LastName:  ', human^.LastName);
    WriteLn('  Age:       ', human^.age);
    WriteLn('  Grösse:    ', human^.size: 4: 2);
    WriteLn();

    case string(sd_bus_message_get_member(m)) of
      'quit': begin
        quit := True;
      end;
      'all': begin
        r := sd_bus_message_read(m, 'ssud', @firstname, @lastname, @age, @size);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;
        if human^.FirstName <> nil then begin
          free(human^.FirstName);
        end;
        human^.FirstName := strdup(firstname);

        if human^.LastName <> nil then begin
          free(human^.LastName);
        end;
        human^.LastName := strdup(lastname);
        human^.age := age;
        human^.size := size;
      end;
      'firstname': begin
        r := sd_bus_message_read(m, 's', @firstname);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;
        if human^.FirstName <> nil then begin
          free(human^.FirstName);
        end;
        human^.FirstName := strdup(firstname);
      end;
      'lastname': begin
        r := sd_bus_message_read(m, 's', @lastname);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;
        if human^.LastName <> nil then begin
          free(human^.LastName);
        end;
        human^.LastName := strdup(lastname);
      end;
      'age': begin
        r := sd_bus_message_read(m, 'u', @age);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;
        human^.age := age;
      end;
      'size': begin
        r := sd_bus_message_read(m, 'd', @size);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end;
        human^.size := size;
      end;
      'siblings': begin
        r := sd_bus_message_read_strv(m, @siblings);
        if r < 0 then begin
          WriteLn('sd_bus_message_read() failed: ', strerror(-r));
          Exit(0);
        end else begin
          WriteLn('siblings: ', r);
          if siblings <> nil then begin
            while siblings^ <> nil do begin
              WriteLn('  ', siblings^);
              Inc(siblings);
            end;
            WriteLn();
          end;
        end;
      end;
    end;

    WriteLn('--- New Human ---');
    WriteLn('  FirstName: ', human^.FirstName);
    WriteLn('  LastName:  ', human^.LastName);
    WriteLn('  Age:       ', human^.age);
    WriteLn('  Grösse:    ', human^.size: 4: 2);
    WriteLn();

    WriteStr(s, 'Daten erfolgreiche empfange.'#10 +
      '  FirsiName:  ', human^.FirstName, #10 +
      '  LastName:   ', human^.LastName, #10 +
      '  Alter:      ', human^.age, #10 +
      '  Grösse:     ', human^.size: 4: 2);

    r := sd_bus_reply_method_return(m, 's', pchar(s));
    if r < 0 then begin
      WriteLn('sd_bus_reply_method_return() failed: ', strerror(-r));
      Exit(0);
    end;

    Exit(1);
  end;

  procedure handler(para1: longint); cdecl;
  begin
    quit := True;
  end;

  function main: integer;
  var
    bus: Psd_bus = nil;
    r: longint;
    human: THuman;
    vtable: Tsd_bus_vtables = nil;

  begin
    signal(SIGINT, @handler);

    Add_bus_vtable(vtable, SD_BUS_VTABLE_START(0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('all', 'ssud', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('firstname', 's', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('lastname', 's', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('age', 'u', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('size', 'd', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('siblings', 'as', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_METHOD('quit', '', 's', @method, 0));
    Add_bus_vtable(vtable, SD_BUS_VTABLE_END);

    sd_bus_default(@bus);

    human.FirstName := strdup('firstname');
    human.LastName := strdup('lastname');
    human.age := 34;
    human.size := 1.00;

    r := sd_bus_add_object_vtable(bus, nil, '/org/ex', 'org.ex', Psd_bus_vtable(vtable), @human);
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

    free(human.FirstName);
    free(human.LastName);
  end;

begin
  main;
end.
