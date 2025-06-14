unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fp_glib2, fp_gst;

type
  TLevel = record
    L, R: Tgdouble;
  end;

  TStreamerLevel = procedure(level: TLevel) of object;
  TStreamer = class(TObject)
  private
    FOnLevelChange: TStreamerLevel;
    fsongPath: string;
    pipelineElement: record
      pipeline,
      equalizer,
      LevelEl,
      volume: PGstElement;
      state: TGstState;
      Duration: Tgint64;
      FIsEnd: boolean;
      Level: TLevel;
      end;
    function GetDuration: TGstClockTime;
    procedure SetOnLevelChange(AValue: TStreamerLevel);
    procedure SetVolume(vol: Tgdouble);
    function GetVolume: Tgdouble;
    procedure SetPosition(AValue: TGstClockTime);
    function GetPosition: TGstClockTime;
  public
    constructor Create(const AsongPath: string);
    destructor Destroy; override;
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure SetEqualizer0(vol: Tgdouble);
    procedure SetEqualizer1(vol: Tgdouble);
    procedure SetEqualizer2(vol: Tgdouble);
    procedure SetMute(mute: boolean);
    procedure printInfo;
    function getState: string;
    property Position: TGstClockTime read GetPosition write SetPosition;
    property Duration: TGstClockTime read GetDuration;
    property Volume: Tgdouble read GetVolume write SetVolume;
    function isPlayed: boolean;
    function isEnd: boolean;
    property OnLevelChange: TStreamerLevel read FOnLevelChange write SetOnLevelChange;
  end;

const
  G_USEC_PER_SEC = 1000000;
  GST_SECOND = G_USEC_PER_SEC * 1000;

  GST_SEEK_FLAG_FLUSH = 1 shl 0;
  GST_SEEK_FLAG_KEY_UNIT = 1 shl 2;



function GstClockToStr(t: TGstClockTime): string;
function get_duration(s: string):TGstClockTime;


implementation

const
{$ifdef Linux}
libgstpbutils = 'libgstpbutils-1.0';
libgstaudio = 'libgstaudio-1.0';
{$endif}
{$ifdef Windows}
libgstpbutils = 'gstpbutils-1.0-0.dll';
libgstaudio = 'gstaudio-1.0-0.dll';
{$endif}


function gst_stream_volume_get_type(): TGType; cdecl; external libgstaudio;

function gst_discoverer_new(timeout: TGstClockTime; err: PPGError): Pointer; cdecl; external libgstpbutils;
function gst_discoverer_discover_uri(discoverer: Pointer; uri: Pgchar; err: PPGError): Pointer; cdecl; external libgstpbutils;
function gst_discoverer_info_get_duration(info: Pointer): TGstClockTime; cdecl; external libgstpbutils;

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

// ====

procedure TestIO(element: Pointer; const s: string);
begin
  if element = nil then begin
    WriteLn(s, ': error !');
  end else begin
    WriteLn(s, ': io.');
  end;
end;

procedure test_cb(bus: PGstBus; msg: PGstMessage; user_data: TGpointer);
var
  err: PGError;
  debug_info: Pgchar;
begin
  case GST_MESSAGE_TYPE(msg) of
    GST_MESSAGE_ERROR: begin
      gst_message_parse_error(msg, @err, @debug_info);

      WriteLn('Fehler:', err^.message);
      if debug_info <> nil then begin
        WriteLn('Debug: ', debug_info);
        g_free(debug_info);
      end;

      g_error_free(err);
    end;
  end;
  //  WriteLn(GST_MESSAGE_TYPE(msg));
end;

//procedure duration_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
//var
//  pE: PPipelineElement absolute Data;
//  stat: TGboolean;
//  ct: integer = 0;
//begin
//  repeat
//    sleep(1);
//    stat := gst_element_query_duration(pE^.pipeline, GST_FORMAT_TIME, @pE^.Duration);
//    //    WriteLn(ct: 4, ' stat:', stat, '  duration: ', pE^.Duration / G_USEC_PER_SEC / 1000: 4: 2);
//    Inc(ct);
//  until stat or (ct > 100);
//end;

procedure state_changed_cb(bus: PGstBus; msg: PGstMessage; user_data: TGpointer);
var
  streamer: TStreamer absolute user_data;
  old_state, new_state, pending_state: TGstState;
begin
  gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
  streamer.pipelineElement.state := new_state;
end;

procedure eos_cb(bus: PGstBus; msg: PGstMessage; user_data: TGpointer);
var
  streamer: TStreamer absolute user_data;
begin
  streamer.pipelineElement.FIsEnd := True;
end;

function message_cb(bus: PGstBus; msg: PGstMessage; user_data: Tgpointer): Tgboolean; cdecl;
var
  streamer: TStreamer absolute user_data;
  s: PGstStructure;
  Name: Pgchar;
  endtime: TGstClockTime;
  array_val: PGValue;
  rms_arr: PGValueArray;
  channels: Tguint;
  Value: PGValue;
