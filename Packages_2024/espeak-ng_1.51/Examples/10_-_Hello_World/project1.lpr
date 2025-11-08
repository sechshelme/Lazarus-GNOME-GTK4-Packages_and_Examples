program project1;

uses
  fp_espeak_ng;

  procedure main;
  const
    text = 'Hallo, ich gebe ein Hello World über espeak-ng aus.';
  begin
    if espeak_Initialize(AUDIO_OUTPUT_PLAYBACK, 0, nil, 0) = -1 then begin
      WriteLn('Fehler bei der Initialisierung von eSpeak');
      Exit;
    end;

    WriteLn('Folgender Text wird ausgegeben:'#10, '  ', text);

    espeak_SetVoiceByName('de');
    espeak_Synth(pchar(text), Length(text) + 1, 0, POS_CHARACTER, 0, espeakCHARS_AUTO, nil, nil);
    espeak_Synchronize;
    espeak_Terminate;
  end;

begin
  main;
end.
