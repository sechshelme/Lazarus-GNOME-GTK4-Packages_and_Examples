unit gtkselectionfiltermodel;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkselectionmodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkSelectionFilterModel = type Pointer;

  TGtkSelectionFilterModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSelectionFilterModelClass = ^TGtkSelectionFilterModelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_selection_filter_model_get_type: TGType; cdecl; external libgtk4;
function gtk_selection_filter_model_new(model: PGtkSelectionModel): PGtkSelectionFilterModel; cdecl; external libgtk4;
procedure gtk_selection_filter_model_set_model(self: PGtkSelectionFilterModel; model: PGtkSelectionModel); cdecl; external libgtk4;
function gtk_selection_filter_model_get_model(self: PGtkSelectionFilterModel): PGtkSelectionModel; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:22 ===

function GTK_TYPE_SELECTION_FILTER_MODEL: TGType;
function GTK_SELECTION_FILTER_MODEL(obj: Pointer): PGtkSelectionFilterModel;
function GTK_IS_SELECTION_FILTER_MODEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SELECTION_FILTER_MODEL: TGType;
begin
  Result := gtk_selection_filter_model_get_type;
end;

function GTK_SELECTION_FILTER_MODEL(obj: Pointer): PGtkSelectionFilterModel;
begin
  Result := PGtkSelectionFilterModel(g_type_check_instance_cast(obj, GTK_TYPE_SELECTION_FILTER_MODEL));
end;

function GTK_IS_SELECTION_FILTER_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SELECTION_FILTER_MODEL);
end;


end.
