unit gdkdmabuftexture;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gdk_dmabuf_texture_get_type: TGType; cdecl; external libgtk4;
function gdk_dmabuf_error_quark: TGQuark; cdecl; external libgtk4;

function GDK_DMABUF_ERROR: TGQuark;


// === Konventiert am: 2-7-26 19:12:46 ===

function GDK_TYPE_DMABUF_TEXTURE: TGType;
function GDK_DMABUF_TEXTURE(obj: Pointer): PGdkDmabufTexture;
function GDK_IS_DMABUF_TEXTURE(obj: Pointer): Tgboolean;

implementation

function GDK_TYPE_DMABUF_TEXTURE: TGType;
begin
  GDK_TYPE_DMABUF_TEXTURE := gdk_dmabuf_texture_get_type;
end;

function GDK_DMABUF_TEXTURE(obj: Pointer): PGdkDmabufTexture;
begin
  Result := PGdkDmabufTexture(g_type_check_instance_cast(obj, GDK_TYPE_DMABUF_TEXTURE));
end;

function GDK_IS_DMABUF_TEXTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_DMABUF_TEXTURE);
end;


function GDK_DMABUF_ERROR: TGQuark;
begin
  GDK_DMABUF_ERROR := gdk_dmabuf_error_quark;
end;


end.
