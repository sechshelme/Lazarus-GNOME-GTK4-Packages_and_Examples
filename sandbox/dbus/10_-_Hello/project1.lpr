program project1;

uses
  fp_dbus;

  procedure main;
  var
    dbus_err: TDBusError;
    conn: PDBusConnection;
    msg, reply: PDBusMessage;
    dbus_result: pchar;
  begin
    dbus_error_init(@dbus_err);

    conn := dbus_bus_get(DBUS_BUS_SYSTEM, @dbus_err);
    if conn = nil then begin
      WriteLn('Connection Error: ', dbus_err.message);
      Halt(1);
    end;

    msg := dbus_message_new_method_call('org.freedesktop.DBus', '/', 'org.freedesktop.DBus.Introspectable', 'Introspect');
    if msg = nil then begin
      WriteLn('Message Null');
      dbus_connection_unref(conn);
      Halt(2);
    end;

    reply := dbus_connection_send_with_reply_and_block(conn, msg, DBUS_TIMEOUT_USE_DEFAULT, @dbus_err);
    if reply = nil then begin
      WriteLn('Reply Error: ', dbus_err.message);
      dbus_message_unref(msg);
      dbus_connection_unref(conn);
      Halt(3);
    end;

    if not dbus_message_get_args(reply, @dbus_err, DBUS_TYPE_STRING, @dbus_result, DBUS_TYPE_INVALID) then begin
      WriteLn('Get Args Error. ', dbus_err.message);
    end else begin
      WriteLn('Introspection Result:'#10, dbus_result);
    end;

    dbus_message_unref(msg);
    dbus_message_unref(reply);
    dbus_connection_unref(conn);
  end;

begin
  main;
end.
