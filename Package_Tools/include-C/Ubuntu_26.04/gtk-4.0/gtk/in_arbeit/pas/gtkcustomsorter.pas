unit gtkcustomsorter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtksorter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCustomSorter = type Pointer;

  TGtkCustomSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkCustomSorterClass = ^TGtkCustomSorterClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_custom_sorter_get_type: TGType; cdecl; external libgtk4;
function gtk_custom_sorter_new(sort_func: TGCompareDataFunc; user_data: Tgpointer; user_destroy: TGDestroyNotify): PGtkCustomSorter; cdecl; external libgtk4;
procedure gtk_custom_sorter_set_sort_func(self: PGtkCustomSorter; sort_func: TGCompareDataFunc; user_data: Tgpointer; user_destroy: TGDestroyNotify); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:08:19 ===

function GTK_TYPE_CUSTOM_SORTER: TGType;
function GTK_CUSTOM_SORTER(obj: Pointer): PGtkCustomSorter;
function GTK_IS_CUSTOM_SORTER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CUSTOM_SORTER: TGType;
begin
  Result := gtk_custom_sorter_get_type;
end;

function GTK_CUSTOM_SORTER(obj: Pointer): PGtkCustomSorter;
begin
  Result := PGtkCustomSorter(g_type_check_instance_cast(obj, GTK_TYPE_CUSTOM_SORTER));
end;

function GTK_IS_CUSTOM_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CUSTOM_SORTER);
end;

end.
