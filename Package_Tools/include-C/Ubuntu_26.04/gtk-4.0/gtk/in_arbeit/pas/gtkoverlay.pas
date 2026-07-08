unit gtkoverlay;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkOverlay = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_overlay_get_type: TGType; cdecl; external libgtk4;
function gtk_overlay_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_overlay_add_overlay(overlay: PGtkOverlay; widget: PGtkWidget); cdecl; external libgtk4;
procedure gtk_overlay_remove_overlay(overlay: PGtkOverlay; widget: PGtkWidget); cdecl; external libgtk4;
procedure gtk_overlay_set_child(overlay: PGtkOverlay; child: PGtkWidget); cdecl; external libgtk4;
function gtk_overlay_get_child(overlay: PGtkOverlay): PGtkWidget; cdecl; external libgtk4;
function gtk_overlay_get_measure_overlay(overlay: PGtkOverlay; widget: PGtkWidget): Tgboolean; cdecl; external libgtk4;
procedure gtk_overlay_set_measure_overlay(overlay: PGtkOverlay; widget: PGtkWidget; measure: Tgboolean); cdecl; external libgtk4;
function gtk_overlay_get_clip_overlay(overlay: PGtkOverlay; widget: PGtkWidget): Tgboolean; cdecl; external libgtk4;
procedure gtk_overlay_set_clip_overlay(overlay: PGtkOverlay; widget: PGtkWidget; clip_overlay: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:00:24 ===

function GTK_TYPE_OVERLAY: TGType;
function GTK_OVERLAY(obj: Pointer): PGtkOverlay;
function GTK_IS_OVERLAY(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_OVERLAY: TGType;
begin
  GTK_TYPE_OVERLAY := gtk_overlay_get_type;
end;

function GTK_OVERLAY(obj: Pointer): PGtkOverlay;
begin
  Result := PGtkOverlay(g_type_check_instance_cast(obj, GTK_TYPE_OVERLAY));
end;

function GTK_IS_OVERLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_OVERLAY);
end;



end.
