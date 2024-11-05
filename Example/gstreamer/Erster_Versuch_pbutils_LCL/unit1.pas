unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  FileUtil,
  glib280, gst124, gstTools,

  gstdiscoverer  ;

type
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
