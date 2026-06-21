program project1;

uses
  fp_histedit;

  {$IFDEF linux}
var
  stdin: PFILE; cvar; external 'c';
  stdout: PFILE; cvar; external 'c';
  stderr: PFILE; cvar; external 'c';
  {$ENDIF}


  function colored_prompt(el: PEditLine): PChar; cdecl;
  begin
    Result := #1 + #27 + '[1;32m' + #1 + 'INPUT>' + #1 + #27 + '[0m'#1' ';
  end;

  procedure main;
  var
    el: PEditLine;
    his: PHistory;
    ev: THistEvent;
    chars: pchar;
    n_chars, status: longint;
    quit: boolean = False;
  begin
    el := el_init(argv[0], stdin, stdout, stderr);
    his := history_init();

    history(his, @ev, H_SETSIZE, 100);
    history(his, @ev, H_ENTER, 'eins');
    history(his, @ev, H_ENTER, 'zwei');
    history(his, @ev, H_ENTER, 'drei');

    el_set(el, EL_HIST, @history, his);
    el_set(el, EL_EDITOR, 'emacs');
    el_set(el, EL_PROMPT_ESC, @colored_prompt, #1);

    WriteLn('Willkommen! Tippe "exit" zum Beenden. Nutze die Pfeiltasten für den Verlauf.');

    while not quit do begin
      chars := el_gets(el, @n_chars);
      chars[n_chars - 1] := #0;

      if n_chars > 0 then begin
        case string(chars) of
          'exit', 'quit': begin
            quit := True;
          end;
          else begin
            history(his, @ev, H_ENTER, chars);
          end;
        end;
        WriteLn('Du hast eingegeben: ', chars);
      end;
    end;

    WriteLn(#10'--- Gespeicherte History ---');
    status := history(his, @ev, H_FIRST);
    while status = 0 do begin
      WriteLn(ev.str);
      status := history(his, @ev, H_NEXT);
    end;

    history_end(his);
    el_end(el);

    WriteLn('End');
  end;

begin
  main;
end.
