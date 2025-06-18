program project1;

//{$define EFL_BETA_API_SUPPORT}


// pcregrep -Mn 'static inline.*\n(.+\n)?\s*{' *.h
// pcregrep -Mn 'static inline.*\n(.+\n){0,2}\s*{' *.h  ??????????
// https://www.perplexity.ai/search/ich-will-die-mit-grep-dateien-aw7Pr2mpROKi9qznTFxhUQ
// rename 's/\.eo/_eo/' *.h

// array of const !!


uses
  efl,
  fp_eina,
  fp_eo,
  fp_efl,
  fp_evas,
  fp_ecore,
  fp_ecore_evas,
  fp_elementary;




  procedure on_win_del(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  procedure on_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_object_text_set(obj, 'Geklickt !');
  end;

  procedure on_exit_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  function AddRadioButton(parent: PEvas_Object; text: pchar): PEvas_Object;
  const
    state: longint = 0;
    group_value: longint = 0;
    group: PEvas_Object = nil;
  begin
    Result := elm_radio_add(parent);
    elm_radio_state_value_set(Result, state);
    if group = nil then  begin
      elm_radio_value_pointer_set(Result, @group_value);
      group:=Result;
    end else begin
      elm_radio_group_add(Result, group);
    end;

    elm_object_text_set(Result, text);
    evas_object_size_hint_weight_set(Result, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(Result, EVAS_HINT_FILL, 0.5);
    evas_object_show(Result);
    elm_box_pack_end(parent, Result);

    inc(state);
  end;

  function createRadioBox(parent: PEvas_Object): PEvas_Object;
  const
    RadioText: array of pchar = ('Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag');
  var
    i: integer;
  begin
    Result := elm_box_add(parent);
    elm_win_resize_object_add(parent, Result);
    evas_object_size_hint_weight_set(Result, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    for i := 0 to Length(RadioText) - 1 do begin
      AddRadioButton(Result, RadioText[i]);
    end;
    elm_box_pack_end(parent, Result);
    evas_object_show(Result);
  end;


  function main(argc: integer; argv: PPChar): integer;
  var
    box, win, btn1, btn2, entry, radioBox: PEvas_Object;
  begin
    eina_init();
    elm_init(argc, argv);

    // Fenster erstellen
    win := elm_win_util_standard_add('EFL Beispiel', 'EFL Beispiel');
    elm_win_autodel_set(win, EINA_TRUE);

    // Callback für das Schließen des Fensters hinzufügen
    evas_object_smart_callback_add(win, 'delete,request', @on_win_del, nil);

    // Box als Container für die Buttons
    box := elm_box_add(win);
    evas_object_size_hint_weight_set(box, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    elm_win_resize_object_add(win, box);
    evas_object_show(box);

    // Erster Button
    btn1 := elm_button_add(box);
    elm_object_text_set(btn1, 'Klick mich!');
    evas_object_smart_callback_add(btn1, 'clicked', @on_button_click, nil);
    evas_object_size_hint_weight_set(btn1, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn1);
    evas_object_show(btn1);

    // Zweiter Button (Beenden)
    btn2 := elm_button_add(box);
    elm_object_text_set(btn2, 'Beenden');
    evas_object_smart_callback_add(btn2, 'clicked', @on_exit_button_click, nil);
    evas_object_size_hint_weight_set(btn2, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn2);
    evas_object_show(btn2);

    // Entry (Textfeld) hinzufügen
    entry := elm_entry_add(box);
    elm_entry_single_line_set(entry, EINA_TRUE); // Einzelne Zeile
    elm_object_text_set(entry, 'Hier Text eingeben...');
    evas_object_size_hint_weight_set(entry, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(entry, EVAS_HINT_FILL, 0.0);
    elm_box_pack_end(box, entry);
    evas_object_show(entry);

    radioBox := createRadioBox(box);


    evas_object_resize(win, 240, 120);
    evas_object_show(win);

    elm_run;
    elm_shutdown;

    Result := 0;
  end;

begin
  main(argc, argv);
end.
