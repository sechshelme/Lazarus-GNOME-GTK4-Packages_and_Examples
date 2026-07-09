
  {$IFDEF read_struct}
type
  PGtkStringObject = type Pointer;

  TGtkStringObjectClass = record
    parent_class: TGObjectClass;
  end;
  PGtkStringObjectClass = ^TGtkStringObjectClass;

type
  PGtkStringList = type Pointer;

  TGtkStringListClass = record
    parent_class: TGObjectClass;
  end;
  PGtkStringListClass = ^TGtkStringListClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_string_list_get_type: TGType; cdecl; external libgtk4;
function gtk_string_object_new(_string: pchar): PGtkStringObject; cdecl; external libgtk4;
function gtk_string_object_get_string(self: PGtkStringObject): pchar; cdecl; external libgtk4;

function gtk_string_object_get_type: TGType; cdecl; external libgtk4;
function gtk_string_list_new(strings: PPchar): PGtkStringList; cdecl; external libgtk4;
procedure gtk_string_list_append(self: PGtkStringList; _string: pchar); cdecl; external libgtk4;
procedure gtk_string_list_take(self: PGtkStringList; _string: pchar); cdecl; external libgtk4;
procedure gtk_string_list_remove(self: PGtkStringList; position: Tguint); cdecl; external libgtk4;
procedure gtk_string_list_splice(self: PGtkStringList; position: Tguint; n_removals: Tguint; additions: PPchar); cdecl; external libgtk4;
function gtk_string_list_get_string(self: PGtkStringList; position: Tguint): pchar; cdecl; external libgtk4;
function gtk_string_list_find(self: PGtkStringList; _string: pchar): Tguint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:55:25 ===

function GTK_TYPE_STRING_OBJECT: TGType;
function GTK_STRING_OBJECT(obj: Pointer): PGtkStringObject;
function GTK_IS_STRING_OBJECT(obj: Pointer): Tgboolean;

function GTK_TYPE_STRING_LIST: TGType;
function GTK_STRING_LIST(obj: Pointer): PGtkStringList;
function GTK_IS_STRING_LIST(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_STRING_OBJECT: TGType;
begin
  Result := gtk_string_object_get_type;
end;

function GTK_STRING_OBJECT(obj: Pointer): PGtkStringObject;
begin
  Result := PGtkStringObject(g_type_check_instance_cast(obj, GTK_TYPE_STRING_OBJECT));
end;

function GTK_IS_STRING_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_OBJECT);
end;


function GTK_TYPE_STRING_LIST: TGType;
begin
  Result := gtk_string_list_get_type;
end;

function GTK_STRING_LIST(obj: Pointer): PGtkStringList;
begin
  Result := PGtkStringList(g_type_check_instance_cast(obj, GTK_TYPE_STRING_LIST));
end;

function GTK_IS_STRING_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_LIST);
end;

{$ENDIF read_implementation}
