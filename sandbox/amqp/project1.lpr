program project1;

uses
amqp,
amqp_framing,
amqp_ssl_socket,
amqp_tcp_socket,

fp_amqp;


procedure main;
var
  conn: Tamqp_connection_state_t;
  socket: Pamqp_socket_t;
begin
  conn := amqp_new_connection();
  socket := amqp_tcp_socket_new(conn);

  if (!socket) {
      die("Fehler beim Erstellen des TCP-Sockets");
  }

  int status = amqp_socket_open(socket, "localhost", 5672);
  if (status) {
      die("Verbindung zum RabbitMQ-Server fehlgeschlagen");
  }

  amqp_login(conn, "/", 0, AMQP_DEFAULT_FRAME_SIZE, 0, AMQP_SASL_METHOD_PLAIN, "guest", "guest");
  amqp_channel_open(conn, 1);
  amqp_get_rpc_reply(conn);

  amqp_queue_declare(conn, 1, amqp_cstring_bytes("test_queue"), 0, 0, 0, 0, amqp_empty_table);
  amqp_get_rpc_reply(conn);

  char *message_bytes = "Hallo Welt vom C-Programm!";
  amqp_bytes_t message;
  message.len = strlen(message_bytes);
  message.bytes = message_bytes;

  amqp_basic_properties_t props;
  props._flags = AMQP_BASIC_CONTENT_TYPE_FLAG;
  props.content_type = amqp_cstring_bytes("text/plain");

  amqp_basic_publish(conn, 1, amqp_cstring_bytes(""), amqp_cstring_bytes("test_queue"), 0, 0, &props, message);

  printf("Nachricht erfolgreich gesendet und Warteschlange erstellt!\n");

  amqp_channel_close(conn, 1, AMQP_REPLY_SUCCESS);
  amqp_connection_close(conn, AMQP_REPLY_SUCCESS);
  amqp_destroy_connection(conn);
end;

begin
    main;
end.

