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
  fp_emile,
  fp_evas,
  fp_ecore,
  fp_ethumb,
  fp_ecore_evas,
  fp_edje,
  fp_ecore_file,
  fp_eet,
  fp_elementary,

  // =======================================


  eina_inline_rectangle,               // io.
  eina_inline_vector,                  // io.
  eina_inline_stringshare,             // io.
  eina_inline_list,                    // io.
  eina_inline_str,                     // io.
  eina_inline_slice,                   // io.  -> eina_inline_str
  eina_inline_lock_posix,              //             ( Result falsch )
  eina_inline_lock_barrier,            // io. -> eina_inline_lock_posix
  eina_inline_mempool,                 // io.
  eina_inline_safepointer,             // io.
  eina_inline_value,
  eina_inline_value_util,
  eina_inline_log,                     // io.
  eina_inline_tiler,                   // io.
  eina_inline_clist,                   // io.
  eina_inline_crc,                     // io.
  eina_inline_hash,                    // io -> eina_inline_crc
  eina_inline_cpu,                     // io.
  eina_inline_f32p32,                  // io.
  eina_inline_ustringshare,            // io.
  eina_inline_fp,                      // io.
  eina_inline_array,                   // io.
  eina_inline_range,                   // io.  min / max !
  eina_inline_unicode,                 // io.
  eina_inline_f8p24,                   // io.
  eina_inline_f16p16,                  // io.
  eina_inline_modinfo,                 // io.
  eina_inline_file,                    // io.
  eina_inline_inlist,                  // io.
  eina_inline_rbtree,                  // io.
  eina_inline_trash,                   // io.
  eina_inline_util;                     // io.



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

procedure ValueTest;
var
  value: PEina_Value;
  res:Int64;
begin
  value:=eina_value_new(EINA_VALUE_TYPE_INT);
//  value^.value.ptr:=Pointer(1234);
  eina_value_set(value, Pointer( 42));

  WriteLn(3333333);
  eina_value_get(value, @Pointer( res));
  WriteLn(44444444444);
  printf('Der Wert ist: %d'#10, res);
  eina_value_free(value);
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    box, win, btn1, btn2, entry: PEvas_Object;
  begin
    elm_init(argc, argv);

    ValueTest;

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
