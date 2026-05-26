unit MPMainWindow;

interface

uses
  fp_glib2, fp_GTK4, fp_gst,

  Common,
  LoadTitle,
  LoadSaveSongs,

  MPStreamer,
  MPVUMeterWidget,
  MPColumnViewBox,
  MPSongItem,
  MPDurationBox,
  MPButtonBox,
  MPMenuButton,
  MPPlayerButtonBox,
  MPColumnViewControl;

type
  PMPMainWindow = type Pointer;
  PMPMainWindowClass = type Pointer;


function mp_main_window_get_type: TGType;
function mp_main_window_new(sw: PSharedWidget): PGTKWidget;
procedure mp_main_window_add_item(button: PMPMainWindow; lab, id: Pgchar);

procedure on_box_action_received(widget: PGtkWidget; button_id: Pgchar; user_data: Tgpointer); cdecl;  // ?????
function timerFunc_cp(user_data: Tgpointer): Tgboolean; cdecl; // ?????



implementation

// ==== private

var     sharedWidgets: PSharedWidget; // ????


type
  TInstPriv = record



    idle_id: Tguint;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  instance_size: integer = 0;
  parent_class: PMPMainWindowClass = nil;

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
  if idle_id > 0 then begin
    g_source_remove(idle_id);
    idle_id := 0;
  end;
  if PriStream <> nil then begin
    gst_clear_object(@PriStream);
  end;
  if SekStream <> nil then begin
    gst_clear_object(@SekStream);
  end;

  g_free(sharedWidgets);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
  end;
end;

// ==== Actionen

procedure on_box_action_received(widget: PGtkWidget; button_id: Pgchar; user_data: Tgpointer); cdecl;

  procedure ChangeSong(box: PGtkWidget);
  var
    item_obj: PGObject;
  begin
    item_obj := mp_column_view_box_get_item(Box);
    gst_clear_object(@PriStream);
    PriStream := mp_streamer_new_from_launch(mp_song_item_get_full_path(item_obj));
    g_object_unref(item_obj);
  end;

var
  priv: PInstPriv;
  list_model: PGListModel;
  adjustment: PGtkAdjustment;
  action_name: string;
