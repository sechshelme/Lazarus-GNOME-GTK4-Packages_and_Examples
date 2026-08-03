program project1;

uses
  fp_glib2,
  fp_GTK4;

type
  TAppData = record
    adjustment: PGtkAdjustment;
    lab: PGtkWidget;
  end;
  PAppData = ^TAppData;

  procedure changed_cp(user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    s: Pgchar;
  begin
    s := g_strdup_printf('value: %f', gtk_adjustment_get_value(appData^.adjustment));
    gtk_label_set_label(GTK_LABEL(appData^.lab), s);
    g_free(s);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    window, box, scale: PGtkWidget;
    final_expr: PGtkExpression;
    watch: PGtkExpressionWatch;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GtkExpression-Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 100);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 100, 10);
    gtk_scale_set_draw_value(GTK_SCALE(scale), True);
    gtk_scale_set_digits(GTK_SCALE(scale), 2);
    gtk_scale_add_mark(GTK_SCALE(scale), 0, GTK_POS_BOTTOM, '0.00');
    gtk_scale_add_mark(GTK_SCALE(scale), 100, GTK_POS_BOTTOM, '100.00');
    gtk_box_append(GTK_BOX(box), scale);
    appData^.adjustment := gtk_range_get_adjustment(GTK_RANGE(scale));

    final_expr := gtk_property_expression_new(GTK_TYPE_ADJUSTMENT, nil, 'value');
    watch := gtk_expression_watch(final_expr, appData^.adjustment, @changed_cp, appData, nil);
    g_signal_connect_swapped(window, 'destroy', G_CALLBACK(@gtk_expression_watch_unwatch), watch);

    appData^.lab := gtk_label_new('value:');
    gtk_box_append(GTK_BOX(box), appData^.lab);

    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
    appData: TAppData;
  begin
    app := gtk_application_new('org.gtk.expression.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @appData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
