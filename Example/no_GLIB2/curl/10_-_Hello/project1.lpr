program project1;

uses
  fp_curl;

  procedure main;
  var
    curl: PCURL;
    res: TCURLcode;
  begin
    curl := curl_easy_init;
    if curl <> nil then begin
      curl_easy_setopt(curl, CURLOPT_URL, 'https://example.com/');
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
