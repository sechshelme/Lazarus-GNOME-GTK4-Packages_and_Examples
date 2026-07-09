unit gtktogglebutton;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget, gtkbutton;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkToggleButton = ^TGtkToggleButton;
  TGtkToggleButton = record
    button: TGtkButton;
  end;

  PGtkToggleButtonClass = ^TGtkToggleButtonClass;
  TGtkToggleButtonClass = record
    parent_class: TGtkButtonClass;
    toggled: procedure(toggle_button: PGtkToggleButton); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_toggle_button_get_type: TGType; cdecl; external libgtk4;
function gtk_toggle_button_new: PGtkWidget; cdecl; external libgtk4;
function gtk_toggle_button_new_with_label(_label: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_toggle_button_new_with_mnemonic(_label: pchar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_toggle_button_set_active(toggle_button: PGtkToggleButton; is_active: Tgboolean); cdecl; external libgtk4;
function gtk_toggle_button_get_active(toggle_button: PGtkToggleButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_toggle_button_toggled(toggle_button: PGtkToggleButton); cdecl; external libgtk4; deprecated;
procedure gtk_toggle_button_set_group(toggle_button: PGtkToggleButton; group: PGtkToggleButton); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:36:20 ===

function GTK_TYPE_TOGGLE_BUTTON: TGType;
function GTK_TOGGLE_BUTTON(obj: Pointer): PGtkToggleButton;
function GTK_TOGGLE_BUTTON_CLASS(klass: Pointer): PGtkToggleButtonClass;
function GTK_IS_TOGGLE_BUTTON(obj: Pointer): Tgboolean;
function GTK_IS_TOGGLE_BUTTON_CLASS(klass: Pointer): Tgboolean;
function GTK_TOGGLE_BUTTON_GET_CLASS(obj: Pointer): PGtkToggleButtonClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_TOGGLE_BUTTON: TGType;
begin
  GTK_TYPE_TOGGLE_BUTTON := gtk_toggle_button_get_type;
end;

function GTK_TOGGLE_BUTTON(obj: Pointer): PGtkToggleButton;
begin
  Result := PGtkToggleButton(g_type_check_instance_cast(obj, GTK_TYPE_TOGGLE_BUTTON));
end;

function GTK_TOGGLE_BUTTON_CLASS(klass: Pointer): PGtkToggleButtonClass;
begin
  Result := PGtkToggleButtonClass(g_type_check_class_cast(klass, GTK_TYPE_TOGGLE_BUTTON));
end;

function GTK_IS_TOGGLE_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TOGGLE_BUTTON);
end;

function GTK_IS_TOGGLE_BUTTON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_TOGGLE_BUTTON);
end;

function GTK_TOGGLE_BUTTON_GET_CLASS(obj: Pointer): PGtkToggleButtonClass;
begin
  Result := PGtkToggleButtonClass(PGTypeInstance(obj)^.g_class);
end;



end.
