unit MPaction;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst,
  Common, LoadTitle,
  MPSongItem, MPStreamer, MPColumnViewBox,
  XML_Tools, LoadSaveSongs;

procedure on_box_action_received(widget: PGtkWidget; button_id: Pgchar; user_data: Tgpointer); cdecl;


implementation


procedure ChangeSong(box: PGtkWidget);
var
  item_obj: PGObject;
begin
  item_obj := mp_column_view_box_get_item(Box);
  gst_clear_object(@PriStream);
  PriStream := mp_streamer_new_from_launch(mp_song_item_get_full_path(item_obj));
  g_object_unref(item_obj);
end;

procedure on_box_action_received(widget: PGtkWidget; button_id: Pgchar; user_data: Tgpointer); cdecl;
var
  sharedWidgets: PSharedWidget absolute user_data;
  list_model: PGListModel;
  adjustment: PGtkAdjustment;
  action_name: string;
begin
  action_name := button_id;

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
      mp_column_view_box_remove(sharedWidgets^.columviewBox);
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


end.

