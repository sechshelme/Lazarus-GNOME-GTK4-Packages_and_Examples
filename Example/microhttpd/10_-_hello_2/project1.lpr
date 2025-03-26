program project1;

// https://www.perplexity.ai/search/4abe87fe-3db5-441b-965e-f94bffc9e646

{$I-}


uses
  fp_microhttpd;

  // http://localhost:8080

const
  PORT = 8080;
  FILENAME = 'clickCount.txt';

var
  clickCount1: integer = 0;
  clickCount2: integer = 0;

  function answer_to_connection(cls: pointer; connection: PMHD_Connection; url: pchar; method: pchar; version: pchar; upload_data: pchar; upload_data_size: Psize_t; req_cls: Ppointer): TMHD_Result; cdecl;
  var
    f: Text;
    html: string;
    response: PMHD_Response;
    ret: TMHD_Result;
  begin
    if string(method) = 'POST' then  begin
      WriteLn('POST');

      if string(url) = '/click1' then begin
        Inc(clickCount1);
        WriteLn('Zähler 1 um eins erhöht (', clickCount1, ')');
      end else if string(url) = '/click2' then begin
        Inc(clickCount2);
        WriteLn('Zähler 2 um eins erhöht (', clickCount2, ')');
      end;
      Assign(f, FILENAME);
      Rewrite(f);
      WriteLn(f, clickCount1);
      WriteLn(f, clickCount2);
      Close(f);

      response := MHD_create_response_from_buffer(0, nil, MHD_RESPMEM_MUST_COPY);
      MHD_add_response_header(response, 'Location', '/');
      ret := MHD_queue_response(connection, MHD_HTTP_SEE_OTHER, response);
      MHD_destroy_response(response);
    end else begin
      WriteStr(html,
        '<html><body>'#10 +
        '<h1>Klick-Zähler</h1>'#10 +
        '<p>Anzahl der Klicks (Button 1): ', clickCount1, '</p>'#10 +
        '<form action="/click1" method="post">'#10 +
        '<input type="submit" value="Button 1 klicken">'#10 +
        '</form>'#10 +
        '<p>Anzahl der Klicks (Button 2): ', clickCount2, '</p>'#10 +
        '<form action="/click2" method="post">'#10 +
        '<input type="submit" value="Button 2 klicken">'#10 +
        '</form>'#10 +
        '</body></html>');
      WriteLn('-----------');
      WriteLn(html);
      WriteLn('-----------');
      response := MHD_create_response_from_buffer(Length(html), PChar(html), MHD_RESPMEM_MUST_COPY);
      MHD_add_response_header(response, 'Content-Type', 'text/html; charset=utf-8');
      ret := MHD_queue_response(connection, MHD_HTTP_OK, response);
      MHD_destroy_response(response);
      WriteLn('Response erzeugt');
    end;

    Result := ret;
  end;


  procedure main;
  var
    f: Text;
    daemon: PMHD_Daemon;
  begin
    Assign(f, FILENAME);
    Reset(f);
    if IOResult <> 0 then begin
      WriteLn('Datei: ', FILENAME, ' wird erzeugt.');
    end else begin
      ReadLn(f, clickCount1);
      ReadLn(f, clickCount2);
      Close(f);
    end;

    daemon := MHD_start_daemon(MHD_USE_AUTO or MHD_USE_INTERNAL_POLLING_THREAD, PORT, nil, nil, @answer_to_connection, nil, MHD_OPTION_END);
    if daemon = nil then begin
      WriteLn('daemon Fehler !');
      Exit;
    end;

    WriteLn('Server läuft auf http://localhost:', PORT);
    ReadLn;

    MHD_stop_daemon(daemon);
  end;

begin
  main;
end.
