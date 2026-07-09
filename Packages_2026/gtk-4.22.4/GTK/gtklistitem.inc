

  {$IFDEF read_struct}
type
  PGtkListItemClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_list_item_get_type: TGType; cdecl; external libgtk4;
function gtk_list_item_get_item(self: PGtkListItem): Tgpointer; cdecl; external libgtk4;
function gtk_list_item_get_position(self: PGtkListItem): Tguint; cdecl; external libgtk4;
function gtk_list_item_get_selected(self: PGtkListItem): Tgboolean; cdecl; external libgtk4;
function gtk_list_item_get_selectable(self: PGtkListItem): Tgboolean; cdecl; external libgtk4;
procedure gtk_list_item_set_selectable(self: PGtkListItem; selectable: Tgboolean); cdecl; external libgtk4;
function gtk_list_item_get_activatable(self: PGtkListItem): Tgboolean; cdecl; external libgtk4;
procedure gtk_list_item_set_activatable(self: PGtkListItem; activatable: Tgboolean); cdecl; external libgtk4;
function gtk_list_item_get_focusable(self: PGtkListItem): Tgboolean; cdecl; external libgtk4;
procedure gtk_list_item_set_focusable(self: PGtkListItem; focusable: Tgboolean); cdecl; external libgtk4;
procedure gtk_list_item_set_child(self: PGtkListItem; child: PGtkWidget); cdecl; external libgtk4;
function gtk_list_item_get_child(self: PGtkListItem): PGtkWidget; cdecl; external libgtk4;
procedure gtk_list_item_set_accessible_description(self: PGtkListItem; description: pchar); cdecl; external libgtk4;
function gtk_list_item_get_accessible_description(self: PGtkListItem): pchar; cdecl; external libgtk4;
procedure gtk_list_item_set_accessible_label(self: PGtkListItem; _label: pchar); cdecl; external libgtk4;
function gtk_list_item_get_accessible_label(self: PGtkListItem): pchar; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:37:09 ===

function GTK_TYPE_LIST_ITEM: TGType;
function GTK_LIST_ITEM(obj: Pointer): PGtkListItem;
function GTK_IS_LIST_ITEM(obj: Pointer): Tgboolean;
function GTK_LIST_ITEM_CLASS(klass: Pointer): PGtkListItemClass;
function GTK_IS_LIST_ITEM_CLASS(klass: Pointer): Tgboolean;
function GTK_LIST_ITEM_GET_CLASS(obj: Pointer): PGtkListItemClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_LIST_ITEM: TGType;
begin
  Result := gtk_list_item_get_type;
end;

function GTK_LIST_ITEM(obj: Pointer): PGtkListItem;
begin
  Result := PGtkListItem(g_type_check_instance_cast(obj, GTK_TYPE_LIST_ITEM));
end;

function GTK_IS_LIST_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LIST_ITEM);
end;

function GTK_LIST_ITEM_CLASS(klass: Pointer): PGtkListItemClass;
begin
  Result := PGtkListItemClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_ITEM));
end;

function GTK_IS_LIST_ITEM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LIST_ITEM);
end;

function GTK_LIST_ITEM_GET_CLASS(obj: Pointer): PGtkListItemClass;
begin
  Result := PGtkListItemClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
