unit nma_ui_utils;

interface

uses
  fp_glib2, fp_GTK4, fp_nm, fp_nma;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure nma_utils_setup_password_storage(passwd_entry: PGtkWidget; initial_flags: TNMSettingSecretFlags; setting: PNMSetting; password_flags_name: pchar; with_not_required: Tgboolean;
  ask_mode: Tgboolean); cdecl; external libnma;
function nma_utils_menu_to_secret_flags(passwd_entry: PGtkWidget): TNMSettingSecretFlags; cdecl; external libnma;
procedure nma_utils_update_password_storage(passwd_entry: PGtkWidget; secret_flags: TNMSettingSecretFlags; setting: PNMSetting; password_flags_name: pchar); cdecl; external libnma;

// === Konventiert am: 8-8-26 13:25:23 ===


implementation



end.
