unit culumn_view;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_GTK4,
  Common, Edit_Dialog;

function Create_ListBoxWidget: PGtkWidget;

implementation

// ==== private


  // https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec32.md


// === CloumnView

const
  ColTitles: array of Pgchar = (
    'Index',
    'Vorname',
    'Nachname',
    'Alter',
    'Grösse');

procedure ListBoxNextItem(selection_model: PGtkSelectionModel);
var
  store: PGListStore;
  selected: PGtkBitset;
  position, Count: Tguint;
begin
  store := g_object_get_data(G_OBJECT(selection_model), store_Key);
  Count := g_list_model_get_n_items(G_LIST_MODEL(store));

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    if position < Count - 1 then begin
      gtk_selection_model_select_item(selection_model, position + 1, True);
    end;
  end;
  gtk_bitset_unref(selected);
end;

procedure ListBoxPrevItem(selection_model: PGtkSelectionModel);
var
  selected: PGtkBitset;
  position: Tguint;
begin
  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    if position > 0 then begin
      gtk_selection_model_select_item(selection_model, position - 1, True);
    end;
  end;
  gtk_bitset_unref(selected);
end;

//////////////////7

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PHuman absolute Data;
begin
  WriteLn(obj^.FirstName, ' ', obj^.LastName, '  (freed)');
  g_free(obj^.FirstName);
  g_free(obj^.LastName);
  g_free(obj);
end;

procedure ListBoxAppendItem(selection_model: PGtkSelectionModel; FirstName: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat);
var
  store: PGListStore;
  obj: PGObject;
  human: PHuman;
const
  index: integer = 0;
begin
  store := g_object_get_data(G_OBJECT(selection_model), store_Key);

  human := g_malloc(SizeOf(THuman));
  human^.Index := index;
  human^.FirstName := g_strdup(FirstName);
  human^.LastName := g_strdup(LastName);
  human^.Age := Age;
  human^.Size := Size;
  Inc(index);

  obj := g_object_new(G_TYPE_OBJECT, nil);
  g_object_set_data_full(obj, humanObjectKey, human, @item_object_free_cp);
  g_list_store_append(store, obj);
  g_object_unref(obj);
end;

//////////////////////

procedure ListBoxRemoveItem(selection_model: PGtkSelectionModel);
var
  store: PGListStore;
  selected: PGtkBitset;
begin
  store := g_object_get_data(G_OBJECT(selection_model), store_Key);

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    g_list_store_remove(store, gtk_bitset_get_nth(selected, 0));
  end;
  gtk_bitset_unref(selected);
end;

procedure ListBoxRemoveAllItem(selection_model: PGtkSelectionModel);
var
  store: PGListStore;
begin
  store := g_object_get_data(G_OBJECT(selection_model), store_Key);

  g_list_store_remove_all(store);
end;

procedure ListBoxUpItem(selection_model: PGtkSelectionModel);
var
  store: PGListStore;
  selected: PGtkBitset;
  position: Tguint;
  obj: PGObject;
begin
  store := g_object_get_data(G_OBJECT(selection_model), store_Key);

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    if position > 0 then begin
      obj := g_list_model_get_item(G_LIST_MODEL(store), position);
      g_list_store_remove(store, position);
      g_list_store_insert(store, position - 1, obj);
      gtk_selection_model_select_item(selection_model, position - 1, True);
      g_object_unref(obj);
    end;
  end;
  gtk_bitset_unref(selected);
end;

procedure ListBoxDownItem(selection_model: PGtkSelectionModel);
var
  store: PGListStore;
  selected: PGtkBitset;
  position, Count: Tguint;
  obj: PGObject;
begin
  store := g_object_get_data(G_OBJECT(selection_model), store_Key);

  Count := g_list_model_get_n_items(G_LIST_MODEL(store));

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    if position < Count - 1 then begin
      obj := g_list_model_get_item(G_LIST_MODEL(store), position);
      g_list_store_remove(store, position);
      g_list_store_insert(store, position + 1, obj);
      gtk_selection_model_select_item(selection_model, position + 1, True);
      g_object_unref(obj);
    end;
  end;
  gtk_bitset_unref(selected);
end;

procedure action_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
var
  action_name: Pgchar;
  selection_model: PGtkSelectionModel absolute user_data;
begin
  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action Name: "%s"'#10, action_name);

  if g_strcmp0(action_name, 'listbox.append') = 0 then begin
//    AddHuman(selection_model  );

    ListBoxAppendItem(selection_model, 'Daniel', 'Maier', Random(100), Random * 2);
  end else if g_strcmp0(action_name, 'listbox.remove') = 0 then begin
    ListBoxRemoveItem(selection_model);
  end else if g_strcmp0(action_name, 'listbox.removeall') = 0 then begin
    ListBoxRemoveAllItem(selection_model);
  end else if g_strcmp0(action_name, 'listbox.up') = 0 then begin
    ListBoxUpItem(selection_model);
  end else if g_strcmp0(action_name, 'listbox.down') = 0 then begin
    ListBoxDownItem(selection_model);
  end else if g_strcmp0(action_name, 'listbox.next') = 0 then begin
    ListBoxNextItem(selection_model);
  end else if g_strcmp0(action_name, 'listbox.prev') = 0 then begin
    ListBoxPrevItem(selection_model);
  end;
end;

procedure setup_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  col: Tgint absolute user_data;
  l: PGtkWidget;
begin
  l := gtk_label_new(nil);
  if col in [0, 3, 4] then begin
    gtk_widget_set_halign(l, GTK_ALIGN_END);
  end else begin
    gtk_widget_set_halign(l, GTK_ALIGN_START);
  end;
  gtk_list_item_set_child(list_item, l);
end;

