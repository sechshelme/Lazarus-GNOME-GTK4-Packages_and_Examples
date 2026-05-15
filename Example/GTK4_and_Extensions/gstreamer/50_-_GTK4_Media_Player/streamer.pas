unit Streamer;

{$modeswitch typehelpers}

interface

uses
  fp_glib2, fp_gst;

type
  TMPStreamer = record
    parent_instance: TGstPipeline;
    volume: PGstElement;
    state: TGstState;
    Duration: TGstClockTime;
    FIsEnd: boolean;
    Level: PGArray;
  end;
  PMPStreamer = ^TMPStreamer;

  TMPStreamerClass = record
    parent_class: TGstPipelineClass;
  end;
  PMPStreamerClass = ^TMPStreamerClass;

function mp_streamer_get_type: TGType;
function mp_streamer_new_from_launch(song: pchar): PMPStreamer;
procedure mp_streamer_play(self: PMPStreamer);
procedure mp_streamer_pause(self: PMPStreamer);
procedure mp_streamer_stop(self: PMPStreamer);
procedure mp_streamer_set_position(self: PMPStreamer; p: TGstClockTime);
function mp_streamer_get_position(self: PMPStreamer): TGstClockTime;
function mp_streamer_get_duration(self: PMPStreamer): TGstClockTime;
procedure mp_streamer_set_volume(self: PMPStreamer; v: Tgdouble);
function mp_streamer_is_played(self: PMPStreamer): boolean;
function mp_streamer_is_end(self: PMPStreamer): boolean;
function mp_streamer_get_VU(self: PMPStreamer): PGArray;

// ================================================

function GstClockToStr(t: TGstClockTime): string;
function get_duration(audioFile: Pgchar): TGstClockTime;


implementation



// ==== private

var
  parent_class: PMPStreamerClass = nil;

procedure dispose_cp(obj: PGObject); cdecl;
var
  self: PMPStreamer absolute obj;
begin
  mp_streamer_stop(Self);
  gst_object_unref(Self^.volume);

  G_OBJECT_CLASS(parent_class)^.dispose(obj);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMPStreamer absolute obj;
begin
  g_array_free(self^.Level, True);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.dispose := @dispose_cp;
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMPStreamer absolute instance;
begin
  with self^ do begin
  end;
end;

function message_cb({%H-}bus: PGstBus; msg: PGstMessage; user_data: Tgpointer): Tgboolean; cdecl;
var
  pipeline: PMPStreamer absolute user_data;

  s: PGstStructure;
  Name, debug_info: Pgchar;
  array_val: PGValue;
  rms_arr: PGValueArray;
  Value: PGValue;
  old_state, new_state, pending_state: TGstState;
  err: PGError;
  i: integer;
  level: PGArray;
begin
  case msg^._type of
    GST_MESSAGE_EOS: begin
      pipeline^.FIsEnd := True;
    end;
    GST_MESSAGE_STATE_CHANGED: begin
      gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
      pipeline^.state := new_state;
    end;
    GST_MESSAGE_ELEMENT: begin
      level := pipeline^.Level;
      s := gst_message_get_structure(msg);
      Name := gst_structure_get_name(s);

      if g_strcmp0(Name, 'level') = 0 then begin
        array_val := gst_structure_get_value(s, 'rms');
        if array_val <> nil then begin
          rms_arr := g_value_get_boxed(array_val);
          if (rms_arr <> nil) then begin
            g_array_set_size(level, rms_arr^.n_values);
            for i := 0 to rms_arr^.n_values - 1 do begin
              Value := @rms_arr^.values[i];
              Pgdouble(level^.Data)[i] := g_value_get_double(Value);
            end;
          end;
        end;
      end;
    end;
    GST_MESSAGE_ERROR: begin
      gst_message_parse_error(msg, @err, @debug_info);
      WriteLn('Fehler:', err^.message);
      if debug_info <> nil then begin
        WriteLn('Debug: ', debug_info);
        g_free(debug_info);
      end;
      g_error_free(err);
    end else begin
      //      WriteLn(GST_MESSAGE_TYPE(msg));
    end;
  end;

  Result := True;
end;




// ==== public

function mp_streamer_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GST_TYPE_PIPELINE, 'MPStreamer', SizeOf(TMPStreamerClass), @class_init, SizeOf(TMPStreamer), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_streamer_new_from_launch(song: pchar): PMPStreamer;
var
  inner_bin: PGstElement;
  s: Pgchar;
  bus: PGstBus;
  LevelEl: PGstElement;

