unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j: integer;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024', '*.pas;*.inc', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

//    WriteLn(i, '/', slFile.Count - 1);

    for j := 0 to slHeader.Count - 1 do begin
      if (pos(' procedure(', slHeader[j]) > 0) or (pos(' function(', slHeader[j]) > 0) or
      (pos(' procedure;', slHeader[j]) > 0) or (pos(' function:', slHeader[j]) > 0) then begin
        if (pos('cdecl;', slHeader[j]) = 0)and(pos('cvar;', slHeader[j]) = 0) then  begin
          WriteLn();
          WriteLn(slFile[i], '  (', j+1, ')');
        end;
      end;
    end;
    slHeader.Free;
    Write('.')
  end;

  slFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
