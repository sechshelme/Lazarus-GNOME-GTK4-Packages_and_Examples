program project1;

uses
  //_sd_common,
  //sd_id128,                          //   Tsd_id128_t = array[0..15] of Byte;   ??????????
  //sd_bus_vtable,                     // struct und Makros entfernt
  //sd_bus,
  //sd_bus_protocol,
  //sd_daemon,
  //sd_event,
  //sd_device,
  //sd_gpt,                            // makro
  //sd_hwdb,
  //sd_journal,
  //sd_login,
  //sd_messages,                       // makro
  //sd_path,


  fp_systemd,
  fp_unistd;

const
  DESTINATION = 'org.freedesktop.systemd1';
  PATH = '/org/freedesktop/systemd1';
  INTERFACE_ = 'org.freedesktop.systemd1.Manager';
  MEMBER = 'GetUnitByPID';



  procedure main;
  var
    bus: Psd_bus = nil;
    r: longint;
    err: Tsd_bus_error;
    replay: Psd_bus_message = nil;
    unit_path: pchar;
  begin
    FillChar(err, SizeOf(err), 0);
    r := sd_bus_open_system(@bus);
    if r < 0 then begin
      WriteLn('sd_bus_open_system() failure ', r);
      Exit;
    end;

    r := sd_bus_call_method(bus, DESTINATION, PATH, INTERFACE_, MEMBER, @err, @replay, 'u', getpid);
    if r < 0 then begin
      WriteLn('sd_bus_call_method() failure ', err.message);
      sd_bus_error_free(@err);
      sd_bus_unref(bus);
      Exit;
    end;

    r := sd_bus_message_read(replay, 'o', @unit_path);
    if r < 0 then begin
      WriteLn('sd_bus_message_read() failure ', r);
      sd_bus_message_unref(replay);
      sd_bus_unref(bus);
      Exit;
    end;

    WriteLn('Unit-Pfad: ', unit_path);
    sd_bus_message_unref(replay);
    sd_bus_unref(bus);
  end;

  procedure Test;
  var
    vt: Tsd_bus_vtable;
    ofs1, ofs2: PtrUInt;
  begin
    ofs1 := PtrUInt(@vt);
    ofs2 := PtrUInt(@vt.start);
    WriteLn('diff: ', ofs2 - ofs1);
  end;


begin
  test;
  main;
end.
