unit gtkdirectorylist;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkDirectoryList = type Pointer;

  TGtkDirectoryListClass = record
    parent_class: TGObjectClass;
  end;
  PGtkDirectoryListClass = ^TGtkDirectoryListClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_directory_list_get_type: TGType; cdecl; external libgtk4;
function gtk_directory_list_new(attributes: pchar; file_: PGFile): PGtkDirectoryList; cdecl; external libgtk4;
procedure gtk_directory_list_set_file(self: PGtkDirectoryList; file_: PGFile); cdecl; external libgtk4;
function gtk_directory_list_get_file(self: PGtkDirectoryList): PGFile; cdecl; external libgtk4;
procedure gtk_directory_list_set_attributes(self: PGtkDirectoryList; attributes: pchar); cdecl; external libgtk4;
function gtk_directory_list_get_attributes(self: PGtkDirectoryList): pchar; cdecl; external libgtk4;
procedure gtk_directory_list_set_io_priority(self: PGtkDirectoryList; io_priority: longint); cdecl; external libgtk4;
function gtk_directory_list_get_io_priority(self: PGtkDirectoryList): longint; cdecl; external libgtk4;
function gtk_directory_list_is_loading(self: PGtkDirectoryList): Tgboolean; cdecl; external libgtk4;
function gtk_directory_list_get_error(self: PGtkDirectoryList): PGError; cdecl; external libgtk4;
procedure gtk_directory_list_set_monitored(self: PGtkDirectoryList; monitored: Tgboolean); cdecl; external libgtk4;
function gtk_directory_list_get_monitored(self: PGtkDirectoryList): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:08:00 ===

function GTK_TYPE_DIRECTORY_LIST: TGType;
function GTK_DIRECTORY_LIST(obj: Pointer): PGtkDirectoryList;
function GTK_IS_DIRECTORY_LIST(obj: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

function GTK_TYPE_DIRECTORY_LIST: TGType;
begin
  Result := gtk_directory_list_get_type;
end;

function GTK_DIRECTORY_LIST(obj: Pointer): PGtkDirectoryList;
begin
  Result := PGtkDirectoryList(g_type_check_instance_cast(obj, GTK_TYPE_DIRECTORY_LIST));
end;

function GTK_IS_DIRECTORY_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DIRECTORY_LIST);
end;


end.
