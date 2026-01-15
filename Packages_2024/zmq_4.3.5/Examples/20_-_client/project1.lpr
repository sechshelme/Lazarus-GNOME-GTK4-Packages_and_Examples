program project1;

uses
  fp_zmq;

  procedure main;
  const
    texts: array of pchar = (
      'hallo welt!',
      'wie geht''s?',
      'programmieren macht spass',
      'zeromq rocks!');
  var
    context, requester: Pointer;
    buffer: array [0..255] of char;
    size, rc: longint;
    i: integer;
    len: SizeInt;
  begin
    context := zmq_ctx_new;
    requester := zmq_socket(context, ZMQ_REQ);
    zmq_connect(requester, 'tcp://localhost:5555');

    for  i := 0 to Length(texts) - 1 do begin
      len := Length(texts[i]);
      WriteLn('Sende:   ', texts[i]);
      zmq_send(requester, texts[i], len, 0);

      size := zmq_recv(requester, @buffer, 255, 0);
      buffer[size] := #0;
      WriteLn('Antwort: ', buffer, #10);
    end;

    zmq_close(requester);
    zmq_ctx_destroy(context);
  end;

begin
  main;
end.
