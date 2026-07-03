unit gdkpaintable;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGdkPaintableFlags = ^TGdkPaintableFlags;
  TGdkPaintableFlags = longint;
const
  GDK_PAINTABLE_STATIC_SIZE = 1 shl 0;
  GDK_PAINTABLE_STATIC_CONTENTS = 1 shl 1;

type
  TGdkPaintable = record
  end;
  PGdkPaintable = ^TGdkPaintable;

  PGdkPaintableInterface = ^TGdkPaintableInterface;
  TGdkPaintableInterface = record
    g_iface: TGTypeInterface;
    snapshot: procedure(paintable: PGdkPaintable; snapshot: PGdkSnapshot; width: double; height: double); cdecl;
    get_current_image: function(paintable: PGdkPaintable): PGdkPaintable; cdecl;
    get_flags: function(paintable: PGdkPaintable): TGdkPaintableFlags; cdecl;
    get_intrinsic_width: function(paintable: PGdkPaintable): longint; cdecl;
    get_intrinsic_height: function(paintable: PGdkPaintable): longint; cdecl;
    get_intrinsic_aspect_ratio: function(paintable: PGdkPaintable): double; cdecl;
  end;

function gdk_paintable_get_type: TGType; cdecl; external libgtk4;
procedure gdk_paintable_snapshot(paintable: PGdkPaintable; snapshot: PGdkSnapshot; width: double; height: double); cdecl; external libgtk4;
function gdk_paintable_get_current_image(paintable: PGdkPaintable): PGdkPaintable; cdecl; external libgtk4;
function gdk_paintable_get_flags(paintable: PGdkPaintable): TGdkPaintableFlags; cdecl; external libgtk4;
function gdk_paintable_get_intrinsic_width(paintable: PGdkPaintable): longint; cdecl; external libgtk4;
function gdk_paintable_get_intrinsic_height(paintable: PGdkPaintable): longint; cdecl; external libgtk4;
function gdk_paintable_get_intrinsic_aspect_ratio(paintable: PGdkPaintable): double; cdecl; external libgtk4;
procedure gdk_paintable_compute_concrete_size(paintable: PGdkPaintable; specified_width: double; specified_height: double; default_width: double; default_height: double;
  concrete_width: Pdouble; concrete_height: Pdouble); cdecl; external libgtk4;
procedure gdk_paintable_invalidate_contents(paintable: PGdkPaintable); cdecl; external libgtk4;
procedure gdk_paintable_invalidate_size(paintable: PGdkPaintable); cdecl; external libgtk4;
function gdk_paintable_new_empty(intrinsic_width: longint; intrinsic_height: longint): PGdkPaintable; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:23:40 ===

function GDK_TYPE_PAINTABLE: TGType;
function GDK_PAINTABLE(obj: Pointer): PGdkPaintable;
function GDK_IS_PAINTABLE(obj: Pointer): Tgboolean;
function GDK_PAINTABLE_GET_IFACE(obj: Pointer): PGdkPaintableInterface;

implementation

function GDK_TYPE_PAINTABLE: TGType;
begin
  Result := gdk_paintable_get_type;
end;

function GDK_PAINTABLE(obj: Pointer): PGdkPaintable;
begin
  Result := PGdkPaintable(g_type_check_instance_cast(obj, GDK_TYPE_PAINTABLE));
end;

function GDK_IS_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PAINTABLE);
end;

function GDK_PAINTABLE_GET_IFACE(obj: Pointer): PGdkPaintableInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_PAINTABLE);
end;

end.
