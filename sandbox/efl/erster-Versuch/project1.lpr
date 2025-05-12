program project1;

//{$define EFL_BETA_API_SUPPORT}

uses
  elf,

  // evas/canvas
  efl_canvas_vg_node_eo_legacy,               // io.
  efl_canvas_vg_gradient_eo_legacy,           // io.
  efl_canvas_vg_container_eo_legacy,          // io. -> efl_canvas_vg_node_eo_legacy
  efl_canvas_vg_shape_eo_legacy,              // io. -> efl_canvas_vg_node_eo_legacy
  efl_canvas_vg_node_eo,                      // io.
  efl_canvas_vg_object_eo,                    // io. ->  efl_canvas_vg_node_eo
  efl_canvas_vg_shape_eo,                     // io. ->  efl_canvas_vg_node_eo
  // evas
  Evas_Loader,                                // io.
  Evas_Common,                                // io. -> Evas_Loader
  Evas_Legacy,                                // io. -> Evas_Common, Evas_Loader, efl_canvas_vg_container_eo_legacy, efl_canvas_vg_shape_eo_legacy, efl_canvas_vg_node_eo_legacy,efl_canvas_vg_gradient_eo_legacy;
  // evas/canvas
  evas_textblock_legacy,                      // io. -> Evas_Common
  evas_canvas_eo_legacy,                      // io. -> Evas_Common
  efl_canvas_vg_object_eo_legacy,             // io. -> Evas_Common, efl_canvas_vg_node_eo_legacy


  // elementary        -> Evas
  elm_general,                                // io.                                  ( makro ELM_MAIN entfernt )
  elm_win_legacy,                             // io. -> Evas_Common, Evas_Legacy      ( Doppelt Methoden evtl. Bug in C-Hedader )
  elm_box_legacy,                             // io.
  elm_box_eo_legacy,                          // io.
  elm_button_legacy,                          // io.
  elm_object,                                 // io. -> elm_general


  Math;

  procedure on_win_del(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  procedure on_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_object_text_set(obj, 'Geklickt!');
  end;

  procedure on_exit_button_click(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  begin
    elm_exit;
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    box, win, btn1, btn2: PEvas_Object;
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

    evas_object_resize(win, 240, 120);
    evas_object_show(win);

    elm_run();
    elm_shutdown();
  end;

begin
  evas_object_size_hint_fill_set:=nil;
  main(argc, argv);
end.
