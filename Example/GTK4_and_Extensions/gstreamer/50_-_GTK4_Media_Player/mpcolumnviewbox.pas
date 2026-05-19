unit MPColumnViewBox;

interface

uses
  fp_glib2, fp_GTK4, fp_pango, fp_gst,
  Common, MPStreamer;

type
  PMPColumnViewBox = type Pointer;
  PMPColumnViewBoxClass = type Pointer;

function mp_column_view_box_get_type: TGType;
function mp_column_view_box_new(sharedWidgets: PSharedWidget): PGTKWidget;

procedure mp_column_view_box_remove(w: PMPColumnViewBox; index: Tguint);
procedure mp_column_view_box_remove_all(w: PMPColumnViewBox);

procedure mp_column_view_box_up(w: PMPColumnViewBox);
procedure mp_column_view_box_down(w: PMPColumnViewBox);



function mp_column_view_box_get_selection_model(w: PMPColumnViewBox): PGtkSelectionModel;

procedure mp_column_view_box_set_data(w: PMPColumnViewBox; i: integer);
function mp_column_view_box_get_data(w: PMPColumnViewBox): integer;

implementation

// ==== private

type
  TInstPriv = record
    columnView: PGtkWidget;
    selection_model: PGtkSelectionModel;
    list_model: PGListModel;

    meineDaten: integer;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
    meineDaten: Pointer;
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

// ======


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
  lab: PGtkWidget;
  item_obj: PGObject;
  song: PSong;
  buffer: Pgchar = nil;
begin
  lab := gtk_list_item_get_child(list_item);
  item_obj := gtk_list_item_get_item(list_item);

  if item_obj = nil then begin
    exit;
  end;

  song := g_object_get_data(item_obj, songObjectKey);

  case col of
    0: begin
      buffer := g_strdup_printf('%d', gtk_list_item_get_position(list_item) + 1);
    end;
    1: begin
      if song <> nil then begin
        buffer := g_strdup_printf('%s', song^.FullPath);
      end;
    end;
    2: begin
      if (song <> nil) and (song^.Duration <> GST_CLOCK_TIME_NONE) then begin
        buffer := g_strdup_printf('%s', pchar(GstClockToStr(song^.Duration)));
      end else begin
        buffer := g_strdup_printf('--:--');
      end;
    end;
  end;

  gtk_label_set_text(GTK_LABEL(lab), buffer);
  g_free(buffer);
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


procedure on_row_activated_cb(view: PGtkColumnView; position: Tgint; user_data: Tgpointer); cdecl;
var
  app: PGApplication;
  action: PGAction;
begin
  app := g_application_get_default;

  if (PriStream <> nil) and (mp_streamer_is_played(PriStream)) then begin
    action := g_action_map_lookup_action(G_ACTION_MAP(app), 'listbox.stop');
    if action <> nil then begin
      g_action_activate(action, nil);
    end;
  end;

  action := g_action_map_lookup_action(G_ACTION_MAP(app), 'listbox.play');
  if action <> nil then begin
    g_action_activate(action, nil);
  end;
end;


// ==== public

function mp_column_view_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_BOX, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'MPColumnViewBox',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_column_view_box_new(sharedWidgets: PSharedWidget): PGTKWidget;
const
  ColTitles: array of Pgchar = ('Index', 'Titel', 'Dauer');
var
  priv: PInstPriv;
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  single_selection: PGtkSingleSelection;
  i: integer;
  len: SizeInt;

begin
  Result := g_object_new(mp_column_view_box_get_type, nil);

  sharedWidgets^.columviewBox := Result;

  priv := GetPriv(Result);

  SekStream := nil;
  PriStream := nil;

  single_selection := gtk_single_selection_new(G_LIST_MODEL(g_list_store_new(G_TYPE_OBJECT)));

  priv^.columnView := gtk_column_view_new(GTK_SELECTION_MODEL(single_selection));

  priv^.selection_model := gtk_column_view_get_model(GTK_COLUMN_VIEW(priv^.columnView));
  priv^.list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(priv^.selection_model));


  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(priv^.columnView), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(priv^.columnView), True);
  g_signal_connect(priv^.columnView, 'activate', G_CALLBACK(@on_row_activated_cb), nil);

  len := Length(ColTitles) - 1;
  for i := 0 to len do begin
    factory := gtk_signal_list_item_factory_new;
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'teardown', G_CALLBACK(@teardown_cb), GINT_TO_POINTER(i));

    column := gtk_column_view_column_new(ColTitles[i], factory);

    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(priv^.columnView), column);

    if i = 1 then  begin
      gtk_column_view_column_set_expand(column, True);
    end;

    g_object_unref(column);
  end;

  gtk_box_append(GTK_BOX(Result), priv^.columnView);
end;

// =====

procedure mp_column_view_box_remove(w: PMPColumnViewBox; index: Tguint);
var
  priv: PInstPriv;
  count: Tguint;
begin
  priv := GetPriv(w);
  count := g_list_model_get_n_items(priv^.list_model);
  if index < count then begin
    g_list_store_remove(G_LIST_STORE(priv^.list_model), index);
  end;
end;

procedure mp_column_view_box_remove_all(w: PMPColumnViewBox);
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  g_list_store_remove_all(G_LIST_STORE(priv^.list_model));
end;

procedure mp_column_view_box_up(w: PMPColumnViewBox);
var
  priv: PInstPriv;
  selected: PGtkBitset;
  index: Tguint;
  item_obj: PGObject = nil;
begin
  priv := GetPriv(w);
  with priv^ do begin
    selected := gtk_selection_model_get_selection(selection_model);
    if not gtk_bitset_is_empty(selected) then begin
      index := gtk_bitset_get_nth(selected, 0);
      if index > 0 then begin
        item_obj := g_list_model_get_item(list_model, index);
        g_list_store_remove(G_LIST_STORE(list_model), index);
        g_list_store_insert(G_LIST_STORE(list_model), index - 1, item_obj);
        gtk_selection_model_select_item(selection_model, index - 1, True);
      end;
    end;
  end;
end;

procedure mp_column_view_box_down(w: PMPColumnViewBox);
var
  priv: PInstPriv;
  selected: PGtkBitset;
  index, Count: Tguint;
  item_obj: PGObject = nil;
begin
  priv := GetPriv(w);
  with priv^ do begin
    selected := gtk_selection_model_get_selection(selection_model);
    Count := g_list_model_get_n_items(list_model);
    if not gtk_bitset_is_empty(selected) then begin
      index := gtk_bitset_get_nth(selected, 0);
      if (index >= 0) and (index < Count - 1) then begin
        item_obj := g_list_model_get_item(list_model, index);
        g_list_store_remove(G_LIST_STORE(list_model), index);
        g_list_store_insert(G_LIST_STORE(list_model), index + 1, item_obj);
        gtk_selection_model_select_item(selection_model, index + 1, True);
      end;
    end;
  end;
end;

function mp_column_view_box_get_selection_model(w: PMPColumnViewBox): PGtkSelectionModel;

var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  Result := gtk_column_view_get_model(GTK_COLUMN_VIEW(priv^.columnView));
end;

procedure mp_column_view_box_set_data(w: PMPColumnViewBox; i: integer);
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  priv^.meineDaten := i;
end;

function mp_column_view_box_get_data(w: PMPColumnViewBox): integer;
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  Result := priv^.meineDaten;
end;

end.
