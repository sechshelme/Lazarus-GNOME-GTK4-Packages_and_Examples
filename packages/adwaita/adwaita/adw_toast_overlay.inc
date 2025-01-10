{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (AdwToastOverlay, adw_toast_overlay, ADW, TOAST_OVERLAY, GtkWidget) }
type
  TAdwToastOverlay = record
  end;
  PAdwToastOverlay = ^TAdwToastOverlay;

  TAdwToastOverlayClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwToastOverlayClass = ^TAdwToastOverlayClass;

function adw_toast_overlay_get_type: TGType; cdecl; external libadwaita;
function adw_toast_overlay_new: PGtkWidget; cdecl; external libadwaita;
function adw_toast_overlay_get_child(self: PAdwToastOverlay): PGtkWidget; cdecl; external libadwaita;
procedure adw_toast_overlay_set_child(self: PAdwToastOverlay; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_toast_overlay_add_toast(self: PAdwToastOverlay; toast: PAdwToast); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:01:37 ===

function ADW_TYPE_TOAST_OVERLAY: TGType;
function ADW_TOAST_OVERLAY(obj: Pointer): PAdwToastOverlay;
function ADW_IS_TOAST_OVERLAY(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_TOAST_OVERLAY: TGType;
begin
  Result := adw_toast_overlay_get_type;
end;

function ADW_TOAST_OVERLAY(obj: Pointer): PAdwToastOverlay;
begin
  Result := PAdwToastOverlay(g_type_check_instance_cast(obj, ADW_TYPE_TOAST_OVERLAY));
end;

function ADW_IS_TOAST_OVERLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TOAST_OVERLAY);
end;


{$ENDIF read_implementation}
