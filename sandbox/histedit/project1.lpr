program project1;

uses
  fp_histedit;

  function mein_prompt(el: PEditLine): pchar; cdecl;
  begin
    Result := 'mein terminal> ';
  end;

  procedure main;
  var
    el: PEditLine;
    mein_verlauf: PHistory;
    ev: THistEvent;
    eingabe: pchar;
    zeichen_gelesen: longint;
    quit: boolean = False;
  begin
    el := el_init(argv[0], stdin, stdout, stderr);
    mein_verlauf := history_init();

    history(mein_verlauf, @ev, H_SETSIZE, 100);

    el_set(el, EL_PROMPT, @mein_prompt);
    el_set(el, EL_HIST, @history, mein_verlauf);
    el_set(el, EL_EDITOR, 'emacs');

    WriteLn('Willkommen! Tippe "exit" zum Beenden. Nutze die Pfeiltasten für den Verlauf.');

    while not quit do begin
      eingabe := el_gets(el, @zeichen_gelesen);

      if zeichen_gelesen > 0 then begin
        case string(eingabe) of
          'exit'#10: begin
            quit := True;
          end;
          else begin
            history(mein_verlauf, @ev, H_ENTER, pchar(eingabe));
          end;
        end;
        WriteLn('Du hast eingegeben: ', eingabe);
      end;
    end;

    history_end(mein_verlauf);
    el_end(el);

    WriteLn('Tschüss!');
  end;

begin
  main;
end.
