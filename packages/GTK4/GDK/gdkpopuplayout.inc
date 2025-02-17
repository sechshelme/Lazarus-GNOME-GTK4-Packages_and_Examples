
{$IFDEF read_interface}

type
  PGdkAnchorHints = ^TGdkAnchorHints;
  TGdkAnchorHints = longint;

const
  GDK_ANCHOR_FLIP_X = 1 shl 0;
  GDK_ANCHOR_FLIP_Y = 1 shl 1;
  GDK_ANCHOR_SLIDE_X = 1 shl 2;
  GDK_ANCHOR_SLIDE_Y = 1 shl 3;
  GDK_ANCHOR_RESIZE_X = 1 shl 4;
  GDK_ANCHOR_RESIZE_Y = 1 shl 5;
  GDK_ANCHOR_FLIP = GDK_ANCHOR_FLIP_X or GDK_ANCHOR_FLIP_Y;
  GDK_ANCHOR_SLIDE = GDK_ANCHOR_SLIDE_X or GDK_ANCHOR_SLIDE_Y;
  GDK_ANCHOR_RESIZE = GDK_ANCHOR_RESIZE_X or GDK_ANCHOR_RESIZE_Y;

type
  TGdkPopupLayout = record
  end;
  PGdkPopupLayout = ^TGdkPopupLayout;

function gdk_popup_layout_get_type: TGType; cdecl; external libgtk4;
function gdk_popup_layout_new(anchor_rect: PGdkRectangle; rect_anchor: TGdkGravity; surface_anchor: TGdkGravity): PGdkPopupLayout; cdecl; external libgtk4;
function gdk_popup_layout_ref(layout: PGdkPopupLayout): PGdkPopupLayout; cdecl; external libgtk4;
procedure gdk_popup_layout_unref(layout: PGdkPopupLayout); cdecl; external libgtk4;
function gdk_popup_layout_copy(layout: PGdkPopupLayout): PGdkPopupLayout; cdecl; external libgtk4;
function gdk_popup_layout_equal(layout: PGdkPopupLayout; other: PGdkPopupLayout): Tgboolean; cdecl; external libgtk4;
procedure gdk_popup_layout_set_anchor_rect(layout: PGdkPopupLayout; anchor_rect: PGdkRectangle); cdecl; external libgtk4;
function gdk_popup_layout_get_anchor_rect(layout: PGdkPopupLayout): PGdkRectangle; cdecl; external libgtk4;
procedure gdk_popup_layout_set_rect_anchor(layout: PGdkPopupLayout; anchor: TGdkGravity); cdecl; external libgtk4;
function gdk_popup_layout_get_rect_anchor(layout: PGdkPopupLayout): TGdkGravity; cdecl; external libgtk4;
procedure gdk_popup_layout_set_surface_anchor(layout: PGdkPopupLayout; anchor: TGdkGravity); cdecl; external libgtk4;
function gdk_popup_layout_get_surface_anchor(layout: PGdkPopupLayout): TGdkGravity; cdecl; external libgtk4;
procedure gdk_popup_layout_set_anchor_hints(layout: PGdkPopupLayout; anchor_hints: TGdkAnchorHints); cdecl; external libgtk4;
function gdk_popup_layout_get_anchor_hints(layout: PGdkPopupLayout): TGdkAnchorHints; cdecl; external libgtk4;
procedure gdk_popup_layout_set_offset(layout: PGdkPopupLayout; dx: longint; dy: longint); cdecl; external libgtk4;
procedure gdk_popup_layout_get_offset(layout: PGdkPopupLayout; dx: Plongint; dy: Plongint); cdecl; external libgtk4;
procedure gdk_popup_layout_set_shadow_width(layout: PGdkPopupLayout; left: longint; right: longint; top: longint; bottom: longint); cdecl; external libgtk4;
procedure gdk_popup_layout_get_shadow_width(layout: PGdkPopupLayout; left: Plongint; right: Plongint; top: Plongint; bottom: Plongint); cdecl; external libgtk4;

// === Konventiert am: 31-7-24 16:23:27 ===

function GDK_TYPE_POPUP_LAYOUT: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_POPUP_LAYOUT: TGType;
begin
  GDK_TYPE_POPUP_LAYOUT := gdk_popup_layout_get_type;
end;



{$ENDIF read_implementation}
