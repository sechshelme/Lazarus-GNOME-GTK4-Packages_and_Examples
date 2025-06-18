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
  fp_ethumb,
  fp_ecore,
  fp_ecore_evas,
  fp_ecore_con,
  fp_ecore_file,
  fp_edje,
  fp_eet,
  fp_eldbus,
  fp_elementary,
  fp_efreet,
  fp_ecore_ipc,
  fp_emotion,
  fp_eio,
  fp_eeze,
  fp_eolian,
  fp_ecore_audio,
  fp_ecore_x,
  fp_efl_canvas_wl,
  fp_ecore_drm2,
  fp_ecore_fb,

  fp_ecore_imf,
  fp_ecore_imf_evas,
  fp_ecore_input,
  fp_ecore_input_evas,
  fp_ecore_wl2,
  fp_elput,
  fp_embryo,
  fp_ethumb_client,


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
  eina_inline_ustringshare,            // io.
  eina_inline_value,
  eina_inline_value_util,
  eina_inline_log,                     // io.
  eina_inline_tiler,                   // io.
  eina_inline_clist,                   // io.
  eina_inline_crc,                     // io.
  eina_inline_hash,                    // io -> eina_inline_crc
  eina_inline_cpu,                     // io.
  eina_inline_f32p32,                  // io.
  eina_inline_fp,                      // io.
  eina_inline_array,                   // io.
  eina_inline_range,                   // io.  min / max !
  eina_inline_unicode,                 // io.
  eina_inline_f8p24,                   // io.
  eina_inline_f16p16,                  // io.
  eina_inline_modinfo,                 // io.
  eina_inline_file,                    // io.
  eina_inline_inlist,                  // io.
