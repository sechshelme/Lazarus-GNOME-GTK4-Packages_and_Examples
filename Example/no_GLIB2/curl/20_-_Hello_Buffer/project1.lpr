program project1;

uses
  //  sysutils,
  fp_curl;

const
  //  link='https://www.perplexity.ai/search/greifne-dies-functione-dieses-PS.LGv1WTu6P2ULNKf9rNA';
  link = 'https://everything.curl.dev/project/etiquette.html';

  function WriteToGArray(contents: Pointer; size, nmemb: Tsize_t; userp: Pointer): Tsize_t; cdecl;
  const
    counter: integer = 0;
  var
    len: Tsize_t;
    b: pbyte absolute contents;
    i: integer;
  begin
    WriteLn('counter: ', counter);
    Inc(counter);

    WriteLn(pchar(userp));

    //    Sleep(1000);
    len := size * nmemb;
    for i := 0 to len - 1 do begin
      //      Write(char(b[i]));
    end;

    WriteLn(1);

    Result := size * nmemb;
  end;

  function progress_func(clientp: Pointer; dltotal, dlnow, ultotal, ulnow: Tcurl_off_t): integer;
  begin
    WriteLn(pchar(clientp));
    WriteLn('progresss     dltotal: ', dltotal, '   dlnow:', dlnow, '   ultotal: ', ultotal, '   ulnow;', ulnow);
    Result := 0;
  end;

  procedure main;
  var
    curl: PCURL;
    res: TCURLcode;
  begin
    curl := curl_easy_init;
    if curl <> nil then begin
      curl_easy_setopt(curl, CURLOPT_URL, link);
      curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, @WriteToGArray);
      curl_easy_setopt(curl, CURLOPT_BUFFERSIZE, 1024); // Extrem kleiner Buffer
      curl_easy_setopt(curl, CURLOPT_WRITEDATA, 'Write user_data');

      curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION, @progress_func);
      curl_easy_setopt(curl, CURLOPT_XFERINFODATA, 'XFER  user_data');
      curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);


      res := curl_easy_perform(curl);
      if res <> CURLE_OK then begin
        curl_mprintf('curl_easy_perform() failed: %s'#10, curl_easy_strerror(res));
      end;
      curl_easy_cleanup(curl);
    end;
  end;

begin
  main;
end.
