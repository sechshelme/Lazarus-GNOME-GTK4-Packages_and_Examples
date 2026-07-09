unit gtkroot;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkRootInterface = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_root_get_type: TGType; cdecl; external libgtk4;
function gtk_root_get_display(self: PGtkRoot): PGdkDisplay; cdecl; external libgtk4;
procedure gtk_root_set_focus(self: PGtkRoot; focus: PGtkWidget); cdecl; external libgtk4;
function gtk_root_get_focus(self: PGtkRoot): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:18:11 ===

function GTK_TYPE_ROOT: TGType;
function GTK_ROOT(obj: Pointer): PGtkRoot;
function GTK_IS_ROOT(obj: Pointer): Tgboolean;
function GTK_ROOT_GET_IFACE(obj: Pointer): PGtkRootInterface;
{$ENDIF read_function}

implementation

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


end.
