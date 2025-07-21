program project1;

// busctl --user introspect org.ex /org/ex org.ex
// busctl --user --xml introspect org.ex /org/ex

// busctl --user monitor org.ex

// busctl --user call org.ex /org/ex org.ex add dd 22 33

// busctl --user get-property org.ex /org/ex org.ex lastresult

// busctl --user set-property org.ex /org/ex org.ex formatoptions '(ii)' 6 3
// busctl --user get-property org.ex /org/ex org.ex formatoptions



uses
  crt,
  fp_systemd;

procedure SetFormatOptions(bus: Psd_bus; fw, dp: longint);
var
  r: longint;
  error: Tsd_bus_error;
  msg: Psd_bus_message;
begin
  FillChar(error, SizeOf(error), 0);

  // Aufruf: Set(string iface, string prop, variant value)
  r := sd_bus_call_method(bus,
    'org.ex',
    '/org/ex',
    'org.freedesktop.DBus.Properties',   // Standard-Interface für Properties
    'Set',
    @error, @msg,
    'ssv',
    'org.ex',
    'formatoptions',
    '(ii)', fw, dp
  );

  if r < 0 then begin
    WriteLn('Fehler beim Setzen von formatoptions: ', r, ' ', error.message);
    Exit;
  end;

   sd_bus_message_unref(msg);
  WriteLn('formatoptions gesetzt auf: ', fw, ' : ', dp);
end;

  procedure Callculate(bus: Psd_bus; arithmetic: pchar; d1, d2: double);
  var
    res: double;
    r: longint;
    err: Tsd_bus_error;
    m: Psd_bus_message;
  begin
    FillChar(err, SizeOf(err), 0);
    r := sd_bus_call_method(bus, 'org.ex', '/org/ex', 'org.ex', arithmetic, @err, @m, 'dd', d1, d2);
    if r < 0 then begin
      WriteLn('sd_bus_call_method() failure ', r);
      Halt(1);
    end;

    r := sd_bus_message_read(m, 'd', @res);
    if r < 0 then begin
      WriteLn('sd_bus_message_read() failure ', r);
      Halt(1);
    end;
    sd_bus_message_unref(m);

    WriteLn('Ergebniss: ', res: 4: 2);
  end;

procedure introspect(bus: Psd_bus);
var
  r: LongInt;
  m: Psd_bus_message;
  err: Tsd_bus_error;
  xml:PChar;
begin
  FillChar(err, SizeOf(err), 0);
  r := sd_bus_call_method(bus, 'org.ex', '/org/ex',  'org.freedesktop.DBus.Introspectable',
        'Introspect',    @err, @m, '', nil);
  if r < 0 then begin
    WriteLn('sd_bus_call_method() failure ', r);
    Halt(1);
  end;

  r := sd_bus_message_read(m, 's', @xml);
  if r < 0 then begin
    WriteLn('sd_bus_message_read() failure ', r);
    Halt(1);
  end;

  WriteLn(xml);


  sd_bus_message_unref(m);
  end;

  procedure main;
  var
    bus: Psd_bus = nil;
  begin
    sd_bus_default(@bus);

    introspect(bus);

    SetFormatOptions(bus,2,1);
    Callculate(bus, 'add', 22, 33);
    SetFormatOptions(bus,6,4);
    Callculate(bus, 'mul', 11, 33);

    sd_bus_unref(bus);
  end;

begin
  main;
end.
