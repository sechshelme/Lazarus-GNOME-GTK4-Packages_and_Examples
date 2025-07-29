program project1;

uses
  fp_dbus;

  procedure main;
  var
    dbus_err: TDBusError;
    dbus_conn: PDBusConnection;
    dbus_msg, dbus_reply: PDBusMessage;
    dbus_result: pchar;
  begin
    dbus_error_init(@dbus_err);

    dbus_conn := dbus_bus_get(DBUS_BUS_SYSTEM, @dbus_err);
    if dbus_conn = nil then begin
      WriteLn('Connection Error: ', dbus_err.message);
      Halt(1);
    end;

    dbus_msg := dbus_message_new_method_call('org.freedesktop.DBus', '/', 'org.freedesktop.DBus.Introspectable', 'Introspect');
    if dbus_msg = nil then begin
      WriteLn('Message Null');
      dbus_connection_unref(dbus_conn);
      Halt(2);
    end;

    dbus_reply := dbus_connection_send_with_reply_and_block(dbus_conn, dbus_msg, DBUS_TIMEOUT_USE_DEFAULT, @dbus_err);
    if dbus_reply = nil then begin
      WriteLn('Reply Error: ', dbus_err.message);
      dbus_message_unref(dbus_msg);
      dbus_connection_unref(dbus_conn);
      Halt(3);
    end;

    if not dbus_message_get_args(dbus_reply, @dbus_err, DBUS_TYPE_STRING, @dbus_result, DBUS_TYPE_INVALID) then begin
      WriteLn('Get Args Error. ', dbus_err.message);
    end else begin
      WriteLn('Introspection Result:'#10, dbus_result);
    end;


    dbus_message_unref(dbus_msg);
    dbus_message_unref(dbus_reply);
    dbus_connection_unref(dbus_conn);
  end;

begin
  main;
end.
