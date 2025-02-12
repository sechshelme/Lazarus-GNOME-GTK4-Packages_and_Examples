unit culumn_view;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst,
  LoadTitle, Streamer;

var
    IsChange:Boolean=False;
    changed_handler_id: Tgulong;
const
    CFTime = 13 * 1000; // 3s
    FITime = CFTime;
    FATime = FITime;


function Create_ListBoxWidget: PGtkWidget;

implementation

// ==== private

const
  ColTitles: array of Pgchar = (
    'Index',
    'Titel',
    'Dauer');

var
  SekStream:TStreamer=nil;
  PriStream: TStreamer=nil;

procedure LoadNewMusic(const titel: string; freeed: boolean);
begin
  if freeed and (PriStream <> nil) then begin
    PriStream.Free;
    PriStream := nil;
  end;
  PriStream := TStreamer.Create(titel);
  PriStream.Volume := 0.0;
  //  PriStream.OnLevelChange := @PriStreamLevelChange;

  //  PlayPanel.TrackBar.Max := 0;
  //  PlayPanel.TrackBar.Position := 0;
  PriStream.Play;
end;


  function timerFunc(user_data: Tgpointer): Tgboolean; cdecl;
  var
    column_view: PGtkColumnView absolute user_data;
    scale: PGtkWidget=nil;
    adjustment: PGtkAdjustment;
    SPos, SDur: TGstClockTime;
    volume: Single;
    selection_model: PGtkSelectionModel;
    list_model: PGListModel;
    Count: Tguint;
    position: Tgint = -1;
    selected: PGtkBitset;

    item_obj2: PGObject;
    song: PSong = nil;
    p: Tgint;

  begin
    selection_model := gtk_column_view_get_model(column_view);
    list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
    Count := g_list_model_get_n_items(list_model);

    selected := gtk_selection_model_get_selection(selection_model);
    if not gtk_bitset_is_empty(selected) then begin
      position := gtk_bitset_get_nth(selected, 0);
    end;


    scale:=g_object_get_data(G_OBJECT(column_view),scaleObjectKey);
    adjustment := gtk_range_get_adjustment(GTK_RANGE(scale));
    g_signal_handler_block(scale, changed_handler_id);


    if (PriStream <> nil) then begin
      if IsChange then begin
        PriStream.Position := Round( gtk_adjustment_get_value(adjustment));
        IsChange := False;
      end else begin
        SPos := PriStream.Position;
        SDur := PriStream.Duration;
        gtk_adjustment_set_upper(adjustment, SDur);
        gtk_adjustment_set_value(adjustment,SPos);

//        PlayPanel.DurationValueLabel.Caption := GstClockToStr(SDur);
//        PlayPanel.PositionValueLabel.Caption := GstClockToStr(SPos);
        volume := PriStream.Position / FITime;
        if volume > 1.0 then begin
          volume := 1.0;
        end;
        if volume < 0.0 then begin
          volume := 0.0;
        end;
        PriStream.Volume := volume;
        if PriStream.Duration > 0 then begin
          if PriStream.isEnd or (PriStream.Duration - PriStream.Position < CFTime) then begin
            if SekStream <> nil then begin
              SekStream.Free;
              SekStream:=nil;;
            end;
            SekStream := PriStream;
            SekStream.OnLevelChange := nil;

            //            if SongListPanel.Next then  begin
            //              LoadNewMusic(SongListPanel.GetTitle, False);
            //            end;

            if (position >= 0) and (position < Count - 1) then  begin
                item_obj2 := g_list_model_get_item(list_model, position + 1);
                song := g_object_get_data(item_obj2, songObjectKey);
                WriteLn('song: ',song^.Titel);
                gtk_adjustment_set_upper(adjustment, 0);
                gtk_adjustment_set_value(adjustment,0);
                LoadNewMusic(song^.Titel, False);
                g_object_unref(item_obj2);
                gtk_selection_model_select_item(selection_model, position + 1, True);
              end;
          end;
        end;
      end;
    end;
    if SekStream <> nil then begin
      if SekStream.Duration > 0 then begin
        volume := (SekStream.Duration - SekStream.Position) / FITime;
        if volume > 1.0 then begin
          volume := 1.0;
        end;
        if volume < 0.0 then begin
          volume := 0.0;
        end;
        SekStream.Volume := volume;
      end;

      if SekStream.isEnd then begin
        WriteLn('ende');
        SekStream.Free;
        SekStream:=nil;;
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
  position: Tgint = -1;
  selected: PGtkBitset;
  item_obj, item_obj2: PGObject;
  song: PSong = nil;

  scale: PGtkWidget=nil;
  adjustment: PGtkAdjustment;