procedure bind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  col: Tgint absolute user_data;
  l: PGtkWidget;
  item: PGObject;
  human: PHuman;
  buffer: array[0..31] of Tgchar;
begin
  l := gtk_list_item_get_child(list_item);
  item := gtk_list_item_get_item(list_item);
  human := g_object_get_data(item, humanObjectKey);
  case col of
    0: begin
      g_snprintf(buffer, SizeOf(buffer), '%d', human^.Index);
    end;
    1: begin
      g_snprintf(buffer, SizeOf(buffer), '%s', human^.FirstName);
    end;
    2: begin
      g_snprintf(buffer, SizeOf(buffer), '%s', human^.LastName);
    end;
    3: begin
      g_snprintf(buffer, SizeOf(buffer), '%d', human^.Age);
    end;
    4: begin
      g_snprintf(buffer, SizeOf(buffer), '%4.2f', human^.Size);
    end;
  end;
  gtk_label_set_text(GTK_LABEL(l), buffer);
end;

procedure unbind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
begin
end;

procedure teardown_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
begin
end;


procedure on_row_activated_cb(view: PGtkColumnView; position: Tgint; user_data: Tgpointer); cdecl;
begin
  WriteLn('position doubleclick: ', position);
end;


// ==== public

function compareFunc(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
var
  col: Tgint absolute user_data;
  human_a, human_b: PHuman;
begin
  human_a := g_object_get_data(G_OBJECT(a), humanObjectKey);
  human_b := g_object_get_data(G_OBJECT(b), humanObjectKey);

  case col of
    0: begin
      Result := human_a^.Index - human_b^.Index;
    end;
    1: begin
      Result := g_strcmp0(human_a^.FirstName , human_b^.FirstName);
    end;
    2: begin
      Result := g_strcmp0(human_a^.LastName , human_b^.LastName);
    end;
    3: begin
      Result := human_a^.Age - human_b^.Age;
    end;
    4: begin
      if human_a^.Size < human_b^.Size then begin
        Result := GTK_ORDERING_SMALLER;
      end else if human_a^.Size > human_b^.Size then begin
        Result := GTK_ORDERING_LARGER;
      end else begin
        Result := GTK_ORDERING_EQUAL;
      end;
    end;
  end;
end;

function Create_ListBoxWidget: PGtkWidget;
const
  entries: array of TGActionEntry = (
    (Name: 'listbox.next'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
    (Name: 'listbox.prev'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
    (Name: 'listbox.append'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
    (Name: 'listbox.remove'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
    (Name: 'listbox.removeall'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
    (Name: 'listbox.up'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
    (Name: 'listbox.down'; activate: @action_cp; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)));

var
  column_view: PGtkWidget;
  scrolled_window, mainWindow: PGtkWidget;
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  app: PGApplication;
  i: integer;
  len: SizeInt;
  model: PGtkSortListModel;
  store: PGListStore;
  selection: PGtkSingleSelection;
  sorter: Tgpointer;
begin
  app := g_application_get_default;

  scrolled_window := gtk_scrolled_window_new;
  column_view := gtk_column_view_new(nil);

  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(column_view), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(column_view), True);
  g_signal_connect(column_view, 'activate', G_CALLBACK(@on_row_activated_cb), nil);
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

  len := Length(ColTitles) - 1;
  for i := 0 to len do begin
    factory := gtk_signal_list_item_factory_new;
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'teardown', G_CALLBACK(@teardown_cb), GINT_TO_POINTER(i));

    column := gtk_column_view_column_new(ColTitles[i], factory);

    sorter := GTK_SORTER(gtk_custom_sorter_new(@compareFunc, GINT_TO_POINTER(i), nil));
    gtk_column_view_column_set_sorter(column, sorter);
    //        gtk_sorter_changed(column_sorter, GTK_SORTER_CHANGE_DIFFERENT);
    g_object_unref(sorter);

    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

    if i = len then  begin
      gtk_column_view_column_set_expand(column, True);
    end;

    g_object_unref(column);
  end;


  store := g_list_store_new(G_TYPE_OBJECT);
  sorter := g_object_ref (gtk_column_view_get_sorter (GTK_COLUMN_VIEW (column_view)));
    model := gtk_sort_list_model_new (G_LIST_MODEL (store), sorter);
    selection := gtk_single_selection_new (G_LIST_MODEL (model));
    gtk_single_selection_set_autoselect (selection, True);
    gtk_column_view_set_model (GTK_COLUMN_VIEW (column_view), GTK_SELECTION_MODEL (selection));


  g_signal_connect_swapped(scrolled_window, 'destroy', G_CALLBACK(@g_object_unref), model);
//  g_signal_connect_swapped(scrolled_window, 'destroy', G_CALLBACK(@g_object_unref), store);

mainWindow := gtk_widget_get_ancestor(GTK_WIDGET(scrolled_window), GTK_TYPE_WINDOW);
WriteLn('mw col: ':20,PtrUInt(mainWindow));

g_object_set_data(G_OBJECT(selection), store_Key, store);
g_object_set_data(G_OBJECT(selection), mainWindows_Key, mainWindow);

  ListBoxAppendItem(GTK_SELECTION_MODEL( selection), 'Max', 'Hugentobler', 45, 1.76);
  ListBoxAppendItem(GTK_SELECTION_MODEL( selection), 'Werner', 'Huber', 42, 1.86);
  ListBoxAppendItem(GTK_SELECTION_MODEL( selection), 'Hans', 'Ulrich', 56, 1.78);
  ListBoxAppendItem(GTK_SELECTION_MODEL( selection), 'Peter', 'Meier', 52, 1.74);

  g_action_map_add_action_entries(G_ACTION_MAP(app), PGActionEntry(entries), Length(entries), selection);

  Result := scrolled_window;
end;


end.
