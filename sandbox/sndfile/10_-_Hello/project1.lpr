program project1;

uses
  fp_unistd,
  fp_stdio,
  fp_fcntl,
  fp_poll,

  fp_libinput,
  fp_libudev;

  function open_restricted(path: pchar; flags: longint; user_data: pointer): longint; cdecl;
  var
    fd: longint;
  begin
    fd := open(path, flags);
    if fd < 0 then begin
      WriteLn('open_restricted');
    end;
    Result := fd;
  end;

  procedure close_restricted(fd: longint; user_data: pointer); cdecl;
  begin
    close(fd);
  end;

  procedure main;
  var
    udev: Pudev;
    li: Plibinput;
    ret: longint;
    pfd: Tpollfd;
    event: Plibinput_event;
    typ: Tlibinput_event_type;
    pointer_event: Plibinput_event_pointer;
    dx, dy: double;
    kbd_event: Plibinput_event_keyboard;
    key: Tuint32_t;
    state: Tlibinput_key_state;
  const
    libinput_interface: Tlibinput_interface = (open_restricted: @open_restricted; close_restricted: @close_restricted);
  begin
    WriteLn('Programm muss als "root" gestartet werden');

    // libudev Context erzeugen (für Gerätverwaltung)
    udev := udev_new;
    if udev = nil then begin
      WriteLn('Failed to create udev');
      Exit;
    end;

    // libinput Context mit udev
    li := libinput_udev_create_context(@libinput_interface, nil, udev);
    if li = nil then begin
      WriteLn('Failed to create libinput context');
      udev_unref(udev);
      Exit;
    end;

    // Sitz zuordnen (seat0 ist normaler Sitz für Eingabegeräte)
    if (libinput_udev_assign_seat(li, 'seat0') <> 0) then begin
      WriteLn('Failed to assign seat');
      libinput_unref(li);
      udev_unref(udev);
      Exit;
    end;

    // Datei Descriptor zum Polling holen
    pfd.fd := libinput_get_fd(li);
    pfd.events := POLLIN;

    WriteLn('Warte auf Eingabegeräte Ereignisse...');

    while True do begin
      ret := poll(@pfd, 1, -1);
      if ret > 0 then begin
        libinput_dispatch(li);

        repeat
          event := libinput_get_event(li);
          if event <> nil then begin
            typ := libinput_event_get_type(event);

            case typ of
              LIBINPUT_EVENT_POINTER_MOTION: begin
                pointer_event := libinput_event_get_pointer_event(event);
                dx := libinput_event_pointer_get_dx(pointer_event);
                dy := libinput_event_pointer_get_dy(pointer_event);
                WriteLn('Maus bewegt (Delta): ', dx: 4: 2, ',  ', dy: 4: 2);
                break;
              end;
              LIBINPUT_EVENT_KEYBOARD_KEY: begin
                kbd_event := libinput_event_get_keyboard_event(event);
                key := libinput_event_keyboard_get_key(kbd_event);
                state := libinput_event_keyboard_get_key_state(kbd_event);
                WriteLn('Tastendruck: key=', key, ', ', state = LIBINPUT_KEY_STATE_PRESSED);
                break;
              end;

              else begin
                WriteLn('Ereignis: ', typ);
              end;
            end;
            libinput_event_destroy(event);
          end;

        until event = nil;
      end;
    end;
    libinput_unref(li);
    udev_unref(udev);
  end;

begin
  main;
end.