//  eina_inline_rbtree,                  // Fehlerhaft
  eina_inline_trash,                   // io.
  eina_inline_util;                    // io.



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
    res_int8: int8;
    res_int64: int64;
    res_Float: single;
    res_Double: double;
    res_Str: pchar;
    val: TEina_Value;
    i: integer;
  begin
    // pset
    value := eina_value_new(EINA_VALUE_TYPE_INT);
    i := 123456;
    eina_value_pset(value, @i);
    i := 0;

    eina_value_get(value, @i);
    printf('pset: %d'#10, i);
    eina_value_free(value);

    // Int8
    value := eina_value_new(EINA_VALUE_TYPE_UCHAR);
    eina_value_set(value, 256 + 12);

    eina_value_get(value, @res_int8);
    printf('Int8: %d'#10, res_int8);
    eina_value_free(value);

    // Int64
    value := eina_value_new(EINA_VALUE_TYPE_INT);
    eina_value_set(value, 1234);

    eina_value_get(value, @res_int64);
    printf('Int64: %d'#10, res_int64);
    eina_value_free(value);

    // Double
    value := eina_value_new(EINA_VALUE_TYPE_DOUBLE);
    eina_value_set(value, 12.34);

    eina_value_get(value, @res_Double);
    printf('Double: %f'#10, res_Double);
    eina_value_free(value);

    // Float
    value := eina_value_new(EINA_VALUE_TYPE_FLOAT);
    eina_value_set(value, single(43.21));

    eina_value_get(value, @res_Float);
    printf('Float:  %f'#10, res_Float);
    eina_value_free(value);

    // PChar
    value := eina_value_new(EINA_VALUE_TYPE_STRING);
    eina_value_set(value, 'Hello World');

    eina_value_get(value, @res_Str);
    printf('PChar:              %s'#10, res_Str);
    eina_value_free(value);

    // PCharwith Pointer
    value := eina_value_new(EINA_VALUE_TYPE_STRING);
    eina_value_pset(value, pchar('Hello PChar'));

    eina_value_get(value, @res_Str);
    printf('PChar with Pointer: %s'#10, res_Str);
    eina_value_free(value);

    // Value Setup
    eina_value_setup(@val, EINA_VALUE_TYPE_STRING);
    eina_value_set(@val, 'eina_value_setup');

    eina_value_get(@val, @res_Str);
    printf('Not Value Ptr:      %s'#10, res_Str);
    eina_value_flush(@val);
  end;

  procedure ValueIntArrayTest;
  var
    i: integer;
    value: TEina_Value;

    valsrc: integer;
    len: cardinal;
    v: integer;
  begin
    printf('--- Int Array ---'#10);
    if not eina_value_array_setup(@value, EINA_VALUE_TYPE_INT, 16) then begin
      printf('Array Fehler'#10);
    end;

    for i := 0 to 8 do begin
      valsrc := i * 111;
      eina_value_array_pappend(@value, @valsrc);
    end;

    valsrc := 200;
    eina_value_array_pinsert(@value, 1, @valsrc);


    len := eina_value_array_count(@value);
    printf('Array Count: %d'#10, len);

    for i := 0 to len - 1 do begin
      eina_value_array_get(@value, i, @v);
      printf('  %d. %d'#10, i, v);
    end;
  end;

  procedure ValueSingleArrayTest;
  var
    i: integer;
    f: single;
    value: TEina_Value;

    len: cardinal;
    v: single;
  begin
    printf('--- Single Array ---'#10);
    if not eina_value_array_setup(@value, EINA_VALUE_TYPE_FLOAT, 16) then begin
      printf('Array Fehler'#10);
    end;

    for i := 0 to 7 do begin
      f := i * 11.11;
      eina_value_array_append(@value, f);
    end;

    f := 12.34;
    eina_value_array_insert(@value, 1, f);

    len := eina_value_array_count(@value);
    printf('Array Count: %d'#10, len);

    for i := 0 to len - 1 do begin
      eina_value_array_get(@value, i, @v);
      printf('  %d. %f'#10, i, v);
    end;
  end;

  procedure ValueDoubleArrayTest;
  var
    i: integer;
    value: TEina_Value;

    len: cardinal;
    v: double;
  begin
    printf('--- Double Array ---'#10);
    if not eina_value_array_setup(@value, EINA_VALUE_TYPE_DOUBLE, 16) then begin
      printf('Array Fehler'#10);
    end;

    for i := 0 to 7 do begin
      eina_value_array_append(@value, i * 11.11);
    end;

    eina_value_array_insert(@value, 1, 12.34);
    eina_value_array_insert(@value, 2, 123.234);

    len := eina_value_array_count(@value);
    printf('Array Count: %d'#10, len);

    for i := 0 to len - 1 do begin
      eina_value_array_get(@value, i, @v);
      printf('  %d. %f'#10, i, v);
    end;
  end;

  procedure ValueListTest;
  var
    list: TEina_Value;
    val, i: integer;
    len: cardinal;
  begin
    printf('--- Value List ---'#10);
    eina_value_list_setup(@list, EINA_VALUE_TYPE_INT);

    val := 10;
    eina_value_list_pappend(@list, @val);
    val := 20;
    eina_value_list_pappend(@list, @val);
    val := 30;
    eina_value_list_pappend(@list, @val);

    eina_value_list_set(@list, 1, Pointer(13));
    eina_value_list_insert(@list,2, 2);
    eina_value_list_insert(@list,1, 1);

    eina_value_list_append(@list, 40);
    eina_value_list_append(@list, 50);

    len := eina_value_list_count(@list);
    printf('List Count: %d'#10, len);

    val := 0;
    for i := 0 to len - 1 do begin

      eina_value_list_get(@list, i, @val);
      printf('  %d. %d'#10, i, val);
    end;
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    box, win, btn1, btn2, entry: PEvas_Object;
  begin
    eina_init();
    elm_init(argc, argv);

    ValueTest;
    printf(#10);
    ValueIntArrayTest;
    printf(#10);
    ValueSingleArrayTest;
    printf(#10);
    ValueDoubleArrayTest;
    printf(#10);
    ValueListTest;
    printf(#10);

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
  //  eina_lock_new(nil);
  ethumb_client_init;
  embryo_init;
  elput_init;
  ecore_wl2_init;
  ecore_event_evas_init;
  ecore_event_init;
  ecore_imf_evas_event_mouse_in_wrap(nil, nil);
  ecore_imf_init;

  ecore_drm2_init;
  ecore_x_init(nil);
  ecore_fb_init(nil);
  eolian_init;
  eeze_init;

  eio_init;
  emotion_init;
  efreet_init;
  ecore_con_init;
  eldbus_message_unref(nil);
  main(argc, argv);
end.
