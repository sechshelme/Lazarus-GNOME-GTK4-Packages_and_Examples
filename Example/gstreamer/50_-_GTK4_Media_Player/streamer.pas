unit Streamer;

{$modeswitch typehelpers}

interface

uses
  Classes, SysUtils, fp_glib2, fp_GTK4,
  fp_gst;

const
  LevelKey = 'LevelKey';

type
  TLevel = record
    L, R: Tgdouble;
  end;
  PLevel = ^TLevel;

  TPipelineElements = record
    volume: PGstElement;
    state: TGstState;
    Duration: TGstClockTime;
    FIsEnd: boolean;
    LevelWidget: PGtkWidget;
    Level: TLevel;
  end;
  PPipelineElements = ^TPipelineElements;

  { TStreamer }

  PStreamer = type PGstElement;

  PStreamerHelper = type Helper for PStreamer
  private
    function GetDuration: TGstClockTime;
    procedure SetVolume(vol: Tgdouble);
    procedure SetPosition(AValue: TGstClockTime);
    function GetPosition: TGstClockTime;
  public
    procedure Create(const AsongPath: string; VU_Widget: PGtkWidget);
    procedure Destroy;
    procedure Play;
    procedure Pause;
    procedure Stop;
    property Position: TGstClockTime read GetPosition write SetPosition;
    property Duration: TGstClockTime read GetDuration;
    property Volume: Tgdouble write SetVolume;
    function isPlayed: boolean;
    function isEnd: boolean;
    procedure SetLevelWidget(w: PGtkWidget);
  end;

function GstClockToStr(t: TGstClockTime): string;
function get_duration(audioFile: Pgchar): TGstClockTime;


implementation

const
  pipelineKey = 'pipelineKey';

// https://www.perplexity.ai/search/wie-kann-ich-mit-gstreamer-dir-2Te_Qn3oTXC4WrpJqiImYQ
function get_duration(audioFile: Pgchar): TGstClockTime;
var
  pipeline_str: Pgchar;
  pipeline: PGstElement;
  ret: TGstStateChangeReturn;
  bus: PGstBus;
  msg: PGstMessage;
  duration: TGstClockTime = GST_CLOCK_TIME_NONE;
