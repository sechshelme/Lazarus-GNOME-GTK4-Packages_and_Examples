unit gtkgraphicsoffload;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkGraphicsOffload = type Pointer;

  TGtkGraphicsOffloadClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkGraphicsOffloadClass = ^TGtkGraphicsOffloadClass;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGtkGraphicsOffloadEnabled = ^TGtkGraphicsOffloadEnabled;
  TGtkGraphicsOffloadEnabled = longint;
const
  GTK_GRAPHICS_OFFLOAD_ENABLED = 0;
  GTK_GRAPHICS_OFFLOAD_DISABLED = 1;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_graphics_offload_get_type: TGType; cdecl; external libgtk4;
function gtk_graphics_offload_new(child: PGtkWidget): PGtkWidget; cdecl; external libgtk4;
procedure gtk_graphics_offload_set_child(self: PGtkGraphicsOffload; child: PGtkWidget); cdecl; external libgtk4;
function gtk_graphics_offload_get_child(self: PGtkGraphicsOffload): PGtkWidget; cdecl; external libgtk4;

procedure gtk_graphics_offload_set_enabled(self: PGtkGraphicsOffload; enabled: TGtkGraphicsOffloadEnabled); cdecl; external libgtk4;
function gtk_graphics_offload_get_enabled(self: PGtkGraphicsOffload): TGtkGraphicsOffloadEnabled; cdecl; external libgtk4;
procedure gtk_graphics_offload_set_black_background(self: PGtkGraphicsOffload; value: Tgboolean); cdecl; external libgtk4;
function gtk_graphics_offload_get_black_background(self: PGtkGraphicsOffload): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:00:30 ===

function GTK_TYPE_GRAPHICS_OFFLOAD: TGType;
function GTK_GRAPHICS_OFFLOAD(obj: Pointer): PGtkGraphicsOffload;
function GTK_IS_GRAPHICS_OFFLOAD(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_GRAPHICS_OFFLOAD: TGType;
begin
  Result := gtk_graphics_offload_get_type;
end;

function GTK_GRAPHICS_OFFLOAD(obj: Pointer): PGtkGraphicsOffload;
begin
  Result := PGtkGraphicsOffload(g_type_check_instance_cast(obj, GTK_TYPE_GRAPHICS_OFFLOAD));
end;

function GTK_IS_GRAPHICS_OFFLOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GRAPHICS_OFFLOAD);
end;

end.
