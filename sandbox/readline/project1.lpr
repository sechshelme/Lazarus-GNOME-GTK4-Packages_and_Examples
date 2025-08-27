program project1;

uses
  fp_stdlib,
  fp_string,

  fp_readline;

  procedure PrintHistoryList;
  var
    entries: PPHIST_ENTRY;
    i: integer = 0;
  begin
    entries := history_list();
    if entries <> nil then begin
      WriteLn('Geladene History-Einträge:');

      while entries[i] <> nil do begin
        WriteLn(i: 5, '. ', entries[i]^.line);
        Inc(i);
      end;
    end;
  end;

  procedure main;
  var
    input_: pchar;
  begin
    using_history;
    rl_message('Hello %s'#10, 'World');

    WriteLn('History-Länge vor Laden: ', history_length);
    if read_history('history.txt') <> 0 then begin
      WriteLn('Warnung: Konnte "history.txt" nicht laden');
    end;

    PrintHistoryList;

    WriteLn('History-Länge nach Laden: ', history_length);

    repeat
      input_ := readline('Eingabe > ');
      if input_^ <> #0
      then begin
        add_history(input_);
      end;
      if strcmp(input_, 'quit') = 0 then begin
        free(input_);
        break;
      end;
    until input_ = nil;

    if write_history('history.txt') <> 0 then begin
      WriteLn('Fehler: Konnte "history.txt" nicht speichern');
    end;
  end;

begin
  main;
  writeln(rl_library_version);

end.
