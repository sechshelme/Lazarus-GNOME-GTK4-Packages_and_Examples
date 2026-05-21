unit Action;

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst,
  Common, LoadTitle,
  MPStreamer, MPColumnViewBox,
  XML_Tools, LoadSaveSongs;

const
  CFTime = 13 * 1000 * G_USEC_PER_SEC; // 3s
  FITime = CFTime;
  FATime = FITime;

const
  sharedWidgetKey = 'shared-widget';

procedure CreateActions(sharedWidgets: PSharedWidget);


implementation

procedure ChangeSong(box: PGtkWidget);
var
  item_obj: PGObject;
  song: PSong;
begin
  item_obj := mp_column_view_box_get_item(Box);
  song := g_object_get_data(item_obj, songObjectKey);
  gst_clear_object(@PriStream);
  PriStream := mp_streamer_new_from_launch(song^.FullPath);
  g_object_unref(item_obj);
end;

procedure action_cp(action: PGSimpleAction; {%H-}parameter: PGVariant; user_data: Tgpointer); cdecl;
var
  sharedWidgets: PSharedWidget absolute user_data;
  list_model: PGListModel;
  index: Tgint = -1;
  adjustment: PGtkAdjustment;
  action_name: string;
begin
  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action, Name: "%s"'#10, Pgchar(action_name));

  list_model := mp_column_view_box_get_list_model(sharedWidgets^.columviewBox);

  case action_name of
    'listbox.default.flac1': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos');
    end;
    'listbox.default.flac2': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Diverses/Games/The Witcher, Pt 3 Wild Hunt');
    end;
    'listbox.default.flac3': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Blu-ray Audio/2L/2L 050 Trondheim Solistene - Divertimenti');
    end;
    'listbox.default.mp3': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Black Bear Roa');
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Greatest Hits');
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/MCcall & Company');
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Roses For Mama');
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Rubber Duck');
      LoadDefaulTitles(G_LIST_STORE(list_model), '/n4800/Multimedia/Music/Country/C.W. McCall/MP3/Wolf Creek Pass');
    end;
    'listbox.default.mod': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
      LoadDefaulTitles(G_LIST_STORE(list_model), '/home/tux/Schreibtisch/sound/mod');
    end;
    'listbox.default.midi': begin
      g_list_store_remove_all(G_LIST_STORE(list_model));
      LoadDefaulTitles(G_LIST_STORE(list_model), '/home/tux/Schreibtisch/sound/midi');
    end;
    'listbox.save': begin
      Save_Songs_XML_Dialog(sharedWidgets^.main_Window, G_LIST_STORE(list_model));
    end;
    'listbox.open': begin
      Open_Songs_XML_Dialog(sharedWidgets^.main_Window, G_LIST_STORE(list_model));
    end;
    'listbox.play': begin
      if PriStream = nil then begin
        ChangeSong(sharedWidgets^.columviewBox);
      end else begin
        mp_streamer_play(PriStream);
      end;
    end;
    'listbox.pause': begin
      if PriStream <> nil then begin
        mp_streamer_pause(PriStream);
      end;
    end;
    'listbox.stop': begin
      WriteLn('stop');
      if PriStream <> nil then begin
        adjustment := gtk_range_get_adjustment(GTK_RANGE(sharedWidgets^.scale));
        gst_clear_object(@PriStream);
        gtk_adjustment_set_value(adjustment, 0);
        gtk_adjustment_set_upper(adjustment, 1000);
      end;
    end;
    'listbox.add': begin
      AddSongsDialog(sharedWidgets);
    end;
    'listbox.remove': begin
      mp_column_view_box_remove(sharedWidgets^.columviewBox, index);
    end;
    'listbox.removeall': begin
      mp_column_view_box_remove_all(sharedWidgets^.columviewBox);
    end;
    'listbox.next': begin
      if (PriStream <> nil) and (mp_streamer_get_duration(PriStream) > 0) then begin
        mp_column_view_box_next(sharedWidgets^.columviewBox);
        ChangeSong(sharedWidgets^.columviewBox);
      end;
    end;
    'listbox.prev': begin
      if (PriStream <> nil) and (mp_streamer_get_duration(PriStream) > 0) then begin
        if mp_streamer_get_position(PriStream) > 2000 * GST_MSECOND then begin
          mp_streamer_set_position(PriStream, 0);
        end else begin
          mp_column_view_box_prev(sharedWidgets^.columviewBox);
          ChangeSong(sharedWidgets^.columviewBox);
        end;
      end;
    end;
    'listbox.up': begin
      mp_column_view_box_up(sharedWidgets^.columviewBox);
    end;
    'listbox.down': begin
      mp_column_view_box_down(sharedWidgets^.columviewBox);
    end;
    else begin
      g_printf('Unbekannte Action, Name: "%s"'#10, Pgchar(action_name));
    end;
  end;
end;

procedure CreateActions(sharedWidgets: PSharedWidget);
const
  entries: array of Pgchar = (
    'listbox.default.flac1',
    'listbox.default.flac2',
    'listbox.default.flac3',
    'listbox.default.mp3',
    'listbox.default.mod',
    'listbox.default.midi',
    'listbox.save',
    'listbox.open',
    'listbox.play',
    'listbox.stop',
    'listbox.pause',
    'listbox.next',
    'listbox.prev',
    'listbox.add',
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
    g_signal_connect(action_, 'activate', G_CALLBACK(@action_cp), sharedWidgets);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action_));
    g_object_unref(action_);
  end;
end;

end.
