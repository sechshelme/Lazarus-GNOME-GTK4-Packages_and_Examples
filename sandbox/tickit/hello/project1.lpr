program project1;

uses
  stdio,
  tickit,
  tickit_evloop,
  tickit_mockterm,
  tickit_termdrv;


  function on_key(tt: PTickitTerm; flags: TTickitEventFlags; info: pointer; user: pointer): longint; cdecl;
  var
    key: PTickitKeyEventInfo;
  begin
    key := info;

    if key^.str <> nil then begin
      tickit_term_printf(tt, 'Key: %d'#10, key^.str[0]);
      tickit_term_printf(tt, 'Str: %s'#10, key^.str);
      if key^.str[0] = #27 then begin
        Exit(1);
      end;
    end;

    tickit_term_print(tt, 'press'#10);
    tickit_term_flush(tt);
    Result := 0;
  end;

  function on_Mouse(tt: PTickitTerm; flags: TTickitEventFlags; info: pointer;
    user: pointer): longint; cdecl;
  begin
    tickit_term_print(tt, '-- Mouse'#10);
    tickit_term_flush(tt);
  end;

  procedure main;
  var
    t: PTickit;
    Lines, cols, row: longint;
    msglen, col: SizeInt;
    term: PTickitTerm;
  const
    msg = 'Hallo, libtickit!'#10;
  begin
    t := tickit_new_stdio;
    term := tickit_get_term(t);

    // Terminalgröße abfragen
    tickit_term_get_size(tickit_get_term(t), @Lines, @cols);

    // Text und Position berechnen
    msglen := Length(msg);
    row := Lines div 2;
    col := (cols - msglen) div 2;

    // Text ausgeben
    tickit_term_goto(term, row, col);
    tickit_term_print(term, msg);

    tickit_term_flush(term);

    tickit_term_bind_event(term, TICKIT_TERM_ON_KEY, 0, @on_key, term);
    tickit_term_bind_event(term, TICKIT_TERM_ON_MOUSE, 0, @on_Mouse, term);

    tickit_run(t);


    // Aufräumen
    tickit_unref(t);
  end;


begin
  main;
end.
