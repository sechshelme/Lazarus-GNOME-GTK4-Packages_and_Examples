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

{ TForm1 }

const
  srcPath = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/gmp/gmp_old.pas';
  destPath = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/gmp/gmp_new.pas';


  //   procedure mpz_init(para1: Tmpz_ptr); cdecl; external libgmp name '__gmpz_init';


function ConverLines(const src, methode: string): string;
var
  p: SizeInt;
  underline,  s: string;
begin
  if (Pos(methode+ ' gmp', src) = 1) then underline:='__' else underline:='__g';

  if (Pos('external', src) > 0) and (Pos(methode, src) = 1) then begin
    p := Pos('(', src);
    s := Copy(src, Length(methode) + 2, p - Length(methode) - 2);
    WriteLn('+' + s + '+');

    Result := Copy(src, 1, Length(src) - 1) + ' name '''+underline + s + ''';';
        WriteLn(Result);

  end else begin
    Result := src;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile: TStringList;
  i: integer;
begin
  Memo1.Clear;
  slFile := TStringList.Create;
  slFile.LoadFromFile(srcPath);

  for i := 0 to slFile.Count - 1 do begin
    slFile[i] := ConverLines(slFile[i], 'procedure');
    slFile[i] := ConverLines(slFile[i], 'function');

    Memo1.Lines.Add(slFile[i]);
  end;
  slFile.SaveToFile(destPath);
  slFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;

end.
