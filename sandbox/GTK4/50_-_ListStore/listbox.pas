unit ListBox;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBoxWidget: PGtkWidget;
procedure LisBoxDeleteItem(w: PGtkWidget);
procedure ListBoxNewItem(w: PGtkWidget; FirstName: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat);

implementation

type
  THuman = record
    FirstName: Pgchar;
    LastName: Pgchar;
    Age: Tgint;
    Size: Tgfloat;
  end;
  PHuman = ^THuman;

const
  columnViewKey = 'cw-Key';
  humanObjectKey = 'human-object';

  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gtk-l-3L_FREJyTXiqn2vNyH76Kw
  // https://www.perplexity.ai/search/ubersetz-mit-die-in-c-const-pa-kwPvpEr2QCapTHvW1nrMpw
  // https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec32.md

const
  RowTitles: array of Pgchar = (
    'Vorname',
    'Nachname',
    'Alter',
    'Grösse');

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PHuman absolute Data;
begin
  WriteLn(obj^.FirstName, ' ', obj^.FirstName, '  (freed)');
  g_free(obj^.FirstName);
  g_free(obj^.LastName);
  g_free(obj);
end;

procedure setup_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer);
var
  row: Tgint absolute user_data;
  l: PGtkWidget;
begin
  //   g_printf('setup called'#10);
  l := gtk_label_new(nil);
  if row in [2, 3] then begin
    gtk_widget_set_halign(l, GTK_ALIGN_END);
  end else begin
    gtk_widget_set_halign(l, GTK_ALIGN_START);
  end;
  gtk_list_item_set_child(list_item, l);
end;

procedure bind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer);
var
  row: Tgint absolute user_data;
  l: PGtkWidget;
  item: PGObject;
  obj: PHuman;
  buffer: array[0..31] of Tgchar;
begin
  //  g_printf('bind number'#10);
  l := gtk_list_item_get_child(list_item);
  item := gtk_list_item_get_item(list_item);
  obj := g_object_get_data(item, humanObjectKey);
  case row of
    0: begin
      g_snprintf(buffer, SizeOf(buffer), '%s', obj^.FirstName);
    end;
    1: begin
      g_snprintf(buffer, SizeOf(buffer), '%s', obj^.LastName);
    end;
    2: begin
      g_snprintf(buffer, SizeOf(buffer), '%d', obj^.Age);
    end;
    3: begin
      g_snprintf(buffer, SizeOf(buffer), '%4.2f', obj^.Size);
    end;
  end;
  gtk_label_set_text(GTK_LABEL(l), buffer);
end;

procedure unbind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer);
begin
end;

procedure teardown_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer);
begin
end;


procedure on_row_activated_cb(view: PGtkColumnView; position: Tgint; user_data: Tgpointer);
begin
  WriteLn('position doubleclick: ', position);
end;

function Create_ListBoxWidget: PGtkWidget;
var
  i: integer;
var
  column_view: PGtkWidget;
  scrolled_window: PGtkWidget;
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  list_store: PGListStore;
  single_selection: PGtkSingleSelection;
begin
  scrolled_window := gtk_scrolled_window_new;

  list_store := g_list_store_new(G_TYPE_OBJECT);
  single_selection := gtk_single_selection_new(G_LIST_MODEL(list_store));

  column_view := gtk_column_view_new(GTK_SELECTION_MODEL(single_selection));
  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(column_view), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(column_view), True);
  g_signal_connect(column_view, 'activate', G_CALLBACK(@on_row_activated_cb), nil);
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

  for i := 0 to Length(RowTitles) - 1 do begin
    factory := gtk_signal_list_item_factory_new;
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'teardown', G_CALLBACK(@teardown_cb), GINT_TO_POINTER(i));

    column := gtk_column_view_column_new(RowTitles[i], factory);
    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);
  end;
  gtk_column_view_column_set_expand(column, True);

  g_object_set_data(G_OBJECT(scrolled_window), columnViewKey, column_view);

  Result := scrolled_window;
end;

procedure ListBoxNewItem(w: PGtkWidget; FirstName: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat);
var
  column_view: PGtkColumnView;
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  obj: PGObject;
  human: PHuman;
begin
  column_view := g_object_get_data(G_OBJECT(w), columnViewKey);
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  obj := g_object_new(G_TYPE_OBJECT, nil);

  human := g_malloc(SizeOf(THuman));
  human^.FirstName := g_strdup(FirstName);
  human^.LastName := g_strdup(LastName);
  human^.Age := Age;
  human^.Size := Size;

  g_object_set_data_full(obj, humanObjectKey, human, @item_object_free_cp);
  g_list_store_append(G_LIST_STORE(list_model), obj);
  g_object_unref(obj);
end;

procedure LisBoxDeleteItem(w: PGtkWidget);
var
  column_view: PGtkColumnView;
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  obj: PGObject;

  selected: PGtkBitset;
  position: Tguint;
begin
  column_view := g_object_get_data(G_OBJECT(w), columnViewKey);
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  selected := gtk_selection_model_get_selection(selection_model);
  if gtk_bitset_is_empty(selected) then begin
    WriteLn('keine Zeile ausgewählt');
  end else begin
    position := gtk_bitset_get_nth(selected, 0);
    WriteLn('Zeile ', position, ' ausgewählt');

    obj := g_list_model_get_item(list_model, position);
    g_list_store_remove(G_LIST_STORE(list_model), position);
    g_object_unref(obj);
  end;
  gtk_bitset_unref(selected);
end;

// Swap:
// https://www.perplexity.ai/search/wie-vertausche-ich-2-eintrage-WUslJPxpQHq7tiDsh7Ys_g

end.
