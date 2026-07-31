unit ColumnViewSortetWidget;

interface

uses
  fp_glib2,
  fp_GTK4,
  ItemsObject;

type
  PColumnViewSortetWidget = type Pointer;
  PColumnViewSortetWidgetClass = type Pointer;

function column_view_sortet_widget_get_type: TGType;
function column_view_sortet_widget_new: PGTKWidget;
procedure column_view_sortet_widget_add_item(w: PColumnViewSortetWidget; item: PCVItem);

implementation

type
  TInstPriv = record
    columnView: PGtkWidget;
    selection_model: PGtkSelectionModel;
    list_model: PGListModel;
    count, index: Tguint;
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
    count := 0;
    index := 0;
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
  item_obj: PGObject;
  buffer: Pgchar = nil;
begin
  lab := gtk_list_item_get_child(list_item);
  item_obj := gtk_list_item_get_item(list_item);
  if item_obj = nil then begin
    exit;
  end;

  case col of
    0: begin
      buffer := cv_item_get_col0(item_obj);
    end;
    1: begin
      buffer := cv_item_get_col1(item_obj);
    end;
  end;

  gtk_label_set_text(GTK_LABEL(lab), buffer);
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
  item_a: PCVItem absolute a;
  item_b: PCVItem absolute b;
  ia, ib: pchar;
begin
  if column_index = 0 then begin
    ia := cv_item_get_col0(item_a);
    ib := cv_item_get_col0(item_b);
  end;
  if column_index = 1 then begin
    ia := cv_item_get_col1(item_a);
    ib := cv_item_get_col1(item_b);
  end;

  Result := g_strcmp0(ia, ib);
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
  ColTitles: array of Pgchar = ('Number0', 'Number1');
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

procedure column_view_sortet_widget_add_item(w: PColumnViewSortetWidget; item: PCVItem);
var
  priv: PInstPriv;
  child_model: PGListModel;
begin
  priv := GetPriv(w);
  if priv^.list_model <> nil then  begin
    child_model := gtk_sort_list_model_get_model(GTK_SORT_LIST_MODEL(priv^.list_model));
    if child_model <> nil then  begin
      g_list_store_append(G_LIST_STORE(child_model), item);
    end;
  end;
end;

end.
