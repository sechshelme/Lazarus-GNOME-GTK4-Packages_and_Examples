unit gtksortlistmodel;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtksorter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkSortListModel = type Pointer;

  TGtkSortListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSortListModelClass = ^TGtkSortListModelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_sort_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_sort_list_model_new(model: PGListModel; sorter: PGtkSorter): PGtkSortListModel; cdecl; external libgtk4;
procedure gtk_sort_list_model_set_sorter(self: PGtkSortListModel; sorter: PGtkSorter); cdecl; external libgtk4;
function gtk_sort_list_model_get_sorter(self: PGtkSortListModel): PGtkSorter; cdecl; external libgtk4;
procedure gtk_sort_list_model_set_section_sorter(self: PGtkSortListModel; sorter: PGtkSorter); cdecl; external libgtk4;
function gtk_sort_list_model_get_section_sorter(self: PGtkSortListModel): PGtkSorter; cdecl; external libgtk4;
procedure gtk_sort_list_model_set_model(self: PGtkSortListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_sort_list_model_get_model(self: PGtkSortListModel): PGListModel; cdecl; external libgtk4;
procedure gtk_sort_list_model_set_incremental(self: PGtkSortListModel; incremental: Tgboolean); cdecl; external libgtk4;
function gtk_sort_list_model_get_incremental(self: PGtkSortListModel): Tgboolean; cdecl; external libgtk4;
function gtk_sort_list_model_get_pending(self: PGtkSortListModel): Tguint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:55:29 ===

function GTK_TYPE_SORT_LIST_MODEL: TGType;
function GTK_SORT_LIST_MODEL(obj: Pointer): PGtkSortListModel;
function GTK_IS_SORT_LIST_MODEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SORT_LIST_MODEL: TGType;
begin
  Result := gtk_sort_list_model_get_type;
end;

function GTK_SORT_LIST_MODEL(obj: Pointer): PGtkSortListModel;
begin
  Result := PGtkSortListModel(g_type_check_instance_cast(obj, GTK_TYPE_SORT_LIST_MODEL));
end;

function GTK_IS_SORT_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SORT_LIST_MODEL);
end;

end.
