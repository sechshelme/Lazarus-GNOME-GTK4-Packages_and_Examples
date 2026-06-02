program project1;

uses
  fp_inotify,

  fp_stdio,
  fp_unistd,
  fp_termios,
  clib;

  procedure main;
  var
    fd, wd: longint;
    i: integer;
    buffer: array[0..4048] of char;
    len: Tssize_t;
    event: Pinotify_event;
  begin
    fd := inotify_init;
    if fd < 0 then begin
      perror('inotify_init');
      Halt(1);
    end;

    wd := inotify_add_watch(fd, '/tmp', IN_ALL_EVENTS);
    if wd < 0 then begin
      perror('inotify_add_watch');
      Halt(1);
    end;

    while True do begin
      len := read(fd, @buffer, sizeof(buffer));
      //        if (len < 0) and (errno <> EAGAIN) then begin
      if (len < 0) then begin
        perror('read');
        break;
      end;

      i := 0;

      while i < len do begin
        event := Pinotify_event(@buffer[i]);
        if (event^.mask and IN_CREATE) <> 0 then begin
          printf('Erstellt: %s'#10, event^.name);
        end;
        if (event^.mask and IN_DELETE) <> 0 then begin
          printf('Gelöscht: %s'#10, event^.name);
        end;
        if (event^.mask and IN_MODIFY) <> 0 then begin
          printf('Geändert: %s'#10, event^.name);
        end;
        if (event^.mask and IN_MOVED_TO) <> 0 then begin
          printf('Verschoben: %s'#10, event^.name);
        end;
        if (event^.mask and IN_MOVED_FROM) <> 0 then begin
          printf('Verschoben: %s'#10, event^.name);
        end;
        i += sizeof(Tinotify_event) + event^.len;
      end;
    end;

    close(fd);

  end;

begin
  main;
end.
