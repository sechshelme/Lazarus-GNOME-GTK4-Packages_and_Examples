program project1;

uses
  ctypes,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

const
  ROWS = 8;
  COL = 1;

  item_value_key = 'item_value_key';

type
  TRowData = array[0..COL - 1] of Tgint;
  PRowData = ^TRowData;

  function compareFunc(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  var
    column_index: Tgint absolute user_data;
    rowData_a, rowData_b: PRowData;
  begin
    rowData_a := g_object_get_data(G_OBJECT(a), item_value_key);
    rowData_b := g_object_get_data(G_OBJECT(b), item_value_key);
    Result := rowData_a^[column_index] - rowData_b^[column_index];
  end;

  procedure object_free(Data: Tgpointer); cdecl;
  begin
    g_print('free object'#10);
    g_free(Data);
  end;

  procedure add_item(store: PGListStore);
  var
    obj: PGObject;
    Value: PRowData;
    i: integer;
  const counter :Tgint=0;
  begin
    obj := g_object_new(G_TYPE_OBJECT, nil);
    Value := g_malloc(SizeOf(TRowData));
    Value^[0] := counter;
    Inc(counter);
    for i := 1 to COL - 1 do begin
      Value^[i] := g_random_int_range(1, 100);
    end;
    g_object_set_data_full(obj, item_value_key, Value, @object_free);
    g_list_store_append(store, obj);
    g_object_unref(obj);
  end;


procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  store: PGListStore absolute user_data;
begin
  add_item(store);
  add_item(store);
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
    column_index: Tgint absolute user_data;
    label_: PGtkWidget;
    buffer: Pgchar;
    item: PGObject;
    Value: PRowData;
    i: Integer;
    s:String;
    const count:Integer=0;
  begin
    label_ := gtk_list_item_get_child(list_item);
    item := gtk_list_item_get_item(list_item);
    Value := g_object_get_data(item, item_value_key);
    buffer := g_strdup_printf('%d', Value^[column_index]);

for i:=0 to 1000000 do begin
    WriteStr(s,'i: ',i, '  label: ', count);
//    gtk_label_set_text(GTK_LABEL(label_), buffer);
    gtk_label_set_text(GTK_LABEL(label_), PChar(s));
    Inc(count);
    WriteLn(s);
end;
    g_free(buffer);
  end;

    procedure chages_cp(self: PGListModel; position: Tguint; removed: Tguint; added: Tguint; user_data: Tgpointer);
  begin
    g_printf('position: %d  removed: %d  added: %d'#10, position, removed, added);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, scrolled_window, column_view, mainBox, button: PGtkWidget;
    store: PGListStore;
    view_sorter, column_sorter: PGtkSorter;
    sort_model: PGtkSortListModel;
    selection_model: PGtkSelectionModel;
    factory: PGtkListItemFactory;
    column: PGtkColumnViewColumn;
    i: integer;
    buffer: Pgchar;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Sortet ColumnView');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    mainBox:=gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), mainBox);

    scrolled_window := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_box_append(GTK_BOX(mainBox), scrolled_window);

    column_view := gtk_column_view_new(nil);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

    store := g_list_store_new(G_TYPE_OBJECT);
        g_signal_connect(G_LIST_MODEL(store), 'items-changed', G_CALLBACK(@chages_cp), nil);


    view_sorter := g_object_ref(gtk_column_view_get_sorter(GTK_COLUMN_VIEW(column_view)));
    sort_model := gtk_sort_list_model_new(G_LIST_MODEL(store), view_sorter);
    selection_model := GTK_SELECTION_MODEL(gtk_single_selection_new(G_LIST_MODEL(sort_model)));
    gtk_column_view_set_model(GTK_COLUMN_VIEW(column_view), selection_model);
    g_object_unref(selection_model);

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

    button := gtk_button_new_with_label('Add');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), store);
    gtk_box_append(GTK_BOX(mainBox), button);

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
