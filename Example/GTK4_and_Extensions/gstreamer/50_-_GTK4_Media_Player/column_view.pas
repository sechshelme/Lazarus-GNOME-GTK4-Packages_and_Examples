unit column_view;

interface

uses
  fp_glib2, fp_GTK4, fp_gst,
  Common,
  Action,
  MPStreamer, XML_Tools,
  MPVUMeterWidget, MPColumnViewBox;

function Create_ColumnView(sharedWidgets: PSharedWidget): PGTKWidget;

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
  vu: PGArray;

begin
  WriteLn('timerFunc_cp() begin');
//  selection_model := gtk_column_view_get_model(GTK_COLUMN_VIEW(sharedWidgets^.columnView));
  selection_model := mp_column_view_box_get_selection_model(sharedWidgets^.columviewBox);
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
      mp_streamer_set_position(PriStream, Round(gtk_adjustment_get_value(adjustment)));
      sharedWidgets^.IsChange := False;
    end else begin
      vu := mp_streamer_get_VU(PriStream);
      mp_vu_meter_widget_set_level(PMPVUMeterWidget(sharedWidgets^.VUMeter), vu);

      SPos := mp_streamer_get_position(PriStream);
      SDur := mp_streamer_get_duration(PriStream);
      gtk_adjustment_set_upper(adjustment, SDur);
      gtk_adjustment_set_value(adjustment, SPos);

      s := GstClockToStr(SPos);
      gtk_label_set_label(GTK_LABEL(sharedWidgets^.LabelPosition), pchar(s));

      if SDur = GST_CLOCK_TIME_NONE then begin
        s := '--.--';
      end else begin
        s := GstClockToStr(SDur);
      end;
      gtk_label_set_label(GTK_LABEL(sharedWidgets^.LabelDuration), pchar(s));

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
            PriStream := mp_streamer_new_from_launch(song^.FullPath);
            g_object_unref(item_obj);
            gtk_selection_model_select_item(selection_model, index2, True);
          end;
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
  //    with SongListPanel do begin
  //      Lab_Track_Value.Caption := IntToStr(ListView.ItemIndex + 1) + '/' + ListView.Items.Count.ToString;
  //    end;

  g_signal_handler_unblock(sharedWidgets^.scale, sharedWidgets^.scale_changed_id);
  Result := G_SOURCE_CONTINUE;
  WriteLn('timerFunc_cp() end');
end;

procedure on_columnview_destroy(widget: PGtkWidget; user_data: Tgpointer);
var
  idle_id: Tguint absolute user_data;
begin
  if idle_id > 0 then begin
    g_source_remove(idle_id);
  end;
  if PriStream <> nil then begin
    gst_clear_object(@PriStream);
  end;
  if SekStream <> nil then begin
    gst_clear_object(@SekStream);
  end;
end;

// ==== public

function Create_ColumnView(sharedWidgets: PSharedWidget): PGTKWidget;
var
  idle_id: Tguint;
begin
  Result := mp_column_view_box_new(sharedWidgets);
//  sharedWidgets^.columviewBox:=Result;;

  CreateActions(sharedWidgets);

  idle_id := g_timeout_add(100, @timerFunc_cp, sharedWidgets);
  g_signal_connect(Result, 'destroy', G_CALLBACK(@on_columnview_destroy), GINT_TO_POINTER(idle_id));
end;

end.
