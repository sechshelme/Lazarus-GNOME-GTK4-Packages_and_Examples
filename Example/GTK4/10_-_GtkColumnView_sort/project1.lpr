program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4;

const
  ROWS = 8;
  COL = 8;

  item_value_key = 'item_value_key';
var
  column_titles: array of Pgchar;

  function compareFunc(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  var
    column_index: Tgint absolute user_data;
    int_a, int_b: Pgint;
  begin
    int_a := g_object_get_data(G_OBJECT(a), g_strdup_printf('item-object-%d', column_index));
    int_b := g_object_get_data(G_OBJECT(b), g_strdup_printf('item-object-%d', column_index));
    Result := int_a^ - int_b^;
  end;

  procedure object_free(Data: Tgpointer); cdecl;
  begin
    g_print('free object'#10);
    g_free(Data);
  end;

  procedure add_item(store: PGListStore);
  var
    obj: PGObject;
    Value: Pgint;
    i: integer;
  begin
    obj := g_object_new(G_TYPE_OBJECT, nil);
    for i := 0 to Length(column_titles) - 1 do begin
      Value := g_malloc(SizeOf(Tgint));
      Value^ := g_random_int_range(1, 100);
      g_object_set_data_full(obj, g_strdup_printf('item-object-%d', i), Value, @object_free);
    end;
    g_list_store_append(store, obj);
    g_object_unref(obj);
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
    column_index: Tgint absolute user_data;
    label_: PGtkWidget;
    buffer: Pgchar;
    item: PGObject;
    Value: Pgint;
  begin
    label_ := gtk_list_item_get_child(list_item);
    item := gtk_list_item_get_item(list_item);
    Value := g_object_get_data(item, g_strdup_printf('item-object-%d', column_index));
    buffer := g_strdup_printf('%d', Value^);
    gtk_label_set_text(GTK_LABEL(label_), buffer);
    g_free(buffer);
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, scrolled_window, column_view: PGtkWidget;
    store: PGListStore;
    view_sorter, column_sorter: PGtkSorter;
    sort_model: PGtkSortListModel;
    selection_model: PGtkSelectionModel;
    factory: PGtkListItemFactory;
    column: PGtkColumnViewColumn;
    i: integer;
    buffer: Pgchar;
  begin
    SetLength(column_titles, COL);
    for i := 0 to Length(column_titles) - 1 do begin
      buffer := g_strdup_printf('Number %d', i);
      column_titles[i] := buffer;
    end;

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Sortet ColumnView');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    scrolled_window := gtk_scrolled_window_new;
    gtk_window_set_child(GTK_WINDOW(window), scrolled_window);

    column_view := gtk_column_view_new(nil);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

    store := g_list_store_new(G_TYPE_OBJECT);

    view_sorter := g_object_ref(gtk_column_view_get_sorter(GTK_COLUMN_VIEW(column_view)));
    sort_model := gtk_sort_list_model_new(G_LIST_MODEL(store), view_sorter);
    selection_model := GTK_SELECTION_MODEL(gtk_single_selection_new(G_LIST_MODEL(sort_model)));
    gtk_column_view_set_model(GTK_COLUMN_VIEW(column_view), selection_model);
    g_object_unref(selection_model);

    for i := 0 to Length(column_titles) - 1 do begin
      factory := gtk_signal_list_item_factory_new;
      g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), nil);
      g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));

      column := gtk_column_view_column_new(column_titles[i], factory);
      gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

      column_sorter := GTK_SORTER(gtk_custom_sorter_new(@compareFunc, GINT_TO_POINTER(i), nil));
      gtk_column_view_column_set_sorter(column, column_sorter);
      g_object_unref(column_sorter);
      g_object_unref(column);
    end;

    for i := 0 to ROWS - 1 do begin
      add_item(store);
    end;

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
