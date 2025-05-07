program project1;

uses
  SysUtils,
  //  stdio,
  fp_tickit,
  fp_tickit_evloop,
  fp_tickit_mockterm,
  fp_tickit_termdrv;

  procedure free(ptr: Pointer); cdecl; external 'c';
  function strdup(s: pchar): pchar; cdecl; external 'c';



var
  lastkey: TTickitKeyEventInfo;
  lastmouse: TTickitMouseEventInfo;

  root, keywin, mousewin, timerwin: PTickitWindow;


  function mkpen_highlight: PTickitPen;
  const
    pen: PTickitPen = nil;
  begin
    if pen = nil then begin
      pen := tickit_pen_new_attrs(TICKIT_PEN_FG, 3, TICKIT_PEN_BOLD, 1, 0);
    end;
    Exit(pen);
  end;

  procedure render_modifier(rb: PTickitRenderBuffer; mod_: longint);
  var
    pipe: integer = 0;
  begin
    if mod_ = 0 then begin
      Exit;
    end;

    tickit_renderbuffer_text(rb, '<');

    if (mod_ and TICKIT_MOD_SHIFT) <> 0 then begin
      if pipe <> 0 then begin
        tickit_renderbuffer_text(rb, '|SHIFT');
      end else begin
        tickit_renderbuffer_text(rb, 'SHIFT');
      end;
      Inc(pipe);
    end;

    if (mod_ and TICKIT_MOD_ALT) <> 0 then begin
      if pipe <> 0 then begin
        tickit_renderbuffer_text(rb, '|ALT');
      end else begin
        tickit_renderbuffer_text(rb, 'ALT');
      end;
      Inc(pipe);
    end;

    if (mod_ and TICKIT_MOD_CTRL) <> 0 then begin
      if pipe <> 0 then begin
        tickit_renderbuffer_text(rb, '|CTRL');
      end else begin
        tickit_renderbuffer_text(rb, 'CTRL');
      end;
      Inc(pipe);
    end;

    tickit_renderbuffer_text(rb, '>');
  end;

  function render_key(win: PTickitWindow; flags: TTickitEventFlags; _info: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitExposeEventInfo absolute _info;
    rb: PTickitRenderBuffer = nil;
  begin
    rb := info^.rb;

    tickit_renderbuffer_eraserect(rb, @info^.rect);

    tickit_renderbuffer_goto(rb, 0, 0);

    tickit_renderbuffer_savepen(rb);

    tickit_renderbuffer_setpen(rb, mkpen_highlight);
    tickit_renderbuffer_text(rb, 'Key:');

    tickit_renderbuffer_restore(rb);

    tickit_renderbuffer_goto(rb, 2, 2);
    case lastkey._type of

      TICKIT_KEYEV_TEXT: begin
        tickit_renderbuffer_text(rb, 'text ');
      end;
      TICKIT_KEYEV_KEY: begin
        tickit_renderbuffer_text(rb, 'key  ');
      end;
      else begin
        Exit(0);
      end;
    end;
    tickit_renderbuffer_text(rb, lastkey.str);

    render_modifier(rb, lastkey.mod_);

    Exit(1);
  end;

  function event_key(win: PTickitWindow; flags: TTickitEventFlags; _info: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitKeyEventInfo absolute _info;
  begin

    if lastkey.str <> nil then begin
      Free(lastkey.str);
    end;

    lastkey := info^;
    lastkey.str := strdup(info^.str);

    tickit_window_expose(keywin, nil);

    Exit(1);
  end;

  function render_mouse(win: PTickitWindow; flags: TTickitEventFlags; _info: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitExposeEventInfo absolute _info;
    rb: PTickitRenderBuffer = nil;
    dir: pchar = nil;
  begin
    rb := info^.rb;

    tickit_renderbuffer_eraserect(rb, @info^.rect);

    tickit_renderbuffer_goto(rb, 0, 0);

    tickit_renderbuffer_savepen(rb);
    tickit_renderbuffer_setpen(rb, mkpen_highlight);
    tickit_renderbuffer_text(rb, 'Mouse:');
    tickit_renderbuffer_restore(rb);

    tickit_renderbuffer_goto(rb, 2, 2);
    case lastmouse._type of
      TICKIT_MOUSEEV_PRESS: begin
        tickit_renderbuffer_text(rb, 'press   ');
      end;
      TICKIT_MOUSEEV_DRAG: begin
        tickit_renderbuffer_text(rb, 'drag    ');
      end;
      TICKIT_MOUSEEV_RELEASE: begin
        tickit_renderbuffer_text(rb, 'release ');
      end;
      TICKIT_MOUSEEV_WHEEL: begin
        tickit_renderbuffer_text(rb, 'wheel ');
      end;
      else begin
        Exit(0);
      end;
    end;

    if lastmouse._type = TICKIT_MOUSEEV_WHEEL then begin
      case lastmouse.button of
        TICKIT_MOUSEWHEEL_UP: begin
          dir := 'up';
        end;
        TICKIT_MOUSEWHEEL_DOWN: begin
          dir := 'down';
        end;
        // Erst in neuer Version verfügbar:
        //          TICKIT_MOUSEWHEEL_LEFT:  dir := 'left';
        //          TICKIT_MOUSEWHEEL_RIGHT: dir := 'right';
      end;
      if dir <> nil then begin
        tickit_renderbuffer_text(rb, dir);
      end else begin
        tickit_renderbuffer_text(rb, '??');
      end;
    end else begin
      tickit_renderbuffer_textf(rb, 'button %d', lastmouse.button);
    end;

    tickit_renderbuffer_textf(rb, ' at (%d,%d)', lastmouse.line, lastmouse.col);

    render_modifier(rb, lastmouse.mod_);
    Exit(1);
  end;

  function event_mouse(win: PTickitWindow; flags: TTickitEventFlags; _info: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitMouseEventInfo absolute _info;
  begin
    lastmouse := info^;
    tickit_window_expose(mousewin, nil);
    Exit(1);
  end;

  function render_timer(win: PTickitWindow; flags: TTickitEventFlags; _info: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitExposeEventInfo absolute _info;
    rb: PTickitRenderBuffer = nil;
    counterp: PInteger absolute user;
  begin
    rb := info^.rb;

    tickit_renderbuffer_eraserect(rb, @info^.rect);

    tickit_renderbuffer_goto(rb, 0, 0);

    tickit_renderbuffer_savepen(rb);
    tickit_renderbuffer_setpen(rb, mkpen_highlight());
    tickit_renderbuffer_text(rb, 'Counter:');
    tickit_renderbuffer_restore(rb);

    tickit_renderbuffer_goto(rb, 2, 2);
    tickit_renderbuffer_textf(rb, '%d', counterp^);

    Exit(1);
  end;


  function on_timer(t: PTickit; flags: TTickitEventFlags; info: pointer; user: pointer): longint; cdecl; forward;

var
  tempFunc: TTickitCallbackFn = @on_timer;

  function on_timer(t: PTickit; flags: TTickitEventFlags; info: pointer; user: pointer): longint; cdecl;
  var
    counterp: PInteger absolute user;
  begin
    Inc(counterp^);
    tickit_window_expose(timerwin, nil);
    tickit_watch_timer_after_msec(t, 1000, 0, tempFunc, user);
    Exit(1);
  end;

  function render_root(win: PTickitWindow; flags: TTickitEventFlags; _info: pointer; user: pointer): longint; cdecl;
  var
    info: PTickitExposeEventInfo absolute _info;
    rb: PTickitRenderBuffer = nil;
    right, bottom, left: longint;
    TickitRect: TTickitRect;
  const
    pen_blue: PTickitPen = nil;
    pen_white: PTickitPen = nil;
  begin
    rb := info^.rb;

    right := tickit_window_cols(win) - 1;
    bottom := tickit_window_lines(win) - 1;

    TickitRect.items := [0, 0, bottom + 1, right + 1];

    tickit_renderbuffer_eraserect(rb, @TickitRect);

    if pen_blue = nil then begin
      pen_blue := tickit_pen_new_attrs(TICKIT_PEN_FG, 4 + 8, 0);
    end;

    if pen_white = nil then begin
      pen_white := tickit_pen_new_attrs(TICKIT_PEN_FG, 7 + 8, 0);
    end;

    // Draw a horizontal size marker bar
    tickit_renderbuffer_setpen(rb, pen_blue);
    tickit_renderbuffer_hline_at(rb, 1, 0, right, TICKIT_LINE_SINGLE, 0);
    tickit_renderbuffer_vline_at(rb, 0, 2, 0, TICKIT_LINE_SINGLE, 0);
    tickit_renderbuffer_vline_at(rb, 0, 2, right, TICKIT_LINE_SINGLE, 0);

    tickit_renderbuffer_setpen(rb, pen_white);
    tickit_renderbuffer_goto(rb, 1, (right div 2) - 2);
    tickit_renderbuffer_textf(rb, ' %d ', right + 1); // cols


    // Draw a vertical size marker bar
    left := right - 4;

    tickit_renderbuffer_setpen(rb, pen_blue);
    tickit_renderbuffer_vline_at(rb, 0, bottom, left + 2, TICKIT_LINE_SINGLE, 0);
    tickit_renderbuffer_hline_at(rb, 0, left, right, TICKIT_LINE_SINGLE, 0);
    tickit_renderbuffer_hline_at(rb, bottom, left, right, TICKIT_LINE_SINGLE, 0);

    tickit_renderbuffer_setpen(rb, pen_white);
    tickit_renderbuffer_goto(rb, (bottom div 2) - 1, left);
    tickit_renderbuffer_textf(rb, '%d', bottom + 1); // lines

    Exit(1);
  end;

  function event_resize(win: PTickitWindow; flags: TTickitEventFlags; info: pointer; user: pointer): longint; cdecl;
  var
    cols: longint;
    TickitRect: TTickitRect;
  begin
    cols := tickit_window_cols(win);

    TickitRect.items := [2, 2, 3, cols - 7];
    tickit_window_set_geometry(keywin, TickitRect);

    TickitRect.items := [8, 2, 3, cols - 7];
    tickit_window_set_geometry(mousewin, TickitRect);

    TickitRect.items := [15, 2, 3, cols - 7];
    tickit_window_set_geometry(timerwin, TickitRect);

    tickit_window_expose(root, nil);

    Exit(1);
  end;

  procedure main;
  var
    t: PTickit;
    TickitRect: TTickitRect;
    counter: integer = 0;
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

    TickitRect.items := [2, 2, 3, tickit_window_cols(root) - 7];
    keywin := tickit_window_new(root, TickitRect, 0);

    tickit_window_bind_event(keywin, TICKIT_WINDOW_ON_EXPOSE, 0, @render_key, nil);
    tickit_window_bind_event(root, TICKIT_WINDOW_ON_KEY, 0, @event_key, nil);

    TickitRect.items := [8, 2, 3, tickit_window_cols(root) - 7];
    mousewin := tickit_window_new(root, TickitRect, 0);

    tickit_window_bind_event(mousewin, TICKIT_WINDOW_ON_EXPOSE, 0, @render_mouse, nil);
    tickit_window_bind_event(root, TICKIT_WINDOW_ON_MOUSE, 0, @event_mouse, nil);

    TickitRect.items := [15, 2, 3, tickit_window_cols(root) - 7];
    timerwin := tickit_window_new(root, TickitRect, 0);

    tickit_window_bind_event(timerwin, TICKIT_WINDOW_ON_EXPOSE, 0, @render_timer, @counter);

    tickit_window_bind_event(root, TICKIT_WINDOW_ON_EXPOSE, 0, @render_root, nil);
    tickit_window_bind_event(root, TICKIT_WINDOW_ON_GEOMCHANGE, 0, @event_resize, nil);

    tempFunc:= @on_timer;
    tickit_watch_timer_after_msec(t, 1000, 0, @on_timer, @counter);

    tickit_window_take_focus(root);
    tickit_window_set_cursor_visible(root, False);

    tickit_run(t);

    tickit_window_close(root);

    tickit_unref(t);
  end;


begin
  main;
end.
