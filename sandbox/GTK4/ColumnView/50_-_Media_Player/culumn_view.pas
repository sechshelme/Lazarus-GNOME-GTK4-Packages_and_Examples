unit culumn_view;

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst,
  LoadTitle, Streamer;

var
  IsChange: boolean = False;
  changed_handler_id: Tgulong;
  SekStream: PStreamer = nil;
  PriStream: PStreamer = nil;

const
  CFTime = 13 * 1000; // 3s
  FITime = CFTime;
  FATime = FITime;

  scaleObjectKey = 'scale-widget';
  VUObjectKey = 'VU-widget';

function Create_ListBoxWidget: PGtkWidget;

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

const
  ColTitles: array of Pgchar = (
    'Index',
    'Titel',
    'Dauer');

function timerFunc(user_data: Tgpointer): Tgboolean; cdecl;
var
  column_view: PGtkColumnView absolute user_data;
  scale: PGtkWidget = nil;
  VU_Meter: PGtkWidget = nil;
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

begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
  Count := g_list_model_get_n_items(list_model);

  selected := gtk_selection_model_get_selection(selection_model);
  if not gtk_bitset_is_empty(selected) then begin
    index := gtk_bitset_get_nth(selected, 0);
  end;

  VU_Meter := g_object_get_data(G_OBJECT(column_view), VUObjectKey);
  scale := g_object_get_data(G_OBJECT(column_view), scaleObjectKey);

  adjustment := gtk_range_get_adjustment(GTK_RANGE(scale));
  g_signal_handler_block(scale, changed_handler_id);

  if PriStream <> nil then begin
    if IsChange then begin
      PriStream.Position := Round(gtk_adjustment_get_value(adjustment));
      IsChange := False;
    end else begin
      SPos := PriStream.Position;
      SDur := PriStream.Duration;
      gtk_adjustment_set_upper(adjustment, SDur);
      gtk_adjustment_set_value(adjustment, SPos);

      //        PlayPanel.DurationValueLabel.Caption := GstClockToStr(SDur);
      //        PlayPanel.PositionValueLabel.Caption := GstClockToStr(SPos);

      PriStream.Volume := clamp01(PriStream.Position / FITime);

      if PriStream.Duration > 0 then begin
        if PriStream.isEnd or (PriStream.Duration - PriStream.Position < CFTime) then begin
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
            PriStream.Create(song^.Titel, VU_Meter);
            g_object_unref(item_obj);
            gtk_selection_model_select_item(selection_model, index2, True);
          end;
        end;
      end;
    end;
  end;

  if SekStream <> nil then begin
    if SekStream.Duration > 0 then begin
      SekStream.Volume := clamp01((SekStream.Duration - SekStream.Position) / FITime);
    end;

    if SekStream.isEnd then begin
      SekStream.Destroy;
    end;
  end;
  //    with SongListPanel do begin
  //      Lab_Track_Value.Caption := IntToStr(ListView.ItemIndex + 1) + '/' + ListView.Items.Count.ToString;
  //    end;

  g_signal_handler_unblock(scale, changed_handler_id);
  Result := G_SOURCE_CONTINUE;
end;

procedure action_cp(action: PGSimpleAction; {%H-}parameter: PGVariant; user_data: Tgpointer); cdecl;
var
  action_name: string;
  column_view: PGtkColumnView absolute user_data;
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  Count: Tguint;
  index: Tgint = -1;
  selected: PGtkBitset;
  item_obj, item_obj2: PGObject;
  song: PSong = nil;

  VU_Meter: PGtkWidget = nil;
  scale: PGtkWidget = nil;
  adjustment: PGtkAdjustment;
  index2: Tgint;
