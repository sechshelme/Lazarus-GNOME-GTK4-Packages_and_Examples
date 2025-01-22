unit ListBox;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBoxWidget: PGtkWidget;
procedure DeleteItem(w: PGtkWidget; index: Tgint);

implementation

type
  THumanObject = record
    FirstName: Pgchar;
    LastName: Pgchar;
    Age: Tgint;
    Size: Tgfloat;
  end;
  PHumanObject = ^THumanObject;

const
  Humans: array of THumanObject = (
    (FirstName: 'Max'; LastName: 'Mustermann'; Age: 33; Size: 1.73),
    (FirstName: 'Bruno'; LastName: 'Weber'; Age: 34; Size: 1.83),
    (FirstName: 'Joel'; LastName: 'Maier'; Age: 43; Size: 1.71),
    (FirstName: 'Hans'; LastName: 'Müller'; Age: 66; Size: 1.93));

  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gtk-l-3L_FREJyTXiqn2vNyH76Kw
  // https://www.perplexity.ai/search/ubersetz-mit-die-in-c-const-pa-kwPvpEr2QCapTHvW1nrMpw
  // https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec32.md

const
  RowTitles: array of Pgchar = (
    'Vorname',
    'Nachname',
    'Alter',
    'Grösse');

function item_object_new(FirstNamee: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat): PHumanObject;
begin
  Result := g_malloc(SizeOf(THumanObject));
  Result^.FirstName := g_strdup(FirstNamee);
  Result^.LastName := g_strdup(LastName);
  Result^.Age := Age;
  Result^.Size := Size;
end;

procedure item_object_free(Data: Tgpointer); cdecl;
var
  obj: PHumanObject absolute Data;
begin
  WriteLn(obj^.FirstName, ' ', obj^.FirstName, '  (freed)');
  g_free(obj^.FirstName);
  g_free(obj^.LastName);
  g_free(obj);
end;

function create_model: PGListModel;
var
  store: PGListStore;
  obj: PGObject;
  i, j: integer;
begin
  store := g_list_store_new(G_TYPE_OBJECT);
  for j := 0 to 10 do begin
    for i := 0 to Length(Humans) - 1 do begin
      obj := g_object_new(G_TYPE_OBJECT, nil);
      with Humans[i] do begin
        g_object_set_data_full(obj, 'human-object', item_object_new(FirstName, LastName, Age, Size), @item_object_free);
      end;
      g_list_store_append(store, obj);
      g_object_unref(obj);
    end;
  end;
  Result := G_LIST_MODEL(store);
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
  obj: PHumanObject;
  buffer: array[0..31] of Tgchar;
begin
  //  g_printf('bind number'#10);
  l := gtk_list_item_get_child(list_item);
  item := gtk_list_item_get_item(list_item);
  obj := g_object_get_data(item, 'human-object');
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
  model: PGListModel;
  selection_model: PGtkSelectionModel;
  factory: PGtkListItemFactory;
  column, last_column: PGtkColumnViewColumn;
begin
  scrolled_window := gtk_scrolled_window_new;

  model := create_model;
  selection_model := GTK_SELECTION_MODEL(gtk_single_selection_new(model));

  column_view := gtk_column_view_new(selection_model);

  g_signal_connect(column_view, 'activate', G_CALLBACK(@on_row_activated_cb), nil);

  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(column_view), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(column_view), True);

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

  g_object_set_data(G_OBJECT(scrolled_window), 'column-view', column_view);

  Result := scrolled_window;
end;

procedure DeleteItem(w: PGtkWidget; index: Tgint);
var
  column_view: PGtkWidget;
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  obj: PGObject;
begin
  column_view := g_object_get_data(G_OBJECT(w), 'column-view');
  selection_model := gtk_column_view_get_model(GTK_COLUMN_VIEW(column_view));
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  obj := g_list_model_get_item(list_model, index);
  g_list_store_remove(G_LIST_STORE(list_model), index);
  g_object_unref(obj);
end;

end.
