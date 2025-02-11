
{$IFDEF read_interface}


  {G_DECLARE_INTERFACE (GtkRoot, gtk_root, GTK, ROOT, GtkWidget) }
type
  // ausgelagert wegen gtkwidget
  //TGtkRoot = record
  //end;
  //PGtkRoot = ^TGtkRoot;

  TGtkRootInterface = record
  end;
  PGtkRootInterface = ^TGtkRootInterface;

function gtk_root_get_type: TGType; cdecl; external libgtk4;
function gtk_root_get_display(self: PGtkRoot): PGdkDisplay; cdecl; external libgtk4;
procedure gtk_root_set_focus(self: PGtkRoot; focus: PGtkWidget); cdecl; external libgtk4;
function gtk_root_get_focus(self: PGtkRoot): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 17-7-24 15:57:17 ===

function GTK_TYPE_ROOT: TGType;
function GTK_ROOT(obj: Pointer): PGtkRoot;
function GTK_IS_ROOT(obj: Pointer): Tgboolean;
function GTK_ROOT_GET_IFACE(obj: Pointer): PGtkRootInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_ROOT: TGType;
begin
  Result := gtk_root_get_type;
end;

function GTK_ROOT(obj: Pointer): PGtkRoot;
begin
  Result := PGtkRoot(g_type_check_instance_cast(obj, GTK_TYPE_ROOT));
end;

function GTK_IS_ROOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ROOT);
end;

function GTK_ROOT_GET_IFACE(obj: Pointer): PGtkRootInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ROOT);
end;


{$ENDIF read_implementation}
