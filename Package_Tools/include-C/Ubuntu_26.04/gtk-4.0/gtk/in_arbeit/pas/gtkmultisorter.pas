unit gtkmultisorter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtksorter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkMultiSorter = type Pointer;

  TGtkMultiSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkMultiSorterClass = ^TGtkMultiSorterClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_multi_sorter_get_type: TGType; cdecl; external libgtk4;
function gtk_multi_sorter_new: PGtkMultiSorter; cdecl; external libgtk4;
procedure gtk_multi_sorter_append(self: PGtkMultiSorter; sorter: PGtkSorter); cdecl; external libgtk4;
procedure gtk_multi_sorter_remove(self: PGtkMultiSorter; position: Tguint); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:33 ===

function GTK_TYPE_MULTI_SORTER: TGType;
function GTK_MULTI_SORTER(obj: Pointer): PGtkMultiSorter;
function GTK_IS_MULTI_SORTER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_MULTI_SORTER: TGType;
begin
  Result := gtk_multi_sorter_get_type;
end;

function GTK_MULTI_SORTER(obj: Pointer): PGtkMultiSorter;
begin
  Result := PGtkMultiSorter(g_type_check_instance_cast(obj, GTK_TYPE_MULTI_SORTER));
end;

function GTK_IS_MULTI_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MULTI_SORTER);
end;

end.
