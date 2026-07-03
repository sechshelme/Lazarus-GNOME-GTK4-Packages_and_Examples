unit gdkgltexture;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGdkGLTexture = type Pointer;

function gdk_gl_texture_get_type: TGType; cdecl; external libgtk4;
function gdk_gl_texture_new(context: PGdkGLContext; id: Tguint; width: longint; height: longint; destroy: TGDestroyNotify;
  data: Tgpointer): PGdkTexture; cdecl; external libgtk4; deprecated;
procedure gdk_gl_texture_release(self: PGdkGLTexture); cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:24:44 ===

function GDK_TYPE_GL_TEXTURE: TGType;
function GDK_GL_TEXTURE(obj: Pointer): PGdkGLTexture;
function GDK_IS_GL_TEXTURE(obj: Pointer): Tgboolean;

implementation

function GDK_TYPE_GL_TEXTURE: TGType;
begin
  GDK_TYPE_GL_TEXTURE := gdk_gl_texture_get_type;
end;

function GDK_GL_TEXTURE(obj: Pointer): PGdkGLTexture;
begin
  Result := PGdkGLTexture(g_type_check_instance_cast(obj, GDK_TYPE_GL_TEXTURE));
end;

function GDK_IS_GL_TEXTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_GL_TEXTURE);
end;



end.
