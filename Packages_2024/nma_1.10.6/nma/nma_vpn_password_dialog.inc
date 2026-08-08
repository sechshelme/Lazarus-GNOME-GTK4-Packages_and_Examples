{$IFDEF read_interface}


type
  PNMAVpnPasswordDialog = ^TNMAVpnPasswordDialog;

  TNMAVpnPasswordDialog = record
    parent: TGtkDialog;
  end;

  PNMAVpnPasswordDialogClass = ^TNMAVpnPasswordDialogClass;

  TNMAVpnPasswordDialogClass = record
    parent_class: TGtkDialogClass;
  end;

function nma_vpn_password_dialog_get_type: TGType; cdecl; external libnma;
function nma_vpn_password_dialog_new(title: pchar; message: pchar; password: pchar): PGtkWidget; cdecl; external libnma;
function nma_vpn_password_dialog_run_and_block(dialog: PNMAVpnPasswordDialog): Tgboolean; cdecl; external libnma;

procedure nma_vpn_password_dialog_set_show_password(dialog: PNMAVpnPasswordDialog; show: Tgboolean); cdecl; external libnma;
procedure nma_vpn_password_dialog_focus_password(dialog: PNMAVpnPasswordDialog); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_password(dialog: PNMAVpnPasswordDialog; password: pchar); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_password_label(dialog: PNMAVpnPasswordDialog; _label: pchar); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_show_password_secondary(dialog: PNMAVpnPasswordDialog; show: Tgboolean); cdecl; external libnma;
procedure nma_vpn_password_dialog_focus_password_secondary(dialog: PNMAVpnPasswordDialog); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_password_secondary(dialog: PNMAVpnPasswordDialog; password_secondary: pchar); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_password_secondary_label(dialog: PNMAVpnPasswordDialog; _label: pchar); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_show_password_ternary(dialog: PNMAVpnPasswordDialog; show: Tgboolean); cdecl; external libnma;
procedure nma_vpn_password_dialog_focus_password_ternary(dialog: PNMAVpnPasswordDialog); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_password_ternary(dialog: PNMAVpnPasswordDialog; password_ternary: pchar); cdecl; external libnma;
procedure nma_vpn_password_dialog_set_password_ternary_label(dialog: PNMAVpnPasswordDialog; _label: pchar); cdecl; external libnma;

function nma_vpn_password_dialog_get_password(dialog: PNMAVpnPasswordDialog): pchar; cdecl; external libnma;
function nma_vpn_password_dialog_get_password_secondary(dialog: PNMAVpnPasswordDialog): pchar; cdecl; external libnma;
function nma_vpn_password_dialog_get_password_ternary(dialog: PNMAVpnPasswordDialog): pchar; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:25:12 ===

function NMA_VPN_TYPE_PASSWORD_DIALOG: TGType;
function NMA_VPN_PASSWORD_DIALOG(obj: Pointer): PNMAVpnPasswordDialog;
function NMA_VPN_PASSWORD_DIALOG_CLASS(klass: Pointer): PNMAVpnPasswordDialogClass;
function NMA_VPN_IS_PASSWORD_DIALOG(obj: Pointer): Tgboolean;
function NMA_VPN_IS_PASSWORD_DIALOG_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_VPN_TYPE_PASSWORD_DIALOG: TGType;
begin
  NMA_VPN_TYPE_PASSWORD_DIALOG := nma_vpn_password_dialog_get_type;
end;

function NMA_VPN_PASSWORD_DIALOG(obj: Pointer): PNMAVpnPasswordDialog;
begin
  Result := PNMAVpnPasswordDialog(g_type_check_instance_cast(obj, NMA_VPN_TYPE_PASSWORD_DIALOG));
end;

function NMA_VPN_PASSWORD_DIALOG_CLASS(klass: Pointer): PNMAVpnPasswordDialogClass;
begin
  Result := PNMAVpnPasswordDialogClass(g_type_check_class_cast(klass, NMA_VPN_TYPE_PASSWORD_DIALOG));
end;

function NMA_VPN_IS_PASSWORD_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_VPN_TYPE_PASSWORD_DIALOG);
end;

function NMA_VPN_IS_PASSWORD_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_VPN_TYPE_PASSWORD_DIALOG);
end;



{$ENDIF read_implementation}
