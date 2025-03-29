unit gtksourcegutterrendererpixbuf;

interface

uses
  fp_glib2, fp_gdk_pixbuf2, fp_GDK4, fp_GTK4, gtksourcegutterrenderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRendererPixbuf, gtk_source_gutter_renderer_pixbuf, GTK_SOURCE, GUTTER_RENDERER_PIXBUF, GtkSourceGutterRenderer) }
type
  TGtkSourceGutterRendererPixbuf = record
    parent_instance: TGtkSourceGutterRenderer;
  end;
  PGtkSourceGutterRendererPixbuf = ^TGtkSourceGutterRendererPixbuf;

  TGtkSourceGutterRendererPixbufClass = record
    parent_class: TGtkSourceGutterRendererClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceGutterRendererPixbufClass = ^TGtkSourceGutterRendererPixbufClass;

function gtk_source_gutter_renderer_pixbuf_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_pixbuf_new: PGtkSourceGutterRenderer; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_pixbuf_set_pixbuf(renderer: PGtkSourceGutterRendererPixbuf; pixbuf: PGdkPixbuf); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_pixbuf_get_pixbuf(renderer: PGtkSourceGutterRendererPixbuf): PGdkPixbuf; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_pixbuf_set_gicon(renderer: PGtkSourceGutterRendererPixbuf; icon: PGIcon); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_pixbuf_get_gicon(renderer: PGtkSourceGutterRendererPixbuf): PGIcon; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_pixbuf_set_icon_name(renderer: PGtkSourceGutterRendererPixbuf; icon_name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_pixbuf_get_icon_name(renderer: PGtkSourceGutterRendererPixbuf): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_pixbuf_get_paintable(renderer: PGtkSourceGutterRendererPixbuf): PGdkPaintable; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_pixbuf_set_paintable(renderer: PGtkSourceGutterRendererPixbuf; paintable: PGdkPaintable); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_pixbuf_overlay_paintable(renderer: PGtkSourceGutterRendererPixbuf; paintable: PGdkPaintable); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:13:49 ===

function GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF: TGType;
function GTK_SOURCE_GUTTER_RENDERER_PIXBUF(obj: Pointer): PGtkSourceGutterRendererPixbuf;
function GTK_SOURCE_IS_GUTTER_RENDERER_PIXBUF(obj: Pointer): Tgboolean;
function GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS(klass: Pointer): PGtkSourceGutterRendererPixbufClass;
function GTK_SOURCE_IS_GUTTER_RENDERER_PIXBUF_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_GUTTER_RENDERER_PIXBUF_GET_CLASS(obj: Pointer): PGtkSourceGutterRendererPixbufClass;

implementation

function GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF: TGType;
begin
  Result := gtk_source_gutter_renderer_pixbuf_get_type;
end;

function GTK_SOURCE_GUTTER_RENDERER_PIXBUF(obj: Pointer): PGtkSourceGutterRendererPixbuf;
begin
  Result := PGtkSourceGutterRendererPixbuf(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF));
end;

function GTK_SOURCE_IS_GUTTER_RENDERER_PIXBUF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF);
end;

function GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS(klass: Pointer): PGtkSourceGutterRendererPixbufClass;
begin
  Result := PGtkSourceGutterRendererPixbufClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF));
end;

function GTK_SOURCE_IS_GUTTER_RENDERER_PIXBUF_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF);
end;

function GTK_SOURCE_GUTTER_RENDERER_PIXBUF_GET_CLASS(obj: Pointer): PGtkSourceGutterRendererPixbufClass;
begin
  Result := PGtkSourceGutterRendererPixbufClass(PGTypeInstance(obj)^.g_class);
end;


end.
