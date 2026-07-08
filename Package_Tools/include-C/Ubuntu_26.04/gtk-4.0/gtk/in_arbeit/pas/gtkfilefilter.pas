unit gtkfilefilter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkFileFilter = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_file_filter_get_type: TGType; cdecl; external libgtk4;
function gtk_file_filter_new: PGtkFileFilter; cdecl; external libgtk4;
procedure gtk_file_filter_set_name(filter: PGtkFileFilter; name: pchar); cdecl; external libgtk4;
function gtk_file_filter_get_name(filter: PGtkFileFilter): pchar; cdecl; external libgtk4;
procedure gtk_file_filter_add_mime_type(filter: PGtkFileFilter; mime_type: pchar); cdecl; external libgtk4;
procedure gtk_file_filter_add_mime_types(filter: PGtkFileFilter; mime_types: PPchar); cdecl; external libgtk4;
procedure gtk_file_filter_add_pattern(filter: PGtkFileFilter; pattern: pchar); cdecl; external libgtk4;
procedure gtk_file_filter_add_suffix(filter: PGtkFileFilter; suffix: pchar); cdecl; external libgtk4;
procedure gtk_file_filter_add_pixbuf_formats(filter: PGtkFileFilter); cdecl; external libgtk4; deprecated;
function gtk_file_filter_get_attributes(filter: PGtkFileFilter): Ppchar; cdecl; external libgtk4;
function gtk_file_filter_to_gvariant(filter: PGtkFileFilter): PGVariant; cdecl; external libgtk4;
function gtk_file_filter_new_from_gvariant(variant: PGVariant): PGtkFileFilter; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:45:55 ===

function GTK_TYPE_FILE_FILTER: TGType;
function GTK_FILE_FILTER(obj: Pointer): PGtkFileFilter;
function GTK_IS_FILE_FILTER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_FILE_FILTER: TGType;
begin
  GTK_TYPE_FILE_FILTER := gtk_file_filter_get_type;
end;

function GTK_FILE_FILTER(obj: Pointer): PGtkFileFilter;
begin
  Result := PGtkFileFilter(g_type_check_instance_cast(obj, GTK_TYPE_FILE_FILTER));
end;

function GTK_IS_FILE_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_FILTER);
end;



end.