begin
  pipeline_str := g_strdup_printf('filesrc location="%s" ! decodebin ! fakesink', audioFile);
  pipeline := gst_parse_launch(pipeline_str, nil);
  g_free(pipeline_str);

  if pipeline = nil then  begin
    g_printerr('Fehler beim Erstellen der Pipeline.'#10);
    Exit(GST_CLOCK_TIME_NONE);
  end;

  ret := gst_element_set_state(pipeline, GST_STATE_PAUSED);
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
//      while duration = GST_CLOCK_TIME_NONE do begin
        if not gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration) then  begin
          g_printerr('Konnte die Dauer nicht abfragen.'#10);
          duration := GST_CLOCK_TIME_NONE;
        end;
//      end;
    end;
    gst_message_unref(msg);
  end;

  gst_element_set_state(pipeline, GST_STATE_NULL);
  gst_object_unref(bus);
  gst_object_unref(pipeline);

  WriteLn(duration);
  WriteLn(GST_CLOCK_TIME_NONE);
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

// ========================

function message_cb({%H-}bus: PGstBus; msg: PGstMessage; user_data: Tgpointer): Tgboolean; cdecl;
var
  pipeline: PGstElement absolute user_data;
  pipelineElements: PPipelineElements;

  s: PGstStructure;
  Name, debug_info: Pgchar;
  array_val: PGValue;
  rms_arr: PGValueArray;
  channels: Tguint;
  Value: PGValue;
  old_state, new_state, pending_state: TGstState;
  err: PGError;
begin
  pipelineElements := g_object_get_data(G_OBJECT(pipeline), pipelineKey);

  case msg^._type of
    GST_MESSAGE_EOS: begin
      pipelineElements^.FIsEnd := True;
    end;
    GST_MESSAGE_STATE_CHANGED: begin
      gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
      pipelineElements^.state := new_state;
    end;
    GST_MESSAGE_ELEMENT: begin
      if GTK_IS_DRAWING_AREA(pipelineElements^.LevelWidget) then begin
        s := gst_message_get_structure(msg);
        Name := gst_structure_get_name(s);
        if g_strcmp0(Name, 'level') = 0 then begin

          array_val := gst_structure_get_value(s, 'rms'); // decay, rms, peak
          rms_arr := g_value_get_boxed(array_val);

          channels := rms_arr^.n_values;
          if channels >= 2 then begin
            Value := g_value_array_get_nth(rms_arr, 0);
            pipelineElements^.Level.L := g_value_get_double(Value);
            Value := g_value_array_get_nth(rms_arr, 1);
            pipelineElements^.Level.R := g_value_get_double(Value);
          end;

          g_object_set_data(G_OBJECT(pipelineElements^.LevelWidget), LevelKey, @pipelineElements^.Level);
          gtk_widget_queue_draw(pipelineElements^.LevelWidget);
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

// =========================

procedure pipeline_free_cp(Data: Tgpointer); cdecl;
begin
  g_free(Data);
end;

procedure PStreamerHelper.Create(const AsongPath: string; VU_Widget: PGtkWidget);
var
  bus: PGstBus;
  LevelEl: PGstElement;
  pipelineElements: PPipelineElements;
begin
  pipelineElements := g_malloc(SizeOf(TPipelineElements));

  pipelineElements^.FisEnd := False;
  pipelineElements^.Duration := GST_CLOCK_TIME_NONE;
  pipelineElements^.LevelWidget := VU_Widget;
  pipelineElements^.Level.L := 0.0;
  pipelineElements^.Level.R := 0.0;
  self := gst_parse_launch(PChar('filesrc location="' + AsongPath + '" ! queue ! decodebin3 ! audioconvert ! audioresample ! volume name=vol volume=0.0 ! level name=level ! autoaudiosink'), nil);
  g_object_set_data_full(G_OBJECT(Self), pipelineKey, pipelineElements, @pipeline_free_cp);

  pipelineElements^.volume := gst_bin_get_by_name(GST_BIN(Self), 'vol');
  if pipelineElements^.volume = nil then begin
    WriteLn('Volume Error');
  end;

  LevelEl := gst_bin_get_by_name(GST_BIN(Self), 'level');
  if LevelEl = nil then begin
    WriteLn('Level Error');
  end else begin
    g_object_set(G_OBJECT(LevelEl),
      'post-messages', True,
      'interval', GST_SECOND div 50,
      nil);
  end;
  g_object_unref(LevelEl);

  bus := gst_element_get_bus(Self);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message', G_CALLBACK(@message_cb), Self);
  gst_object_unref(bus);

  gst_element_set_state(Self, GST_STATE_PLAYING);
end;

procedure PStreamerHelper.Destroy;
var
  pipelineElements: PPipelineElements;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  Stop;
  gst_object_unref(pipelineElements^.volume);
  gst_object_unref(Self);
  self := nil;
end;

procedure PStreamerHelper.Play;
begin
  gst_element_set_state(Self, GST_STATE_PLAYING);
end;

procedure PStreamerHelper.Pause;
begin
  gst_element_set_state(Self, GST_STATE_PAUSED);
end;

procedure PStreamerHelper.Stop;
begin
  gst_element_set_state(Self, GST_STATE_NULL);
end;

procedure PStreamerHelper.SetPosition(AValue: TGstClockTime);
begin
  gst_element_seek_simple(Self, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), AValue);
end;

function PStreamerHelper.GetPosition: TGstClockTime;
begin
  gst_element_query_position(Self, GST_FORMAT_TIME, @Result);
end;

function PStreamerHelper.GetDuration: TGstClockTime;
var
  pipelineElements: PPipelineElements;
  current: TGstClockTime = GST_CLOCK_TIME_NONE;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  if pipelineElements^.Duration = GST_CLOCK_TIME_NONE then begin
    gst_element_query_duration(Self, GST_FORMAT_TIME, @current);

    if current <> GST_CLOCK_TIME_NONE then  begin
      pipelineElements^.Duration := current;
    end;
  end;
  Result := pipelineElements^.Duration;
end;

procedure PStreamerHelper.SetVolume(vol: Tgdouble);
var
  pipelineElements: PPipelineElements;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  g_object_set(pipelineElements^.volume, 'volume', vol, nil);
end;

function PStreamerHelper.isPlayed: boolean;
var
  pipelineElements: PPipelineElements;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  Result := pipelineElements^.state = GST_STATE_PLAYING;
end;

function PStreamerHelper.isEnd: boolean;
var
  pipelineElements: PPipelineElements;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  Result := pipelineElements^.FIsEnd;
end;

procedure PStreamerHelper.SetLevelWidget(w: PGtkWidget);
var
  pipelineElements: PPipelineElements;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  pipelineElements^.LevelWidget := w;
end;

// ==== Inizialisierung

begin
  gst_init(@argc, @argv);
end.