begin
  VU_Meter := g_object_get_data(G_OBJECT(column_view), VUObjectKey);
  scale := g_object_get_data(G_OBJECT(column_view), scaleObjectKey);

  adjustment := gtk_range_get_adjustment(GTK_RANGE(scale));

  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action, Name: "%s"'#10, Pgchar(action_name));

  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
  Count := g_list_model_get_n_items(list_model);

  selected := gtk_selection_model_get_selection(selection_model);
  if not gtk_bitset_is_empty(selected) then begin
    index := gtk_bitset_get_nth(selected, 0);
    item_obj := g_list_model_get_item(list_model, index);
    song := g_object_get_data(item_obj, songObjectKey);
  end;

  case action_name of
    'listbox.play': begin
      if PriStream = nil then begin
        if Count > 0 then begin
          PriStream.Create(song^.Titel, VU_Meter);
        end;
      end else begin
        PriStream.Play;
      end;
    end;
    'listbox.pause': begin
      if PriStream <> nil then begin
        PriStream.Pause;
      end;
    end;
    'listbox.stop': begin
      WriteLn('stop');
      if PriStream <> nil then begin
        PriStream.Stop;
        PriStream.Destroy;
        gtk_adjustment_set_value(adjustment, 0);
        gtk_adjustment_set_upper(adjustment, 1000);
      end;
    end;
    'listbox.append': begin
      //      LoadTitles(G_LIST_STORE(list_model), '/home/tux/Schreibtisch/sound');
      LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos');
      LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Diverses/Games/The Witcher, Pt 3 Wild Hunt');

      //      LoadTitles(G_LIST_STORE(list_model), '/home/tux/Schreibtisch/sound/midi');
    end;
    'listbox.remove': begin
      if index >= 0 then begin
        g_list_store_remove(G_LIST_STORE(list_model), index);
      end;
    end;
    'listbox.removeall': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
    end;
    'listbox.next': begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if index >= 0 then  begin
          if index >= Count - 1 then begin
            index2 := 0;
          end else begin
            index2 := index + 1;
          end;

          gtk_selection_model_select_item(selection_model, index2, True);
          if PriStream.isPlayed then begin
            item_obj2 := g_list_model_get_item(list_model, index2);
            song := g_object_get_data(item_obj2, songObjectKey);
            PriStream.Destroy;
            PriStream.Create(song^.Titel, VU_Meter);
            g_object_unref(item_obj2);
          end;
        end;
      end;
    end;
    'listbox.prev': begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if PriStream.Position > 2000 then begin
          PriStream.Position := 0;
        end else begin
          if index = 0 then begin
            index2 := Count - 1;
          end else begin
            index2 := index - 1;
          end;

          gtk_selection_model_select_item(selection_model, index2, True);
          if PriStream.isPlayed then begin
            item_obj2 := g_list_model_get_item(list_model, index2);
            song := g_object_get_data(item_obj2, songObjectKey);
            PriStream.Destroy;
            PriStream.Create(song^.Titel, VU_Meter);
            g_object_unref(item_obj2);
          end;
        end;
      end;
    end;
    'listbox.up': begin
      if index > 0 then begin
        g_list_store_remove(G_LIST_STORE(list_model), index);
        g_list_store_insert(G_LIST_STORE(list_model), index - 1, item_obj);
        gtk_selection_model_select_item(selection_model, index - 1, True);
      end;
    end;
    'listbox.down': begin
      if (index >= 0) and (index < Count - 1) then begin
        g_list_store_remove(G_LIST_STORE(list_model), index);
        g_list_store_insert(G_LIST_STORE(list_model), index + 1, item_obj);
        gtk_selection_model_select_item(selection_model, index + 1, True);
      end;
    end;
    else begin
      g_printf('Unbekannte Action, Name: "%s"'#10, Pgchar(action_name));
    end;
  end;

  if not gtk_bitset_is_empty(selected) then begin
    g_object_unref(item_obj);
  end;

  gtk_bitset_unref(selected);
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
  label_: PGtkWidget;
  item_obj: PGObject;
  song: PSong;
  buffer: Pgchar;
begin
  label_ := gtk_list_item_get_child(list_item);
  item_obj := gtk_list_item_get_item(list_item);
  song := g_object_get_data(item_obj, songObjectKey);
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
  gtk_label_set_text(GTK_LABEL(label_), buffer);
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
  WriteLn('position doubleclick: ', position);

  if (PriStream <> nil) and (PriStream.isPlayed) then begin
    action := g_action_map_lookup_action(G_ACTION_MAP(app), 'listbox.stop');
    if action <> nil then begin
      g_action_activate(action, nil);
      WriteLn('action stop found');
    end;
  end;

  action := g_action_map_lookup_action(G_ACTION_MAP(app), 'listbox.play');
  if action <> nil then begin
    g_action_activate(action, nil);
    WriteLn('action play found');
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

function Create_ListBoxWidget: PGtkWidget;
const
  entries: array of Pgchar = (
    'listbox.play',
    'listbox.stop',
    'listbox.pause',
    //    'listbox.forward',
    //    'listbox.backward',

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
  idle_id: Tguint;
begin
  SekStream := nil;
  PriStream := nil;

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

  idle_id := g_timeout_add(100, @timerFunc, column_view);
  //  idle_id := g_idle_add(@timerFunc, column_view);
  g_signal_connect(column_view, 'destroy', G_CALLBACK(@on_columnview_destroy), GINT_TO_POINTER(idle_id));

  Result := column_view;
end;


end.
