program project1;

uses
  fp_curl;

  procedure main;
  var
    data: Pcurl_version_info_data;
    proto: PPChar;
  begin
    data := curl_version_info(CURLVERSION_NOW);

    Writeln('age:              ', data^.age);
    Writeln('version:          ', data^.version);
    Writeln('version_num:      ', data^.version_num);
    Writeln('host:             ', data^.host);
    Writeln('features:         ', data^.features);
    Writeln('ssl_version:      ', data^.ssl_version);
    Writeln('ssl_version_num:  ', data^.ssl_version_num);
    Writeln('libz_version:     ', data^.libz_version);
    Writeln('ares:             ', data^.ares);
    Writeln('ares_num:         ', data^.ares_num);
    Writeln('libidn:           ', data^.libidn);
    Writeln('iconv_ver_num:    ', data^.iconv_ver_num);
    Writeln('libssh_version:   ', data^.libssh_version);
    Writeln('brotli_ver_num:   ', data^.brotli_ver_num);
    Writeln('brotli_version:   ', data^.brotli_version);
    WriteLn();
    WriteLn('Unterstützte Protokolle:');
    proto := data^.protocols;
    while proto^ <> nil do begin
      WriteLn('  ', proto^);
      Inc(proto);
    end;
    WriteLn();
    WriteLn('Features Name:');
    proto := data^.feature_names;
    while proto^ <> nil do begin
      WriteLn('  ', proto^);
      Inc(proto);
    end;
  end;

begin
  main;
end.
