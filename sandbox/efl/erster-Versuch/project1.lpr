program project1;

//{$define EFL_BETA_API_SUPPORT}


// pcregrep -Mn 'static inline.*\n(.+\n)?\s*{' *.h
// pcregrep -Mn 'static inline.*\n(.+\n){0,2}\s*{' *.h  ??????????
// https://www.perplexity.ai/search/ich-will-die-mit-grep-dateien-aw7Pr2mpROKi9qznTFxhUQ
// rename 's/\.eo/_eo/' *.h

// array of const !!

// Bei eina *.x behandeln


uses
  efl,
  fp_eina,
  fp_efl,
  fp_eo,
  fp_emile,
  fp_ecore,
  fp_evas,
  fp_ecore_evas,

  // =======================================

  Edje,                                       // io.
  Edje_Eo,                                    // io.                    ( Evtl. löschen )
  Edje_Common,                                // io.                    ( Macros entfernt )
  Edje_Legacy,                                // io. -> Edje_Common
  Edje_Edit,                                  // io. -> Edje_Legacy, Edje_Common
  Efl_Layout,                                 // io.                    ( Evtl. löschen )
  efl_canvas_layout_eo,                       // io.
  efl_canvas_layout_eo_legacy,                // io.
  efl_canvas_layout_part_eo,                  // io.
  efl_canvas_layout_part_external_eo,         // io.
  efl_canvas_layout_part_text_eo,             // io.
  efl_canvas_layout_part_box_eo,              // io.
  efl_canvas_layout_part_invalid_eo,          // io.
  efl_canvas_layout_part_swallow_eo,          // io.
  efl_canvas_layout_part_table_eo,            // io.
  efl_canvas_layout_types_eot,                // io.
  efl_canvas_layout_part_type_provider_eo,    // io. -> efl_canvas_layout_types_eot
  efl_layout_calc_eo,                         // io.
  efl_layout_group_eo,                        // io.
  efl_layout_signal_eo,                       // io.
  efl_layout_group_eo_legacy,                 // io.
  edje_edit_eo,                               // io.
  edje_edit_eo_legacy,                        // io.

  // =======================================


  // elementary-1
  elm_general,                                         // io.     ( makro ELM_MAIN entfernt )
  elm_win_legacy,                                      // io.     ( Doppelt Methoden evtl. Bug in C-Hedader )
  elm_box_legacy,                                      // io.
  elm_box_eo_legacy,                                   // io.
  elm_button_legacy,                                   // io.
  elm_entry_common,                                    // io. -> elm_general
  elm_entry_eo_legacy,                                 // io. -> elm_general, elm_entry_common
  elm_entry_legacy,                                    // io. -> elm_general
  elm_object,                                          // io. -> elm_general


  Math;

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

  function main(argc: integer; argv: PPChar): integer;
  var
    box, win, btn1, btn2, entry: PEvas_Object;
  begin
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
    btn1 := elm_button_add(win);
    elm_object_text_set(btn1, 'Klick mich!');
    evas_object_smart_callback_add(btn1, 'clicked', @on_button_click, nil);
    evas_object_size_hint_weight_set(btn1, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn1);
    evas_object_show(btn1);

    // Zweiter Button (Beenden)
    btn2 := elm_button_add(win);
    elm_object_text_set(btn2, 'Beenden');
    evas_object_smart_callback_add(btn2, 'clicked', @on_exit_button_click, nil);
    evas_object_size_hint_weight_set(btn2, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn2);
    evas_object_show(btn2);

    // Entry (Textfeld) hinzufügen
    entry := elm_entry_add(win);
    elm_entry_single_line_set(entry, EINA_TRUE); // Einzelne Zeile
    elm_object_text_set(entry, 'Hier Text eingeben...');
    evas_object_size_hint_weight_set(entry, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(entry, EVAS_HINT_FILL, 0.0);
    elm_box_pack_end(box, entry);
    evas_object_show(entry);


    evas_object_resize(win, 240, 120);
    evas_object_show(win);

    elm_run;
    elm_shutdown;

    Result := 0;
  end;

begin
  main(argc, argv);
end.
