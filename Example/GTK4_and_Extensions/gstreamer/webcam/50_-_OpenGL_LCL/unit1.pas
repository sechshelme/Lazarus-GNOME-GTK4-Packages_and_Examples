unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, gl, OpenGLContext, GST_OpenGL;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    OpenGLControl1: TGST_OpenGL;
  public
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  OpenGLControl1.Repaint;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  OpenGLControl1 := TGST_OpenGL.Create(Self);
  OpenGLControl1.Parent := Self;
  OpenGLControl1.Align := alClient;
//  OpenGLControl1.MakeCurrent;

  Timer1.Enabled := True;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  OpenGLControl1.Free;
end;

initialization

  {$I unit1.lrs}

end.
