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
    function DeleteLines(const s, delStr: string): string;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DeleteLines(const s, delStr: string): string;
begin
  if Pos(delStr, s) = 1 then begin
    Result := '';
  end else begin
    Result := s;
  end;
end;

const
  epoxy_path: TStringArray = (
    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/epoxy_1.5.10/epoxy/fp_egl_generated.inc',
    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/epoxy_1.5.10/epoxy/fp_gl_generated.inc',
    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/epoxy_1.5.10/epoxy/fp_glx_generated.inc');

procedure TForm1.Button1Click(Sender: TObject);
var
  slSrc, slDest: TStringList;
  i, j, v: integer;
  s: string;
begin
  Memo1.Clear;

  for i := 0 to Length(epoxy_path) - 1 do begin
    WriteLn(epoxy_path[i]);
    slSrc := TStringList.Create;
    slSrc.LoadFromFile(epoxy_path[i]);
    slDest := TStringList.Create;


    WriteLn(slSrc.Count);
    for j := 0 to slSrc.Count - 1 do begin
      s := slSrc[j];
      if pos('epoxy_', s) > 1 then begin
        WriteLn(s);
      end;

    end;
    //    slDest.SaveToFile(slFile[i]);
    slSrc.Free;
    slDest.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
