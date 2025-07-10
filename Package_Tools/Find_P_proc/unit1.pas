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
  private
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure FindPType(sl: TStringList; proc: string; path: string);
var
  i: integer;
begin
  Delete(path, 1, 52);

  //  WriteLn('proc  ',proc);
  if Length(proc) > 0 then begin
    if proc[1] = 'T' then begin
      proc[1] := 'P';

      WriteLn();
      for i := 0 to sl.Count - 1 do begin
        if pos(proc, sl[i]) <> 0 then begin
          WriteLn(sl[i], '   (', i, ')  ',path);
        end;
      end;

    end else begin
      //    WriteLn('Fehler  ', proc,'    ',path);
    end;

  end else begin
//    WriteLn('Länge = 0');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a, k: integer;
  s: string;
  sa: TAnsiStringArray;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/advancedpackages', '*.pas;*.inc', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    for j := 0 to slHeader.Count - 1 do begin
      if (pos(' procedure(', slHeader[j]) > 0) or (pos(' function(', slHeader[j]) > 0) or
        (pos(' procedure;', slHeader[j]) > 0) or (pos(' function:', slHeader[j]) > 0) then begin

        s := slHeader[j];
        //        WriteLn('  ', s);
        s := StringReplace(s, ' ', '', [rfReplaceAll]);
        sa := s.Split([' ', '(', '=']);
        for k := 0 to Length(sa) - 1 do begin
          //          WriteLn(k:4,'  ', sa[k]);
        end;
        FindPType(slHeader, sa[0], slFile[i]);
        //        WriteLn();

      end;
    end;
    slHeader.Free;
    Write('.');
  end;

  slFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
