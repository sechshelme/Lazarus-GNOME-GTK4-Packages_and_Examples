program project1;

{$I-}

uses
  fp_microhttpd;

  // http://localhost:8080

const
  BUTTON_COUNT = 8;
  PORT = 8080;
  FILENAME = 'clickCount.txt';

var
  clickCount: array [0..BUTTON_COUNT - 1] of integer;
  clickCount2: integer = 0;

  function answer_to_connection(cls: pointer; connection: PMHD_Connection; url: pchar; method: pchar; version: pchar; upload_data: pchar; upload_data_size: Psize_t; req_cls: Ppointer): TMHD_Result; cdecl;
  var
    f: Text;
    cc, s, html: string;
    response: PMHD_Response;
    ret: TMHD_Result;
    i: integer;
  begin
    if string(method) = 'POST' then  begin
      WriteLn('POST');

      for i := 0 to BUTTON_COUNT - 1 do begin
        str(i, s);
        if string(url) = '/click' + s then begin
          Inc(clickCount[i]);
          str(clickCount[i], cc);
          WriteLn('Zähler ' + s + ' um eins erhöht (', clickCount[i], ')');
          Break;
        end;
      end;

      Assign(f, FILENAME);
      Rewrite(f);
      for i := 0 to BUTTON_COUNT - 1 do begin
        WriteLn(f, clickCount[i]);
      end;
      Close(f);

      response := MHD_create_response_from_buffer(0, nil, MHD_RESPMEM_MUST_COPY);
      MHD_add_response_header(response, 'Location', '/');
      ret := MHD_queue_response(connection, MHD_HTTP_SEE_OTHER, response);
      MHD_destroy_response(response);
    end else begin
      html := '<html><body>' + '<h1>Klick-Zähler</h1>';
      for i := 0 to BUTTON_COUNT - 1 do begin
        str(i, s);
        str(clickCount[i], cc);
        html := html + '<form action="/click' + s + '" method="post">' +
          '<input type="submit" value="Button ' + s + '"> ' + '<span>Klicks: ' + cc + '</span>' +
          '</form>';
      end;
      html := html + '</body></html>';

      response := MHD_create_response_from_buffer(Length(html), PChar(html), MHD_RESPMEM_MUST_COPY);
      MHD_add_response_header(response, 'Content-Type', 'text/html; charset=utf-8');
      ret := MHD_queue_response(connection, MHD_HTTP_OK, response);
      MHD_destroy_response(response);
    end;

    Result := ret;
  end;


  procedure main;
  var
    f: Text;
    daemon: PMHD_Daemon;
    i: integer;
  begin
    Assign(f, FILENAME);
    Reset(f);
    if IOResult <> 0 then begin
      WriteLn('Datei: ', FILENAME, ' wird erzeugt.');
    end else begin
      for i := 0 to BUTTON_COUNT - 1 do begin
        ReadLn(f, clickCount[i]);
      end;
      Close(f);
    end;

    daemon := MHD_start_daemon(MHD_USE_AUTO or MHD_USE_INTERNAL_POLLING_THREAD, PORT, nil, nil, @answer_to_connection, nil, MHD_OPTION_END);
    if daemon = nil then begin
      WriteLn('daemon Fehler !');
      Exit;
    end;

    WriteLn('Server läuft auf http://localhost:', PORT);
    WriteLn('<ENTER>= Abbruch');
    ReadLn;

    MHD_stop_daemon(daemon);
  end;

begin
  main;
end.
