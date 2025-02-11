
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkGraphicsOffload, gtk_graphics_offload, GTK, GRAPHICS_OFFLOAD, GtkWidget) }
type
  TGtkGraphicsOffload = record
  end;
  PGtkGraphicsOffload = ^TGtkGraphicsOffload;

  TGtkGraphicsOffloadClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkGraphicsOffloadClass = ^TGtkGraphicsOffloadClass;

function gtk_graphics_offload_get_type: TGType; cdecl; external libgtk4;
function gtk_graphics_offload_new(child: PGtkWidget): PGtkWidget; cdecl; external libgtk4;
procedure gtk_graphics_offload_set_child(self: PGtkGraphicsOffload; child: PGtkWidget); cdecl; external libgtk4;
function gtk_graphics_offload_get_child(self: PGtkGraphicsOffload): PGtkWidget; cdecl; external libgtk4;

type
  PGtkGraphicsOffloadEnabled = ^TGtkGraphicsOffloadEnabled;
  TGtkGraphicsOffloadEnabled = longint;

const
  GTK_GRAPHICS_OFFLOAD_ENABLED = 0;
  GTK_GRAPHICS_OFFLOAD_DISABLED = 1;


procedure gtk_graphics_offload_set_enabled(self: PGtkGraphicsOffload; Enabled: TGtkGraphicsOffloadEnabled); cdecl; external libgtk4;
function gtk_graphics_offload_get_enabled(self: PGtkGraphicsOffload): TGtkGraphicsOffloadEnabled; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 19:31:40 ===

function GTK_TYPE_GRAPHICS_OFFLOAD: TGType;
function GTK_GRAPHICS_OFFLOAD(obj: Pointer): PGtkGraphicsOffload;
function GTK_IS_GRAPHICS_OFFLOAD(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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




{$ENDIF read_implementation}
