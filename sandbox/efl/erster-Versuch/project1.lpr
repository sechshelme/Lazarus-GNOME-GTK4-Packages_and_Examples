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
  fp_edje,

  // =======================================


  // =======================================


  // elementary-1
  elm_genlist,                                         // io. ( Evtl. löschen )
  elm_general,                                         // io.     ( makro ELM_MAIN entfernt )
  elm_win_legacy,                                      // io.     ( Doppelt Methoden evtl. Bug in C-Hedader )
  elm_box_legacy,                                      // io.
  elm_box_eo_legacy,                                   // io.
  elm_button_legacy,                                   // io.
  elm_entry_common,                                    // io. -> elm_general
  elm_entry_eo_legacy,                                 // io. -> elm_general, elm_entry_common
  elm_entry_legacy,                                    // io. -> elm_general
  elm_object,                                          // io. -> elm_general
  elm_config,                                          // io. -> elm_general
  elm_scroller_legacy,                                 // io.
  elm_map_common,                                      // io.
  elm_tooltip,                                         // io.
  elm_widget_item_eo_legacy,                           // io. -> elm_general, elm_tooltip
  elm_object_item,                                     // io. -> elm_widget_item_eo_legacy
  elm_access,                                          // io. -> elm_object_item, elm_widget_item_eo_legacy
  elm_entry_eo,                                        // io. -> elm_general, elm_entry_common
  elm_pan_eo_legacy,                                   // io.
  elm_interface_scrollable,                            // io. -> elm_scroller_legacy, elm_pan_eo_legacy
  elm_interface_scrollable_eo,                         // io. -> elm_interface_scrollable
  elm_transit,                                         // io.
  elm_theme,                                           // io.
  elm_gen,                                             // io. -> elm_general
  elm_genlist_eo_legacy,                               // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  elm_layout_legacy,                                   // io.
  elm_cnp,                                             // io. -> elm_widget_item_eo_legacy
  elm_code_common,                                     // io.
  elm_code_line,                                       // io. -> elm_code_common
  elm_code_widget_eo,                                  // io. -> elm_code_common, elm_code_line
  elm_gengrid_eo_legacy,                               // io. -> elm_general, elm_widget_item_eo_legacy, elm_gen
  elm_list_eo_legacy,                                  // io. -> elm_general, elm_widget_item_eo_legacy
  efl_ui_textpath_eo_legacy,                           // io.
  efl_ui_win_eo,                                       // io.
  efl_ui_eot,                                          // io.
  efl_ui_focus_object_eo,                              // io.
  efl_ui_widget_eo,                                    // io. -> efl_ui_focus_object_eo, efl_ui_eot
  efl_ui_widget_eo_legacy,                             // io. -> efl_ui_focus_object_eo
  efl_access_object_eo,                                // io.







  elm_widget,                                          // io. -> elm_widget_item_eo_legacy, elm_theme, efl_ui_widget_eo_legacy, efl_ui_focus_object_eo, elm_access, efl_ui_eot
  elm_deprecated,                                      // io. -> elm_general, elm_scroller_legacy, elm_map_common, elm_win_legacy, efl_ui_textpath_eo_legacy, elm_widget_item_eo_legacy
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
