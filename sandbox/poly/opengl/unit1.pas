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
const
  scale = 0.1;
  trans = -0.5;
begin
  glClearColor(0.8, 0.5, 0.3, 1.0);
  glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);

  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glEnable(GL_DEPTH_TEST);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
  glTranslatef(trans, trans, trans);
  glScalef(scale, scale, scale);
  glRotatef(30, 1, 1, 1);

  draw;

  OpenGLControl1.SwapBuffers;
end;


initialization

  {$I unit1.lrs}


end.
