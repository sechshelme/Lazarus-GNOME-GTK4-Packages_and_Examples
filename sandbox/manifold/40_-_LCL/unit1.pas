unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, OpenGLContext, gl,
  draw_gl;

type
  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  public
  end;

var
  Form1: TForm1;

implementation


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  draw;

  OpenGLControl1.SwapBuffers;
end;


initialization

  {$I unit1.lrs}


end.
