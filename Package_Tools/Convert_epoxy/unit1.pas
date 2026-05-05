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
    procedure Memo1Change(Sender: TObject);
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
  s1, s2, bez: string;
  p, l: SizeInt;
begin
  Memo1.Clear;

  for i := 0 to Length(epoxy_path) - 1 do begin
    WriteLn(epoxy_path[i]);
    slSrc := TStringList.Create;
    slSrc.LoadFromFile(epoxy_path[i]);
    slDest := TStringList.Create;

    for j := 0 to slSrc.Count - 1 do begin
      s1 := slSrc[j];
      s2:=s1;
      slDest.Add(s2);
      p := pos('epoxy_', s2);
      if p > 1 then begin
        bez := copy(s2, p, pos(':', s2) - 3);

        Delete(s2, 1, p + 5);
        l := Length(s2);
        Delete(s2, l - 24, 100);
        s2 := '  '+s2 + ' absolute ' + bez + ';'#10;
        slDest.Add(s2);

        WriteLn(s2);
      end;
    end;
//    slDest.SaveToFile(epoxy_path[i]);
    slSrc.Free;
    slDest.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


end.
