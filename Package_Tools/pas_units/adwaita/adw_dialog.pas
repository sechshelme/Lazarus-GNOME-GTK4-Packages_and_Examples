unit adw_dialog;

interface

uses
  fp_glib2, fp_GTK4, adw_breakpoint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwDialogPresentationMode = ^TAdwDialogPresentationMode;
  TAdwDialogPresentationMode = longint;

const
  ADW_DIALOG_AUTO = 0;
  ADW_DIALOG_FLOATING = 1;
  ADW_DIALOG_BOTTOM_SHEET = 2;

  {G_DECLARE_DERIVABLE_TYPE (AdwDialog, adw_dialog, ADW, DIALOG, GtkWidget) }
type
  TAdwDialog = record
    parent_instance: TGtkWidget;
  end;
  PAdwDialog = ^TAdwDialog;

  TAdwDialogClass = record
    parent_class: TGtkWidgetClass;
    close_attempt: procedure(dialog: PAdwDialog); cdecl;
    closed: procedure(dialog: PAdwDialog); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwDialogClass = ^TAdwDialogClass;

function adw_dialog_get_type: TGType; cdecl; external libadwaita;
function adw_dialog_new: PAdwDialog; cdecl; external libadwaita;
function adw_dialog_get_child(self: PAdwDialog): PGtkWidget; cdecl; external libadwaita;
procedure adw_dialog_set_child(self: PAdwDialog; child: PGtkWidget); cdecl; external libadwaita;
function adw_dialog_get_title(self: PAdwDialog): pchar; cdecl; external libadwaita;
procedure adw_dialog_set_title(self: PAdwDialog; title: pchar); cdecl; external libadwaita;
function adw_dialog_get_can_close(self: PAdwDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_dialog_set_can_close(self: PAdwDialog; can_close: Tgboolean); cdecl; external libadwaita;
function adw_dialog_get_content_width(self: PAdwDialog): longint; cdecl; external libadwaita;
procedure adw_dialog_set_content_width(self: PAdwDialog; content_width: longint); cdecl; external libadwaita;
function adw_dialog_get_content_height(self: PAdwDialog): longint; cdecl; external libadwaita;
procedure adw_dialog_set_content_height(self: PAdwDialog; content_height: longint); cdecl; external libadwaita;
function adw_dialog_get_follows_content_size(self: PAdwDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_dialog_set_follows_content_size(self: PAdwDialog; follows_content_size: Tgboolean); cdecl; external libadwaita;
function adw_dialog_get_presentation_mode(self: PAdwDialog): TAdwDialogPresentationMode; cdecl; external libadwaita;
procedure adw_dialog_set_presentation_mode(self: PAdwDialog; presentation_mode: TAdwDialogPresentationMode); cdecl; external libadwaita;
function adw_dialog_get_focus(self: PAdwDialog): PGtkWidget; cdecl; external libadwaita;
procedure adw_dialog_set_focus(self: PAdwDialog; focus: PGtkWidget); cdecl; external libadwaita;
function adw_dialog_get_default_widget(self: PAdwDialog): PGtkWidget; cdecl; external libadwaita;
procedure adw_dialog_set_default_widget(self: PAdwDialog; default_widget: PGtkWidget); cdecl; external libadwaita;
function adw_dialog_close(self: PAdwDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_dialog_force_close(self: PAdwDialog); cdecl; external libadwaita;
procedure adw_dialog_add_breakpoint(self: PAdwDialog; breakpoint: PAdwBreakpoint); cdecl; external libadwaita;
function adw_dialog_get_current_breakpoint(self: PAdwDialog): PAdwBreakpoint; cdecl; external libadwaita;
procedure adw_dialog_present(self: PAdwDialog; parent: PGtkWidget); cdecl; external libadwaita;

// === Konventiert am: 7-1-25 19:57:10 ===

function ADW_TYPE_DIALOG: TGType;
function ADW_DIALOG(obj: Pointer): PAdwDialog;
function ADW_IS_DIALOG(obj: Pointer): Tgboolean;
function ADW_DIALOG_CLASS(klass: Pointer): PAdwDialogClass;
function ADW_IS_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADW_DIALOG_GET_CLASS(obj: Pointer): PAdwDialogClass;

implementation

function ADW_TYPE_DIALOG: TGType;
begin
  Result := adw_dialog_get_type;
end;

function ADW_DIALOG(obj: Pointer): PAdwDialog;
begin
  Result := PAdwDialog(g_type_check_instance_cast(obj, ADW_TYPE_DIALOG));
end;

function ADW_IS_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_DIALOG);
end;

function ADW_DIALOG_CLASS(klass: Pointer): PAdwDialogClass;
begin
  Result := PAdwDialogClass(g_type_check_class_cast(klass, ADW_TYPE_DIALOG));
end;

function ADW_IS_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_DIALOG);
end;

function ADW_DIALOG_GET_CLASS(obj: Pointer): PAdwDialogClass;
begin
  Result := PAdwDialogClass(PGTypeInstance(obj)^.g_class);
end;


end.
