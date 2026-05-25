unit MPTimerLoop;

interface

uses
  fp_glib2, fp_GTK4, fp_gst,
  Common,
  MPStreamer, MPSongItem, MPVUMeterWidget, MPColumnViewBox, MPDurationBox;

function timerFunc_cp(user_data: Tgpointer): Tgboolean; cdecl;


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

  item_obj: PGObject;
  s: string;
  vu: PGArray;

begin
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

end.
