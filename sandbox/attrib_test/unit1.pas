unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  BaseUnix;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure WriteTest;
var
  f: Text;
begin
  assign(f, 'write.txt');
  Rewrite(f);
  WriteLn(f, 'Test');
  close(f);
end;

procedure UnixWriteTest;
const
  TestText = 'Testtext';
var
  f: cint;
begin
  //  f := FpOpen('unixwrite.txt', O_WRONLY or O_CREAT or O_TRUNC, &644);
//  f := FpOpen('unixwrite.txt', O_WRONLY or O_CREAT or O_TRUNC, &000);
  f := FpOpen('unixwrite.txt', O_WRONLY or O_CREAT, &644);
  FpWrite(f, TestText, Length(TestText));
  FpClose(f);
end;

const
  libglib2 = 'libglib-2.0';

function g_file_set_contents(filename: Pchar; contents: Pchar; length: SizeUInt; error: Pointer): boolean; cdecl; external libglib2;

procedure GLIbWrite;
var
  filename: Pchar = 'glibtest.txt';
  content: Pchar = 'testext';
begin
  g_file_set_contents(filename, content, -1, nil);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  WriteTest;
  UnixWriteTest;
  GLIbWrite;
  Memo1.Lines.SaveToFile('memotest.txt');
end;

end.
