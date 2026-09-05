unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  crt,
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    soText: string;
    procedure checkProc(const src: string);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.checkProc(const src: string);
var
  sa: TAnsiStringArray;
  s: string;
begin
  TextAttr := 7;
  WriteLn(src);
  sa := src.Split('(');
  s := sa[0];
  sa := s.Split(' ');
  s := sa[Length(sa) - 1];
  TextAttr := 13;
  WriteLn(s);

  if pos(s, soText) > 0 then begin
    TextAttr := 11;
    WriteLn('found');
  end else begin
    TextAttr := 12;
    WriteLn('not found');
  end;
  WriteLn();
  TextAttr := 7;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
  p: SizeInt;
  soBuffer: TStringList;
  f:file;
  BytesRead: Integer;
begin
  //soBuffer := TStringList.Create;
  //soBuffer.LoadFromFile('/home/tux/Schreibtisch/von_Git/flint/flint-3.4.0/libflint.so');
  //soText := soBuffer.Text;
  //soBuffer.Free;
  //

  AssignFile(f, '/home/tux/Schreibtisch/von_Git/flint/flint-3.4.0/libflint.so');
  Reset(f, 1);
    SetLength(soText, FileSize(f)); // Reserviert exakt die 64 MB im String
    BlockRead(f, soText[1], FileSize(f), BytesRead); // Liest die gesamte Binärdatei direkt in den String
    CloseFile(f);

  Memo1.Clear;
  slFile := FindAllFiles('/home/tux/Schreibtisch/von_Git/flint/flint-3.4.0/src', '*.h', True);
  Memo1.Lines := slFile;



  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

//    WriteLn(#10, i, '/', slFile.Count - 1, '         ', slFile[i], #10);

    for j := 0 to slHeader.Count - 1 do begin
      s := slHeader[j];
      p := pos('_INLINE ', s);
      if p > 0 then begin

        if pos('#', s) <> 1 then begin
          if pos('TEMPLATE', s) = 0 then begin
            if pos('(', s) = 0 then begin checkProc(slHeader[j + 1]); end else begin checkProc(s); end;
          end;
        end;
      end;

    end;
    //    slHeader.SaveToFile(slFile[i]);
    slHeader.Free;
  end;

  slFile.Free;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
