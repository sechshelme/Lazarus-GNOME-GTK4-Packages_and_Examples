program project1;
uses
curl,
curlver,
easy,
header,     // ????
mprintf,
multi,
options,  // ????
//stdcheaders,
//system_,
urlapi,
websockets,





fp_curl;

procedure main
begin
  curl_ := curl_easy_init;
  if(curl) {
      curl_easy_setopt(curl, CURLOPT_URL, "https://example.com/");
      CURLcode res = curl_easy_perform(curl);
      if(res != CURLE_OK)
          fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
      curl_easy_cleanup(curl);
  }
end;
begin
    main;
end.