begin
  scale:=g_object_get_data(G_OBJECT(column_view),scaleObjectKey);
  adjustment := gtk_range_get_adjustment(GTK_RANGE(scale));
  WriteLn(GTK_IS_SCALE(scale));

  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action, Name: "%s"'#10, Pgchar(action_name));

  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));
  Count := g_list_model_get_n_items(list_model);

  selected := gtk_selection_model_get_selection(selection_model);
  if not gtk_bitset_is_empty(selected) then begin
    position := gtk_bitset_get_nth(selected, 0);
    item_obj := g_list_model_get_item(list_model, position);
    song := g_object_get_data(item_obj, songObjectKey);
  end;

  case action_name of
    'listbox.play': begin
      if PriStream = nil then begin
        if Count > 0 then begin
          LoadNewMusic(song^.Titel, True);
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
        PriStream.Free;
        PriStream := nil;
        gtk_adjustment_set_value(adjustment,0);
        gtk_adjustment_set_upper(adjustment, 1000);
      end;
    end;
    'listbox.append': begin
      OpenTitel(GTK_COLUMN_VIEW(column_view));
    end;
    'listbox.remove': begin
      if position >= 0 then begin
        g_list_store_remove(G_LIST_STORE(list_model), position);
      end;
    end;
    'listbox.removeall': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
    end;
    'listbox.next': begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if (position >= 0) and (position < Count - 1) then  begin
          gtk_selection_model_select_item(selection_model, position + 1, True);
          if PriStream.isPlayed then begin
            item_obj2 := g_list_model_get_item(list_model, position + 1);
            song := g_object_get_data(item_obj2, songObjectKey);
            LoadNewMusic(song^.Titel, True);
            g_object_unref(item_obj2);
          end;
        end;
      end;
    end;
    'listbox.prev': begin
      if position > 0 then begin
        gtk_selection_model_select_item(selection_model, position - 1, True);
      end;
    end;
    'listbox.up': begin
      if position > 0 then begin
        g_list_store_remove(G_LIST_STORE(list_model), position);
        g_list_store_insert(G_LIST_STORE(list_model), position - 1, item_obj);
        gtk_selection_model_select_item(selection_model, position - 1, True);
      end;
    end;
    'listbox.down': begin
      if (position >= 0) and (position < Count - 1) then begin
        g_list_store_remove(G_LIST_STORE(list_model), position);
        g_list_store_insert(G_LIST_STORE(list_model), position + 1, item_obj);
        gtk_selection_model_select_item(selection_model, position + 1, True);
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
  l: PGtkWidget;
  item_obj: PGObject;
  song: PSong;
  buffer: Pgchar;
begin
  l := gtk_list_item_get_child(list_item);
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
  gtk_label_set_text(GTK_LABEL(l), buffer);
end;

procedure unbind_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
begin
end;

procedure teardown_cb(factory: PGtkSignalListItemFactory; list_item: PGtkListItem; user_data: Tgpointer); cdecl;
begin
end;


procedure on_row_activated_cb(view: PGtkColumnView; position: Tgint; user_data: Tgpointer); cdecl;
begin
  WriteLn('position doubleclick: ', position);
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

  g_timeout_add(100, @timerFunc, column_view);

  Result := column_view;
end;


end.
