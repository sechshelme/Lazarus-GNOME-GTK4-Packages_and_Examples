program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GDK4,
  fp_GTK4;

const
  anyDataKey = 'anyKey';

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    app: PGApplication;
    Name, titel: pchar;
    windowList, wp: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));

    Name := gtk_button_get_label(GTK_BUTTON(widget));
    if g_strcmp0(Name, 'Quit') = 0 then begin
      wp := g_list_copy(windowList);
      while wp <> nil do begin
        titel := gtk_window_get_title(GTK_WINDOW(wp^.Data));
        g_printf('%s closed'#10, titel);
        gtk_window_close(GTK_WINDOW(wp^.Data));
        wp := wp^.Next;
      end;
      g_list_free(wp);
    end;
    if g_strcmp0(Name, 'Close') = 0 then begin
      titel := gtk_window_get_title(GTK_WINDOW(windowList^.Data));
      g_printf('%s closed'#10, titel);
      gtk_window_close(GTK_WINDOW(windowList^.Data));
    end;
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    title: pchar;
  begin
    title := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    cairo_move_to(cr, 5, 15);
    cairo_show_text(cr, title);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    title: pchar;
  begin
    title := g_object_get_data(G_OBJECT(widget), anyDataKey);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure destroy_anyData_cp(Data: Tgpointer); cdecl;
  var
    title: pchar absolute Data;
  begin
    WriteLn('--- cleaning ---');
    g_free(title);
  end;

  function CreateDrawingArea(boxNr: Tgint): PGtkWidget;
  var
    title: pchar;
    buffer:array[0..127]of Tgchar;
  begin
    Result := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(Result), @draw_func, nil, nil);
    gtk_widget_set_vexpand(Result, True);
    gtk_widget_set_hexpand(Result, True);

    g_sprintf(buffer, 'Window: %d', boxNr);
    title := g_strdup(buffer);

    g_object_set_data_full(G_OBJECT(Result), anyDataKey, title, @destroy_anyData_cp);
    gtk_widget_add_tick_callback(Result, @on_tick, nil, nil);
  end;

  function CreateWindow(nr: Tgint): PGtkWidget;
  var
    box, drawing_area, button_close, button_quit: PGtkWidget;
    app: PGApplication;
  begin
    app := g_application_get_default;

    Result := gtk_application_window_new(GTK_APPLICATION(app));
    gtk_window_set_title(GTK_WINDOW(Result), 'window');
    gtk_window_set_default_size(GTK_WINDOW(Result), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(Result), box);

    drawing_area := CreateDrawingArea(nr);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button_close := gtk_button_new_with_label('Close');
    g_signal_connect(button_close, 'clicked', G_CALLBACK(@quit_clicked_cp), nil);
    gtk_box_append(GTK_BOX(box), button_close);

    button_quit := gtk_button_new_with_label('Quit');
    g_signal_connect(button_quit, 'clicked', G_CALLBACK(@quit_clicked_cp), nil);
    gtk_box_append(GTK_BOX(box), button_quit);

    gtk_window_present(GTK_WINDOW(Result));
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    i: integer;
  begin
    for i := 0 to 7 do begin
      CreateWindow(i);
    end;
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  Randomize;
  main(argc, argv);
end.