begin
  if msg^._type = GST_MESSAGE_ELEMENT then begin
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
        streamer.pipelineElement.Level.L := g_value_get_double(Value);
        Value := g_value_array_get_nth(rms_arr, 1);
        streamer.pipelineElement.Level.R := g_value_get_double(Value);
      end;
    end;
    if streamer.OnLevelChange <> nil then begin
      streamer.OnLevelChange(streamer.pipelineElement.Level);
    end;
  end;

  Result := True;
end;

// =========================

constructor TStreamer.Create(const AsongPath: string);
var
  bus: PGstBus;
begin
  fsongPath := AsongPath;
  pipelineElement.FisEnd := False;
  pipelineElement.Duration := 0;
  pipelineElement.Level.L := 0.0;
  pipelineElement.Level.R := 0.0;
  pipelineElement.pipeline := gst_parse_launch(PChar('filesrc location="' + fsongPath + '" ! queue ! decodebin3 ! audioconvert ! audioresample ! equalizer-3bands name=equ ! volume name=vol ! level name=level ! autoaudiosink'), nil);

  pipelineElement.volume := gst_bin_get_by_name(GST_BIN(pipelineElement.pipeline), 'vol');
  if pipelineElement.volume = nil then begin
    WriteLn('Volume Error');
  end;

  pipelineElement.equalizer := gst_bin_get_by_name(GST_BIN(pipelineElement.pipeline), 'equ');
  if pipelineElement.equalizer = nil then begin
    WriteLn('Equalizer Error');
  end;

  pipelineElement.LevelEl := gst_bin_get_by_name(GST_BIN(pipelineElement.pipeline), 'level');
  if pipelineElement.LevelEl = nil then begin
    WriteLn('Level Error');
  end else begin
    g_object_set(G_OBJECT(pipelineElement.LevelEl), 'post-messages', True, nil);
  end;

  bus := gst_element_get_bus(pipelineElement.pipeline);
  gst_bus_add_signal_watch(bus);
  //  Level_watch_id := gst_bus_add_watch(bus, @message_cb, @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message::element', TGCallback(@message_cb), Self);
  g_signal_connect(G_OBJECT(bus), 'message::state-changed', TGCallback(@state_changed_cb), Self);
  g_signal_connect(G_OBJECT(bus), 'message::eos', TGCallback(@eos_cb), Self);
  g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@test_cb), @pipelineElement);
  //  g_signal_connect(G_OBJECT(bus), 'message::duration-changed', TGCallback(@duration_cb), @pipelineElement);
  gst_object_unref(bus);
end;

destructor TStreamer.Destroy;
begin
  Stop;
  gst_object_unref(pipelineElement.pipeline);
  inherited Destroy;
end;

procedure TStreamer.Play;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_PLAYING);
end;

procedure TStreamer.Pause;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_PAUSED);
end;

procedure TStreamer.Stop;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_NULL);
end;

procedure TStreamer.SetPosition(AValue: TGstClockTime);
begin
  gst_element_seek_simple(pipelineElement.pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), AValue * G_USEC_PER_SEC);
end;

function TStreamer.GetPosition: TGstClockTime;
var
  current: Tgint64;
begin
  gst_element_query_position(pipelineElement.pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: TGstClockTime;
var
  current: Tgint64 = 0;
begin
  if pipelineElement.Duration = 0 then begin
    gst_element_query_duration(pipelineElement.pipeline, GST_FORMAT_TIME, @current);
    if current > 0 then  begin
      pipelineElement.Duration := current;
    end;
//    WriteLn(current);
  end;
  Result := pipelineElement.Duration div G_USEC_PER_SEC;
end;

function TStreamer.GetVolume: Tgdouble;
begin
  g_object_get(pipelineElement.volume, 'volume', @Result, nil);
end;

procedure TStreamer.SetVolume(vol: Tgdouble);
begin
  g_object_set(pipelineElement.volume, 'volume', vol, nil);
end;

procedure TStreamer.SetEqualizer0(vol: Tgdouble);
begin
  g_object_set(pipelineElement.equalizer, 'band0', vol, nil);
end;

procedure TStreamer.SetEqualizer1(vol: Tgdouble);
begin
  g_object_set(pipelineElement.equalizer, 'band1', vol, nil);
end;

procedure TStreamer.SetEqualizer2(vol: Tgdouble);
begin
  g_object_set(pipelineElement.equalizer, 'band2', vol, nil);
end;

procedure TStreamer.SetMute(mute: boolean);
begin
  g_object_set(pipelineElement.volume, 'mute', Tgboolean(mute), nil);
end;

procedure TStreamer.printInfo;
var
  n_audio, n_text: Tgint;
begin
  g_object_get(pipelineElement.pipeline, 'n-audio', @n_audio, nil);
  WriteLn('n-audio: ', n_audio);
  g_object_get(pipelineElement.pipeline, 'n-text', @n_text, nil);
  WriteLn('n-text: ', n_text);
end;

function TStreamer.getState: string;
begin
  WriteStr(Result, pipelineElement.state);
end;

function TStreamer.isPlayed: boolean;
begin
  Result := pipelineElement.state = GST_STATE_PLAYING;
end;

function TStreamer.isEnd: boolean;
begin
  Result := pipelineElement.FIsEnd;
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
