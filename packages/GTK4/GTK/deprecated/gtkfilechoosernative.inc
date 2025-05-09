
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkFileChooserNative, gtk_file_chooser_native, GTK, FILE_CHOOSER_NATIVE, GtkNativeDialog) }
type
  TGtkFileChooserNative = record
  end;
  PGtkFileChooserNative = ^TGtkFileChooserNative;

  TGtkFileChooserNativeClass = record
    parent_class: TGtkNativeDialogClass;
  end;
  PGtkFileChooserNativeClass = ^TGtkFileChooserNativeClass;

function gtk_file_chooser_native_get_type: TGType; cdecl; external libgtk4;
function gtk_file_chooser_native_new(title: PChar; parent: PGtkWindow; action: TGtkFileChooserAction; accept_label: PChar; cancel_label: PChar): PGtkFileChooserNative; cdecl; external libgtk4;
function gtk_file_chooser_native_get_accept_label(self: PGtkFileChooserNative): PChar; cdecl; external libgtk4;
procedure gtk_file_chooser_native_set_accept_label(self: PGtkFileChooserNative; accept_label: PChar); cdecl; external libgtk4;
function gtk_file_chooser_native_get_cancel_label(self: PGtkFileChooserNative): PChar; cdecl; external libgtk4;
procedure gtk_file_chooser_native_set_cancel_label(self: PGtkFileChooserNative; cancel_label: PChar); cdecl; external libgtk4;

// === Konventiert am: 29-7-24 19:42:40 ===

function GTK_TYPE_FILE_CHOOSER_NATIVE: TGType;
function GTK_FILE_CHOOSER_NATIVE(obj: Pointer): PGtkFileChooserNative;
function GTK_IS_FILE_CHOOSER_NATIVE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_FILE_CHOOSER_NATIVE: TGType;
begin
  Result := gtk_file_chooser_native_get_type;
end;

function GTK_FILE_CHOOSER_NATIVE(obj: Pointer): PGtkFileChooserNative;
begin
  Result := PGtkFileChooserNative(g_type_check_instance_cast(obj, GTK_TYPE_FILE_CHOOSER_NATIVE));
end;

function GTK_IS_FILE_CHOOSER_NATIVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_CHOOSER_NATIVE);
end;




{$ENDIF read_implementation}
