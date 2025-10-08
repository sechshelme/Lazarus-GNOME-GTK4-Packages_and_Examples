unit GST_OpenGL;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, gl, OpenGLContext;

type

  { TGST_OpenGL }

  TGST_OpenGL = class(TPanel)
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure Repaint; override;
  private
    ogc:TOpenGLControl;
    textureID0: GLuint;
    Ready: boolean;
  end;

implementation

{ TGST_OpenGL }

constructor TGST_OpenGL.Create(TheOwner: TComponent);
begin
  self.BorderWidth:=0;
  textureID0 := 0;
  Ready := False;
  inherited Create(TheOwner);
  ogc:=TOpenGLControl.Create(self);
  ogc.Parent := Self;
  ogc.Align := alClient;
  ogc.AutoResizeViewport := True;
//  ogc.MakeCurrent;
end;

procedure TGST_OpenGL.Repaint;
const
  size = 0.9;
  Textur24: array[0..11] of byte = ($FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $FF, $00, $00);
begin
  inherited;

  WriteLn('Repaint');
  WriteLn(self.Width, ' x ', self.Height);

  if not Ready then begin
    Ready := True;
    Exit;
  end;

  if textureID0 = 0 then begin
    glClearColor(0.8, 0.5, 0.3, 1.0);

    glGenTextures(1, @textureID0);
    glBindTexture(GL_TEXTURE_2D, textureID0);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, 2, 2, 0, GL_RGB, GL_UNSIGNED_BYTE, @Textur24);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glEnable(GL_TEXTURE_2D);
  end;

  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

  glBegin(GL_QUADS);
  glTexCoord2f(0.0, 0.0);
  glVertex3f(-size, -size, 0);
  glTexCoord2f(1.0, 0.0);
  glVertex3f(-size, size, 0);
  glTexCoord2f(1.0, 1.0);
  glVertex3f(size, size, 0);
  glTexCoord2f(0.0, 1.0);
  glVertex3f(size, -size, 0);
  glEnd();

 ogc.SwapBuffers;
end;

destructor TGST_OpenGL.Destroy;
begin
  if textureID0 <> 0 then begin
    glDeleteTextures(1, @textureID0);
  end;
  inherited Destroy;
end;

end.
