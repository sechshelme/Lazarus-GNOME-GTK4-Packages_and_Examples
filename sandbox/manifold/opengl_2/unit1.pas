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
  scale = 1.5;
  w: single = 0;
  ambientColor:TVector4f=( 0.1, 0.1, 0.1, 1.0);
begin
  glClearColor(0.8, 0.5, 0.3, 1.0);
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);

//  glEnable(GL_CULL_FACE); // Aktiviert das Weglassen von Flächen
  glCullFace(GL_BACK);    // Bestimmt, dass die Rückseiten (Back) weggelassen werden

  glEnable(GL_LIGHTING); // Beleuchtung generell aktivieren
  glEnable(GL_LIGHT0);   // Lichtquelle 0 einschalten

  glEnable(GL_NORMALIZE);

  glLightfv(GL_LIGHT0, GL_AMBIENT, @ambientColor);



  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glEnable(GL_DEPTH_TEST);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glFrustum(-1.0, 1.0, -1.0, 1.0, 1.5, 100.0);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
  glTranslatef(0, 0, -30);

  glScalef(scale, scale, scale);
  glRotatef(w, 1, 1, 1);
  w += 2;

  draw;

  OpenGLControl1.SwapBuffers;
end;


initialization

  {$I unit1.lrs}


end.
