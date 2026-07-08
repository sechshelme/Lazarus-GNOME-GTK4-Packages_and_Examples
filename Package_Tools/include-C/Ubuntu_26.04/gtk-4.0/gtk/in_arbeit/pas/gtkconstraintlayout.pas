unit gtkconstraintlayout;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtklayoutmanager, gtklayoutchild, gtkconstraint, gtkconstraintguide;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkConstraintLayout = type Pointer;

  TGtkConstraintLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkConstraintLayoutClass = ^TGtkConstraintLayoutClass;

  PGtkConstraintLayoutChild = type Pointer;

  TGtkConstraintLayoutChildClass = record
    parent_class: TGtkLayoutChildClass;
  end;
  PGtkConstraintLayoutChildClass = ^TGtkConstraintLayoutChildClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_constraint_layout_child_get_type: TGType; cdecl; external libgtk4;
function gtk_constraint_layout_get_type: TGType; cdecl; external libgtk4;

function gtk_constraint_vfl_parser_error_quark: TGQuark; cdecl; external libgtk4;
function gtk_constraint_layout_new: PGtkLayoutManager; cdecl; external libgtk4;
procedure gtk_constraint_layout_add_constraint(layout: PGtkConstraintLayout; constraint: PGtkConstraint); cdecl; external libgtk4;
procedure gtk_constraint_layout_remove_constraint(layout: PGtkConstraintLayout; constraint: PGtkConstraint); cdecl; external libgtk4;
procedure gtk_constraint_layout_add_guide(layout: PGtkConstraintLayout; guide: PGtkConstraintGuide); cdecl; external libgtk4;
procedure gtk_constraint_layout_remove_guide(layout: PGtkConstraintLayout; guide: PGtkConstraintGuide); cdecl; external libgtk4;
procedure gtk_constraint_layout_remove_all_constraints(layout: PGtkConstraintLayout); cdecl; external libgtk4;
function gtk_constraint_layout_add_constraints_from_description(layout: PGtkConstraintLayout; lines: PPchar; n_lines: Tgsize; hspacing: longint; vspacing: longint;
  error: PPGError; first_view: pchar): PGList; cdecl; varargs; external libgtk4;
function gtk_constraint_layout_add_constraints_from_descriptionv(layout: PGtkConstraintLayout; lines: PPchar; n_lines: Tgsize; hspacing: longint; vspacing: longint;
  views: PGHashTable; error: PPGError): PGList; cdecl; external libgtk4;
function gtk_constraint_layout_observe_constraints(layout: PGtkConstraintLayout): PGListModel; cdecl; external libgtk4;
function gtk_constraint_layout_observe_guides(layout: PGtkConstraintLayout): PGListModel; cdecl; external libgtk4;

function GTK_CONSTRAINT_VFL_PARSER_ERROR: TGQuark;

// === Konventiert am: 6-7-26 14:08:47 ===

function GTK_TYPE_CONSTRAINT_LAYOUT: TGType;
function GTK_CONSTRAINT_LAYOUT(obj: Pointer): PGtkConstraintLayout;
function GTK_IS_CONSTRAINT_LAYOUT(obj: Pointer): Tgboolean;

function GTK_TYPE_CONSTRAINT_LAYOUT_CHILD: TGType;
function GTK_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): PGtkConstraintLayoutChild;
function GTK_IS_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CONSTRAINT_LAYOUT_CHILD: TGType;
begin
  Result := gtk_constraint_layout_child_get_type;
end;

function GTK_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): PGtkConstraintLayoutChild;
begin
  Result := PGtkConstraintLayoutChild(g_type_check_instance_cast(obj, GTK_TYPE_CONSTRAINT_LAYOUT_CHILD));
end;

function GTK_IS_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CONSTRAINT_LAYOUT_CHILD);
end;


function GTK_TYPE_CONSTRAINT_LAYOUT: TGType;
begin
  Result := gtk_constraint_layout_get_type;
end;

function GTK_CONSTRAINT_LAYOUT(obj: Pointer): PGtkConstraintLayout;
begin
  Result := PGtkConstraintLayout(g_type_check_instance_cast(obj, GTK_TYPE_CONSTRAINT_LAYOUT));
end;

function GTK_IS_CONSTRAINT_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CONSTRAINT_LAYOUT);
end;


function GTK_CONSTRAINT_VFL_PARSER_ERROR: TGQuark;
begin
  GTK_CONSTRAINT_VFL_PARSER_ERROR := gtk_constraint_vfl_parser_error_quark;
end;


end.
