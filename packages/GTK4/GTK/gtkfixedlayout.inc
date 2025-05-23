
{$IFDEF read_interface}


{G_DECLARE_FINAL_TYPE (GtkFixedLayout, gtk_fixed_layout, GTK, FIXED_LAYOUT, GtkLayoutManager) }
type
  TGtkFixedLayout = record
  end;
  PGtkFixedLayout = ^TGtkFixedLayout;

  TGtkFixedLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkFixedLayoutClass = ^TGtkFixedLayoutClass;

function gtk_fixed_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_fixed_layout_new: PGtkLayoutManager; cdecl; external libgtk4;


{G_DECLARE_FINAL_TYPE (GtkFixedLayoutChild, gtk_fixed_layout_child, GTK, FIXED_LAYOUT_CHILD, GtkLayoutChild) }
type
  TGtkFixedLayoutChild = record
  end;
  PGtkFixedLayoutChild = ^TGtkFixedLayoutChild;

  TGtkFixedLayoutChildClass = record
    parent_class: TGtkLayoutChildClass;
  end;
  PGtkFixedLayoutChildClass = ^TGtkFixedLayoutChildClass;

function gtk_fixed_layout_child_get_type: TGType; cdecl; external libgtk4;
procedure gtk_fixed_layout_child_set_transform(child: PGtkFixedLayoutChild; transform: PGskTransform); cdecl; external libgtk4;
function gtk_fixed_layout_child_get_transform(child: PGtkFixedLayoutChild): PGskTransform; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 15:21:19 ===

function GTK_TYPE_FIXED_LAYOUT: TGType;
function GTK_FIXED_LAYOUT(obj: Pointer): PGtkFixedLayout;
function GTK_IS_FIXED_LAYOUT(obj: Pointer): Tgboolean;

function GTK_TYPE_FIXED_LAYOUT_CHILD: TGType;
function GTK_FIXED_LAYOUT_CHILD(obj: Pointer): PGtkFixedLayoutChild;
function GTK_IS_FIXED_LAYOUT_CHILD(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_FIXED_LAYOUT: TGType;
begin
  Result := gtk_fixed_layout_get_type;
end;

function GTK_FIXED_LAYOUT(obj: Pointer): PGtkFixedLayout;
begin
  Result := PGtkFixedLayout(g_type_check_instance_cast(obj, GTK_TYPE_FIXED_LAYOUT));
end;

function GTK_IS_FIXED_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FIXED_LAYOUT);
end;

// ====

function GTK_TYPE_FIXED_LAYOUT_CHILD: TGType;
begin
  Result := gtk_fixed_layout_child_get_type;
end;

function GTK_FIXED_LAYOUT_CHILD(obj: Pointer): PGtkFixedLayoutChild;
begin
  Result := PGtkFixedLayoutChild(g_type_check_instance_cast(obj, GTK_TYPE_FIXED_LAYOUT_CHILD));
end;

function GTK_IS_FIXED_LAYOUT_CHILD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FIXED_LAYOUT_CHILD);
end;

{$ENDIF read_implementation}
