unit gtkshortcutmanager;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkshortcutcontroller;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkShortcutManager = type Pointer;

  PGtkShortcutManagerInterface = ^TGtkShortcutManagerInterface;
  TGtkShortcutManagerInterface = record
    g_iface: TGTypeInterface;
    add_controller: procedure(self: PGtkShortcutManager; controller: PGtkShortcutController); cdecl;
    remove_controller: procedure(self: PGtkShortcutManager; controller: PGtkShortcutController); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcut_manager_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:06:48 ===

function GTK_TYPE_SHORTCUT_MANAGER: TGType;
function GTK_SHORTCUT_MANAGER(obj: Pointer): PGtkShortcutManager;
function GTK_IS_SHORTCUT_MANAGER(obj: Pointer): Tgboolean;
function GTK_SHORTCUT_MANAGER_GET_IFACE(obj: Pointer): PGtkShortcutManagerInterface;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUT_MANAGER: TGType;
begin
  Result := gtk_shortcut_manager_get_type;
end;

function GTK_SHORTCUT_MANAGER(obj: Pointer): PGtkShortcutManager;
begin
  Result := PGtkShortcutManager(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_MANAGER));
end;

function GTK_IS_SHORTCUT_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_MANAGER);
end;

function GTK_SHORTCUT_MANAGER_GET_IFACE(obj: Pointer): PGtkShortcutManagerInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SHORTCUT_MANAGER);
end;

end.
