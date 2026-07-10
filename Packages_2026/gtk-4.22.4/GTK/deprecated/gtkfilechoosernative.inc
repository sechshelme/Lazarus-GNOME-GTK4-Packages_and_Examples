

  {$IFDEF read_struct}
type
  PGtkFileChooserNative = type Pointer;

  TGtkFileChooserNativeClass = record
    parent_class: TGtkNativeDialogClass;
  end;
  PGtkFileChooserNativeClass = ^TGtkFileChooserNativeClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_file_chooser_native_get_type: TGType; cdecl; external libgtk4;
function gtk_file_chooser_native_new(title: pchar; parent: PGtkWindow; action: TGtkFileChooserAction; accept_label: pchar; cancel_label: pchar): PGtkFileChooserNative; cdecl; external libgtk4;
function gtk_file_chooser_native_get_accept_label(self: PGtkFileChooserNative): pchar; cdecl; external libgtk4;
procedure gtk_file_chooser_native_set_accept_label(self: PGtkFileChooserNative; accept_label: pchar); cdecl; external libgtk4;
function gtk_file_chooser_native_get_cancel_label(self: PGtkFileChooserNative): pchar; cdecl; external libgtk4;
procedure gtk_file_chooser_native_set_cancel_label(self: PGtkFileChooserNative; cancel_label: pchar); cdecl; external libgtk4;

// === Konventiert am: 9-7-26 19:45:41 ===

function GTK_TYPE_FILE_CHOOSER_NATIVE: TGType;
function GTK_FILE_CHOOSER_NATIVE(obj: Pointer): PGtkFileChooserNative;
function GTK_IS_FILE_CHOOSER_NATIVE(obj: Pointer): Tgboolean;
{$ENDIF read_function}


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
