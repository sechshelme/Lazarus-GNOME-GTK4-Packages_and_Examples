program project1;

uses
  SysUtils,
  fp_aspell;


  procedure checklanguage;
  var
    config: PAspellConfig;
    dict_list: PAspellDictInfoList;
    dicts: PAspellDictInfoEnumeration;
    entry: PAspellDictInfo;
  begin
    config := new_aspell_config;

    dict_list := get_aspell_dict_info_list(config);
    dicts := aspell_dict_info_list_elements(dict_list);

    WriteLn('Verfügbare Sprachen:');

    repeat
      entry := aspell_dict_info_enumeration_next(dicts);
      if entry <> nil then  begin
        WriteLn('- ', entry^.name, ' (Code: ', entry^.code, ')');
      end;
    until entry = nil;
    // Aufräumen nicht vergessen
    delete_aspell_dict_info_enumeration(dicts);
    delete_aspell_config(config);
  end;

  procedure main;
  var
    spell_config: PAspellConfig;
    possible_err: PAspellCanHaveError;
    speller: PAspellSpeller;
    worts: TAnsiStringArray;
    korrekt: longint;
    i: integer;
    suggestions: PAspellWordList;
    wort: pchar;
    elements: PAspellStringEnumeration;
    vorschlag: pchar;

  const
    satz: string = 'Ich habe Programmmieren falsch geschrieben';

  begin
    checklanguage;

    spell_config := new_aspell_config;
    aspell_config_replace(spell_config, 'language-tag', 'de_DE');

    possible_err := new_aspell_speller(spell_config);
    if aspell_error_number(possible_err) <> 0 then begin
      WriteLn('Fehler: %s', aspell_error_message(possible_err));
      Exit;;
    end;

    speller := to_aspell_speller(possible_err);


    worts := satz.Split(' ');

    for i := 0 to Length(worts) - 1 do begin
      wort := pchar(worts[i]);
      korrekt := aspell_speller_check(speller, wort, -1);
      WriteLn('Wort:  ', wort, '  ', korrekt);
      WriteLn;

      if korrekt = 0 then begin
        suggestions := aspell_speller_suggest(speller, wort, -1);
        elements := aspell_word_list_elements(suggestions);

        WriteLn('  -> Vorschläge: ');

        vorschlag := aspell_string_enumeration_next(elements);
        while vorschlag <> nil do begin
          Write(vorschlag);
          Write('  ');
          vorschlag := aspell_string_enumeration_next(elements);
        end;
        WriteLn;

        delete_aspell_string_enumeration(elements);
      end;
    end;

    delete_aspell_speller(speller);
    delete_aspell_config(spell_config);
  end;

begin
  main;
end.
