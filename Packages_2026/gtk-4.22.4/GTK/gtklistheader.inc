

  {$IFDEF read_struct}
type
  PGtkListHeader = type Pointer;
  PGtkListHeaderClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_list_header_get_type: TGType; cdecl; external libgtk4;
function gtk_list_header_get_item(self: PGtkListHeader): Tgpointer; cdecl; external libgtk4;
function gtk_list_header_get_start(self: PGtkListHeader): Tguint; cdecl; external libgtk4;
function gtk_list_header_get_end(self: PGtkListHeader): Tguint; cdecl; external libgtk4;
function gtk_list_header_get_n_items(self: PGtkListHeader): Tguint; cdecl; external libgtk4;
procedure gtk_list_header_set_child(self: PGtkListHeader; child: PGtkWidget); cdecl; external libgtk4;
function gtk_list_header_get_child(self: PGtkListHeader): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:10:36 ===

function GTK_TYPE_LIST_HEADER: TGType;
function GTK_LIST_HEADER(obj: Pointer): PGtkListHeader;
function GTK_IS_LIST_HEADER(obj: Pointer): Tgboolean;
function GTK_LIST_HEADER_CLASS(klass: Pointer): PGtkListHeaderClass;
function GTK_IS_LIST_HEADER_CLASS(klass: Pointer): Tgboolean;
function GTK_LIST_HEADER_GET_CLASS(obj: Pointer): PGtkListHeaderClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_LIST_HEADER: TGType;
begin
  Result := gtk_list_header_get_type;
end;

function GTK_LIST_HEADER(obj: Pointer): PGtkListHeader;
begin
  Result := PGtkListHeader(g_type_check_instance_cast(obj, GTK_TYPE_LIST_HEADER));
end;

function GTK_IS_LIST_HEADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LIST_HEADER);
end;

function GTK_LIST_HEADER_CLASS(klass: Pointer): PGtkListHeaderClass;
begin
  Result := PGtkListHeaderClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_HEADER));
end;

function GTK_IS_LIST_HEADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LIST_HEADER);
end;

function GTK_LIST_HEADER_GET_CLASS(obj: Pointer): PGtkListHeaderClass;
begin
  Result := PGtkListHeaderClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
