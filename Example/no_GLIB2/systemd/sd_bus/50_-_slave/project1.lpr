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
  fp_systemd,
  clib;

const
  {$IFDEF unix}
  libc = 'c';
  {$ENDIF}

  {$IFDEF mswindows}
  libc = 'msvcrt';
  {$ENDIF}

  procedure free(__ptr: pointer); cdecl; external libc;

  procedure SetFormatOptions(bus: Psd_bus; fw, dp: longint);
  var
    r: longint;
    err: Tsd_bus_error;
    msg: Psd_bus_message;
  begin
    err := SD_BUS_ERROR_NULL;

    // Aufruf: Set(string iface, string prop, variant value)
    r := sd_bus_call_method(bus,
      'org.ex',
      '/org/ex',
      'org.freedesktop.DBus.Properties',   // Standard-Interface für Properties
      'Set',
      @err, @msg,
      'ssv',
      'org.ex',
      'formatoptions',
      '(ii)', fw, dp
      );

    if r < 0 then begin
      WriteLn('Fehler beim Setzen von formatoptions: ', r, ' ', err.message);
      Exit;
    end;

    sd_bus_message_unref(msg);
  end;

  procedure GetFormatOptions(bus: Psd_bus);
  var
    r: longint;
    err: Tsd_bus_error;
    msg: Psd_bus_message;
    fw, dp: integer;
  begin
    err := SD_BUS_ERROR_NULL;

    r := sd_bus_call_method(bus,
      'org.ex',
      '/org/ex',
      'org.freedesktop.DBus.Properties',   // Standard-Interface für Properties
      'Get',
      @err, @msg,
      'ss',
      'org.ex',
      'formatoptions');

    if r < 0 then begin
      WriteLn('Fehler beim Lesen von formatoptions: ', r, ' ', err.message);
      Exit;
    end;

    // Die Antwort ist ein 'variant', der das wirkliche Tupel enthält
    r := sd_bus_message_enter_container(msg, SD_BUS_TYPE_VARIANT, '(ii)');
    if r < 0 then  begin
      WriteLn('Fehler beim Öffnen des Variants: ', r);
      sd_bus_message_unref(msg);
      Exit;
    end;

    r := sd_bus_message_read(msg, '(ii)', @fw, @dp);
    if r < 0 then  begin
      WriteLn('Fehler beim Lesen des Tupels: ', r);
    end;

    WriteLn('Formatoption: ', fw, ':', dp);

    sd_bus_message_unref(msg);
  end;

  procedure Callculate(bus: Psd_bus; arithmetic: pchar; d1, d2: double);
  var
    res: double;
    r: longint;
    err: Tsd_bus_error;
    m: Psd_bus_message;
    sig: pchar;
  begin
    err := SD_BUS_ERROR_NULL;

    sig := sd_bus_message_get_signature(m, 0);
    WriteLn('Signature: ', sig);

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

    WriteLn('Ergebnis: ', res: 4: 2);
  end;

  procedure Callculate_All(bus: Psd_bus; d1, d2: double);
  var
    res: record
    add_, sub_, mul_, div_: double;
      end;
    r: longint;
    err: Tsd_bus_error;
    m: Psd_bus_message;
    sig: pchar;
  begin
    err := SD_BUS_ERROR_NULL;

    r := sd_bus_call_method(bus, 'org.ex', '/org/ex', 'org.ex', 'all', @err, @m, 'dd', d1, d2);
    if r < 0 then begin
      WriteLn('sd_bus_call_method() failure ', r);
      Halt(1);
    end;

    sig := sd_bus_message_get_signature(m, 0);
    WriteLn('Signature: ', sig);

    r := sd_bus_message_read(m, 'dddd', @res.add_, @res.sub_, @res.mul_, @res.div_);
    if r < 0 then begin
      WriteLn('sd_bus_message_read() failure ', r);
      Halt(1);
    end;
    sd_bus_message_unref(m);

    WriteLn('Ergebnis calc_all: ');
    WriteLn('  ', d1: 4: 2, ' + ', d2: 4: 2, ' = ', res.add_: 4: 2);
    WriteLn('  ', d1: 4: 2, ' - ', d2: 4: 2, ' = ', res.sub_: 4: 2);
    WriteLn('  ', d1: 4: 2, ' * ', d2: 4: 2, ' = ', res.mul_: 4: 2);
    WriteLn('  ', d1: 4: 2, ' / ', d2: 4: 2, ' = ', res.div_: 4: 2);
    WriteLn();
  end;

  procedure ReadStringArray(bus: Psd_bus);
  var
    r: longint;
    err: Tsd_bus_error;
    m: Psd_bus_message;
    sa, p: PPChar;
    sig: pchar;
  begin
    err := SD_BUS_ERROR_NULL;

    r := sd_bus_call_method(bus, 'org.ex', '/org/ex', 'org.ex', 'strarrout', @err, @m, '');
    if r < 0 then begin
      WriteLn('sd_bus_call_method() failure ', r);
      Halt(1);
    end;

    sig := sd_bus_message_get_signature(m, 0);
    WriteLn('Signature: ', sig);

    r := sd_bus_message_read_strv(m, @sa);
    if r < 0 then begin
      WriteLn('sd_bus_message_read() failure ', r);
      Halt(1);
    end;
    sd_bus_message_unref(m);

    if sa <> nil then begin
      p := sa;
      while p^ <> nil do begin
        WriteLn(p^);
        free(p^);
        Inc(p);
      end;
      free(sa);
    end;
  end;

  procedure ReadNumbeArray(bus: Psd_bus);
  var
    r: longint;
    err: Tsd_bus_error;
    m: Psd_bus_message;
    ia: PInt32;
    da: PDouble;
    ia_len: Tsize_t=0;
    da_len: Tsize_t=0;
    i: integer;
    sig: pchar;
  begin
    err := SD_BUS_ERROR_NULL;


    r := sd_bus_call_method(bus, 'org.ex', '/org/ex', 'org.ex', 'numarrout', @err, @m, '');
    if r < 0 then begin
      WriteLn('sd_bus_call_method() failure ', r);
      Halt(1);
    end;

    sig := sd_bus_message_get_signature(m, 0);
    WriteLn('Signature: ', sig);

    r := sd_bus_message_enter_container(m, SD_BUS_TYPE_ARRAY, 'i');
    if r < 0 then begin
      WriteLn('sd_bus_message_enter_container() failure ', r);
      Halt(1);
    end;

    r := sd_bus_message_read_array(m, SD_BUS_TYPE_INT32, @ia, @ia_len);
    if r < 0 then begin
      WriteLn('sd_bus_message_read_array() failure ', r);
      Halt(1);
    end;

    WriteLn('len: ', ia_len);
    for i := 0 to ia_len - 1 do begin
      Write(ia[i], ' ');
    end;
    WriteLn();

    r := sd_bus_message_exit_container(m);
    if r < 0 then begin
      WriteLn('sd_bus_message_exit_container() failure ', r);
      Halt(1);
    end;

    // ---

    r := sd_bus_message_enter_container(m, SD_BUS_TYPE_ARRAY, 'd');
    if r < 0 then begin
      WriteLn('sd_bus_message_enter_container() failure ', r);
      Halt(1);
    end;

    r := sd_bus_message_read_array(m, SD_BUS_TYPE_DOUBLE, @da, @da_len);
    if r < 0 then begin
      WriteLn('sd_bus_message_read_array() failure ', r);
      Halt(1);
    end;

    r := sd_bus_message_exit_container(m);
    if r < 0 then begin
      WriteLn('sd_bus_message_exit_container() failure ', r);
      Halt(1);
    end;


    sd_bus_message_unref(m);
    sd_bus_unref(bus);
  end;

  procedure introspect(bus: Psd_bus);
  var
    r: longint;
    m: Psd_bus_message;
    err: Tsd_bus_error;
    xml: pchar;
  begin
    err := SD_BUS_ERROR_NULL;

    r := sd_bus_call_method(bus, 'org.ex', '/org/ex', 'org.freedesktop.DBus.Introspectable',
      'Introspect', @err, @m, '', nil);
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
    SetFormatOptions(bus, 2, 1);
    GetFormatOptions(bus);
    Callculate(bus, 'add', 22, 33);
    SetFormatOptions(bus, 6, 3);
    GetFormatOptions(bus);
    Callculate(bus, 'mul', 11, 33);

    Callculate_All(bus, 55, 66);

    ReadStringArray(bus);
//    ReadNumbeArray(bus);

    sd_bus_unref(bus);
  end;

begin
  main;
end.
