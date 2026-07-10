unit gtkcelllayout;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkcellrenderer, gtktreemodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCellLayout = type Pointer;

  TGtkCellLayoutDataFunc = procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; tree_model: PGtkTreeModel; iter: PGtkTreeIter; data: Tgpointer); cdecl;

  PGtkCellLayoutIface = ^TGtkCellLayoutIface;
  TGtkCellLayoutIface = record
    g_iface: TGTypeInterface;
    pack_start: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl;
    pack_end: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl;
    clear: procedure(cell_layout: PGtkCellLayout); cdecl;
    add_attribute: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; attribute: pchar; column: longint); cdecl;
    set_cell_data_func: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; func: TGtkCellLayoutDataFunc; func_data: Tgpointer; destroy: TGDestroyNotify); cdecl;
    clear_attributes: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer); cdecl;
    reorder: procedure(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; position: longint); cdecl;
    get_cells: function(cell_layout: PGtkCellLayout): PGList; cdecl;
    get_area: function(cell_layout: PGtkCellLayout): PGtkCellArea; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_layout_get_type: TGType; cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_pack_start(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_pack_end(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; expand: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_cell_layout_get_cells(cell_layout: PGtkCellLayout): PGList; cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_clear(cell_layout: PGtkCellLayout); cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_set_attributes(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_cell_layout_add_attribute(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; attribute: pchar; column: longint); cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_set_cell_data_func(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; func: TGtkCellLayoutDataFunc; func_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_clear_attributes(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer); cdecl; external libgtk4; deprecated;
procedure gtk_cell_layout_reorder(cell_layout: PGtkCellLayout; cell: PGtkCellRenderer; position: longint); cdecl; external libgtk4; deprecated;
function gtk_cell_layout_get_area(cell_layout: PGtkCellLayout): PGtkCellArea; cdecl; external libgtk4; deprecated;
function _gtk_cell_layout_buildable_custom_tag_start(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: pchar; parser: PGtkBuildableParser; data: Pgpointer): Tgboolean; cdecl; external libgtk4; deprecated;
function _gtk_cell_layout_buildable_custom_tag_end(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: pchar; data: Pgpointer): Tgboolean; cdecl; external libgtk4; deprecated;
procedure _gtk_cell_layout_buildable_add_child(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; _type: pchar); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:34:53 ===

function GTK_TYPE_CELL_LAYOUT: TGType;
function GTK_CELL_LAYOUT(obj: Pointer): PGtkCellLayout;
function GTK_IS_CELL_LAYOUT(obj: Pointer): Tgboolean;
function GTK_CELL_LAYOUT_GET_IFACE(obj: Pointer): PGtkCellLayoutIface;
{$ENDIF read_function}

implementation

function GTK_TYPE_CELL_LAYOUT: TGType;
begin
  GTK_TYPE_CELL_LAYOUT := gtk_cell_layout_get_type;
end;

function GTK_CELL_LAYOUT(obj: Pointer): PGtkCellLayout;
begin
  Result := PGtkCellLayout(g_type_check_instance_cast(obj, GTK_TYPE_CELL_LAYOUT));
end;

function GTK_IS_CELL_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_LAYOUT);
end;

function GTK_CELL_LAYOUT_GET_IFACE(obj: Pointer): PGtkCellLayoutIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_CELL_LAYOUT);
end;



end.
