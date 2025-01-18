unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  Buttons, ExtCtrls, ComCtrls, Menus, Types, FileUtil,
  InterfaceBase,
  Common, MenuBar, SoundListBox, PlayPanel, AddSongs, SongEditBox,
  gst, Streamer;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MainMenu: TMenuBar;
    PlayPanel: TPlayPanel;
    Timer: TTimer;
    IsTrackBarMDown: boolean;
    SekStream,
    PriStream: TStreamer;
    IsChange: boolean;
    procedure LoadNewMusic(const titel: string; freeed: boolean);
    procedure BoxEventProc(cmd: Tcommand);
    procedure PlayBoxTrackBarChange(Sender: TObject);
    procedure PlayBoxTrackBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure PlayBoxTrackBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure PriStreamLevelChange(level: TLevel);
    procedure TimerTimer(Sender: TObject);
  public
    SongListPanel: TSongsListPanel;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.BoxEventProc(cmd: Tcommand);
var
  index: integer;
  s: string;
  sl: TStringList;
  fd: TOpenDialog;
  sd: TSaveDialog;
begin
  case cmd of
    cmNone: begin
    end;
    cmNew: begin
      //      SongListPanel.Add;
    end;
    cmSave: begin
      sd := TSaveDialog.Create(self);
      sd.DefaultExt := DefaultExt;
      if sd.Execute then  begin
        SongListPanel.SaveToXML(sd.FileName);
      end;
      sd.Free;
    end;
    cmOpen: begin
      fd := TOpenDialog.Create(self);
      fd.DefaultExt := DefaultExt;
      if fd.Execute then  begin
        SongListPanel.LoadToXML(fd.FileName);
      end;
      fd.Free;
    end;
    cmDefaultSongs: begin
      sl := FindAllFiles('/n4800/Multimedia/Music/Diverses/Games/The Witcher, Pt 3 Wild Hunt', '*.flac');
      SongListPanel.Add(sl);
      sl.Free;

      sl := FindAllFiles('/n4800/Multimedia/Music/Schlager/Various/25 Jahre Deutscher Schlager', '*.flac');
      SongListPanel.Add(sl);
      sl.Free;

      //  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16/Vol. 09/CD 1', '*.mp3');
      sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16', '*.mp3');
      SongListPanel.Add(sl);
      sl.Free;

      sl := FindAllFiles('/home/tux/Schreibtisch/sound', '*.mp3');
      SongListPanel.Add(sl);
      sl.Free;

      SongListPanel.Add('/n4800/Multimedia/Videos/WNDSURF1.AVI');
      SongListPanel.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
      SongListPanel.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
      SongListPanel.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
      SongListPanel.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
      SongListPanel.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
      SongListPanel.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_1.wav');
      SongListPanel.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_2.wav');
      SongListPanel.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_3.wav');
      SongListPanel.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_4.wav');
      SongListPanel.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_6.wav');
      SongListPanel.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_7.wav');

      SongListPanel.Lab_Total_Value.Caption := GstClockToStr(SongListPanel.getDurationTotal);
    end;
    cmClose: begin
      Close;
    end;

    cmAdd: begin
      SoundAddForm.SongListBox := SongListPanel;
      SoundAddForm.ShowModal;
      SongListPanel.Lab_Total_Value.Caption := GstClockToStr(SongListPanel.getDurationTotal);
    end;
    cmRemove: begin
      SongListPanel.Remove;
      SongListPanel.Lab_Total_Value.Caption := GstClockToStr(SongListPanel.getDurationTotal);
    end;
    cmRemoveAll: begin
      if MessageDlg('Songs Löschen', 'Alle Einträge entfernen ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        SongListPanel.RemoveAll;
      end;
      SongListPanel.Lab_Total_Value.Caption := GstClockToStr(SongListPanel.getDurationTotal);
    end;
    cmUp: begin
      SongListPanel.Up;
      SongListPanel.Lab_Total_Value.Caption := GstClockToStr(SongListPanel.getDurationTotal);
    end;
    cmDown: begin
      SongListPanel.Down;
      SongListPanel.Lab_Total_Value.Caption := GstClockToStr(SongListPanel.getDurationTotal);
    end;

    cmPlay: begin
      if PriStream = nil then begin
        index := SongListPanel.ItemIndex;
        if SongListPanel.Count > 0 then begin
          if index < 0 then begin
            index := 0;
            SongListPanel.ItemIndex := index;
          end;
          s := SongListPanel.GetTitle;
          LoadNewMusic(s, True);
        end;
      end else begin
        PriStream.Play;
      end;
    end;
    cmPause: begin
      if PriStream <> nil then begin
        PriStream.Pause;
      end;
    end;
    cmStop: begin
      if PriStream <> nil then begin
        PriStream.Stop;
        FreeAndNil(PriStream);
        PlayPanel.TrackBar.Position := 0;
        PlayPanel.TrackBar.Max := 1000;
      end;
    end;
    cmNext: begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if SongListPanel.Next then  begin
          if (PriStream <> nil) and (PriStream.isPlayed) then begin
            LoadNewMusic(SongListPanel.GetTitle, True);
          end;
        end;
      end;
    end;
    cmPrev: begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if PriStream.Position > 2000 then begin
          PriStream.Position := 0;
        end else begin
          if SongListPanel.Prev then begin
            LoadNewMusic(SongListPanel.GetTitle, True);
          end;
        end;
      end;
    end;
    cmAbout: begin
      ShowMessage(GetLCLWidgetTypeName);
    end;
  end;
end;

procedure TForm1.PlayBoxTrackBarChange(Sender: TObject);
begin
  IsChange := True;
end;

procedure TForm1.PlayBoxTrackBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  WriteLn('down');
  IsTrackBarMDown := True;
end;

procedure TForm1.PlayBoxTrackBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  WriteLn('up');
  IsTrackBarMDown := False;
end;

procedure TForm1.TimerTimer(Sender: TObject);
var
  SDur, SPos: integer;
  OldChangeProc: TNotifyEvent;
  volume: extended;
begin
  if (PriStream <> nil) then begin
    if IsChange then begin
      PriStream.Position := PlayPanel.TrackBar.Position;
      IsChange := False;
    end else begin
      OldChangeProc := PlayPanel.TrackBar.OnChange;
      PlayPanel.TrackBar.OnChange := nil;
      SPos := PriStream.Position;
      SDur := PriStream.Duration;
      PlayPanel.TrackBar.Max := SDur;
      PlayPanel.TrackBar.Position := SPos;
      PlayPanel.TrackBar.OnChange := OldChangeProc;
      PlayPanel.DurationValueLabel.Caption := GstClockToStr(SDur);
      PlayPanel.PositionValueLabel.Caption := GstClockToStr(SPos);
      volume := PriStream.Position / FITime;
      if volume > 1.0 then begin
        volume := 1.0;
      end;
      if volume < 0.0 then begin
        volume := 0.0;
      end;
      PriStream.Volume := volume;
      if PriStream.Duration > 0 then begin
        if PriStream.isEnd or (PriStream.Duration - PriStream.Position < CFTime) then begin
          if SekStream <> nil then begin
            FreeAndNil(SekStream);
          end;
          SekStream := PriStream;
          SekStream.OnLevelChange := nil;
          if SongListPanel.Next then  begin
            LoadNewMusic(SongListPanel.GetTitle, False);
          end;
        end;
      end;
    end;
  end;
  if SekStream <> nil then begin
    if SekStream.Duration > 0 then begin
      volume := (SekStream.Duration - SekStream.Position) / FITime;
      if volume > 1.0 then begin
        volume := 1.0;
      end;
      if volume < 0.0 then begin
        volume := 0.0;
      end;
      SekStream.Volume := volume;
    end;

    if SekStream.isEnd then begin
      FreeAndNil(SekStream);
    end;
  end;
  with SongListPanel do begin
    Lab_Track_Value.Caption := IntToStr(ListView.ItemIndex + 1) + '/' + ListView.Items.Count.ToString;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  h: integer;
begin
  Width := 1024;

  PriStream := nil;
  SekStream := nil;

  MainMenu := TMenuBar.Create(Self);
  MainMenu.OnMenuBarEvent := @BoxEventProc;
  Menu := MainMenu;

  PlayPanel := TPlayPanel.Create(Self);
  PlayPanel.Parent := Self;
  PlayPanel.Left := 5;
  PlayPanel.Top := 0;
  PlayPanel.PlayBtnPanel.OnPlayBoxEvent := @BoxEventProc;
  PlayPanel.Width := ClientWidth - 10;
  PlayPanel.Align := alTop;

  SongListPanel := TSongsListPanel.Create(self);
  SongListPanel.Align := alClient;
  SongListPanel.Top := PlayPanel.Height;
  SongListPanel.Left := 5;
  SongListPanel.Height := ClientHeight - PlayPanel.Height;
  SongListPanel.Parent := self;
  SongListPanel.EditBox.OnPlayBoxEvent := @BoxEventProc;

  //  h := EditBox.Height + PlayPanel.Height + 10;

  PlayPanel.TrackBar.TickStyle := tsNone;
  PlayPanel.TrackBar.Max := 1000;
  PlayPanel.TrackBar.OnChange := @PlayBoxTrackBarChange;
  PlayPanel.TrackBar.OnMouseDown := @PlayBoxTrackBarMouseDown;
  PlayPanel.TrackBar.OnMouseUp := @PlayBoxTrackBarMouseUp;
  IsTrackBarMDown := False;

  Timer := TTimer.Create(self);
  Timer.OnTimer := @TimerTimer;
  Timer.Interval := 100;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if PriStream <> nil then begin
    FreeAndNil(PriStream);
  end;
  if SekStream <> nil then begin
    FreeAndNil(PriStream);
  end;
end;

procedure TForm1.LoadNewMusic(const titel: string; freeed: boolean);
begin
  if freeed and (PriStream <> nil) then begin
    FreeAndNil(PriStream);
  end;
  PriStream := TStreamer.Create(titel);
  PriStream.Volume := 0.0;
  PriStream.OnLevelChange := @PriStreamLevelChange;

  PlayPanel.TrackBar.Max := 0;
  PlayPanel.TrackBar.Position := 0;
  PriStream.Play;
end;

procedure TForm1.PriStreamLevelChange(level: TLevel);

  function dB_to_Prozent(db: Tgdouble): Tguint32;
  begin
    Result := 300 - abs(Round(db) * 10);
  end;

begin
  PlayPanel.LevelLShape.Width := dB_to_Prozent(level.L);
  PlayPanel.LevelRShape.Width := dB_to_Prozent(level.R);
end;



end.
