
{$IFDEF read_interface}

type
  TGdkPixbufLoader = record
    parent_instance: TGObject;
    priv: Tgpointer;
  end;
  PGdkPixbufLoader = ^TGdkPixbufLoader;

  TGdkPixbufLoaderClass = record
    parent_class: TGObjectClass;
    size_prepared: procedure(loader: PGdkPixbufLoader; Width: longint; Height: longint); cdecl;
    area_prepared: procedure(loader: PGdkPixbufLoader); cdecl;
    area_updated: procedure(loader: PGdkPixbufLoader; x: longint; y: longint; Width: longint; Height: longint); cdecl;
    closed: procedure(loader: PGdkPixbufLoader); cdecl;
  end;
  PGdkPixbufLoaderClass = ^TGdkPixbufLoaderClass;

function gdk_pixbuf_loader_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_new: PGdkPixbufLoader; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_new_with_type(image_type: pchar; error: PPGError): PGdkPixbufLoader; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_new_with_mime_type(mime_type: pchar; error: PPGError): PGdkPixbufLoader; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_loader_set_size(loader: PGdkPixbufLoader; Width: longint; Height: longint); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_write(loader: PGdkPixbufLoader; buf: Pguchar; Count: Tgsize; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_write_bytes(loader: PGdkPixbufLoader; buffer: PGBytes; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_get_pixbuf(loader: PGdkPixbufLoader): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_get_animation(loader: PGdkPixbufLoader): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_close(loader: PGdkPixbufLoader; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_loader_get_format(loader: PGdkPixbufLoader): PGdkPixbufFormat; cdecl; external libgdk_pixbuf2;

// === Konventiert am: 8-11-24 17:06:58 ===

function GDK_TYPE_PIXBUF_LOADER: TGType;
function GDK_PIXBUF_LOADER(obj: Pointer): PGdkPixbufLoader;
function GDK_PIXBUF_LOADER_CLASS(klass: Pointer): PGdkPixbufLoaderClass;
function GDK_IS_PIXBUF_LOADER(obj: Pointer): Tgboolean;
function GDK_IS_PIXBUF_LOADER_CLASS(klass: Pointer): Tgboolean;
function GDK_PIXBUF_LOADER_GET_CLASS(obj: Pointer): PGdkPixbufLoaderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_PIXBUF_LOADER: TGType;
begin
  GDK_TYPE_PIXBUF_LOADER := gdk_pixbuf_loader_get_type;
end;

function GDK_PIXBUF_LOADER(obj: Pointer): PGdkPixbufLoader;
begin
  Result := PGdkPixbufLoader(g_type_check_instance_cast(obj, GDK_TYPE_PIXBUF_LOADER));
end;

function GDK_PIXBUF_LOADER_CLASS(klass: Pointer): PGdkPixbufLoaderClass;
begin
  Result := PGdkPixbufLoaderClass(g_type_check_class_cast(klass, GDK_TYPE_PIXBUF_LOADER));
end;

function GDK_IS_PIXBUF_LOADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PIXBUF_LOADER);
end;

function GDK_IS_PIXBUF_LOADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_PIXBUF_LOADER);
end;

function GDK_PIXBUF_LOADER_GET_CLASS(obj: Pointer): PGdkPixbufLoaderClass;
begin
  Result := PGdkPixbufLoaderClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
