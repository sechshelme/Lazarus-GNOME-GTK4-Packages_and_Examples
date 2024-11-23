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
    'GDK_PIXBUF_AVAILABLE_IN_2',
    'GDK_AVAILABLE_IN_4',
    'PANGO_AVAILABLE_IN_1');




procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
begin
  Memo1.Clear;
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    WriteLn(i,'/',slFile.Count);


    for j := 0 to slHeader.Count - 1 do begin
      //if pos('long', slHeader[j]) > 0 then begin
      //  WriteLn();
      //  WriteLn(slFile[i]);
      //  WriteLn(slHeader[j]);
      //
      //  WriteLn();
      //  WriteLn();
      //end;


      slHeader[j] := StringReplace(slHeader[j], 'G_BEGIN_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_END_DECLS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_PURE', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_CONST', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NULL_TERMINATED', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_BEGIN_IGNORE_DEPRECATIONS', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_END_IGNORE_DEPRECATIONS', '', [rfReplaceAll]);

      for a := 0 to Length(availables) - 1 do begin
        for v := 98 downto 2 do begin
          s := availables[a] + '_' + IntToStr(v);
          slHeader[j] := StringReplace(slHeader[j], s, 'extern', [rfReplaceAll]);
        end;
        s := availables[a] + '_VAR';
      end;

            slHeader[j] := StringReplace(slHeader[j], 'PANGO_AVAILABLE_IN_ALL', 'extern', [rfReplaceAll]);


//
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_VAR', 'extern', [rfReplaceAll]);
//
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_ALL', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_12', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_14', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_26', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_30', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_32', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_36', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_2', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_4', 'extern', [rfReplaceAll]);
//      slHeader[j] := StringReplace(slHeader[j], 'GDK_PIXBUF_AVAILABLE_IN_2_6', 'extern', [rfReplaceAll]);

      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_ALL', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_CONST', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_DEPRECATED_IN_4_10', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_DEPRECATED_IN_4_12', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_DEPRECATED_IN_4_14', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_2', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_4', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_6', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_8', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_10', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_12', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_IN_4_14', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_ENUMERATOR_IN_4_10', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_ENUMERATOR_IN_4_12', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_ENUMERATOR_IN_4_14', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GDK_AVAILABLE_ENUMERATOR_IN_4_14', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NULL_TERMINATED', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_WARN_UNUSED_RESULT', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_MALLOC', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_PURE', '', [rfReplaceAll]);
      //slHeader[j] := DeleteLines(slHeader[j], 'G_DEFINE_AUTOPTR_CLEANUP_FUNC(');
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
