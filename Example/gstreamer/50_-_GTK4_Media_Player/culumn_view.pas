unit culumn_view;

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst,
  Common,
  Action,
  LoadTitle, Streamer, XML_Tools, LoadSaveSongs;

procedure Create_ColumnView(sharedWidgets: PSharedWidget);

implementation

// ==== private

function clamp01(v: single): single; inline;
begin
  if v < 0.0 then begin
    Result := 0.0;
  end else if v > 1.0 then begin
    Result := 1.0;
  end else begin
    Result := v;
  end;
end;

function timerFunc_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  sharedWidgets: PSharedWidget absolute user_data;
  adjustment: PGtkAdjustment;
  SPos, SDur: TGstClockTime;
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  Count: Tguint;
  index: Tgint = -1;
  index2: Tgint;
  selected: PGtkBitset;

  item_obj: PGObject;
  song: PSong = nil;
  s: string;

begin
  selection_model := gtk_column_view_get_model(GTK_COLUMN_VIEW( sharedWidgets^.columnView));
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
  Count := g_list_model_get_n_items(list_model);

  selected := gtk_selection_model_get_selection(selection_model);
  if not gtk_bitset_is_empty(selected) then begin
    index := gtk_bitset_get_nth(selected, 0);
  end;

  adjustment := gtk_range_get_adjustment(GTK_RANGE(sharedWidgets^.scale));
  g_signal_handler_block(sharedWidgets^.scale, sharedWidgets^.scale_changed_id);

  if PriStream <> nil then begin
    if sharedWidgets^.IsChange then begin
      PriStream.Position := Round(gtk_adjustment_get_value(adjustment));
      sharedWidgets^.IsChange := False;
    end else begin
      SPos := PriStream.Position;
      SDur := PriStream.Duration;
      gtk_adjustment_set_upper(adjustment, SDur);
      gtk_adjustment_set_value(adjustment, SPos);

      s := GstClockToStr(SPos);
      gtk_label_set_label(GTK_LABEL(sharedWidgets^.LabelPosition), PChar(s));

      if SDur = GST_CLOCK_TIME_NONE then begin
        s := '--.--';
      end else begin
        s := GstClockToStr(SDur);
      end;
      gtk_label_set_label(GTK_LABEL(sharedWidgets^.LabelDuration), PChar(s));

      if SPos = GST_CLOCK_TIME_NONE then begin
        PriStream.Volume := 0.0;
      end else begin
        PriStream.Volume := clamp01(SPos / FITime);
      end;

      if PriStream.Duration <> GST_CLOCK_TIME_NONE then begin
        if PriStream.isEnd or (PriStream.Duration - SPos < CFTime) then begin
          if SekStream <> nil then begin
            SekStream.Destroy;
          end;
          SekStream := PriStream;
          SekStream.SetLevelWidget(nil);

          if index >= 0 then begin
            if index >= Count - 1 then begin
              index2 := 0;
            end else begin
              index2 := index + 1;
            end;
            item_obj := g_list_model_get_item(list_model, index2);
            song := g_object_get_data(item_obj, songObjectKey);
            gtk_adjustment_set_upper(adjustment, 0);
            gtk_adjustment_set_value(adjustment, 0);
            PriStream.Create(song^.FullPath, sharedWidgets^.VUMeter);
            g_object_unref(item_obj);
            gtk_selection_model_select_item(selection_model, index2, True);
          end;
        end;
      end;
    end;
  end;

  if SekStream <> nil then begin
    if SekStream.Duration <> GST_CLOCK_TIME_NONE then begin
      SekStream.Volume := clamp01((SekStream.Duration - SekStream.Position) / FITime);
    end;

    if SekStream.isEnd then begin
      SekStream.Destroy;
    end;
  end;
  //    with SongListPanel do begin
  //      Lab_Track_Value.Caption := IntToStr(ListView.ItemIndex + 1) + '/' + ListView.Items.Count.ToString;
  //    end;

  g_signal_handler_unblock(sharedWidgets^.scale, sharedWidgets^.scale_changed_id);
  Result := G_SOURCE_CONTINUE;
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
  lab: PGtkWidget;
  item_obj: PGObject;
  song: PSong;
  buffer: Pgchar = nil;
begin
  lab := gtk_list_item_get_child(list_item);
  item_obj := gtk_list_item_get_item(list_item);
  song := g_object_get_data(item_obj, songObjectKey);
  case col of
    0: begin
      buffer := g_strdup_printf('%d', gtk_list_item_get_position(list_item));
    end;
    1: begin
      buffer := g_strdup_printf('%s', song^.FullPath);
    end;
    2: begin
      if song^.Duration = GST_CLOCK_TIME_NONE then begin
        buffer := g_strdup_printf('(error)');
      end else begin
        buffer := g_strdup_printf('%s', PChar(GstClockToStr(song^.Duration)));
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

  if (PriStream <> nil) and (PriStream.isPlayed) then begin
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

procedure on_columnview_destroy(widget: PGtkWidget; user_data: Tgpointer);
var
  idle_id: Tguint absolute user_data;
begin
  if idle_id > 0 then begin
    g_source_remove(idle_id);
  end;
  if PriStream <> nil then begin
    PriStream.Destroy;
  end;
  if SekStream <> nil then begin
    SekStream.Destroy;
  end;
end;

// ==== public

procedure Create_ColumnView(sharedWidgets: PSharedWidget);
const
  ColTitles: array of Pgchar = ('Index', 'Titel', 'Dauer');
var
  factory: PGtkListItemFactory;
  column: PGtkColumnViewColumn;
  list_store: PGListStore;
  single_selection: PGtkSingleSelection;
  app: PGApplication;
  i: integer;
  len: SizeInt;
  action: PGSimpleAction;
  idle_id: Tguint;
begin
  SekStream := nil;
  PriStream := nil;

  app := g_application_get_default;

  list_store := g_list_store_new(G_TYPE_OBJECT);
  single_selection := gtk_single_selection_new(G_LIST_MODEL(list_store));

  sharedWidgets^.columnView := gtk_column_view_new(GTK_SELECTION_MODEL(single_selection));
  gtk_column_view_set_show_row_separators(GTK_COLUMN_VIEW(sharedWidgets^.columnView), True);
  gtk_column_view_set_show_column_separators(GTK_COLUMN_VIEW(sharedWidgets^.columnView), True);
  g_signal_connect(sharedWidgets^.columnView, 'activate', G_CALLBACK(@on_row_activated_cb), nil);

  len := Length(ColTitles) - 1;
  for i := 0 to len do begin
    factory := gtk_signal_list_item_factory_new;
    g_signal_connect(factory, 'setup', G_CALLBACK(@setup_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'bind', G_CALLBACK(@bind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'unbind', G_CALLBACK(@unbind_cb), GINT_TO_POINTER(i));
    g_signal_connect(factory, 'teardown', G_CALLBACK(@teardown_cb), GINT_TO_POINTER(i));

    column := gtk_column_view_column_new(ColTitles[i], factory);

    gtk_column_view_column_set_resizable(column, True);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(sharedWidgets^.columnView), column);

    if i = 1 then  begin
      gtk_column_view_column_set_expand(column, True);
    end;

    g_object_unref(column);
  end;

  CreateActions(sharedWidgets);

  idle_id := g_timeout_add(100, @timerFunc_cp, sharedWidgets);
  g_signal_connect(sharedWidgets^.columnView, 'destroy', G_CALLBACK(@on_columnview_destroy), GINT_TO_POINTER(idle_id));
end;


end.
