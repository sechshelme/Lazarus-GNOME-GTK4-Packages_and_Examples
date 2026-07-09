

  {$IFDEF read_struct}
type
  PGtkTextTagTable = type Pointer;

  TGtkTextTagTableForeach = procedure(tag: PGtkTextTag; data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_text_tag_table_get_type: TGType; cdecl; external libgtk4;
function gtk_text_tag_table_new: PGtkTextTagTable; cdecl; external libgtk4;
function gtk_text_tag_table_add(table: PGtkTextTagTable; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
procedure gtk_text_tag_table_remove(table: PGtkTextTagTable; tag: PGtkTextTag); cdecl; external libgtk4;
function gtk_text_tag_table_lookup(table: PGtkTextTagTable; name: pchar): PGtkTextTag; cdecl; external libgtk4;
procedure gtk_text_tag_table_foreach(table: PGtkTextTagTable; func: TGtkTextTagTableForeach; data: Tgpointer); cdecl; external libgtk4;
function gtk_text_tag_table_get_size(table: PGtkTextTagTable): longint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:45:17 ===

function GTK_TYPE_TEXT_TAG_TABLE: TGType;
function GTK_TEXT_TAG_TABLE(obj: Pointer): PGtkTextTagTable;
function GTK_IS_TEXT_TAG_TABLE(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TEXT_TAG_TABLE: TGType;
begin
  GTK_TYPE_TEXT_TAG_TABLE := gtk_text_tag_table_get_type;
end;

function GTK_TEXT_TAG_TABLE(obj: Pointer): PGtkTextTagTable;
begin
  Result := PGtkTextTagTable(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_TAG_TABLE));
end;

function GTK_IS_TEXT_TAG_TABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TEXT_TAG_TABLE);
end;



{$ENDIF read_implementation}
