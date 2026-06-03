unit ColumViewBox;

interface

uses
  fp_glib2, fp_GTK4,
  RowItem;

function column_view_box_get_type: TGType;
function column_view_box_new: PGtkWidget;

implementation

// ==== private

type
  TInstPriv = record
    text: Pgchar;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

// =================

procedure setup_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  entry: PGtkWidget;
begin
  entry := gtk_entry_new;
  gtk_list_item_set_child(list_item, entry);
end;


procedure entry_changed_cb(editable: PGtkEditable; user_data: Tgpointer); cdecl;
var
  obj: PRowItem;
begin
  obj := PRowItem(user_data);
  row_item_set_text(obj, gtk_editable_get_text(editable));
end;


procedure bind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  obj: PRowItem;
  entry: PGtkWidget;
begin
  obj := PRowItem(gtk_list_item_get_item(list_item));
  entry := gtk_list_item_get_child(list_item);
  gtk_editable_set_text(GTK_EDITABLE(entry), row_item_get_text(obj));
  g_signal_connect(entry, 'changed', G_CALLBACK(@entry_changed_cb), obj);
end;


procedure unbind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  entry: PGtkWidget;
begin
  entry := gtk_list_item_get_child(list_item);
  g_signal_handlers_disconnect_by_func(entry, @entry_changed_cb, nil);
end;


procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin

end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin

end;


procedure save_cp({%H-}widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  store: PGListStore absolute user_data;
  n, i: Tguint;
  obj: PRowItem;
  text: pchar;
begin
  n := g_list_model_get_n_items(G_LIST_MODEL(store));
  g_print('--- SPEICHER-VORGANG ---'#10);
  for  i := 0 to n - 1 do begin
    obj := g_list_model_get_item(G_LIST_MODEL(store), i);
    text := row_item_get_text(obj);
    g_print('Zeile %u: %s'#10, i, text);
    g_object_unref(obj);
  end;
end;



// ==== public

function column_view_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_BOX, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'ColumViewBox',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function column_view_box_new: PGtkWidget;
var
  scrolled_window, cv, btn: PGtkWidget;
  store: PGListStore;
  sel: PGtkSingleSelection;
  factory: PGtkListItemFactory;
  i: integer;
  col: PGtkColumnViewColumn;
begin
  Result := g_object_new(column_view_box_get_type, nil);
  gtk_orientable_set_orientation(GTK_ORIENTABLE(Result), GTK_ORIENTATION_VERTICAL);


  scrolled_window := gtk_scrolled_window_new;
  gtk_widget_set_vexpand(scrolled_window, True);
  gtk_box_append(GTK_BOX(Result), scrolled_window);

  store := g_list_store_new(row_item_get_type);
  for i := 0 to 4 do begin
    g_list_store_append(store, row_item_new('Eintrag 1'));
    g_list_store_append(store, row_item_new('Eintrag 2'));
    g_list_store_append(store, row_item_new('Eintrag 3'));
  end;

  sel := gtk_single_selection_new(G_LIST_MODEL(store));
  cv := gtk_column_view_new(GTK_SELECTION_MODEL(sel));
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), cv);

  factory := gtk_signal_list_item_factory_new();
  g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), nil);
  g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), nil);
  g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), nil);

  col := gtk_column_view_column_new('Editierbare Felder', factory);
  gtk_column_view_column_set_expand(col, True);
  gtk_column_view_append_column(GTK_COLUMN_VIEW(cv), col);

  btn := gtk_button_new_with_label('Daten in Konsole speichern');
  g_signal_connect(btn, 'clicked', G_CALLBACK(@save_cp), store);
  gtk_box_append(GTK_BOX(Result), btn);
end;

end.
