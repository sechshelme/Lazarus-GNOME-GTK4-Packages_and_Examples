program project1;

uses
  fp_espeak_ng;

  function synthCallback(wav: PInt16; numsamples: longint; event: Pespeak_EVENT): integer; cdecl;
  begin
    while event^._type <> espeakEVENT_LIST_TERMINATED do begin
      case event^._type of
        espeakEVENT_SENTENCE: begin
          WriteLn('Spachausgabe beendet');
        end;
      end;

      WriteLn(event^._type);
      Inc(event);
    end;
    exit(0);
  end;

  procedure main;
  const
    text: array of pchar = (
      'Hallo Welt',
      'Dies ist der zweite Text',
      'Und hier kommt der dritte Text');
  var
    Quit: boolean = False;
    ch: byte;
    s: pchar;
  begin
    if espeak_Initialize(AUDIO_OUTPUT_PLAYBACK, 1000, nil, AUDIO_OUTPUT_PLAYBACK) = -1 then begin
      WriteLn('Fehler bei der Initialisierung von eSpeak');
      Exit;
    end;
    espeak_SetSynthCallback(@synthCallback);
    espeak_SetVoiceByName('de');

    repeat
      WriteLn('Wähle eine Option:');
      WriteLn('  1.', text[0]);
      WriteLn('  2.', text[1]);
      WriteLn('  3.', text[2]);
      WriteLn('  4.', 'Ende');
      ReadLn(ch);
      case ch of
        1..3: begin
          s := text[ch - 1];
          espeak_Synth(s, Length(s) + 1, 0, POS_CHARACTER, 0, espeakCHARS_AUTO, nil, nil);
        end;
        4: begin
          Quit := True;
        end;
      end;
    until Quit;

    espeak_Terminate;
  end;

begin
  main;
end.
