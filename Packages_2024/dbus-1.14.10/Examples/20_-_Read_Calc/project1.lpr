program project1;

uses
  fp_dbus;

  procedure CallMethode(conn: PDBusConnection; oper: pchar; arg1, arg2: double);
  var
    msg, reply: PDBusMessage;
    args: TDBusMessageIter;
    ret: Tdbus_bool_t;
    err: TDBusError;
    res: double;
  begin
    dbus_error_init(@err);

    msg := dbus_message_new_method_call('org.ex', '/org/ex', 'org.ex', oper);
    if msg = nil then begin
      WriteLn('Message Null');
      dbus_connection_unref(conn);
      Halt(2);
    end;

    dbus_message_iter_init_append(msg, @args);
    ret := dbus_message_iter_append_basic(@args, DBUS_TYPE_DOUBLE, @arg1);
    if not ret then begin
      WriteLn('Fehler beim Anhängen von arg1');
      dbus_message_unref(msg);
      Halt(1);
    end;

    ret := dbus_message_iter_append_basic(@args, DBUS_TYPE_DOUBLE, @arg2);
    if not ret then begin
      WriteLn('Fehler beim Anhängen von arg2');
      dbus_message_unref(msg);
      Halt(1);
    end;

    reply := dbus_connection_send_with_reply_and_block(conn, msg, -1, @err);
    dbus_message_unref(msg);
    if dbus_error_is_set(@err) then begin
      WriteLn('Fehler beim Methodenaufruf: ', err.message);
      dbus_error_free(@err);
      Halt(1);
    end;
    if reply = nil then begin
      WriteLn('Keine Antwort erhalten');
      Halt(1);
    end;

    if not dbus_message_iter_init(reply, @args) then begin
      WriteLn('Keine Argumente in der Antwort');
      dbus_message_unref(reply);
      Halt(1);
    end;

    if DBUS_TYPE_DOUBLE <> dbus_message_iter_get_arg_type(@args) then begin
      WriteLn('Antwort hat nicht den Typ double');
      dbus_message_unref(reply);
      Halt(1);
    end;

    dbus_message_iter_get_basic(@args, @res);
    WriteLn('  Ergebnis: ', res: 4: 2);
  end;

  procedure CallMethodeAll(conn: PDBusConnection; arg1: double; arg2: double);
  var
    err: TDBusError;
    msg, reply: PDBusMessage;
    args: TDBusMessageIter;
    ret: Tdbus_bool_t;
    i: integer;
    res: double;
  begin
    dbus_error_init(@err);

    msg := dbus_message_new_method_call('org.ex', '/org/ex', 'org.ex', 'all');
    if msg = nil then begin
      WriteLn('Message Null');
      dbus_connection_unref(conn);
      Halt(2);
    end;

    dbus_message_iter_init_append(msg, @args);
    ret := dbus_message_iter_append_basic(@args, DBUS_TYPE_DOUBLE, @arg1);
    if not ret then begin
      WriteLn('Fehler beim Anhängen von arg1');
      dbus_message_unref(msg);
      Halt(1);
    end;

    ret := dbus_message_iter_append_basic(@args, DBUS_TYPE_DOUBLE, @arg2);
    if not ret then begin
      WriteLn('Fehler beim Anhängen von arg2');
      dbus_message_unref(msg);
      Halt(1);
    end;

    reply := dbus_connection_send_with_reply_and_block(conn, msg, -1, @err);
    dbus_message_unref(msg);
    if dbus_error_is_set(@err) then begin
      WriteLn('Fehler beim Methodenaufruf: ', err.message);
      dbus_error_free(@err);
      Halt(1);
    end;
    if reply = nil then begin
      WriteLn('Keine Antwort erhalten');
      Halt(1);
    end;

    if not dbus_message_iter_init(reply, @args) then begin
      WriteLn('Keine Argumente in der Antwort');
      dbus_message_unref(reply);
      Halt(1);
    end;

    for i := 0 to 3 do begin
      if DBUS_TYPE_DOUBLE <> dbus_message_iter_get_arg_type(@args) then begin
        WriteLn('Antwort hat nicht den Typ double');
        dbus_message_unref(reply);
        Halt(1);
      end;

      dbus_message_iter_get_basic(@args, @res);
      WriteLn('  Ergebnis: ', res: 4: 2);
      dbus_message_iter_next(@args);
    end;

  end;

  procedure main;
  var
    err: TDBusError;
    conn: PDBusConnection;
  const
    arg1: double = 22.0;
    arg2: double = 33.0;
  begin
    dbus_error_init(@err);

    conn := dbus_bus_get(DBUS_BUS_SESSION, @err);
    if dbus_error_is_set(@err) then begin
      WriteLn('Verbindungsfehler: ', err.message);
      dbus_error_free(@err);
      Halt(1);
    end;
    if conn = nil then begin
      WriteLn('Connection Error: ', err.message);
      Halt(1);
    end;

    WriteLn('Einzeln:');
    CallMethode(conn, 'add', arg1, arg2);
    CallMethode(conn, 'sub', arg1, arg2);
    CallMethode(conn, 'mul', arg1, arg2);
    CallMethode(conn, 'div', arg1, arg2);

    WriteLn();
    WriteLn('Alle:');
    CallMethodeAll(conn, arg1, arg2);

  end;

begin
  main;
end.
