program project1;

uses
  ctypes,
  fp_glib2;

  function main(argc: cint; argv: PPChar): cint;
  const
    pattern: Pgchar = '(\d+)[a-z]+';
    subject: Pgchar = '123abc 456de  123blubluf';
  var
    err: PGError = nil;
    regex: PGRegex;
    match_info: PGMatchInfo = nil;
    start_pos, end_pos: Tgint;
    match_count: integer = 0;
  begin
    regex := g_regex_new(pattern, 0, 0, @err);
    if regex = nil then begin
      g_print('Regex-Fehler'#10, err^.message);
      g_error_free(err);
      Exit(1);
    end;

    g_regex_match(regex, subject, 0, @match_info);

    while g_match_info_matches(match_info) do begin
      if g_match_info_fetch_pos(match_info, 1, @start_pos, @end_pos) then begin
        g_print('Gefundene Ziffern: "%.*s" an Position %d bis %d'#10,
          end_pos - start_pos, subject + start_pos, start_pos, end_pos);
        Inc(match_count);
      end;
      g_match_info_next(match_info, nil);
    end;

    if match_count = 0 then begin
      g_print('Keine passenden Ziffern gefunden.'#10);
    end;

    g_match_info_free(match_info);
    g_regex_unref(regex);
    Exit(0);
  end;

begin
  main(argc, argv);
end.
