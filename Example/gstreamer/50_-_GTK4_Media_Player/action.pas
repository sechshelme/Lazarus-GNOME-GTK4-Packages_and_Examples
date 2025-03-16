unit Action;

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst,
  Common,
  LoadTitle, Streamer, XML_Tools, LoadSaveSongs;

var
  SekStream: PStreamer = nil;
  PriStream: PStreamer = nil;

const
  CFTime = 13 * 1000 * G_USEC_PER_SEC; // 3s
  FITime = CFTime;
  FATime = FITime;

const
  sharedWidgetKey = 'shared-widget';

type
  TSharedWidget = record
    main_Window,
    LabelPosition,
    LabelDuration,
    VUMeter,
    scale: PGtkWidget;
    IsChange: boolean;
    scale_changed_id: Tgulong;
  end;
  PSharedWidget = ^TSharedWidget;

procedure CreateActions(column_view: PGtkWidget);


implementation

procedure action_cp(action: PGSimpleAction; {%H-}parameter: PGVariant; user_data: Tgpointer); cdecl;
var
  column_view: PGtkColumnView absolute user_data;
  sharedWidget: PSharedWidget;
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  Count: Tguint;
  index: Tgint = -1;
  selected: PGtkBitset;
  item_obj, item_obj2: PGObject;
  song: PSong = nil;
  adjustment: PGtkAdjustment;
  index2: Tgint;
  action_name: string;
begin
  sharedWidget := g_object_get_data(G_OBJECT(column_view), sharedWidgetKey);

  adjustment := gtk_range_get_adjustment(GTK_RANGE(sharedWidget^.scale));

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
    'listbox.save': begin
      Save_Songs(sharedWidget^.main_Window, G_LIST_STORE(list_model));
    end;
    'listbox.open': begin
      Open_Songs(sharedWidget^.main_Window, G_LIST_STORE(list_model));
    end;
    'listbox.play': begin
      if PriStream = nil then begin
        if Count > 0 then begin
          PriStream.Create(song^.FullPath, sharedWidget^.VUMeter);
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
      //      LoadTitles(G_LIST_STORE(list_model), '/home/tux/Schreibtisch/sound/midi');
//      LoadTitles(G_LIST_STORE(list_model), '/home/tux/Schreibtisch/sound/mod');

      //      LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos');
      //LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Diverses/Games/The Witcher, Pt 3 Wild Hunt');
      //
      //      LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Black Bear Roa');
            LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Greatest Hits');
      //      LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/MCcall & Company');
      //LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Roses For Mama');
      //LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Rubber Duck');
      //LoadTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Wolf Creek Pass');
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
            PriStream.Create(song^.FullPath, sharedWidget^.VUMeter);
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
            PriStream.Create(song^.FullPath, sharedWidget^.VUMeter);
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

procedure CreateActions(column_view: PGtkWidget);
const
  entries: array of Pgchar = (
    'listbox.save',
    'listbox.open',
    'listbox.play',
    'listbox.stop',
    'listbox.pause',
    'listbox.next',
    'listbox.prev',
    'listbox.append',
    'listbox.remove',
    'listbox.removeall',
    'listbox.up',
    'listbox.down');
var
  i: integer;
  action_: PGSimpleAction;
  app: PGApplication;
begin
  app := g_application_get_default;

  for i := 0 to Length(entries) - 1 do begin
    action_ := g_simple_action_new(entries[i], nil);
    g_signal_connect(action_, 'activate', G_CALLBACK(@action_cp), column_view);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action_));
    g_object_unref(action_);
  end;
end;

end.
