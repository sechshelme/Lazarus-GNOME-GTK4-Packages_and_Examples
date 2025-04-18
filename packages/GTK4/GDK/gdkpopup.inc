
{$IFDEF read_interface}


  {G_DECLARE_INTERFACE (GdkPopup, gdk_popup, GDK, POPUP, GObject) }
type
  TGdkPopup = record
  end;
  PGdkPopup = ^TGdkPopup;

  TGdkPopupInterface = record
  end;
  PGdkPopupInterface = ^TGdkPopupInterface;

function gdk_popup_get_type: TGType; cdecl; external libgtk4;
function gdk_popup_present(popup: PGdkPopup; Width: longint; Height: longint; layout: PGdkPopupLayout): Tgboolean; cdecl; external libgtk4;
function gdk_popup_get_surface_anchor(popup: PGdkPopup): TGdkGravity; cdecl; external libgtk4;
function gdk_popup_get_rect_anchor(popup: PGdkPopup): TGdkGravity; cdecl; external libgtk4;
function gdk_popup_get_parent(popup: PGdkPopup): PGdkSurface; cdecl; external libgtk4;
function gdk_popup_get_position_x(popup: PGdkPopup): longint; cdecl; external libgtk4;
function gdk_popup_get_position_y(popup: PGdkPopup): longint; cdecl; external libgtk4;
function gdk_popup_get_autohide(popup: PGdkPopup): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:23:35 ===

function GDK_TYPE_POPUP: TGType;
function GDK_POPUP(obj: Pointer): PGdkPopup;
function GDK_IS_POPUP(obj: Pointer): Tgboolean;
function GDK_POPUP_GET_IFACE(obj: Pointer): PGdkPopupInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_POPUP: TGType;
begin
  Result := gdk_popup_get_type;
end;

function GDK_POPUP(obj: Pointer): PGdkPopup;
begin
  Result := PGdkPopup(g_type_check_instance_cast(obj, GDK_TYPE_POPUP));
end;

function GDK_IS_POPUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_POPUP);
end;

function GDK_POPUP_GET_IFACE(obj: Pointer): PGdkPopupInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_POPUP);
end;




{$ENDIF read_implementation}
