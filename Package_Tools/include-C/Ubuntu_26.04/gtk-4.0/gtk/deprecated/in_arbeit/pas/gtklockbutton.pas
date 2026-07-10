unit gtklockbutton;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkLockButton = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_lock_button_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_lock_button_new(permission: PGPermission): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_lock_button_get_permission(button: PGtkLockButton): PGPermission; cdecl; external libgtk4; deprecated;
procedure gtk_lock_button_set_permission(button: PGtkLockButton; permission: PGPermission); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:44:55 ===

function GTK_TYPE_LOCK_BUTTON: TGType;
function GTK_LOCK_BUTTON(obj: Pointer): PGtkLockButton;
function GTK_IS_LOCK_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_LOCK_BUTTON: TGType;
begin
  GTK_TYPE_LOCK_BUTTON := gtk_lock_button_get_type;
end;

function GTK_LOCK_BUTTON(obj: Pointer): PGtkLockButton;
begin
  Result := PGtkLockButton(g_type_check_instance_cast(obj, GTK_TYPE_LOCK_BUTTON));
end;

function GTK_IS_LOCK_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LOCK_BUTTON);
end;



end.
