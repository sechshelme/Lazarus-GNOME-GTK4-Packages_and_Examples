program project1;

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
  fp_elementary;

  procedure btn_toggle_cb(data: pointer; obj: PEvas_Object; event_info: pointer); cdecl;
  var
    rect: PEvas_Object absolute data;
  const
    rect_visible: boolean = True;
  begin
    if rect_visible then begin
      evas_object_hide(rect);
    end else begin
      evas_object_show(rect);
    end;
    rect_visible := not rect_visible;
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    win, rect, btn: PEvas_Object;
  begin
    elm_init(argc, argv);

    elm_policy_set(ELM_POLICY_QUIT, ELM_POLICY_QUIT_LAST_WINDOW_CLOSED);

    win := elm_win_util_standard_add('main', 'Rectangles');
    elm_win_autodel_set(win, EINA_TRUE);
    evas_object_resize(win, 640, 480);
    evas_object_show(win);

    // Rechteck
    rect := evas_object_rectangle_add(evas_object_evas_get(win));
    evas_object_color_set(rect, $FF, $FF, $7F, $FF);
    evas_object_move(rect, 50, 50);
    evas_object_resize(rect, 150, 150);
    evas_object_show(rect);

    // Button
    btn := elm_button_add(win);
    elm_object_text_set(btn, 'Rechteck ausblenden');
    evas_object_move(btn, 50, 200);
    evas_object_resize(btn, 200, 50);
    evas_object_show(btn);

    evas_object_smart_callback_add(btn, 'clicked', @btn_toggle_cb, rect);

    elm_run;
    elm_shutdown;

    Result := 0;
  end;

begin
  main(argc, argv);
end.
