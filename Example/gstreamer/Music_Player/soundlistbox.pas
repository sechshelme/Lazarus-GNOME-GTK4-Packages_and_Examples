unit SoundListBox;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
{$modeswitch advancedrecords on}

interface

uses
  Classes, SysUtils, gst,
  StdCtrls, Controls, Dialogs, ExtCtrls, ComCtrls, Forms,
  Laz2_XMLCfg, Types, Graphics,
  Common,
  Streamer, SongEditBox;

type
  TSongInfo = record
    title: string;
    Duration: TGstClockTime;
  end;
  TSongInfos = array of TSongInfo;

  { TSongInfosHelper }

  TSongInfosHelper = type helper for TSongInfos
    procedure Add(const path: string);
    procedure Remove(index: integer);
    procedure Move(index0, index1: integer);
    function getTotalDuration: TGstClockTime;
  end;

type

  { TSongsListPanel }

  TSongsListPanel = class(TPanel)
  private
    SongInfos: TSongInfos;
    function GetCount: integer;
    function GetItemIndex: integer;
    procedure SetItemIndex(AValue: integer);
    procedure Renum;
  public
    EditBox: TEditBox;
    ListView: TListView;
    Lab_Total_Value, Lab_Track_Value: TLabel;
    constructor Create(TheOwner: TComponent); override;
    procedure Add(const song: string); overload;
    procedure Add(const song: TStringList); overload;
    procedure Remove;
    procedure RemoveAll;
    procedure Down;
    procedure Up;
    function Next: boolean;
    function Prev: boolean;
    function GetTitle: string;
    function getDurationTotal: TGstClockTime;
    procedure SaveToXML(const path: string);
    procedure LoadToXML(const path: string);
    property ItemIndex: integer read GetItemIndex write SetItemIndex;
    property Count: integer read GetCount;
  end;

implementation

{ TSongInfosHelper }

procedure TSongInfosHelper.Add(const path: string);
var
  si: TSongInfo;
begin
  si.title := path;
  si.Duration := get_duration(path);
  Self += [si];
end;

procedure TSongInfosHelper.Remove(index: integer);
begin
  Delete(Self, index, 1);
  WriteLn('len: ', Length(Self));
end;

procedure TSongInfosHelper.Move(index0, index1: integer);
var
  si: TSongInfo;
begin
  si := Self[index0];
  Self[index0] := Self[index1];
  Self[index1] := si;
end;

function TSongInfosHelper.getTotalDuration: TGstClockTime;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Length(Self) - 1 do begin
    Result += Self[i].Duration;
  end;
end;

// ========

function TSongsListPanel.GetItemIndex: integer;
begin
  Result := ListView.ItemIndex;
end;

procedure TSongsListPanel.SetItemIndex(AValue: integer);
begin
  ListView.ItemIndex := AValue;
end;

procedure TSongsListPanel.Renum;
var
  i: integer;
begin
  for i := 0 to ListView.Items.Count - 1 do begin
    ListView.Items[i].Caption := IntToStr(i);
  end;
end;

function TSongsListPanel.GetCount: integer;
begin
  Result := ListView.Items.Count;
end;

constructor TSongsListPanel.Create(TheOwner: TComponent);
var
  ToolBox, ListInfoBox: TPanel;
  Lab_Total, Lab_Track: TLabel;
begin
  inherited Create(TheOwner);
  SetLength(SongInfos, 0);

  ToolBox := TPanel.Create(Self);
  ToolBox.Parent := Self;
  ToolBox.Align := alRight;
  ToolBox.Width := 120;

  EditBox := TEditBox.Create(ToolBox);
  EditBox.Parent := ToolBox;
  EditBox.Width := ToolBox.Width;
  EditBox.Align := alTop;

  ListInfoBox := TPanel.Create(ToolBox);
  ListInfoBox.Parent := ToolBox;
  ListInfoBox.Width := ToolBox.Width;
  ListInfoBox.Align := alBottom;
  ListInfoBox.Height := 150;

  Lab_Total := TLabel.Create(ListInfoBox);
  Lab_Total.Parent := ListInfoBox;
  Lab_Total.Font.Style := [fsbold];
  Lab_Total.Top := 10;
  Lab_Total.Left := 10;
  Lab_Total.Caption := 'Total:';

  Lab_Total_Value := TLabel.Create(ListInfoBox);
  Lab_Total_Value.Parent := ListInfoBox;
  Lab_Total_Value.Top := 30;
  Lab_Total_Value.Left := 10;
  Lab_Total_Value.Caption := '--:-';

  Lab_Track := TLabel.Create(ListInfoBox);
  Lab_Track.Parent := ListInfoBox;
  Lab_Track.Font.Style := [fsbold];
  Lab_Track.Top := 60;
  Lab_Track.Left := 10;
  Lab_Track.Caption := 'Track:';

  Lab_Track_Value := TLabel.Create(ListInfoBox);
  Lab_Track_Value.Parent := ListInfoBox;
  Lab_Track_Value.Top := 80;
  Lab_Track_Value.Left := 10;
  Lab_Track_Value.Caption := '-/-';

  ListView := TListView.Create(Self);
  ListView.Parent := Self;
  ListView.Align := alClient;
  ListView.ReadOnly := True;

  ListView.ViewStyle := vsReport;
  ListView.Columns.Add.Caption := 'Track';
  ListView.Columns[0].Width := 50;
  ListView.Columns.Add.Caption := 'Titel';
  ListView.Columns[1].Width := 800;
  ListView.Columns.Add.Caption := 'Time';
  ListView.Columns[2].Width := 100;
