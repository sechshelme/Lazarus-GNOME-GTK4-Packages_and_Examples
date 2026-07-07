unit gtkbookmarklist;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkBookmarkList = type Pointer;

  TGtkBookmarkListClass = record
    parent_class: TGObjectClass;
  end;
  PGtkBookmarkListClass = ^TGtkBookmarkListClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_bookmark_list_get_type: TGType; cdecl; external libgtk4;
function gtk_bookmark_list_new(filename: pchar; attributes: pchar): PGtkBookmarkList; cdecl; external libgtk4;
function gtk_bookmark_list_get_filename(self: PGtkBookmarkList): pchar; cdecl; external libgtk4;
procedure gtk_bookmark_list_set_attributes(self: PGtkBookmarkList; attributes: pchar); cdecl; external libgtk4;
function gtk_bookmark_list_get_attributes(self: PGtkBookmarkList): pchar; cdecl; external libgtk4;
procedure gtk_bookmark_list_set_io_priority(self: PGtkBookmarkList; io_priority: longint); cdecl; external libgtk4;
function gtk_bookmark_list_get_io_priority(self: PGtkBookmarkList): longint; cdecl; external libgtk4;
function gtk_bookmark_list_is_loading(self: PGtkBookmarkList): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 19:15:43 ===

function GTK_TYPE_BOOKMARK_LIST: TGType;
function GTK_BOOKMARK_LIST(obj: Pointer): PGtkBookmarkList;
function GTK_IS_BOOKMARK_LIST(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_BOOKMARK_LIST: TGType;
begin
  Result := gtk_bookmark_list_get_type;
end;

function GTK_BOOKMARK_LIST(obj: Pointer): PGtkBookmarkList;
begin
  Result := PGtkBookmarkList(g_type_check_instance_cast(obj, GTK_TYPE_BOOKMARK_LIST));
end;

function GTK_IS_BOOKMARK_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BOOKMARK_LIST);
end;

end.
