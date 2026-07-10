unit gtkmessagedialog;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkdialog;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkMessageDialog = ^TGtkMessageDialog;
  TGtkMessageDialog = record
    parent_instance: TGtkDialog;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGtkButtonsType = ^TGtkButtonsType;
  TGtkButtonsType = longint;
const
  GTK_BUTTONS_NONE = 0;
  GTK_BUTTONS_OK = 1;
  GTK_BUTTONS_CLOSE = 2;
  GTK_BUTTONS_CANCEL = 3;
  GTK_BUTTONS_YES_NO = 4;
  GTK_BUTTONS_OK_CANCEL = 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_message_dialog_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_message_dialog_new(parent: PGtkWindow; flags: TGtkDialogFlags; _type: TGtkMessageType; buttons: TGtkButtonsType; message_format: pchar): PGtkWidget; cdecl; varargs; external libgtk4; deprecated;
function gtk_message_dialog_new_with_markup(parent: PGtkWindow; flags: TGtkDialogFlags; _type: TGtkMessageType; buttons: TGtkButtonsType; message_format: pchar): PGtkWidget; cdecl; varargs; external libgtk4; deprecated;
procedure gtk_message_dialog_set_markup(message_dialog: PGtkMessageDialog; str: pchar); cdecl; external libgtk4; deprecated;
procedure gtk_message_dialog_format_secondary_text(message_dialog: PGtkMessageDialog; message_format: pchar); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_message_dialog_format_secondary_markup(message_dialog: PGtkMessageDialog; message_format: pchar); cdecl; varargs; external libgtk4; deprecated;
function gtk_message_dialog_get_message_area(message_dialog: PGtkMessageDialog): PGtkWidget; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:50:08 ===

function GTK_TYPE_MESSAGE_DIALOG: TGType;
function GTK_MESSAGE_DIALOG(obj: Pointer): PGtkMessageDialog;
function GTK_IS_MESSAGE_DIALOG(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_MESSAGE_DIALOG: TGType;
begin
  GTK_TYPE_MESSAGE_DIALOG := gtk_message_dialog_get_type;
end;

function GTK_MESSAGE_DIALOG(obj: Pointer): PGtkMessageDialog;
begin
  Result := PGtkMessageDialog(g_type_check_instance_cast(obj, GTK_TYPE_MESSAGE_DIALOG));
end;

function GTK_IS_MESSAGE_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MESSAGE_DIALOG);
end;



end.