end;

procedure TSongsListPanel.Add(const song: string);
var
  ad: TListItem;
  dur: string;
begin
  SongInfos.Add(song);
  dur := GstClockToStr(SongInfos[Length(SongInfos) - 1].Duration);

  ad := ListView.Items.Add;
  ad.Caption := '';

  ad.SubItems.Add(SongInfos[Length(SongInfos) - 1].title);
  ad.SubItems.Add(dur);
  Renum;
end;

procedure TSongsListPanel.Add(const song: TStringList);
var
  i: integer;
begin
  for i := 0 to song.Count - 1 do begin
    Add(song[i]);
    Application.ProcessMessages;
  end;
end;

procedure TSongsListPanel.Remove;
var
  index: integer;
begin
  index := ListView.ItemIndex;
  if (index >= 0) and (index < ListView.Items.Count) then  begin
    ListView.Items.Delete(index);
    SongInfos.Remove(index);
    if index < ListView.Items.Count then  begin
      ListView.ItemIndex := index;
    end else if index > 0 then  begin
      ListView.ItemIndex := index - 1;
    end;
  end;
  Renum;
end;

procedure TSongsListPanel.RemoveAll;
begin
  SetLength(SongInfos, 0);
  ListView.Clear;
end;

procedure TSongsListPanel.Down;
var
  index: integer;
begin
  index := ListView.ItemIndex;
  if index = -1 then begin
    Exit;
  end;
  if index < ListView.Items.Count - 1 then  begin
    ListView.Items.Move(index, index + 1);
    SongInfos.Move(index, index + 1);
    ListView.ItemIndex := index + 1;
  end;
  Renum;
end;

procedure TSongsListPanel.Up;
var
  index: integer;
begin
  index := ListView.ItemIndex;
  if index = -1 then begin
    Exit;
  end;
  if index > 0 then  begin
    ListView.Items.Move(index, index - 1);
    SongInfos.Move(index, index - 1);
    ListView.ItemIndex := index - 1;
  end;
  Renum;
end;

function TSongsListPanel.Next: boolean;
var
  index: integer;
begin
  if ListView.Items.Count <= 0 then begin
    Result := False;
    Exit;
  end else begin
    Result := True;
  end;
  index := ListView.ItemIndex;
  Inc(index);
  if index >= ListView.Items.Count then begin
    index := 0;
  end;
  ListView.ItemIndex := index;
end;

function TSongsListPanel.Prev: boolean;
begin
  if ListView.Items.Count <= 0 then begin
    Result := False;
    Exit;
  end;
  Result := True;
  begin
    if ListView.ItemIndex = 0 then begin
      ListView.ItemIndex := ListView.Items.Count - 1;
    end else begin
      ListView.ItemIndex := ListView.ItemIndex - 1;
    end;
  end;
end;

function TSongsListPanel.GetTitle: string;
begin
  if ListView.ItemIndex >= 0 then begin
    Result := SongInfos[ListView.ItemIndex].title;
  end else begin
    Result := '';
  end;
end;

function TSongsListPanel.getDurationTotal: TGstClockTime;
begin
  Result := SongInfos.getTotalDuration;
end;

procedure TSongsListPanel.SaveToXML(const path: string);
var
  xml: TXMLConfig;
  i: integer;
begin
  xml := TXMLConfig.Create(nil);
  xml.Filename := path;
  xml.Clear;
  for i := 0 to Length(SongInfos) - 1 do begin
    xml.SetValue('songs/items[' + IntToStr(i + 1) + ']/song', SongInfos[i].title);
  end;
  xml.Free;
end;

procedure TSongsListPanel.LoadToXML(const path: string);
var
  i, cnt: integer;
  xml: TXMLConfig;
  s: string;
begin
  RemoveAll;
  xml := TXMLConfig.Create(nil);
  xml.Filename := path;
  cnt := xml.GetChildCount('songs');
  for i := 0 to cnt - 1 do begin
    s := xml.GetValue('songs/items[' + IntToStr(i + 1) + ']/song', '');
    Add(s);
  end;
  xml.Free;
end;

end.
