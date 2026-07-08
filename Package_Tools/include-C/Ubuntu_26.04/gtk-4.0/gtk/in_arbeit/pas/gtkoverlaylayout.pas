unit gtkoverlaylayout;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtklayoutmanager, gtklayoutchild;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkOverlayLayout = type Pointer;
  TGtkOverlayLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkOverlayLayoutClass = ^TGtkOverlayLayoutClass;

  PGtkOverlayLayoutChild = type Pointer;
  TGtkOverlayLayoutChildClass = record
    parent_class: TGtkLayoutChildClass;
  end;
  PGtkOverlayLayoutChildClass = ^TGtkOverlayLayoutChildClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_overlay_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_overlay_layout_new: PGtkLayoutManager; cdecl; external libgtk4;

function gtk_overlay_layout_child_get_type: TGType; cdecl; external libgtk4;
procedure gtk_overlay_layout_child_set_measure(child: PGtkOverlayLayoutChild; measure: Tgboolean); cdecl; external libgtk4;
function gtk_overlay_layout_child_get_measure(child: PGtkOverlayLayoutChild): Tgboolean; cdecl; external libgtk4;
procedure gtk_overlay_layout_child_set_clip_overlay(child: PGtkOverlayLayoutChild; clip_overlay: Tgboolean); cdecl; external libgtk4;
function gtk_overlay_layout_child_get_clip_overlay(child: PGtkOverlayLayoutChild): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:07:05 ===

function GTK_TYPE_OVERLAY_LAYOUT: TGType;
function GTK_OVERLAY_LAYOUT(obj: Pointer): PGtkOverlayLayout;
function GTK_IS_OVERLAY_LAYOUT(obj: Pointer): Tgboolean;

function GTK_TYPE_OVERLAY_LAYOUT_CHILD: TGType;
function GTK_OVERLAY_LAYOUT_CHILD(obj: Pointer): PGtkOverlayLayoutChild;
function GTK_IS_OVERLAY_LAYOUT_CHILD(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_OVERLAY_LAYOUT: TGType;
begin
  Result := gtk_overlay_layout_get_type;
end;

function GTK_OVERLAY_LAYOUT(obj: Pointer): PGtkOverlayLayout;
begin
  Result := PGtkOverlayLayout(g_type_check_instance_cast(obj, GTK_TYPE_OVERLAY_LAYOUT));
end;

function GTK_IS_OVERLAY_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_OVERLAY_LAYOUT);
end;


function GTK_TYPE_OVERLAY_LAYOUT_CHILD: TGType;
begin
  Result := gtk_overlay_layout_child_get_type;
end;

function GTK_OVERLAY_LAYOUT_CHILD(obj: Pointer): PGtkOverlayLayoutChild;
begin
  Result := PGtkOverlayLayoutChild(g_type_check_instance_cast(obj, GTK_TYPE_OVERLAY_LAYOUT_CHILD));
end;

function GTK_IS_OVERLAY_LAYOUT_CHILD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_OVERLAY_LAYOUT_CHILD);
end;

end.
