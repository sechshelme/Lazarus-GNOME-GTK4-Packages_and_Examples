unit gdk_pixbuf_simple_anim;

interface

uses
  glib280, gdk_pixbuf_core;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkPixbufSimpleAnim = record
  end;
  PGdkPixbufSimpleAnim = ^TGdkPixbufSimpleAnim;

  TGdkPixbufSimpleAnimClass = record
  end;
  PGdkPixbufSimpleAnimClass = ^TGdkPixbufSimpleAnimClass;

function gdk_pixbuf_simple_anim_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_simple_anim_iter_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_simple_anim_new(Width: Tgint; Height: Tgint; rate: Tgfloat): PGdkPixbufSimpleAnim; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_simple_anim_add_frame(animation: PGdkPixbufSimpleAnim; pixbuf: PGdkPixbuf); cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_simple_anim_set_loop(animation: PGdkPixbufSimpleAnim; loop: Tgboolean); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_simple_anim_get_loop(animation: PGdkPixbufSimpleAnim): Tgboolean; cdecl; external libgdk_pixbuf2;

// === Konventiert am: 8-11-24 17:07:17 ===

function GDK_TYPE_PIXBUF_SIMPLE_ANIM: TGType;
function GDK_PIXBUF_SIMPLE_ANIM(obj: Pointer): PGdkPixbufSimpleAnim;
function GDK_PIXBUF_SIMPLE_ANIM_CLASS(klass: Pointer): PGdkPixbufSimpleAnimClass;
function GDK_IS_PIXBUF_SIMPLE_ANIM(obj: Pointer): Tgboolean;
function GDK_IS_PIXBUF_SIMPLE_ANIM_CLASS(klass: Pointer): Tgboolean;
function GDK_PIXBUF_SIMPLE_ANIM_GET_CLASS(obj: Pointer): PGdkPixbufSimpleAnimClass;

implementation

function GDK_TYPE_PIXBUF_SIMPLE_ANIM: TGType;
begin
  GDK_TYPE_PIXBUF_SIMPLE_ANIM := gdk_pixbuf_simple_anim_get_type;
end;

function GDK_PIXBUF_SIMPLE_ANIM(obj: Pointer): PGdkPixbufSimpleAnim;
begin
  Result := PGdkPixbufSimpleAnim(g_type_check_instance_cast(obj, GDK_TYPE_PIXBUF_SIMPLE_ANIM));
end;

function GDK_PIXBUF_SIMPLE_ANIM_CLASS(klass: Pointer): PGdkPixbufSimpleAnimClass;
begin
  Result := PGdkPixbufSimpleAnimClass(g_type_check_class_cast(klass, GDK_TYPE_PIXBUF_SIMPLE_ANIM));
end;

function GDK_IS_PIXBUF_SIMPLE_ANIM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PIXBUF_SIMPLE_ANIM);
end;

function GDK_IS_PIXBUF_SIMPLE_ANIM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_PIXBUF_SIMPLE_ANIM);
end;

function GDK_PIXBUF_SIMPLE_ANIM_GET_CLASS(obj: Pointer): PGdkPixbufSimpleAnimClass;
begin
  Result := PGdkPixbufSimpleAnimClass(PGTypeInstance(obj)^.g_class);
end;



end.
