unit culumn_view;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_pango, fp_GTK4,
  LoadTitle, Streamer;

function Create_ListBoxWidget: PGtkWidget;
//procedure ListBoxAppendItem(column_view: PGtkColumnView; Titel: Pgchar);

implementation

// ==== private

const
  ColTitles: array of Pgchar = (
    'Index',
    'Titel',
    'Dauer');

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
begin
  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action Name: "%s"'#10, action_name);

  if g_strcmp0(action_name, 'listbox.append') = 0 then begin
    OpenTitel(GTK_COLUMN_VIEW(culumn_view));
    //ListBoxAppendItem(culumn_view, 'Daniel');
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
  label_: PGtkWidget;
begin
  label_ := gtk_label_new(nil);
  if col in [0, 2] then begin
    gtk_widget_set_halign(label_, GTK_ALIGN_END);
  end else begin
    gtk_widget_set_halign(label_, GTK_ALIGN_START);
  end;
  gtk_label_set_ellipsize(GTK_LABEL(label_), PANGO_ELLIPSIZE_END);
  gtk_list_item_set_child(list_item, label_);
end;

procedure bind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  col: Tgint absolute user_data;
  l: PGtkWidget;
  item: PGObject;
  song: PSong;
  buffer: Pgchar;
begin
  l := gtk_list_item_get_child(list_item);
  item := gtk_list_item_get_item(list_item);
  song := g_object_get_data(item, humanObjectKey);
  case col of
    0: begin
      buffer := g_strdup_printf('%d', song^.Index);
    end;
    1: begin
      buffer := g_strdup_printf('%s', song^.Titel);
    end;
    2: begin
      buffer := g_strdup_printf('%d', song^.Duration);
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

function Create_ListBoxWidget: PGtkWidget;
const
  entries: array of Pgchar = (
    'listbox.next',
    'listbox.prev',
    'listbox.append',
    'listbox.remove',
    'listbox.removeall',
    'listbox.up',
    'listbox.down');

var
  column_view: PGtkWidget;
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  list_store: PGListStore;
  single_selection: PGtkSingleSelection;
  app: PGApplication;
  i: integer;
  len: SizeInt;
  action: PGSimpleAction;
begin
  app := g_application_get_default;

  list_store := g_list_store_new(G_TYPE_OBJECT);
  single_selection := gtk_single_selection_new(G_LIST_MODEL(list_store));

  column_view := gtk_column_view_new(GTK_SELECTION_MODEL(single_selection));
  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(column_view), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(column_view), True);
  g_signal_connect(column_view, 'activate', G_CALLBACK(@on_row_activated_cb), nil);

  len := Length(ColTitles) - 1;
  for i := 0 to len do begin
    factory := gtk_signal_list_item_factory_new;
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'teardown', G_CALLBACK(@teardown_cb), GINT_TO_POINTER(i));

    column := gtk_column_view_column_new(ColTitles[i], factory);

    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

    if i = 1 then  begin
      gtk_column_view_column_set_expand(column, True);
    end;

    g_object_unref(column);
  end;

  for i := 0 to Length(entries) - 1 do begin
    action := g_simple_action_new(entries[i], nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@action_cp), column_view);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_object_unref(action);
  end;

  Result := column_view;
end;


end.
