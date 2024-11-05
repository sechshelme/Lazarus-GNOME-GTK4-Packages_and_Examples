unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  FileUtil,
  glib280, gst124, gstTools;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure WriteDuration(sl: TStringList);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function get_duration1(s: string): Tguint64;
var
  pipeline: PGstElement;
  bus: PGstBus;
  msg: PGstMessage;
  duration: int64;
  Count: integer;
begin
  pipeline := gst_element_factory_make('playbin', 'playbin');
  if pipeline = nil then begin
    WriteLn('pipeline error !');
  end;
  g_object_set(pipeline, 'uri', PChar('file:' + s), nil);

  gst_element_set_state(pipeline, GST_STATE_PLAYING);
  // gst_element_set_state(pipeline, GST_STATE_PAUSED);
  //    WriteLn('io 11');
  //
  //
  //  bus := gst_element_get_bus(pipeline);
  //  if bus = nil then begin
  //    WriteLn('bus error !');
  //  end;
  //  WriteLn(s);
  ////  msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_DURATION_CHANGED or GST_MESSAGE_ERROR);
  //  msg := gst_bus_timed_pop_filtered(bus, 10000, GST_MESSAGE_DURATION_CHANGED or GST_MESSAGE_ERROR);
  //  if msg = nil then begin
  //    WriteLn('msg error !');
  //  end;
  //  count:=0;
  //  repeat
  //    gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration);
  //    inc(count);
  ////    WriteLn(count);
  ////      Application.ProcessMessages;
  //
  //  until duration <> GST_CLOCK_TIME_NONE;
  WriteLn(s);
  repeat
    gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration);
    if duration <> -1 then  begin
      WriteLn(duration);
    end;
  until duration > 0;


  Result := duration div G_USEC_PER_SEC;
  //  WriteLn(GstClockToStr(duration div G_USEC_PER_SEC));
  //  WriteLn(duration: 4);

  gst_element_set_state(pipeline, GST_STATE_NULL);
  //gst_message_unref(msg);
  //g_object_unref(bus);
  g_object_unref(pipeline);
end;

const
  libpbutils = 'gstpbutils-1.0';

function gst_discoverer_new(time: Tgint64; err: Pointer): Pointer; cdecl; external libpbutils;
function gst_discoverer_discover_uri(discover: Pointer; uri: Pgchar; err: Pointer): Pointer; cdecl; external libpbutils;
function gst_discoverer_info_get_duration(info: Pointer): TGstClockTime; cdecl; external libpbutils;
//procedure gst_discoverer_info_unref(info: Pointer); cdecl; external libpbutils;

function GstClockToStr(t: TGstClockTime): string;
var
  ms, s, min: TGstClockTime;
  i: integer;
begin
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min: 3, ':', s: 2, ':', ms: 3);
  for i := 1 to Length(Result) do begin
    if Result[i] = ' ' then begin
      Result[i] := '0';
    end;
  end;
end;




function get_duration(s: string): Tguint64;
var
  discoverer, info: Pointer;
begin
  discoverer := gst_discoverer_new(5 * GST_SECOND, nil);

  //  info := gst_discoverer_discover_uri(discoverer, 'file:/home/tux/Schreibtisch/sound/test.mp3', nil);
  info := gst_discoverer_discover_uri(discoverer, PChar('file:' + s), nil);

  if info = nil then begin
    WriteLn('Info error !');
    Result := -1;
  end else begin
    Result := gst_discoverer_info_get_duration(info) div G_USEC_PER_SEC;
    //    gst_discoverer_info_unref(info);
    g_object_unref(info);
  end;
  g_object_unref(discoverer);
end;

procedure TForm1.WriteDuration(sl: TStringList);
var
  i: integer;
  s: string;
  dur: Tguint64;
begin
  for i := 0 to sl.Count - 1 do begin
    s := sl[i];
    dur := get_duration(s);
    WriteLn(GstClockToStr(dur));
    Application.ProcessMessages;
    Memo1.Lines.Add(s);
  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  sl: TStringList;
begin
  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos', '*.flac;*.mp3', True);
  WriteDuration(sl);
  sl.Free;
  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16', '*.flac;*.mp3', True);
  WriteDuration(sl);
  sl.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  gst_init(nil, nil);
  Timer1.Enabled := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Panel1.Canvas.Pen.Color := Random($FFFFFF);
  Panel1.Canvas.Line(Random(Panel1.Width), Random(Panel1.Height), Random(Panel1.Width), Random(Panel1.Height));
end;

end.
