

  {$IFDEF read_struct}
type
  PGtkBoxLayout = type Pointer;

  TGtkBoxLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkBoxLayoutClass = ^TGtkBoxLayoutClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_box_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_box_layout_new(orientation: TGtkOrientation): PGtkLayoutManager; cdecl; external libgtk4;
procedure gtk_box_layout_set_homogeneous(box_layout: PGtkBoxLayout; homogeneous: Tgboolean); cdecl; external libgtk4;
function gtk_box_layout_get_homogeneous(box_layout: PGtkBoxLayout): Tgboolean; cdecl; external libgtk4;
procedure gtk_box_layout_set_spacing(box_layout: PGtkBoxLayout; spacing: Tguint); cdecl; external libgtk4;
function gtk_box_layout_get_spacing(box_layout: PGtkBoxLayout): Tguint; cdecl; external libgtk4;
procedure gtk_box_layout_set_baseline_position(box_layout: PGtkBoxLayout; position: TGtkBaselinePosition); cdecl; external libgtk4;
function gtk_box_layout_get_baseline_position(box_layout: PGtkBoxLayout): TGtkBaselinePosition; cdecl; external libgtk4;
procedure gtk_box_layout_set_baseline_child(box_layout: PGtkBoxLayout; child: longint); cdecl; external libgtk4;
function gtk_box_layout_get_baseline_child(box_layout: PGtkBoxLayout): longint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 13:54:34 ===

function GTK_TYPE_BOX_LAYOUT: TGType;
function GTK_BOX_LAYOUT(obj: Pointer): PGtkBoxLayout;
function GTK_IS_BOX_LAYOUT(obj: Pointer): Tgboolean;
{$ENDIF read_struct}


{$IFDEF read_implementation}

function GTK_TYPE_BOX_LAYOUT: TGType;
begin
  Result := gtk_box_layout_get_type;
end;

function GTK_BOX_LAYOUT(obj: Pointer): PGtkBoxLayout;
begin
  Result := PGtkBoxLayout(g_type_check_instance_cast(obj, GTK_TYPE_BOX_LAYOUT));
end;

function GTK_IS_BOX_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BOX_LAYOUT);
end;

{$ENDIF read_implementation}