begin
  priv := GetPriv(user_data);
  with priv^ do begin
  action_name := button_id;
  g_printf('Action, Name: "%s"'#10, Pgchar(action_name));

  list_model := mp_column_view_box_get_list_model(sharedWidgets^.columviewBox);

  case action_name of
    'listbox.quit': begin
      gtk_window_close(GTK_WINDOW(gtk_widget_get_root(widget)));
    end;
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
end;

// ==== Timerloop

function timerFunc_cp(user_data: Tgpointer): Tgboolean; cdecl;

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

var
  priv: PInstPriv;
  adjustment: PGtkAdjustment;
  SPos, SDur: TGstClockTime;
  item_obj: PGObject;
  vu: PGArray;

begin
  priv := GetPriv(user_data);

  with priv^ do begin
  adjustment := gtk_range_get_adjustment(GTK_RANGE(sharedWidgets^.scale));
  g_signal_handler_block(sharedWidgets^.scale, sharedWidgets^.scale_changed_id);

  if PriStream <> nil then begin
    if sharedWidgets^.IsChange then begin
      mp_streamer_set_position(PriStream, Round(gtk_adjustment_get_value(adjustment)));
      sharedWidgets^.IsChange := False;
    end else begin
      vu := mp_streamer_get_VU(PriStream);
      mp_vu_meter_widget_set_level(PMPVUMeterWidget(sharedWidgets^.VUMeter), vu);

      SPos := mp_streamer_get_position(PriStream);
      SDur := mp_streamer_get_duration(PriStream);
      gtk_adjustment_set_upper(adjustment, SDur);
      gtk_adjustment_set_value(adjustment, SPos);

      mp_duration_box_set_position(sharedWidgets^.Label_Box, SPos);
      mp_duration_box_set_duration(sharedWidgets^.Label_Box, SDur);

      if SPos = GST_CLOCK_TIME_NONE then begin
        mp_streamer_set_volume(PriStream, 0.0);
      end else begin
        mp_streamer_set_volume(PriStream, clamp01(SPos / FITime));
      end;

      if mp_streamer_get_duration(PriStream) <> GST_CLOCK_TIME_NONE then begin
        if mp_streamer_is_end(PriStream) or (mp_streamer_get_duration(PriStream) - SPos < CFTime) then begin
          if SekStream <> nil then begin
            gst_clear_object(@SekStream);
          end;
          SekStream := PriStream;

          mp_column_view_box_next(sharedWidgets^.columviewBox);
          item_obj := mp_column_view_box_get_item(sharedWidgets^.columviewBox);
          PriStream := mp_streamer_new_from_launch(mp_song_item_get_full_path(item_obj));
          g_object_unref(item_obj);

          gtk_adjustment_set_upper(adjustment, 0);
          gtk_adjustment_set_value(adjustment, 0);
        end;
      end;
    end;
  end;

  if SekStream <> nil then begin
    if mp_streamer_get_duration(SekStream) <> GST_CLOCK_TIME_NONE then begin
      mp_streamer_set_volume(SekStream, clamp01((mp_streamer_get_duration(SekStream) - mp_streamer_get_position(SekStream)) / FITime));
    end;

    if mp_streamer_is_end(SekStream) then begin
      gst_clear_object(@SekStream);
    end;
  end;

  g_signal_handler_unblock(sharedWidgets^.scale, sharedWidgets^.scale_changed_id);
  Result := G_SOURCE_CONTINUE;
  end;
end;

// ======

procedure on_scale_changed_cp({%H-}range: PGtkRange; user_data: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(user_data);
  with priv^ do begin
  sharedWidgets^.IsChange := True;
  end;
end;


// ==== public

function mp_main_window_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_WINDOW, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_WINDOW, 'MyMainWindow',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_main_window_new(sw: PSharedWidget): PGTKWidget;
var
  priv: PInstPriv;
  header_bar, menubutton, mainLayout, HBox, VBox, mediaControlPanel,
  scrolled_window, columnBox, columnViewControlBox,
  ColumnViewButtonBox: PGtkWidget;
begin
  Result := g_object_new(mp_main_window_get_type, nil);
  priv := GetPriv(Result);

  with priv^ do begin
    sharedWidgets := sw;
    sharedWidgets^.main_Window := Result;

    // === Self
    gtk_window_set_title(GTK_WINDOW(Result), 'Media Player');
    gtk_window_set_default_size(GTK_WINDOW(Result), 1024, 768);

    // === headerbar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(Result), header_bar);

    menubutton := mp_menu_button_new;
    g_signal_connect(menubutton, 'action-triggered', G_CALLBACK(@on_box_action_received), Result);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), menubutton);


    // --- Haupt-Container für das ganze Fenster
    mainLayout := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(mainLayout, 10);
    gtk_widget_set_margin_end(mainLayout, 10);
    gtk_widget_set_margin_top(mainLayout, 10);
    gtk_widget_set_margin_bottom(mainLayout, 10);

    // --- Bereich 1: Scale (Fortschrittsbalken)
    sharedWidgets^.scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0.0, 100.0, 1.0);
    gtk_scale_set_draw_value(GTK_SCALE(sharedWidgets^.scale), True);
    gtk_scale_set_value_pos(GTK_SCALE(sharedWidgets^.scale), GTK_POS_TOP);
    gtk_range_set_value(GTK_RANGE(sharedWidgets^.scale), 0.0);
    sharedWidgets^.scale_changed_id := g_signal_connect(sharedWidgets^.scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), sharedWidgets);
    gtk_box_append(GTK_BOX(mainLayout), sharedWidgets^.scale);

    // --- Bereich 2: Obere Steuerung (Buttons & VU-Meter)
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainLayout), HBox);

    VBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), VBox);

    // MediaButtons (Play, Stop, etc.)
    mediaControlPanel := mp_player_button_box_new;
    g_signal_connect(mediaControlPanel, 'action-triggered', G_CALLBACK(@on_box_action_received), Result);
    gtk_box_append(GTK_BOX(VBox), mediaControlPanel);


    // Zeit-Labels (Position / Duration)
    sharedWidgets^.Label_Box := mp_duration_box_new;
    gtk_box_append(GTK_BOX(VBox), sharedWidgets^.Label_Box);

    // VU-Meter Widget hinzufügen
    sharedWidgets^.VUMeter := mp_vu_meter_widget_new;
    gtk_widget_set_hexpand(sharedWidgets^.VUMeter, True);
    gtk_widget_set_size_request(sharedWidgets^.VUMeter, 100, 50);
    gtk_box_append(GTK_BOX(HBox), sharedWidgets^.VUMeter);

    // --- Bereich 3: Liste (ColumnView) und Edit-Buttons
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_widget_set_vexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainLayout), HBox);

    // ScrolledWindow für die Liste
    scrolled_window := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_widget_set_hexpand(scrolled_window, True);

    // Erstelle die Custom Box (MPColumnViewBox), welche die GtkColumnView enthält
    columnBox := mp_column_view_box_new(sharedWidgets);
    g_signal_connect(columnBox, 'action-triggered', G_CALLBACK(@on_box_action_received), Result);

    // Die Box in das ScrolledWindow packen
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), columnBox);
    gtk_box_append(GTK_BOX(HBox), scrolled_window);

    // ColumnView Control
    columnViewControlBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), columnViewControlBox);

    gtk_box_append(GTK_BOX(columnViewControlBox), gtk_label_new('Edit'));

    ColumnViewButtonBox := mp_column_view_control_new;
    gtk_orientable_set_orientation(GTK_ORIENTABLE(ColumnViewButtonBox), GTK_ORIENTATION_VERTICAL);
    g_signal_connect(ColumnViewButtonBox, 'action-triggered', G_CALLBACK(@on_box_action_received), Result);
    gtk_box_append(GTK_BOX(columnViewControlBox), ColumnViewButtonBox);

    // --- Fertigstellung
    gtk_window_set_child(GTK_WINDOW(Result), mainLayout);
    gtk_window_present(GTK_WINDOW(Result));

    // Timerloop
    idle_id := g_timeout_add(100, @timerFunc_cp, Result);
  end;
end;

procedure mp_main_window_add_item(button: PMPMainWindow; lab, id: Pgchar);
var
  priv: PInstPriv;
begin
  priv := GetPriv(button);
  with priv^ do begin
  end;
end;

end.
