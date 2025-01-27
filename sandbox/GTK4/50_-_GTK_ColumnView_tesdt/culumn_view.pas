unit culumn_view;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBoxWidget: PGtkWidget;

implementation

// ==== private

type
  THuman = record
    Index: Tgint;
    FirstName: Pgchar;
    LastName: Pgchar;
    Age: Tgint;
    Size: Tgfloat;
  end;
  PHuman = ^THuman;

const
  humanObjectKey = 'human-object';

  // https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec32.md


  // === Add Dialog;

procedure on_response_cp(widget: PGtkDialog; response_id: Tgint; {%H-}user_data: Tgpointer); cdecl;
var
  app: PGApplication;
  windowList: PGList;
  human: PHuman absolute user_data;
begin
  case response_id of
    GTK_RESPONSE_OK: begin
      g_printf('Ok.'#10);
      app := g_application_get_default;
      windowList := gtk_application_get_windows(GTK_APPLICATION(app));
      gtk_window_close(GTK_WINDOW(windowList^.Data));
    end;
    GTK_RESPONSE_CANCEL: begin
      g_printf('CANCEL'#10);
    end;
  end;
  gtk_window_destroy(GTK_WINDOW(widget));
end;


function AddHuman: THuman;
  // https://www.perplexity.ai/search/ich-will-rein-gtk4-dialg-welch-SoQpm_vMSJybIAK.5LXodw
var
  app: PGApplication;
  windowList: PGList;
  window: PGtkWindow;
  dialog: PGtkWidget;
begin
  app := g_application_get_default;
  windowList := gtk_application_get_windows(GTK_APPLICATION(app));
  window := GTK_WINDOW(windowList^.Data);

  dialog := gtk_dialog_new_with_buttons('Human data Input', window, GTK_DIALOG_MODAL or GTK_DIALOG_DESTROY_WITH_PARENT,
    'Add', GTK_RESPONSE_OK,
    'Cancel', GTK_RESPONSE_CANCEL, nil);

  //gtk_window_present(GTK_WINDOW(dialog));

  g_signal_connect(dialog, 'response', G_CALLBACK(@on_response_cp), @Result);

  //   gtk_widget_show_all (dialog);

  gtk_widget_set_visible(dialog, True);
end;


// === CloumnView

const
  ColTitles: array of Pgchar = (
    'Index',
    'Vorname',
    'Nachname',
    'Alter',
    'Grösse');

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PHuman absolute Data;
begin
  WriteLn(obj^.FirstName, ' ', obj^.LastName, '  (freed)');
  g_free(obj^.FirstName);
  g_free(obj^.LastName);
  g_free(obj);
end;

procedure ListBoxNextItem(column_view: PGtkColumnView);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  selected: PGtkBitset;
  position, Count: Tguint;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
  Count := g_list_model_get_n_items(list_model);

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

procedure ListBoxPrevItem(column_view: PGtkColumnView);
var
  selection_model: PGtkSelectionModel;
  selected: PGtkBitset;
  position: Tguint;
begin
  selection_model := gtk_column_view_get_model(column_view);

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

procedure ListBoxAppendItem(column_view: PGtkColumnView; FirstName: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  obj: PGObject;
  human: PHuman;
const
  index: integer = 0;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  obj := g_object_new(G_TYPE_OBJECT, nil);

  human := g_malloc(SizeOf(THuman));
  human^.Index := index;
  human^.FirstName := g_strdup(FirstName);
  human^.LastName := g_strdup(LastName);
  human^.Age := Age;
  human^.Size := Size;
  Inc(index);

  g_object_set_data_full(obj, humanObjectKey, human, @item_object_free_cp);
  g_list_store_append(G_LIST_STORE(list_model), obj);
  g_object_unref(obj);
end;

procedure ListBoxRemoveItem(column_view: PGtkColumnView);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;

  selected: PGtkBitset;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    g_list_store_remove(G_LIST_STORE(list_model), gtk_bitset_get_nth(selected, 0));
  end;
  gtk_bitset_unref(selected);
end;

procedure ListBoxRemoveAllItem(column_view: PGtkColumnView);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  g_list_store_remove_all(G_LIST_STORE(list_model));
end;

procedure ListBoxUpItem(column_view: PGtkColumnView);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  selected: PGtkBitset;
  position: Tguint;
  obj: PGObject;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    if position > 0 then begin
      obj := g_list_model_get_item(list_model, position);
      g_list_store_remove(G_LIST_STORE(list_model), position);
      g_list_store_insert(G_LIST_STORE(list_model), position - 1, obj);
      gtk_selection_model_select_item(selection_model, position - 1, True);
      g_object_unref(obj);
    end;
  end;
  gtk_bitset_unref(selected);
end;

procedure ListBoxDownItem(column_view: PGtkColumnView);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  selected: PGtkBitset;
  position, Count: Tguint;
  obj: PGObject;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
  Count := g_list_model_get_n_items(list_model);

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    g_printf('keine Zeile ausgewählt'#10);
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    if position < Count - 1 then begin
      obj := g_list_model_get_item(list_model, position);
      g_list_store_remove(G_LIST_STORE(list_model), position);
      g_list_store_insert(G_LIST_STORE(list_model), position + 1, obj);
      gtk_selection_model_select_item(selection_model, position + 1, True);
      g_object_unref(obj);
    end;
  end;
  gtk_bitset_unref(selected);
end;

procedure action_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
var
  action_name: Pgchar;
  culumn_view: PGtkColumnView absolute user_data;
  human: THuman;
begin
  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action Name: "%s"'#10, action_name);

  if g_strcmp0(action_name, 'listbox.append') = 0 then begin
    //human := AddHuman;
    //with human do begin
    //  ListBoxAppendItem(culumn_view, FirstName, LastName, Age, Size);
    //end;

    ListBoxAppendItem(culumn_view, 'Daniel', 'Maier', Random(100), Random * 2);
  end else if g_strcmp0(action_name, 'listbox.remove') = 0 then begin
    ListBoxRemoveItem(culumn_view);
  end else if g_strcmp0(action_name, 'listbox.removeall') = 0 then begin
    ListBoxRemoveAllItem(culumn_view);
  end else if g_strcmp0(action_name, 'listbox.up') = 0 then begin
    ListBoxUpItem(culumn_view);
  end else if g_strcmp0(action_name, 'listbox.down') = 0 then begin
    ListBoxDownItem(culumn_view);
  end else if g_strcmp0(action_name, 'listbox.next') = 0 then begin
    ListBoxNextItem(culumn_view);
  end else if g_strcmp0(action_name, 'listbox.prev') = 0 then begin
    ListBoxPrevItem(culumn_view);
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
  WriteLn('sort');
  human_a := g_object_get_data(G_OBJECT(a), humanObjectKey);
  human_b := g_object_get_data(G_OBJECT(b), humanObjectKey);

  case col of
    0: begin
      Result := human_a^.Index - human_b^.Index;
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
  scrolled_window: PGtkWidget;
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  list_store: PGListStore;
  single_selection, selection: PGtkSingleSelection;
  sorter, testsort: PGtkSorter;
  app: PGApplication;
  i: integer;
  len: SizeInt;
  model: PGtkSortListModel;
begin
  app := g_application_get_default;

  scrolled_window := gtk_scrolled_window_new;

  list_store := g_list_store_new(G_TYPE_OBJECT);
  single_selection := gtk_single_selection_new(G_LIST_MODEL(list_store));

  column_view := gtk_column_view_new(GTK_SELECTION_MODEL(single_selection));
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
    gtk_sorter_changed(sorter, GTK_SORTER_CHANGE_DIFFERENT);

    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

    if i = len then  begin
      gtk_column_view_column_set_expand(column, True);
    end;


    g_object_unref(sorter);
    g_object_unref(column);
  end;

  ListBoxAppendItem(GTK_COLUMN_VIEW(column_view), 'Max', 'Hugentobler', 45, 1.76);
  ListBoxAppendItem(GTK_COLUMN_VIEW(column_view), 'Werner', 'Huber', 42, 1.86);
  ListBoxAppendItem(GTK_COLUMN_VIEW(column_view), 'Hans', 'Ulrich', 56, 1.78);
  ListBoxAppendItem(GTK_COLUMN_VIEW(column_view), 'Peter', 'Meier', 52, 1.74);

  g_action_map_add_action_entries(G_ACTION_MAP(app), PGActionEntry(entries), Length(entries), column_view);

  Result := scrolled_window;
end;


end.
