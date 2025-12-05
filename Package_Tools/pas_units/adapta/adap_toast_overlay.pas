unit adap_toast_overlay;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_toast;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapToastOverlay = record
  end;
  PAdapToastOverlay = ^TAdapToastOverlay;

  TAdapToastOverlayClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapToastOverlayClass = ^TAdapToastOverlayClass;

function adap_toast_overlay_get_type: TGType; cdecl; external libadapta;
function adap_toast_overlay_new: PGtkWidget; cdecl; external libadapta;
function adap_toast_overlay_get_child(self: PAdapToastOverlay): PGtkWidget; cdecl; external libadapta;
procedure adap_toast_overlay_set_child(self: PAdapToastOverlay; child: PGtkWidget); cdecl; external libadapta;
procedure adap_toast_overlay_add_toast(self: PAdapToastOverlay; toast: PAdapToast); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:41 ===

function ADAP_TYPE_TOAST_OVERLAY: TGType;
function ADAP_TOAST_OVERLAY(obj: Pointer): PAdapToastOverlay;
function ADAP_IS_TOAST_OVERLAY(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TOAST_OVERLAY: TGType;
begin
  Result := adap_toast_overlay_get_type;
end;

function ADAP_TOAST_OVERLAY(obj: Pointer): PAdapToastOverlay;
begin
  Result := PAdapToastOverlay(g_type_check_instance_cast(obj, ADAP_TYPE_TOAST_OVERLAY));
end;

function ADAP_IS_TOAST_OVERLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TOAST_OVERLAY);
end;


end.
