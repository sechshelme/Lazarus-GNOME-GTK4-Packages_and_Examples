program project1;

uses
  fp_zmq;

  procedure main;
  var
    context, responder: Pointer;
    buffer: array [0..255] of char;
    size, rc: longint;
    i: integer;
  begin
    context := zmq_ctx_new();
    responder := zmq_socket(context, ZMQ_REP);
    rc := zmq_bind(responder, 'tcp://*:5555');
    if rc = 0 then begin
      WriteLn('Fehler');
    end;
    WriteLn('Server läuft auf tcp://*:5555 (Strg+C zum Beenden)');

    while True do begin
      size := zmq_recv(responder, @buffer, 255, 0);
      if size = -1 then begin
        continue;
      end;
      buffer[size] := #0;

      WriteLn('Erhalten: ', buffer);

      for  i := 0 to size - 1 do begin
        buffer[i] := UpCase(buffer[i]);
      end;
      buffer[size] := #0;

      zmq_send(responder, @buffer, size, 0);
    end;
    zmq_close(responder);
    zmq_ctx_destroy(context);
  end;

begin
  main;
end.
