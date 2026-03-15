program project1;

uses
  fp_thorvg_capi;

  procedure main;
  var
    canvas: TTvg_Canvas;
    buffer: array[0..100 * 100 - 1] of Tuint32_t;
    bg, rect: TTvg_Paint;
  var
    f: TextFile;
    i: integer;
    r, g, b: byte;

  begin
    tvg_engine_init(0);

    canvas := tvg_swcanvas_create(0);

    tvg_swcanvas_set_target(canvas, buffer, 100, 100, 100, TVG_COLORSPACE_ARGB8888);

    bg := tvg_shape_new;
    tvg_shape_append_rect(bg, 0, 0, 100, 100, 0, 0, True);
    tvg_shape_set_fill_color(bg, 0, 0, 255, 255);
    tvg_canvas_add(canvas, bg);

    rect := tvg_shape_new;
    tvg_shape_append_rect(rect, 10, 10, 80, 80, 0, 0, True);

    tvg_shape_set_fill_color(rect, 255, 0, 0, 255);

    tvg_shape_set_stroke_width(rect, 5.0);
    tvg_shape_set_stroke_color(rect, 255, 255, 0, 255);

    tvg_canvas_add(canvas, rect);

    tvg_canvas_draw(canvas, True);
    tvg_canvas_sync(canvas);

    // 7. Export als PPM-Bild (damit du das Ergebnis prüfen kannst)
    Assign(f, 'output.ppm');
    Rewrite(f);
    WriteLn(f, 'P6'#10'100 100'#10'255');
    for  i := 0 to 100 * 100 - 1 do begin
      r := (buffer[i] shr 16) and $ff;
      g := (buffer[i] shr 8) and $ff;
      b := (buffer[i]) and $ff;
      Write(f, char(r));
      Write(f, char(g));
      Write(f, char(b));
    end;
    Close(f);
    WriteLn('Erfolg! Bild gespeichert als ''output.ppm''.');


    //Tvg_Saver saver = tvg_saver_new();
    //
    //Tvg_Result result = tvg_saver_save_paint(saver, rect, "output.svg", 0);
    //
    //if (result == TVG_RESULT_SUCCESS) {
    //    tvg_saver_sync(saver);
    //    printf("Erfolg! output.svg wurde erstellt.\n");
    //} else {
    //    // Wenn hier 'Fehler: 7' (Unknown) oder '3' (Insufficient Condition) kommt
    //    printf("Fehler beim Speichern: %d\n", (int)result);
    //}
    //
    //tvg_saver_del(saver);




    // 8. Ressourcen freigeben
    tvg_canvas_destroy(canvas);
    tvg_engine_term();
  end;

begin
  main;
end.
