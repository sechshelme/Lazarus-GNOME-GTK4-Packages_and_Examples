unit adap_dialog;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_breakpoint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapDialogPresentationMode = ^TAdapDialogPresentationMode;
  TAdapDialogPresentationMode = longint;

const
  ADAP_DIALOG_AUTO = 0;
  ADAP_DIALOG_FLOATING = 1;
  ADAP_DIALOG_BOTTOM_SHEET = 2;

type
  TAdapDialog = record
    parent_instance: TGtkWidget;
  end;
  PAdapDialog = ^TAdapDialog;

  TAdapDialogClass = record
    parent_class: TGtkWidgetClass;
    close_attempt: procedure(dialog: PAdapDialog); cdecl;
    closed: procedure(dialog: PAdapDialog); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapDialogClass = ^TAdapDialogClass;

function adap_dialog_get_type: TGType; cdecl; external libadapta;
function adap_dialog_new: PAdapDialog; cdecl; external libadapta;
function adap_dialog_get_child(self: PAdapDialog): PGtkWidget; cdecl; external libadapta;
procedure adap_dialog_set_child(self: PAdapDialog; child: PGtkWidget); cdecl; external libadapta;
function adap_dialog_get_title(self: PAdapDialog): pchar; cdecl; external libadapta;
procedure adap_dialog_set_title(self: PAdapDialog; title: pchar); cdecl; external libadapta;
function adap_dialog_get_can_close(self: PAdapDialog): Tgboolean; cdecl; external libadapta;
procedure adap_dialog_set_can_close(self: PAdapDialog; can_close: Tgboolean); cdecl; external libadapta;
function adap_dialog_get_content_width(self: PAdapDialog): longint; cdecl; external libadapta;
procedure adap_dialog_set_content_width(self: PAdapDialog; content_width: longint); cdecl; external libadapta;
function adap_dialog_get_content_height(self: PAdapDialog): longint; cdecl; external libadapta;
procedure adap_dialog_set_content_height(self: PAdapDialog; content_height: longint); cdecl; external libadapta;
function adap_dialog_get_follows_content_size(self: PAdapDialog): Tgboolean; cdecl; external libadapta;
procedure adap_dialog_set_follows_content_size(self: PAdapDialog; follows_content_size: Tgboolean); cdecl; external libadapta;
function adap_dialog_get_presentation_mode(self: PAdapDialog): TAdapDialogPresentationMode; cdecl; external libadapta;
procedure adap_dialog_set_presentation_mode(self: PAdapDialog; presentation_mode: TAdapDialogPresentationMode); cdecl; external libadapta;
function adap_dialog_get_focus(self: PAdapDialog): PGtkWidget; cdecl; external libadapta;
procedure adap_dialog_set_focus(self: PAdapDialog; focus: PGtkWidget); cdecl; external libadapta;
function adap_dialog_get_default_widget(self: PAdapDialog): PGtkWidget; cdecl; external libadapta;
procedure adap_dialog_set_default_widget(self: PAdapDialog; default_widget: PGtkWidget); cdecl; external libadapta;
function adap_dialog_close(self: PAdapDialog): Tgboolean; cdecl; external libadapta;
procedure adap_dialog_force_close(self: PAdapDialog); cdecl; external libadapta;
procedure adap_dialog_add_breakpoint(self: PAdapDialog; breakpoint: PAdapBreakpoint); cdecl; external libadapta;
function adap_dialog_get_current_breakpoint(self: PAdapDialog): PAdapBreakpoint; cdecl; external libadapta;
procedure adap_dialog_present(self: PAdapDialog; parent: PGtkWidget); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:09:13 ===

function ADAP_TYPE_DIALOG: TGType;
function ADAP_DIALOG(obj: Pointer): PAdapDialog;
function ADAP_IS_DIALOG(obj: Pointer): Tgboolean;
function ADAP_DIALOG_CLASS(klass: Pointer): PAdapDialogClass;
function ADAP_IS_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADAP_DIALOG_GET_CLASS(obj: Pointer): PAdapDialogClass;

implementation

function ADAP_TYPE_DIALOG: TGType;
begin
  Result := adap_dialog_get_type;
end;

function ADAP_DIALOG(obj: Pointer): PAdapDialog;
begin
  Result := PAdapDialog(g_type_check_instance_cast(obj, ADAP_TYPE_DIALOG));
end;

function ADAP_IS_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_DIALOG);
end;

function ADAP_DIALOG_CLASS(klass: Pointer): PAdapDialogClass;
begin
  Result := PAdapDialogClass(g_type_check_class_cast(klass, ADAP_TYPE_DIALOG));
end;

function ADAP_IS_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_DIALOG);
end;

function ADAP_DIALOG_GET_CLASS(obj: Pointer): PAdapDialogClass;
begin
  Result := PAdapDialogClass(PGTypeInstance(obj)^.g_class);
end;



end.
