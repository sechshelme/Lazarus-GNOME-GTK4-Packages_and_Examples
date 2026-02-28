unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  fp_liblas;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
const
  filename = '/home/tux/Schreibtisch/von_Git/liblas/libLAS/test/data/autzen.las';
var
  reader: TLASReaderH;
  header: TLASHeaderH;
  points_count: DWord;
  version_major, version_minor: byte;
  p: TLASPointH;
  i: integer;
  x, y: Int64;
begin
      reader := LASReader_Create(filename);
    if reader = nil then begin
      WriteLn('Fehler beim Öffnen!');
      Exit;
    end;

    header := LASReader_GetHeader(reader);

    points_count := LASHeader_GetPointRecordsCount(header);
    version_major := LASHeader_GetVersionMajor(header);
    version_minor := LASHeader_GetVersionMinor(header);

    WriteLn('Datei: ', filename);
    WriteLn('LAS Version:  ', version_major, '.', version_minor);
    WriteLn('Anzahl Punkte: ', points_count);

    LASHeader_Destroy(header);

    WriteLn('Lese Punkte...');

    for i := 0 to points_count - 1 do begin
      p := LASReader_GetNextPoint(reader);
      if p = nil then begin
        break;
      end;
//      x:=Trunc( LASPoint_GetX(p)/10000);
//      y:=Trunc( LASPoint_GetY(p)/10000);
      x:=Trunc( LASPoint_GetX(p)-637000);
      y:=Trunc( LASPoint_GetY(p)-852000);
      WriteLn(x,' x ',y);

      Canvas.Pixels[x,y]:=0;

      WriteLn('P ', i: 2, ': X=', LASPoint_GetX(p): 0: 2, ' Y=', LASPoint_GetY(p): 0: 2, ' Z=', LASPoint_GetZ(p): 0: 2,
        ' | Int: ', LASPoint_GetIntensity(p), ' | Class: ', LASPoint_GetClassification(p));
    end;

    LASReader_Destroy(reader);


end;

end.

