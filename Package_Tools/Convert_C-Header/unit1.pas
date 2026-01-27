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
  availables: array of string = (
    'CHAFA_AVAILABLE_IN_1',
    'GDK_PIXBUF_AVAILABLE_IN_2',
    'GDK_AVAILABLE_IN_4',
    'GRAPHENE_AVAILABLE_IN',
    'PANGO_AVAILABLE_IN_1',
    'PANGO_DEPRECATED_IN_1');


procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/hpdf', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    WriteLn(i, '/', slFile.Count - 1,'         ', slFile[i]);


    for j := 0 to slHeader.Count - 1 do begin
      //if pos('long', slHeader[j]) > 0 then begin
      //  WriteLn();
      //  WriteLn(slFile[i]);
      //  WriteLn(slHeader[j]);
      //
      //  WriteLn();
      //  WriteLn();
      //end;

      s:=slHeader[j];
      if pos('HPDF_EXPORT(', s)=1 then WriteLn(s);




      slHeader[j] := StringReplace(slHeader[j], 'G_BEGIN_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_END_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NULL_TERMINATED', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_CONST', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_DEPRECATED', '/*G_GNUC_DEPRECATED*/', [rfReplaceAll]);





      //slHeader[j] := StringReplace(slHeader[j], 'HPDF_EXPORT(const char *)', 'extern char *', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'HPDF_EXPORT(HPDF_Doc)', 'extern HPDF_Doc', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'HPDF_EXPORT(HPDF_STATUS)', 'extern HPDF_STATUS', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'HPDF_EXPORT(void)', 'extern void', [rfReplaceAll]);



      slHeader[j] := StringReplace(slHeader[j], 'G_DECLARE_DERIVABLE_TYPE', '//G_DECLARE_DERIVABLE_TYPE', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NON_NULL(1, 2)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_WARN_UNUSED_RESULT', '', [rfReplaceAll]);

    end;
    slHeader.SaveToFile(slFile[i]);
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
