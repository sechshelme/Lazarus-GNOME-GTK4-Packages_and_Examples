unit ListBox;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBoxWidget: PGtkWidget;

implementation

type
  TItemObject = record
    Value: Tgint;
    Name: Pgchar;
    size: Tgfloat;
  end;
  PItemObject = ^TItemObject;

const
  TOTAL = 10;

  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gtk-l-3L_FREJyTXiqn2vNyH76Kw
  // https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec32.md


function item_object_new(Value: Tgint; Name: Pgchar; size: Tgfloat): PItemObject;
begin
  Result := g_malloc(SizeOf(TItemObject));
  Result^.Value := Value;
  Result^.Name := g_strdup(Name);
  Result^.size := size;
end;

procedure item_object_free(Data: Tgpointer); cdecl;
var
  obj: PItemObject absolute Data;
begin
  g_free(obj^.Name);
  g_free(obj);
end;

function create_model: PGListModel;
var
  store: PGListStore;
  obj: PGObject;
  i: integer;
  Name: array[0..19] of Tgchar;
  size: Tgfloat;
begin
  store := g_list_store_new(G_TYPE_OBJECT);
  for i := 0 to TOTAL - 1 do begin
    obj := g_object_new(G_TYPE_OBJECT, nil);
    g_snprintf(Name, SizeOf(Name), 'Name %d', 1);
    size := i / 10;
    g_object_set_data_full(obj, 'item-object', item_object_new(i, Name, size), @item_object_free);
    g_list_store_append(store, obj);
  end;
  Result := G_LIST_MODEL(store);
end;

procedure setup_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer);
var
  l: PGtkWidget;
begin
  l := gtk_label_new(nil);
  gtk_list_item_set_child(list_item, l);
  g_printf('setup called'#10);
end;

procedure bind_number_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer);
var
  l: PGtkWidget;
  item: Tgpointer;
  obj: PItemObject;
  buffer: array[0..31] of Tgchar;
begin
  l := gtk_list_item_get_child(list_item);
  item := gtk_list_item_get_item(list_item);
  obj := g_object_get_data(item, 'item-object');
  g_snprintf(buffer, SizeOf(buffer), '%d', obj^.Value);
  gtk_label_set_text(GTK_LABEL(l), buffer);
end;

function Create_ListBoxWidget: PGtkWidget;
var
  i: integer;
  scrolled_window, column_view: PGtkWidget;
  model: PGListModel;
  selection_model: PGtkSelectionModel;
  number_factory: PGtkListItemFactory;
  number_column: PGtkColumnViewColumn;
begin
  scrolled_window := gtk_scrolled_window_new;
  gtk_widget_set_vexpand(scrolled_window, True);

  model := create_model;
  selection_model := GTK_SELECTION_MODEL(gtk_no_selection_new(model));

  column_view := gtk_column_view_new(selection_model);
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

  number_factory := gtk_signal_list_item_factory_new;
  g_signal_connect(number_factory, 'setup', G_CALLBACK(@setup_cb), nil);
  g_signal_connect(number_factory, 'bind', G_CALLBACK(@bind_number_cb), nil);
  ////////////////

  number_column := gtk_column_view_column_new('Numbers', number_factory);
  gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), number_column);



  Result := scrolled_window;
end;




end.
