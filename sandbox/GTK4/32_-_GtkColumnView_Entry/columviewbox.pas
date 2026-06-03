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

procedure entry_changed_cb(editable: PGtkEditable; user_data: Tgpointer); cdecl;
var
  obj: PRowItem;
begin
  obj := PRowItem(user_data);
  row_item_set_text(obj, gtk_editable_get_text(editable));
end;


procedure setup_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  col: Tgint absolute user_data;
  w: PGtkWidget;
begin
  case col of
    0: begin
      w := gtk_label_new(nil);
      gtk_list_item_set_child(list_item, w);
    end;
    1: begin
      w := gtk_entry_new;
      gtk_list_item_set_child(list_item, w);
    end;
  end;
end;


procedure bind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  col: Tgint absolute user_data;
  obj: PRowItem;
  entry, lab: PGtkWidget;
  s: Pgchar;
begin
  obj := PRowItem(gtk_list_item_get_item(list_item));
  case col of
    0: begin
      s := g_strdup_printf('%d.', row_item_get_index(obj));
      lab := gtk_list_item_get_child(list_item);
      s := g_strdup_printf('%d.', row_item_get_index(obj));
      gtk_label_set_text(GTK_LABEL(lab), s);
      g_free(s);
    end;
    1: begin
      entry := gtk_list_item_get_child(list_item);
      gtk_editable_set_text(GTK_EDITABLE(entry), row_item_get_text(obj));
      g_signal_connect(entry, 'changed', G_CALLBACK(@entry_changed_cb), obj);
    end;
  end;
end;

procedure unbind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  col: Tgint absolute user_data;
  entry: PGtkWidget;
  obj: PRowItem;
begin
  case col of
    0: begin
    end;
    1: begin
      entry := gtk_list_item_get_child(list_item);
      obj := PRowItem(gtk_list_item_get_item(list_item));
      g_signal_handlers_disconnect_by_func(entry, @entry_changed_cb, obj);
    end;
  end;
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin

end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin

end;


procedure scroll_changed_cb(adjustment: PGtkAdjustment; user_data: Tgpointer); cdecl;
var
  box: PGtkWidget;
  root: PGtkRoot;
  focus_widget: PGtkWidget;
begin
  box := GTK_WIDGET(user_data);
  root := gtk_widget_get_root(box);

  if root <> nil then begin
    focus_widget := gtk_root_get_focus(root);
    if (focus_widget <> nil) and (gtk_widget_is_ancestor(focus_widget, box)) then begin
      gtk_root_set_focus(root, nil);
    end;
  end;
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
  vadj, hadj: PGtkAdjustment;
  s: Pgchar;
  item: PRowItem;
const
  ColTitles: array of Pgchar = ('Index', 'Entry');
begin
  // === Liste befüllen
  store := g_list_store_new(row_item_get_type);
  for i := 0 to 15 do begin
    s := g_strdup_printf('Eintrag %d', i);
    item := row_item_new(i, s);
    g_list_store_append(store, item);
    g_object_unref(item);
    g_free(s);
  end;

  // ====
  Result := g_object_new(column_view_box_get_type, nil);
  gtk_orientable_set_orientation(GTK_ORIENTABLE(Result), GTK_ORIENTATION_VERTICAL);

  scrolled_window := gtk_scrolled_window_new;
  gtk_widget_set_vexpand(scrolled_window, True);
  gtk_box_append(GTK_BOX(Result), scrolled_window);

  vadj := gtk_scrolled_window_get_vadjustment(GTK_SCROLLED_WINDOW(scrolled_window));
  g_signal_connect(vadj, 'value-changed', G_CALLBACK(@scroll_changed_cb), Result);

  hadj := gtk_scrolled_window_get_hadjustment(GTK_SCROLLED_WINDOW(scrolled_window));
  g_signal_connect(hadj, 'value-changed', G_CALLBACK(@scroll_changed_cb), Result);

  sel := gtk_single_selection_new(G_LIST_MODEL(store));
  cv := gtk_column_view_new(GTK_SELECTION_MODEL(sel));
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), cv);

  for i := 0 to Length(ColTitles) - 1 do begin
    factory := gtk_signal_list_item_factory_new();
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));

    col := gtk_column_view_column_new('Editierbare Felder', factory);

    gtk_column_view_column_set_expand(col, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(cv), col);

    g_object_unref(col);
  end;

  btn := gtk_button_new_with_label('Daten in Konsole speichern');
  g_signal_connect(btn, 'clicked', G_CALLBACK(@save_cp), store);
  gtk_box_append(GTK_BOX(Result), btn);
end;

end.
