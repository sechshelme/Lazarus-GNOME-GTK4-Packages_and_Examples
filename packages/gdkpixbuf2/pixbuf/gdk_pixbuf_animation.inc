
{$IFDEF read_interface}

type
  TGdkPixbufAnimation = record
    parent_instance: TGObject;
  end;
  PGdkPixbufAnimation = ^TGdkPixbufAnimation;

  TGdkPixbufAnimationIter = record
    parent_instance: TGObject;
  end;
  PGdkPixbufAnimationIter = ^TGdkPixbufAnimationIter;

  TGdkPixbufAnimationClass = record
    parent_class: TGObjectClass;
    is_static_image: function(animation: PGdkPixbufAnimation): Tgboolean; cdecl;
    get_static_image: function(animation: PGdkPixbufAnimation): PGdkPixbuf; cdecl;
    get_size: procedure(animation: PGdkPixbufAnimation; Width: Plongint; Height: Plongint); cdecl;
    get_iter: function(animation: PGdkPixbufAnimation; start_time: PGTimeVal): PGdkPixbufAnimationIter; cdecl;
  end;
  PGdkPixbufAnimationClass = ^TGdkPixbufAnimationClass;

  TGdkPixbufAnimationIterClass = record
    parent_class: TGObjectClass;
    get_delay_time: function(iter: PGdkPixbufAnimationIter): longint; cdecl;
    get_pixbuf: function(iter: PGdkPixbufAnimationIter): PGdkPixbuf; cdecl;
    on_currently_loading_frame: function(iter: PGdkPixbufAnimationIter): Tgboolean; cdecl;
    advance: function(iter: PGdkPixbufAnimationIter; current_time: PGTimeVal): Tgboolean; cdecl;
  end;
  PGdkPixbufAnimationIterClass = ^TGdkPixbufAnimationIterClass;


function gdk_pixbuf_animation_get_type: TGType; cdecl; external libgdk_pixbuf2;
{$ifdef windows}
function gdk_pixbuf_animation_new_from_file_utf8(filename: pansichar; error: PPGError): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
{$endif}
function gdk_pixbuf_animation_new_from_file(filename: pansichar; error: PPGError): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_new_from_stream(stream: PGInputStream; cancellable: PGCancellable; error: PPGError): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_animation_new_from_stream_async(stream: PGInputStream; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_new_from_stream_finish(async_result: PGAsyncResult; error: PPGError): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_new_from_resource(resource_path: pansichar; error: PPGError): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_ref(animation: PGdkPixbufAnimation): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_animation_unref(animation: PGdkPixbufAnimation); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_width(animation: PGdkPixbufAnimation): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_height(animation: PGdkPixbufAnimation): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_is_static_image(animation: PGdkPixbufAnimation): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_static_image(animation: PGdkPixbufAnimation): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_iter(animation: PGdkPixbufAnimation; start_time: PGTimeVal): PGdkPixbufAnimationIter; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_get_delay_time(iter: PGdkPixbufAnimationIter): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_get_pixbuf(iter: PGdkPixbufAnimationIter): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_on_currently_loading_frame(iter: PGdkPixbufAnimationIter): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_advance(iter: PGdkPixbufAnimationIter; current_time: PGTimeVal): Tgboolean; cdecl; external libgdk_pixbuf2;

function gdk_pixbuf_non_anim_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_non_anim_new(pixbuf: PGdkPixbuf): PGdkPixbufAnimation; cdecl; external libgdk_pixbuf2;

// === Konventiert am: 7-11-24 19:26:25 ===

function GDK_TYPE_PIXBUF_ANIMATION: TGType;
function GDK_PIXBUF_ANIMATION(obj: Pointer): PGdkPixbufAnimation;
function GDK_PIXBUF_ANIMATION_CLASS(klass: Pointer): PGdkPixbufAnimationClass;
function GDK_IS_PIXBUF_ANIMATION(obj: Pointer): Tgboolean;
function GDK_IS_PIXBUF_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function GDK_PIXBUF_ANIMATION_GET_CLASS(obj: Pointer): PGdkPixbufAnimationClass;

function GDK_TYPE_PIXBUF_ANIMATION_ITER: TGType;
function GDK_PIXBUF_ANIMATION_ITER(obj: Pointer): PGdkPixbufAnimationIter;
function GDK_PIXBUF_ANIMATION_ITER_CLASS(klass: Pointer): PGdkPixbufAnimationIterClass;
function GDK_IS_PIXBUF_ANIMATION_ITER(obj: Pointer): Tgboolean;
function GDK_IS_PIXBUF_ANIMATION_ITER_CLASS(klass: Pointer): Tgboolean;
function GDK_PIXBUF_ANIMATION_ITER_GET_CLASS(obj: Pointer): PGdkPixbufAnimationIterClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_PIXBUF_ANIMATION: TGType;
begin
  GDK_TYPE_PIXBUF_ANIMATION := gdk_pixbuf_animation_get_type;
end;

function GDK_PIXBUF_ANIMATION(obj: Pointer): PGdkPixbufAnimation;
begin
  Result := PGdkPixbufAnimation(g_type_check_instance_cast(obj, GDK_TYPE_PIXBUF_ANIMATION));
end;

function GDK_PIXBUF_ANIMATION_CLASS(klass: Pointer): PGdkPixbufAnimationClass;
begin
  Result := PGdkPixbufAnimationClass(g_type_check_class_cast(klass, GDK_TYPE_PIXBUF_ANIMATION));
end;

function GDK_IS_PIXBUF_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PIXBUF_ANIMATION);
end;

function GDK_IS_PIXBUF_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_PIXBUF_ANIMATION);
end;

function GDK_PIXBUF_ANIMATION_GET_CLASS(obj: Pointer): PGdkPixbufAnimationClass;
begin
  Result := PGdkPixbufAnimationClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GDK_TYPE_PIXBUF_ANIMATION_ITER: TGType;
begin
  GDK_TYPE_PIXBUF_ANIMATION_ITER := gdk_pixbuf_animation_iter_get_type;
end;

function GDK_PIXBUF_ANIMATION_ITER(obj: Pointer): PGdkPixbufAnimationIter;
begin
  Result := PGdkPixbufAnimationIter(g_type_check_instance_cast(obj, GDK_TYPE_PIXBUF_ANIMATION_ITER));
end;

function GDK_PIXBUF_ANIMATION_ITER_CLASS(klass: Pointer): PGdkPixbufAnimationIterClass;
begin
  Result := PGdkPixbufAnimationIterClass(g_type_check_class_cast(klass, GDK_TYPE_PIXBUF_ANIMATION_ITER));
end;

function GDK_IS_PIXBUF_ANIMATION_ITER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PIXBUF_ANIMATION_ITER);
end;

function GDK_IS_PIXBUF_ANIMATION_ITER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_PIXBUF_ANIMATION_ITER);
end;

function GDK_PIXBUF_ANIMATION_ITER_GET_CLASS(obj: Pointer): PGdkPixbufAnimationIterClass;
begin
  Result := PGdkPixbufAnimationIterClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
