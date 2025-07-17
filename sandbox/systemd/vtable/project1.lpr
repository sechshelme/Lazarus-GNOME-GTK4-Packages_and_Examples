program project1;

uses
  fp_systemd,
  fp_string,
  fp_stdlib,
  fp_unistd;

const
  DESTINATION = 'org.freedesktop.systemd1';
  PATH = '/org/freedesktop/systemd1';
  INTERFACE_ = 'org.freedesktop.systemd1.Manager';
  MEMBER = 'GetUnitByPID';

type
  Tobj = record
    name: pchar;
    number: uint32;
  end;

var
  vtable: array[0..7] of Tsd_bus_vtable;

  function method(m: Psd_bus_message; userdata: Pointer; error: Psd_bus_error): integer; cdecl;
  var
    r: longint;
    s: pchar;
  begin
    WriteLn('---method---');
    WriteLn('Got called with userdata=', PtrUInt(userdata));
    if sd_bus_message_is_method_call(m, 'org.freedesktop.systemd.VtableExample', 'Method4') <> 0 then begin
      Exit(1);
    end;
    r := sd_bus_message_read(m, 's', @s);
    if r < 0 then begin
      WriteLn('sd_bus_message_read() failed: ', strerror(-r));
      Exit(0);
    end;

    r := sd_bus_reply_method_return(m, 's', s);
    if r < 0 then begin
      WriteLn('sd_bus_reply_method_return() failed: ', strerror(-r));
      Exit(0);
    end;
    Exit(1);
  end;

  procedure Test;
  var
    vt: Tsd_bus_vtable;
    ofs1, ofs2: PtrUInt;
  begin
    ofs1 := PtrUInt(@vt);
    ofs2 := PtrUInt(@vt.start);
    WriteLn('diff: ', ofs2 - ofs1);
    WriteLn('tablesize: ', SizeOf(Tsd_bus_vtable));
  end;



  procedure main;
  var
    bus: Psd_bus = nil;
    r: longint;
    err: Tsd_bus_error;
    replay: Psd_bus_message = nil;
    unit_path: pchar;
    obj: Tobj;
  begin
    Test;
    FillChar(vtable, SizeOf(vtable),0);

    vtable[0] := SD_BUS_VTABLE_START(0);
    vtable[1] := SD_BUS_METHOD('Method1', 's', 's', @method, 0);
    vtable[2] := SD_BUS_METHOD_WITH_NAMES_OFFSET('Method2', 'so', 'string'#0'path'#0, 's', 'returnstring'#0, @method, 8, SD_BUS_VTABLE_DEPRECATED);
    vtable[3] := SD_BUS_SIGNAL('Signal1', 'so', 0);
    vtable[4] := SD_BUS_SIGNAL_WITH_NAMES('Signal2', 'so', 'string'#0'path'#0, 0);
    vtable[5] := SD_BUS_WRITABLE_PROPERTY('AutomaticStringProperty', 's', nil, nil, 0, SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE);
    vtable[6] := SD_BUS_WRITABLE_PROPERTY('AutomaticIntegerProperty', 'u', nil, nil, 8, SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION);
    vtable[7] := SD_BUS_VTABLE_END;

    sd_bus_default(@bus);

    obj.number := 666;
    obj.name := strdup('name');

    r := sd_bus_add_object_vtable(bus, nil, '/org/freedesktop/systemd/VtableExample', 'org.freedesktop.systemd.VtableExample', @vtable, @obj);
    if r < 0 then begin
      WriteLn('sd_bus_add_fallback_vtable() failure ', strerror(-r));
      Exit;
    end;

    r := sd_bus_request_name(bus, 'org.freedesktop.systemd.VtableExample', 0);
    if r < 0 then begin
      WriteLn('sd_bus_request_name() failure ', strerror(-r));
      Exit;
    end;




    free(obj.name);
  end;

begin
  main;
end.
