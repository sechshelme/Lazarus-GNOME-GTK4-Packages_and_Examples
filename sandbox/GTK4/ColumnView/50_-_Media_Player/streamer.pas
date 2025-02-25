unit Streamer;

{$modeswitch typehelpers}

interface

uses
  Classes, SysUtils, fp_glib2, fp_GTK4,
  fp_gst, fp_gst_pbutils;

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
    Duration: Tgint64;
    FIsEnd: boolean;
    LevelWidget: PGtkWidget;
    Level: TLevel;
  end;
  PPipelineElements = ^TPipelineElements;

  { TStreamer }

  PStreamer = type PGstElement;

  { PStreamerHelper }

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
function get_duration(s: string): TGstClockTime;


implementation

const
  pipelineKey = 'pipelineKey';

function get_duration(s: string): TGstClockTime;
var
  discoverer: Pointer;
  info: Pointer;
begin
  discoverer := gst_discoverer_new(5 * GST_SECOND, nil);
  info := gst_discoverer_discover_uri(discoverer, PChar('file:' + s), nil);
  if info = nil then begin
    WriteLn('Info error !');
    Result := -1;
  end else begin
    Result := gst_discoverer_info_get_duration(info) div G_USEC_PER_SEC;
    g_object_unref(info);
  end;
  g_object_unref(discoverer);
end;


function GstClockToStr(t: TGstClockTime): string;
var
  ms, s, min: TGstClockTime;
  i: integer;
begin
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min: 3, ':', s: 2, ':', ms div 100: 1);
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
  endtime: TGstClockTime;
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
        if strcomp(Name, 'level') = 0 then begin
          if not gst_structure_get_clock_time(s, 'endtime', @endtime) then begin
            WriteLn('endtime warning');
          end;

          array_val := gst_structure_get_value(s, 'rms'); // decay, rms, peak
          if array_val = nil then begin
            Exit;
          end;
          rms_arr := g_value_get_boxed(array_val);

// https://www.perplexity.ai/search/g-value-array-get-nth-ist-vera-t3T1VE1MROaWvC41iReDkA
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
  pipelineElements^.Duration := 0;
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
  gst_element_seek_simple(Self, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), AValue * G_USEC_PER_SEC);
end;

function PStreamerHelper.GetPosition: TGstClockTime;
var
  current: Tgint64;
begin
  gst_element_query_position(Self, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function PStreamerHelper.GetDuration: TGstClockTime;
var
  pipelineElements: PPipelineElements;
  current: Tgint64 = 0;
begin
  pipelineElements := g_object_get_data(G_OBJECT(Self), pipelineKey);
  if pipelineElements^.Duration = 0 then begin
    gst_element_query_duration(Self, GST_FORMAT_TIME, @current);
    if current > 0 then  begin
      pipelineElements^.Duration := current;
    end;
  end;
  Result := pipelineElements^.Duration div G_USEC_PER_SEC;
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
