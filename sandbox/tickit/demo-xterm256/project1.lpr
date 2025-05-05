program project1;

uses
  //  stdio,
  fp_tickit,
  fp_tickit_evloop,
  fp_tickit_mockterm,
  fp_tickit_termdrv;

  function on_expose(win: PTickitWindow; flags: TTickitEventFlags; info_: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitExposeEventInfo absolute info_;
    rb: PTickitRenderBuffer;
    pen: PTickitPen;
    i, y, x: integer;
  begin
    rb := info^.rb;

    tickit_renderbuffer_eraserect(rb, @info^.rect);

    pen := tickit_pen_new();

    tickit_renderbuffer_goto(rb, 0, 0);
    tickit_renderbuffer_text(rb, 'ANSI');

    tickit_renderbuffer_save(rb);
    tickit_renderbuffer_goto(rb, 2, 0);
    for  i := 0 to 15 do begin
      tickit_pen_set_colour_attr(pen, TICKIT_PEN_BG, i);
      tickit_renderbuffer_setpen(rb, pen);
      tickit_renderbuffer_textf(rb, '[%02d]', i);
    end;
    tickit_renderbuffer_restore(rb);


    tickit_renderbuffer_goto(rb, 4, 0);
    tickit_renderbuffer_text(rb, '216 RGB cube');

    tickit_renderbuffer_save(rb);
    for  y := 0 to 5 do begin
      tickit_renderbuffer_goto(rb, 6 + y, 0);
      for  x := 0 to 35 do begin
        tickit_pen_set_colour_attr(pen, TICKIT_PEN_BG, y * 36 + x + 16);
        tickit_renderbuffer_setpen(rb, pen);
        tickit_renderbuffer_text(rb, '  ');
      end;
    end;
    tickit_renderbuffer_restore(rb);

    tickit_renderbuffer_goto(rb, 13, 0);
    tickit_renderbuffer_text(rb, '24 Greyscale ramp');

    tickit_renderbuffer_save(rb);
    tickit_renderbuffer_goto(rb, 15, 0);
    for  i := 0 to 23 do begin
      tickit_pen_set_colour_attr(pen, TICKIT_PEN_BG, 232 + i);
      if i > 12 then begin
        tickit_pen_set_colour_attr(pen, TICKIT_PEN_FG, 0);
      end;
      tickit_renderbuffer_setpen(rb, pen);
      tickit_renderbuffer_textf(rb, 'g%02d', i);
    end;
    tickit_renderbuffer_restore(rb);

    tickit_pen_unref(pen);

    Exit(1);
  end;

  procedure main;
  var
    t: PTickit;
    root: PTickitWindow;
  begin
    t := tickit_new_stdtty;
    if t = nil then begin
      WriteLn('Cannot create Tickit - ');
      Exit;
    end;

    root := tickit_get_rootwin(t);
    if root = nil then begin
      WriteLn('Cannot create root window - ');
      Exit;
    end;

    tickit_term_setctl_str(tickit_get_term(t), TICKIT_TERMCTL_TITLE_TEXT, 'XTerm256 colour demo');
    tickit_window_bind_event(root, TICKIT_WINDOW_ON_EXPOSE, 0, @on_expose, nil);
    tickit_run(t);
    tickit_window_close(root);
    tickit_unref(t);
  end;


begin
  main;
end.
