program project1;

uses
  fp_glib2,
  fp_GTK4,
  ItemsObject, ColumnViewWidget, ColumnViewSortetWidget;

const
  ROWS = 8;
  COL = 2;

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    store: PGListStore absolute user_data;
  begin
    //    add_item(store);
  end;


  procedure AddCVItem(cv: PColumnViewSortetWidget);
  var
    obj: PGObject;
    s0, s1: Pgchar;
  begin
    s0 := g_strdup_printf('%d', g_random_int_range(10, 99));
    s1 := g_strdup_printf('%d', g_random_int_range(10, 99));
    obj := cv_item_new(s0, s1);
    g_free(s0);
    g_free(s1);

    column_view_widget_add_item(cv, obj);
    g_object_unref(obj);
  end;

  procedure AddCVSortetItem(cv: PColumnViewSortetWidget);
  var
    obj: PGObject;
    s0, s1: Pgchar;
  begin
    s0 := g_strdup_printf('%d', g_random_int_range(10, 99));
    s1 := g_strdup_printf('%d', g_random_int_range(10, 99));
    obj := cv_item_new(s0, s1);
    g_free(s0);
    g_free(s1);

    column_view_sortet_widget_add_item(cv, obj);
    g_object_unref(obj);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, mainBox, button, cvs, cv: PGtkWidget;
    view_sorter, column_sorter: PGtkSorter;
    sort_model: PGtkSortListModel;
    selection_model: PGtkSelectionModel;
    factory: PGtkListItemFactory;
    column: PGtkColumnViewColumn;
    i: integer;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Sortet ColumnView');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), mainBox);

    cv := column_view_widget_new;
    for i := 0 to ROWS - 1 do begin
      AddCVItem(cv);
    end;
    gtk_box_append(GTK_BOX(mainBox), cv);

    cvs := column_view_sortet_widget_new;
    for i := 0 to ROWS - 1 do begin
      AddCVSortetItem(cvs);
    end;
    gtk_box_append(GTK_BOX(mainBox), cvs);

    button := gtk_button_new_with_label('Add');
    //    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), store);
    gtk_box_append(GTK_BOX(mainBox), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
