unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fp_glib2,
  fp_gst, fp_gst_pbutils;

type
  TLevel = record
    L, R: Tgdouble;
  end;

  TpipelineElements = record
    pipeline,
    volume: PGstElement;
    state: TGstState;
    Duration: Tgint64;
    FIsEnd: boolean;
    Level: TLevel;
  end;

  TStreamerLevel = procedure(level: TLevel) of object;

  { TStreamer }

  TStreamer = class(TObject)
  private
    FOnLevelChange: TStreamerLevel;
    pipelineElements: TpipelineElements;
    function GetDuration: TGstClockTime;
    procedure SetOnLevelChange(AValue: TStreamerLevel);
    procedure SetVolume(vol: Tgdouble);
    procedure SetPosition(AValue: TGstClockTime);
    function GetPosition: TGstClockTime;
  public
    constructor Create(const AsongPath: string);
    destructor Destroy; override;
    procedure Play;
    procedure Pause;
    procedure Stop;
    property Position: TGstClockTime read GetPosition write SetPosition;
    property Duration: TGstClockTime read GetDuration;
    property Volume: Tgdouble write SetVolume;
    function isPlayed: boolean;
    function isEnd: boolean;
    property OnLevelChange: TStreamerLevel read FOnLevelChange write SetOnLevelChange;
  end;


function GstClockToStr(t: TGstClockTime): string;
function get_duration(s: string): TGstClockTime;


implementation

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
  streamer: TStreamer absolute user_data;
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
  case msg^._type of
    GST_MESSAGE_EOS: begin
      streamer.pipelineElements.FIsEnd := True;
    end;
    GST_MESSAGE_STATE_CHANGED: begin
      gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
      streamer.pipelineElements.state := new_state;
    end;
    GST_MESSAGE_ELEMENT: begin
      s := gst_message_get_structure(msg);
      Name := gst_structure_get_name(s);
      if strcomp(Name, 'level') = 0 then begin
        if not gst_structure_get_clock_time(s, 'endtime', @endtime) then begin
          WriteLn('endtime warning');
        end;

        array_val := gst_structure_get_value(s, 'decay');
        if array_val = nil then begin
          WriteLn('rms error');
        end;
        rms_arr := PGValueArray(g_value_get_boxed(array_val));

        channels := rms_arr^.n_values;
        if channels >= 2 then begin
          Value := g_value_array_get_nth(rms_arr, 0);
          streamer.pipelineElements.Level.L := g_value_get_double(Value);
          Value := g_value_array_get_nth(rms_arr, 1);
          streamer.pipelineElements.Level.R := g_value_get_double(Value);
        end;
      end;
      if streamer.OnLevelChange <> nil then begin
        streamer.OnLevelChange(streamer.pipelineElements.Level);
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

constructor TStreamer.Create(const AsongPath: string);
var
  bus: PGstBus;
  LevelEl: PGstElement;
begin
  pipelineElements.FisEnd := False;
  pipelineElements.Duration := 0;
  pipelineElements.Level.L := 0.0;
  pipelineElements.Level.R := 0.0;
  pipelineElements.pipeline := gst_parse_launch(PChar('filesrc location="' + AsongPath + '" ! queue ! decodebin3 ! audioconvert ! audioresample ! volume name=vol ! level name=level ! autoaudiosink'), nil);

  pipelineElements.volume := gst_bin_get_by_name(GST_BIN(pipelineElements.pipeline), 'vol');
  if pipelineElements.volume = nil then begin
    WriteLn('Volume Error');
  end;

  LevelEl := gst_bin_get_by_name(GST_BIN(pipelineElements.pipeline), 'level');
  if LevelEl = nil then begin
    WriteLn('Level Error');
  end else begin
    g_object_set(G_OBJECT(LevelEl), 'post-messages', True, nil);
  end;
  g_object_unref(LevelEl);

  bus := gst_element_get_bus(pipelineElements.pipeline);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@message_cb), Self);
  gst_object_unref(bus);
end;

destructor TStreamer.Destroy;
begin
  Stop;
  gst_object_unref(pipelineElements.volume);
  gst_object_unref(pipelineElements.pipeline);
  inherited Destroy;
end;

procedure TStreamer.Play;
begin
  gst_element_set_state(pipelineElements.pipeline, GST_STATE_PLAYING);
end;

procedure TStreamer.Pause;
begin
  gst_element_set_state(pipelineElements.pipeline, GST_STATE_PAUSED);
end;

procedure TStreamer.Stop;
begin
  gst_element_set_state(pipelineElements.pipeline, GST_STATE_NULL);
end;

procedure TStreamer.SetPosition(AValue: TGstClockTime);
begin
  gst_element_seek_simple(pipelineElements.pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), AValue * G_USEC_PER_SEC);
end;

function TStreamer.GetPosition: TGstClockTime;
var
  current: Tgint64;
begin
  gst_element_query_position(pipelineElements.pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: TGstClockTime;
var
  current: Tgint64 = 0;
begin
  if pipelineElements.Duration = 0 then begin
    gst_element_query_duration(pipelineElements.pipeline, GST_FORMAT_TIME, @current);
    if current > 0 then  begin
      pipelineElements.Duration := current;
    end;
  end;
  Result := pipelineElements.Duration div G_USEC_PER_SEC;
end;

procedure TStreamer.SetVolume(vol: Tgdouble);
begin
  g_object_set(pipelineElements.volume, 'volume', vol, nil);
end;

function TStreamer.isPlayed: boolean;
begin
  Result := pipelineElements.state = GST_STATE_PLAYING;
end;

function TStreamer.isEnd: boolean;
begin
  Result := pipelineElements.FIsEnd;
end;

// ==== Events

procedure TStreamer.SetOnLevelChange(AValue: TStreamerLevel);
begin
  if FOnLevelChange = AValue then begin
    Exit;
  end;
  FOnLevelChange := AValue;
end;

// ==== Inizialisierung

begin
  gst_init(@argc, @argv);
end.
