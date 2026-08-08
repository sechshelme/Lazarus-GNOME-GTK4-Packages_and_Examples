unit ColumnViewWidget;

interface

uses
  fp_glib2,
  fp_GTK4;

type
  PColumnViewWidget = type Pointer;
  PColumnViewWidgetClass = type Pointer;

function column_view_sortet_widget_get_type: TGType;
function column_view_sortet_widget_new: PGTKWidget;
procedure column_view_sortet_widget_add_item(w: PColumnViewWidget; s0, s1, s2: pchar);

implementation

// ==== ItemObject

type
  TItemObject = record
    parent_instance: TGObject;
    index: Tgint;
    col0, col1, col2: Pgchar;
  end;
  PItemObject = ^TItemObject;

  TItemObjectClass = record
    parent_class: TGObjectClass;
  end;
  PItemObjectClass = ^TItemObjectClass;

var
  item_parent_class: Tgpointer = nil;

procedure item_finalize_cp(obj: PGObject); cdecl;
var
  item: PItemObject absolute obj;
begin
  with item^ do begin
    if col0 <> nil then begin
      g_free(col0);
    end;
    if col1 <> nil then begin
      g_free(col1);
    end;
    if col2 <> nil then begin
      g_free(col2);
    end;
  end;
  G_OBJECT_CLASS(item_parent_class)^.finalize(obj);
end;

procedure item_class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @item_finalize_cp;
  item_parent_class := g_type_class_peek_parent(g_class);
end;

procedure item_init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  item: PItemObject absolute instance;
begin
  with item^ do begin
    index := 0;
    col0 := nil;
    col1 := nil;
    col2 := nil;
  end;
end;

function cv_item_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(G_TYPE_OBJECT, 'ColumnViewItems', SizeOf(TItemObjectClass), @item_class_init_cp, SizeOf(TItemObject), @item_init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function cv_item_new(index: Tgint; c0, c1, c2: Pgchar): PItemObject;
begin
  Result := g_object_new(cv_item_get_type, nil);
  Result^.index := index;
  Result^.col0 := g_strdup(c0);
  Result^.col1 := g_strdup(c1);
  Result^.col2 := g_strdup(c2);
end;


// ==== ColumnView

type
  TInstPriv = record
    columnView: PGtkWidget;
    selection_model: PGtkSelectionModel;
    list_model: PGListModel;
    index: Tgint;
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

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
  end;
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
  col: Tgint absolute user_data;
  lab: PGtkWidget;
  item_obj: PItemObject;
  buffer: Pgchar = nil;
begin
  lab := gtk_list_item_get_child(list_item);
  item_obj := gtk_list_item_get_item(list_item);
  if item_obj = nil then begin
    exit;
  end;

  case col of
    0: begin
      buffer := g_strdup_printf('%d', item_obj^.index);
      gtk_label_set_text(GTK_LABEL(lab), buffer);
      g_free(buffer);
    end;
    1: begin
      buffer := item_obj^.col0;
      gtk_label_set_text(GTK_LABEL(lab), buffer);
    end;
    2: begin
      buffer := item_obj^.col1;
      gtk_label_set_text(GTK_LABEL(lab), buffer);
    end;
    3: begin
      buffer := item_obj^.col2;
      gtk_label_set_text(GTK_LABEL(lab), buffer);
    end;
  end;
end;

procedure unbind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
var
  label_: PGtkWidget;
begin
  label_ := gtk_list_item_get_child(list_item);
  gtk_label_set_text(GTK_LABEL(label_), nil);
end;

procedure teardown_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
begin
  gtk_list_item_set_child(list_item, nil);
end;

function compareFunc(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
var
  column_index: Tgint absolute user_data;
  item_a: PItemObject absolute a;
  item_b: PItemObject absolute b;
  ia, ib: pchar;
begin
  if column_index = 0 then begin
    Result := item_a^.index - item_b^.index;
  end;
  if column_index = 1 then begin
    ia := item_a^.col0;
    ib := item_b^.col0;
    Result := g_strcmp0(ia, ib);
  end;
  if column_index = 2 then begin
    ia := item_a^.col1;
    ib := item_b^.col1;
    Result := g_strcmp0(ia, ib);
  end;
  if column_index = 3 then begin
    ia := item_a^.col2;
    ib := item_b^.col2;
    Result := g_strcmp0(ia, ib);
  end;
end;

// ==== public

function column_view_sortet_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_BOX, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'ColumnViewSortetWidget',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function column_view_sortet_widget_new: PGTKWidget;
const
  ColTitles: array of Pgchar = ('Index', 'Name', 'Typ', 'Homepage');
var
  priv: PInstPriv;
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  column_sorter: PGtkSorter;
  view_sorter: PGtkSorter;
  sort_model: PGtkSortListModel;
  single_selection: PGtkSingleSelection;
  scroll_window: PGtkWidget;
  store: PGListStore;
  i: integer;
begin
  Result := g_object_new(column_view_sortet_widget_get_type, nil);
  priv := GetPriv(Result);

  priv^.columnView := gtk_column_view_new(nil);
  store := g_list_store_new(G_TYPE_OBJECT);
  view_sorter := g_object_ref(gtk_column_view_get_sorter(GTK_COLUMN_VIEW(priv^.columnView)));
  sort_model := gtk_sort_list_model_new(G_LIST_MODEL(store), view_sorter);
  single_selection := gtk_single_selection_new(G_LIST_MODEL(sort_model));
  gtk_column_view_set_model(GTK_COLUMN_VIEW(priv^.columnView), GTK_SELECTION_MODEL(single_selection));
  priv^.selection_model := GTK_SELECTION_MODEL(single_selection);
  priv^.list_model := G_LIST_MODEL(sort_model);
  g_object_unref(single_selection);

  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(priv^.columnView), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(priv^.columnView), True);

  scroll_window := gtk_scrolled_window_new;
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scroll_window), priv^.columnView);
  gtk_scrolled_window_set_has_frame(GTK_SCROLLED_WINDOW(scroll_window), True);
  gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scroll_window), GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC);
  gtk_widget_set_vexpand(scroll_window, True);
  gtk_widget_set_hexpand(scroll_window, True);

  for i := 0 to Length(ColTitles) - 1 do begin
    factory := gtk_signal_list_item_factory_new;
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'teardown', G_CALLBACK(@teardown_cb), GINT_TO_POINTER(i));

    column := gtk_column_view_column_new(ColTitles[i], factory);
    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(priv^.columnView), column);

    column_sorter := GTK_SORTER(gtk_custom_sorter_new(@compareFunc, GINT_TO_POINTER(i), nil));
    gtk_column_view_column_set_sorter(column, column_sorter);
    g_object_unref(column_sorter);

    if i = 1 then  begin
      gtk_column_view_column_set_expand(column, True);
    end;
    g_object_unref(column);
  end;

  gtk_box_append(GTK_BOX(Result), scroll_window);
end;

procedure column_view_sortet_widget_add_item(w: PColumnViewWidget; s0, s1,  s2: pchar);
var
  priv: PInstPriv;
  child_model: PGListModel;
  item: PItemObject;
begin
  priv := GetPriv(w);
  if priv^.list_model <> nil then  begin
    item := cv_item_new(priv^.index,s0, s1, s2);
    Inc(priv^.index);
    child_model := gtk_sort_list_model_get_model(GTK_SORT_LIST_MODEL(priv^.list_model));
    if child_model <> nil then  begin
      g_list_store_append(G_LIST_STORE(child_model), PItemObject(item));
    end;
    g_object_unref(item);
  end;
end;

end.
