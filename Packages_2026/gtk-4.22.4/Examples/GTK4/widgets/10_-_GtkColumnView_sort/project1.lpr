program project1;

uses
  fp_glib2,
  fp_GTK4,
  ItemsObject, ColumnViewWidget;

const
  ROWS = 8;
  COL = 2;

  function compareFunc(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  var
    column_index: Tgint absolute user_data;
    item_a: PCVItem absolute a;
    item_b: PCVItem absolute b;
    ia, ib: pchar;
  begin
    if column_index = 0 then begin
      ia := cv_item_get_col0(item_a);
      ib := cv_item_get_col0(item_b);
    end;
    if column_index = 1 then begin
      ia := cv_item_get_col1(item_a);
      ib := cv_item_get_col1(item_b);
    end;

    Result := g_strcmp0(ia, ib);
  end;

  procedure object_free(Data: Tgpointer); cdecl;
  begin
    g_print('free object'#10);
    g_free(Data);
  end;

  procedure add_item(store: PGListStore);
  var
    obj: PGObject;
    s0, s1: Pgchar;
  begin
    s0 := g_strdup_printf('%d', g_random_int_range(10, 99));
    s1 := g_strdup_printf('%d', g_random_int_range(10, 99));

    obj := cv_item_new(s0, s1);

    g_free(s0);
    g_free(s1);

    g_list_store_append(store, obj);
    g_object_unref(obj);
  end;


  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    store: PGListStore absolute user_data;
  begin
    add_item(store);
  end;


  procedure setup_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
  var
    label_: PGtkWidget;
  begin
    label_ := gtk_label_new(nil);
    gtk_list_item_set_child(list_item, label_);
  end;

  procedure bind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
  var
    col: Tgint absolute user_data;
    lab: PGtkWidget;
    item_obj: PGObject;
    buffer: Pgchar = nil;
  begin
    lab := gtk_list_item_get_child(list_item);
    item_obj := gtk_list_item_get_item(list_item);
    if item_obj = nil then begin
      exit;
    end;

    case col of
      0: begin
        buffer := cv_item_get_col0(item_obj);
      end;
      1: begin
        buffer := cv_item_get_col1(item_obj);
      end;
    end;

    gtk_label_set_text(GTK_LABEL(lab), buffer);
  end;

  procedure on_row_activated_cb(view: PGtkColumnView; position: Tgint; user_data: Tgpointer); cdecl;
  begin
  end;

  procedure AddCVItem(cv: PColumnViewWidget);
  var
    obj: PGObject;
    s0, s1: Pgchar;
  begin
    s0 := g_strdup_printf('%d', g_random_int_range(10, 99));
    s1 := g_strdup_printf('%d', g_random_int_range(10, 99));

    obj := cv_item_new(s0, s1);

    g_free(s0);
    g_free(s1);

    column_view_box_add_item(cv, obj);
    //  g_list_store_append(store, obj);
    g_object_unref(obj);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, scrolled_window, column_view, mainBox, button, cv: PGtkWidget;
    store: PGListStore;
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

    scrolled_window := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_box_append(GTK_BOX(mainBox), scrolled_window);

    column_view := gtk_column_view_new(nil);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

    store := g_list_store_new(G_TYPE_OBJECT);

    view_sorter := g_object_ref(gtk_column_view_get_sorter(GTK_COLUMN_VIEW(column_view)));
    sort_model := gtk_sort_list_model_new(G_LIST_MODEL(store), view_sorter);
    selection_model := GTK_SELECTION_MODEL(gtk_single_selection_new(G_LIST_MODEL(sort_model)));
    gtk_column_view_set_model(GTK_COLUMN_VIEW(column_view), selection_model);
    g_object_unref(selection_model);

    g_signal_connect(column_view, 'activate', G_CALLBACK(@on_row_activated_cb), nil);

    for i := 0 to COL - 1 do begin
      factory := gtk_signal_list_item_factory_new;
      g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), nil);
      g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));

      column := gtk_column_view_column_new(g_strdup_printf('Number %d', i), factory);
      gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

      column_sorter := GTK_SORTER(gtk_custom_sorter_new(@compareFunc, GINT_TO_POINTER(i), nil));
      gtk_column_view_column_set_sorter(column, column_sorter);
      g_object_unref(column_sorter);
      g_object_unref(column);
    end;

    for i := 0 to ROWS - 1 do begin
      add_item(store);
    end;

    cv := column_view_box_new;


    for i := 0 to ROWS - 1 do begin AddCVItem(cv); end;

    gtk_box_append(GTK_BOX(mainBox), cv);

    button := gtk_button_new_with_label('Add');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), store);
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
