unit gtkviewport;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes, gtkwidget, gtkadjustment;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkViewport = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_viewport_get_type: TGType; cdecl; external libgtk4;
function gtk_viewport_new(hadjustment: PGtkAdjustment; vadjustment: PGtkAdjustment): PGtkWidget; cdecl; external libgtk4;
function gtk_viewport_get_scroll_to_focus(viewport: PGtkViewport): Tgboolean; cdecl; external libgtk4;
procedure gtk_viewport_set_scroll_to_focus(viewport: PGtkViewport; scroll_to_focus: Tgboolean); cdecl; external libgtk4;
procedure gtk_viewport_set_child(viewport: PGtkViewport; child: PGtkWidget); cdecl; external libgtk4;
function gtk_viewport_get_child(viewport: PGtkViewport): PGtkWidget; cdecl; external libgtk4;
procedure gtk_viewport_scroll_to(viewport: PGtkViewport; descendant: PGtkWidget; scroll: PGtkScrollInfo); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:59:50 ===

function GTK_TYPE_VIEWPORT: TGType;
function GTK_VIEWPORT(obj: Pointer): PGtkViewport;
function GTK_IS_VIEWPORT(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_VIEWPORT: TGType;
begin
  GTK_TYPE_VIEWPORT := gtk_viewport_get_type;
end;

function GTK_VIEWPORT(obj: Pointer): PGtkViewport;
begin
  Result := PGtkViewport(g_type_check_instance_cast(obj, GTK_TYPE_VIEWPORT));
end;

function GTK_IS_VIEWPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_VIEWPORT);
end;



end.