begin
  Result := PMPStreamer(g_object_new(mp_streamer_get_type, nil));

  s := g_strdup_printf('filesrc location="%s" ! queue ! decodebin3 ! audioconvert ! audioresample ! volume name=vol volume=0.0 ! level name=level ! autoaudiosink', song);
  inner_bin := gst_parse_bin_from_description(s, False, nil);
  g_free(s);

  if inner_bin <> nil then begin
    gst_bin_add(GST_BIN(Result), inner_bin);
    gst_element_sync_state_with_parent(inner_bin);
  end;

  Result^.FisEnd := False;
  Result^.Duration := GST_CLOCK_TIME_NONE;
  Result^.Level := g_array_new(False, True, SizeOf(Tgdouble));

  Result^.volume := gst_bin_get_by_name(GST_BIN(Result), 'vol');
  if Result^.volume = nil then begin
    WriteLn('Volume Error');
  end;

  LevelEl := gst_bin_get_by_name(GST_BIN(Result), 'level');
  if LevelEl = nil then begin
    WriteLn('Level Error');
  end else begin
    g_object_set(G_OBJECT(LevelEl),
      'post-messages', True,
      'interval', GST_SECOND div 60,
      nil);
  end;
  g_object_unref(LevelEl);

  bus := gst_element_get_bus(GST_ELEMENT(Result));
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message', G_CALLBACK(@message_cb), Result);
  gst_object_unref(bus);

  gst_element_set_state(GST_ELEMENT(Result), GST_STATE_PLAYING);
end;


procedure mp_streamer_play(self: PMPStreamer);
begin
  gst_element_set_state(GST_ELEMENT(Self), GST_STATE_PLAYING);
end;

procedure mp_streamer_pause(self: PMPStreamer);
begin
  gst_element_set_state(GST_ELEMENT(Self), GST_STATE_PAUSED);
end;

procedure mp_streamer_stop(self: PMPStreamer);
begin
  gst_element_set_state(GST_ELEMENT(Self), GST_STATE_NULL);
end;

procedure mp_streamer_set_position(self: PMPStreamer; p: TGstClockTime);
begin
  gst_element_seek_simple(GST_ELEMENT(Self), GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), p);
end;

function mp_streamer_get_position(self: PMPStreamer): TGstClockTime;
begin
  gst_element_query_position(GST_ELEMENT(Self), GST_FORMAT_TIME, @Result);
end;

function mp_streamer_get_duration(self: PMPStreamer): TGstClockTime;
var
  current: TGstClockTime = GST_CLOCK_TIME_NONE;
begin
  if Self^.Duration = GST_CLOCK_TIME_NONE then begin
    gst_element_query_duration(GST_ELEMENT(Self), GST_FORMAT_TIME, @current);

    if current <> GST_CLOCK_TIME_NONE then  begin
      Self^.Duration := current;
    end;
  end;
  Result := Self^.Duration;
end;

procedure mp_streamer_set_volume(self: PMPStreamer; v: Tgdouble);
begin
  g_object_set(Self^.volume, 'volume', v, nil);
end;

function mp_streamer_is_played(self: PMPStreamer): boolean;
begin
  Result := Self^.state = GST_STATE_PLAYING;
end;

function mp_streamer_is_end(self: PMPStreamer): boolean;
begin
  Result := Self^.FIsEnd;
end;

function mp_streamer_get_VU(self: PMPStreamer): PGArray;
begin
  Result := Self^.Level;
end;


// ================================================


function get_duration(audioFile: Pgchar): TGstClockTime;
var
  pipeline_str: Pgchar;
  pipeline: PGstElement;
  ret: TGstStateChangeReturn;
  bus: PGstBus;
  msg: PGstMessage;
  duration: TGstClockTime = GST_CLOCK_TIME_NONE;
  t: Tgint64;
begin
  //  pipeline_str := g_strdup_printf('filesrc location="%s" ! queue ! decodebin3 ! fakesink', audioFile);
  pipeline_str := g_strdup_printf('filesrc location="%s"  ! decodebin3 ! fakesink', audioFile);
  pipeline := gst_parse_launch(pipeline_str, nil);
  g_free(pipeline_str);

  if pipeline = nil then  begin
    g_printerr('Fehler beim Erstellen der Pipeline.'#10);
    Exit(GST_CLOCK_TIME_NONE);
  end;

  ret := gst_element_set_state(pipeline, GST_STATE_PLAYING);
  if ret = GST_STATE_CHANGE_FAILURE then  begin
    g_printerr('Pipeline konnte nicht in den PAUSED-Zustand versetzt werden.'#10);
    gst_object_unref(pipeline);
    Exit(GST_CLOCK_TIME_NONE);
  end;

  bus := gst_element_get_bus(pipeline);
  msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_ERROR or GST_MESSAGE_ASYNC_DONE);
  if msg <> nil then begin
    if GST_MESSAGE_TYPE(msg) = GST_MESSAGE_ERROR then  begin
      g_printerr('Fehler beim Verarbeiten der Datei.'#10);
      duration := GST_CLOCK_TIME_NONE;
    end else begin
      t := g_get_real_time;
      while (duration = GST_CLOCK_TIME_NONE) and (g_get_real_time - t < 1000 * 1000) do begin
        gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration);
      end;
    end;
    gst_message_unref(msg);
  end;

  gst_element_set_state(pipeline, GST_STATE_NULL);
  gst_object_unref(bus);
  gst_object_unref(pipeline);

  Result := duration;
end;

function GstClockToStr(t: TGstClockTime): string;
var
  ms, s, min: TGstClockTime;
  i: integer;
begin
  t := t div G_USEC_PER_SEC;
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min: 2, ':', s: 2, ':', ms div 100: 1);
  for i := 1 to Length(Result) do begin
    if Result[i] = ' ' then begin
      Result[i] := '0';
    end;
  end;
end;

end.
