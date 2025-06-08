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
  slFile := FindAllFiles('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/efl', '*.h', True);
  Memo1.Lines := slFile;

  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

    WriteLn(i, '/', slFile.Count - 1);


    for j := 0 to slHeader.Count - 1 do begin
      //if pos('long', slHeader[j]) > 0 then begin
      //  WriteLn();
      //  WriteLn(slFile[i]);
      //  WriteLn(slHeader[j]);
      //
      //  WriteLn();
      //  WriteLn();
      //end;

      //slHeader[j] := StringReplace(slHeader[j], 'GRAPHENE_BEGIN_DECLS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GRAPHENE_END_DECLS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'HB_BEGIN_DECLS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'HB_END_DECLS', '', [rfReplaceAll]);
      //
      //slHeader[j] := StringReplace(slHeader[j], 'G_BEGIN_DECLS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_END_DECLS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_PURE', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_CONST', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_NULL_TERMINATED', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_BEGIN_IGNORE_DEPRECATIONS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_END_IGNORE_DEPRECATIONS', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'G_GNUC_WARN_UNUSED_RESULT', '', [rfReplaceAll]);

      //for a := 0 to Length(availables) - 1 do begin
      //  for v := 98 downto 2 do begin
      //    s := availables[a] + '_' + IntToStr(v);
      //    slHeader[j] := StringReplace(slHeader[j], s, 'extern', [rfReplaceAll]);
      //  end;
      //  s := availables[a] + '_VAR';
      //end;

      //slHeader[j] := StringReplace(slHeader[j], 'WEBKIT_API', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'JSC_API', 'extern', [rfReplaceAll]);
      //
      //slHeader[j] := StringReplace(slHeader[j], 'ADW_AVAILABLE_IN_ALL', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'ADW_AVAILABLE_IN_1_4', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'ADW_AVAILABLE_IN_1_5', 'extern', [rfReplaceAll]);
      //
      //slHeader[j] := StringReplace(slHeader[j], 'GTK_SOURCE_AVAILABLE_IN_ALL', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'GTK_SOURCE_AVAILABLE_IN_5_4', 'extern', [rfReplaceAll]);
      //
      //
      //slHeader[j] := StringReplace(slHeader[j], 'PANGO_AVAILABLE_IN_ALL', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'PANGO_DEPRECATED', 'extern', [rfReplaceAll]);
      //
      //slHeader[j] := StringReplace(slHeader[j], 'GES_API', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'HB_EXTERN', 'extern', [rfReplaceAll]);
      //
      //slHeader[j] := StringReplace(slHeader[j], 'CHAFA_AVAILABLE_IN_ALL', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], '_VTE_PUBLIC', 'extern', [rfReplaceAll]);
      //
      //
      //// libxml
      //slHeader[j] := StringReplace(slHeader[j], 'XMLPUBFUN', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'XMLPUBVAR', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'XMLCALL', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'XMLCDECL', '', [rfReplaceAll]);

      //      slHeader[j] := StringReplace(slHeader[j], 'EAPI', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'EVAS_API', 'extern', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'EINA_WARN_UNUSED_RESULT', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'EINA_CONST', '', [rfReplaceAll]);
      //slHeader[j] := StringReplace(slHeader[j], 'extern_WEAK', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(1)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(2)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(3)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(4)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(1, 2)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(2, 3)', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_ARG_NONNULL(1, 2, 3)', '', [rfReplaceAll]);


      slHeader[j] := StringReplace(slHeader[j], 'EINA_PURE', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_CONST', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_MALLOC', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_WARN_UNUSED_RESULT', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EINA_API', 'extern', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EO_API_WEAK', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EO_API', 'extern', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EAPI_WEAK', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EAPI', 'extern', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EWAPI', 'extern', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'extern_WEAK', '', [rfReplaceAll]);
      slHeader[j] := StringReplace(slHeader[j], 'EFL_TRANSFER_OWNERSHIP', '', [rfReplaceAll]);

      slHeader[j] := StringReplace(slHeader[j], 'ECORE_CON_API', 'extern', [rfReplaceAll]);



      slHeader[j] := StringReplace(slHeader[j], 'EINA_INLIST;', 'Eina_Inlist __in_list;', [rfReplaceAll]);

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
