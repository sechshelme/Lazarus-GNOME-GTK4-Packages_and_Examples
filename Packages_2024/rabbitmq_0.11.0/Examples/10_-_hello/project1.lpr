program project1;

(*
sudo apt install rabbitmq-server
 sudo rabbitmq-plugins enable rabbitmq_management
 Browser: http://localhost:15672
*)

uses
  fp_amqp;

  procedure main;
  var
    conn: Tamqp_connection_state_t;
    socket: Pamqp_socket_t;
    status: longint;
    message: Tamqp_bytes_t;
    props: Tamqp_basic_properties_t;
  const
    message_bytes: pchar = 'Hallo Welt vom C-Programm!';
  begin
    conn := amqp_new_connection();
    socket := amqp_tcp_socket_new(conn);

    if socket = nil then begin
      WriteLn('Fehler beim Erstellen des TCP-Sockets');
      Exit;
    end;

    status := amqp_socket_open(socket, 'localhost', 5672);
    if status <> 0 then begin
      WriteLn('Verbindung zum RabbitMQ-Server fehlgeschlagen');
      Exit;
    end;

    amqp_login(conn, '/', 0, AMQP_DEFAULT_FRAME_SIZE, 0, AMQP_SASL_METHOD_PLAIN, 'guest', 'guest');
    amqp_channel_open(conn, 1);
    amqp_get_rpc_reply(conn);

    amqp_queue_declare(conn, 1, amqp_cstring_bytes('test_queue'), False, False, False, False, amqp_empty_table);
    amqp_get_rpc_reply(conn);

    message.len := Length(message_bytes);
    message.bytes := message_bytes;

    props._flags := AMQP_BASIC_CONTENT_TYPE_FLAG;
    props.content_type := amqp_cstring_bytes('text/plain');

    amqp_basic_publish(conn, 1, amqp_cstring_bytes(''), amqp_cstring_bytes('test_queue'), False, False, @props, message);

    WriteLn('Nachricht erfolgreich gesendet und Warteschlange erstellt!');

    amqp_channel_close(conn, 1, AMQP_REPLY_SUCCESS);
    amqp_connection_close(conn, AMQP_REPLY_SUCCESS);
    amqp_destroy_connection(conn);
  end;

begin
  main;
end.
