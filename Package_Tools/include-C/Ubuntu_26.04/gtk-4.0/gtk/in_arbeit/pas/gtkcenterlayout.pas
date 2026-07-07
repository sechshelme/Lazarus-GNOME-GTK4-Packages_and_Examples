unit gtkcenterlayout;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkwidget, gtklayoutmanager;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCenterLayout = type Pointer;

  TGtkCenterLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkCenterLayoutClass = ^TGtkCenterLayoutClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_center_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_center_layout_new: PGtkLayoutManager; cdecl; external libgtk4;
procedure gtk_center_layout_set_orientation(self: PGtkCenterLayout; orientation: TGtkOrientation); cdecl; external libgtk4;
function gtk_center_layout_get_orientation(self: PGtkCenterLayout): TGtkOrientation; cdecl; external libgtk4;
procedure gtk_center_layout_set_baseline_position(self: PGtkCenterLayout; baseline_position: TGtkBaselinePosition); cdecl; external libgtk4;
function gtk_center_layout_get_baseline_position(self: PGtkCenterLayout): TGtkBaselinePosition; cdecl; external libgtk4;
procedure gtk_center_layout_set_start_widget(self: PGtkCenterLayout; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_center_layout_get_start_widget(self: PGtkCenterLayout): PGtkWidget; cdecl; external libgtk4;
procedure gtk_center_layout_set_center_widget(self: PGtkCenterLayout; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_center_layout_get_center_widget(self: PGtkCenterLayout): PGtkWidget; cdecl; external libgtk4;
procedure gtk_center_layout_set_end_widget(self: PGtkCenterLayout; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_center_layout_get_end_widget(self: PGtkCenterLayout): PGtkWidget; cdecl; external libgtk4;
procedure gtk_center_layout_set_shrink_center_last(self: PGtkCenterLayout; shrink_center_last: Tgboolean); cdecl; external libgtk4;
function gtk_center_layout_get_shrink_center_last(self: PGtkCenterLayout): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 13:52:48 ===

function GTK_TYPE_CENTER_LAYOUT: TGType;
function GTK_CENTER_LAYOUT(obj: Pointer): PGtkCenterLayout;
function GTK_IS_CENTER_LAYOUT(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CENTER_LAYOUT: TGType;
begin
  Result := gtk_center_layout_get_type;
end;

function GTK_CENTER_LAYOUT(obj: Pointer): PGtkCenterLayout;
begin
  Result := PGtkCenterLayout(g_type_check_instance_cast(obj, GTK_TYPE_CENTER_LAYOUT));
end;

function GTK_IS_CENTER_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CENTER_LAYOUT);
end;

end.
