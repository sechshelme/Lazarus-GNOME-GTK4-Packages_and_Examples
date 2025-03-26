program project1;

// https://www.perplexity.ai/search/4abe87fe-3db5-441b-965e-f94bffc9e646

{$I-}


uses
  fp_microhttpd;

const
  PORT = 8080;
  FILENAME = 'clickCount.txt';

var
  clickCount: integer = 0;

  function answer_to_connection(cls: pointer; connection: PMHD_Connection; url: pchar; method: pchar; version: pchar; upload_data: pchar; upload_data_size: Psize_t; req_cls: Ppointer): TMHD_Result; cdecl;
  var
    f: Text;
    countstr, html: string;
    response: PMHD_Response;
    ret: TMHD_Result;
  begin
    if string(url) = '/click' then begin
      Inc(clickCount);
      Assign(f, FILENAME);
      Rewrite(f);
      WriteLn(f, clickCount);
      Close(f);

      WriteStr(countstr, 'Klicks: ', clickCount);
      response := MHD_create_response_from_buffer(Length(countstr), PChar(countstr), MHD_RESPMEM_MUST_COPY);
      MHD_add_response_header(response, 'Content-Type', 'text/plain');
      WriteLn('Zähler um eins erhöht (',clickCount,')');
    end else begin
      WriteStr(html,
        '<html><body>' +
        '<h1>Klick-Zähler</h1>' +
        '<button onclick="handleClick()">Klick mich!</button>' +
        '<p id="count">Klicks: ', clickCount, '</p>' +
        '<script>' +
        'function handleClick() {' +
        '  fetch(''/click'')' +
        '    .then(response => response.text())' +
        '    .then(data => document.getElementById(''count'').textContent = data);' +
        '}' +
        '</script>' +
        '</body></html>');

      response := MHD_create_response_from_buffer(Length(html), PChar(html), MHD_RESPMEM_MUST_COPY);
      MHD_add_response_header(response, 'Content-Type', 'text/html; charset=utf-8');
      WriteLn('Response erzeugt');
    end;

    ret := MHD_queue_response(connection, MHD_HTTP_OK, response);
    MHD_destroy_response(response);

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
      ReadLn(f, clickCount);
      Close(f);
    end;

    daemon := MHD_start_daemon(MHD_USE_THREAD_PER_CONNECTION, PORT, nil, nil, @answer_to_connection, nil, MHD_OPTION_END);
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
