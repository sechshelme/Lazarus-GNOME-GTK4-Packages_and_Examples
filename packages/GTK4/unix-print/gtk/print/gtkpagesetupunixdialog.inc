
{$IFDEF read_interface}

type
  TGtkPageSetupUnixDialog = record
  end;
  PGtkPageSetupUnixDialog = ^TGtkPageSetupUnixDialog;

function gtk_page_setup_unix_dialog_get_type: TGType; cdecl; external libgtk4;
function gtk_page_setup_unix_dialog_new(title: PChar; parent: PGtkWindow): PGtkWidget; cdecl; external libgtk4;
procedure gtk_page_setup_unix_dialog_set_page_setup(dialog: PGtkPageSetupUnixDialog; page_setup: PGtkPageSetup); cdecl; external libgtk4;
function gtk_page_setup_unix_dialog_get_page_setup(dialog: PGtkPageSetupUnixDialog): PGtkPageSetup; cdecl; external libgtk4;
procedure gtk_page_setup_unix_dialog_set_print_settings(dialog: PGtkPageSetupUnixDialog; print_settings: PGtkPrintSettings); cdecl; external libgtk4;
function gtk_page_setup_unix_dialog_get_print_settings(dialog: PGtkPageSetupUnixDialog): PGtkPrintSettings; cdecl; external libgtk4;

// === Konventiert am: 3-8-24 13:39:46 ===

function GTK_TYPE_PAGE_SETUP_UNIX_DIALOG: TGType;
function GTK_PAGE_SETUP_UNIX_DIALOG(obj: Pointer): PGtkPageSetupUnixDialog;
function GTK_IS_PAGE_SETUP_UNIX_DIALOG(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_PAGE_SETUP_UNIX_DIALOG: TGType;
begin
  GTK_TYPE_PAGE_SETUP_UNIX_DIALOG := gtk_page_setup_unix_dialog_get_type;
end;

function GTK_PAGE_SETUP_UNIX_DIALOG(obj: Pointer): PGtkPageSetupUnixDialog;
begin
  Result := PGtkPageSetupUnixDialog(g_type_check_instance_cast(obj, GTK_TYPE_PAGE_SETUP_UNIX_DIALOG));
end;

function GTK_IS_PAGE_SETUP_UNIX_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PAGE_SETUP_UNIX_DIALOG);
end;



{$ENDIF read_implementation}
