unit gtksizegroup;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkSizeGroup = ^TGtkSizeGroup;
  TGtkSizeGroup = record
    parent_instance: TGObject;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_size_group_get_type: TGType; cdecl; external libgtk4;
function gtk_size_group_new(mode: TGtkSizeGroupMode): PGtkSizeGroup; cdecl; external libgtk4;
procedure gtk_size_group_set_mode(size_group: PGtkSizeGroup; mode: TGtkSizeGroupMode); cdecl; external libgtk4;
function gtk_size_group_get_mode(size_group: PGtkSizeGroup): TGtkSizeGroupMode; cdecl; external libgtk4;
procedure gtk_size_group_add_widget(size_group: PGtkSizeGroup; widget: PGtkWidget); cdecl; external libgtk4;
procedure gtk_size_group_remove_widget(size_group: PGtkSizeGroup; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_size_group_get_widgets(size_group: PGtkSizeGroup): PGSList; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:02 ===

function GTK_TYPE_SIZE_GROUP: TGType;
function GTK_SIZE_GROUP(obj: Pointer): PGtkSizeGroup;
function GTK_IS_SIZE_GROUP(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SIZE_GROUP: TGType;
begin
  GTK_TYPE_SIZE_GROUP := gtk_size_group_get_type;
end;

function GTK_SIZE_GROUP(obj: Pointer): PGtkSizeGroup;
begin
  Result := PGtkSizeGroup(g_type_check_instance_cast(obj, GTK_TYPE_SIZE_GROUP));
end;

function GTK_IS_SIZE_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SIZE_GROUP);
end;



end.
