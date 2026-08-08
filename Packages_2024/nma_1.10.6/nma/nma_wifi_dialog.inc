{$IFDEF read_interface}


type
  PNMAWifiDialog = ^TNMAWifiDialog;
  TNMAWifiDialog = record
    parent: TGtkDialog;
  end;

  PNMAWifiDialogClass = ^TNMAWifiDialogClass;
  TNMAWifiDialogClass = record
    parent: TGtkDialogClass;
  end;

function nma_wifi_dialog_get_type: TGType; cdecl; external libnma;
function nma_wifi_dialog_new(client: PNMClient; connection: PNMConnection; device: PNMDevice; ap: PNMAccessPoint; secrets_only: Tgboolean): PGtkWidget; cdecl; external libnma;
function nma_wifi_dialog_new_for_secrets(client: PNMClient; connection: PNMConnection; secrets_setting_name: pchar; secrets_hints: PPchar): PGtkWidget; cdecl; external libnma;
function nma_wifi_dialog_new_for_hidden(client: PNMClient): PGtkWidget; cdecl; external libnma;
function nma_wifi_dialog_new_for_create(client: PNMClient): PGtkWidget; cdecl; external libnma;
function nma_wifi_dialog_get_connection(self: PNMAWifiDialog; device: PPNMDevice; ap: PPNMAccessPoint): PNMConnection; cdecl; external libnma;
function nma_wifi_dialog_nag_user(self: PNMAWifiDialog): PGtkWidget; cdecl; external libnma; deprecated;
procedure nma_wifi_dialog_set_nag_ignored(self: PNMAWifiDialog; ignored: Tgboolean); cdecl; external libnma; deprecated;
function nma_wifi_dialog_get_nag_ignored(self: PNMAWifiDialog): Tgboolean; cdecl; external libnma; deprecated;
function nma_wifi_dialog_new_for_other(client: PNMClient): PGtkWidget; cdecl; external libnma; deprecated;

// === Konventiert am: 8-8-26 13:24:53 ===

function NMA_TYPE_WIFI_DIALOG: TGType;
function NMA_WIFI_DIALOG(obj: Pointer): PNMAWifiDialog;
function NMA_WIFI_DIALOG_CLASS(klass: Pointer): PNMAWifiDialogClass;
function NMA_IS_WIFI_DIALOG(obj: Pointer): Tgboolean;
function NMA_IS_WIFI_DIALOG_CLASS(klass: Pointer): Tgboolean;
function NMA_WIFI_DIALOG_GET_CLASS(obj: Pointer): PNMAWifiDialogClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_WIFI_DIALOG: TGType;
begin
  NMA_TYPE_WIFI_DIALOG := nma_wifi_dialog_get_type;
end;

function NMA_WIFI_DIALOG(obj: Pointer): PNMAWifiDialog;
begin
  Result := PNMAWifiDialog(g_type_check_instance_cast(obj, NMA_TYPE_WIFI_DIALOG));
end;

function NMA_WIFI_DIALOG_CLASS(klass: Pointer): PNMAWifiDialogClass;
begin
  Result := PNMAWifiDialogClass(g_type_check_class_cast(klass, NMA_TYPE_WIFI_DIALOG));
end;

function NMA_IS_WIFI_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_WIFI_DIALOG);
end;

function NMA_IS_WIFI_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_WIFI_DIALOG);
end;

function NMA_WIFI_DIALOG_GET_CLASS(obj: Pointer): PNMAWifiDialogClass;
begin
  Result := PNMAWifiDialogClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
