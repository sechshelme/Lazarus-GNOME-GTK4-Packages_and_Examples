unit gtktreeexpander;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget, gtktreelistmodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGtkTreeExpander = type Pointer;

  TGtkTreeExpanderClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkTreeExpanderClass = ^TGtkTreeExpanderClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_expander_get_type: TGType; cdecl; external libgtk4;
function gtk_tree_expander_new: PGtkWidget; cdecl; external libgtk4;
function gtk_tree_expander_get_child(self: PGtkTreeExpander): PGtkWidget; cdecl; external libgtk4;
procedure gtk_tree_expander_set_child(self: PGtkTreeExpander; child: PGtkWidget); cdecl; external libgtk4;
function gtk_tree_expander_get_item(self: PGtkTreeExpander): Tgpointer; cdecl; external libgtk4;
function gtk_tree_expander_get_list_row(self: PGtkTreeExpander): PGtkTreeListRow; cdecl; external libgtk4;
procedure gtk_tree_expander_set_list_row(self: PGtkTreeExpander; list_row: PGtkTreeListRow); cdecl; external libgtk4;
function gtk_tree_expander_get_indent_for_depth(self: PGtkTreeExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_tree_expander_set_indent_for_depth(self: PGtkTreeExpander; indent_for_depth: Tgboolean); cdecl; external libgtk4;
function gtk_tree_expander_get_indent_for_icon(self: PGtkTreeExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_tree_expander_set_indent_for_icon(self: PGtkTreeExpander; indent_for_icon: Tgboolean); cdecl; external libgtk4;
function gtk_tree_expander_get_hide_expander(self: PGtkTreeExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_tree_expander_set_hide_expander(self: PGtkTreeExpander; hide_expander: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:45:12 ===

function GTK_TYPE_TREE_EXPANDER: TGType;
function GTK_TREE_EXPANDER(obj: Pointer): PGtkTreeExpander;
function GTK_IS_TREE_EXPANDER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_TREE_EXPANDER: TGType;
begin
  Result := gtk_tree_expander_get_type;
end;

function GTK_TREE_EXPANDER(obj: Pointer): PGtkTreeExpander;
begin
  Result := PGtkTreeExpander(g_type_check_instance_cast(obj, GTK_TYPE_TREE_EXPANDER));
end;

function GTK_IS_TREE_EXPANDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_EXPANDER);
end;

end.
