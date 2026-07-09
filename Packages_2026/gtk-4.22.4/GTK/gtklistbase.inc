

  {$IFDEF read_struct}
type
  PGtkListBase = type Pointer;
  PGtkListBaseClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_list_base_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:29:07 ===

function GTK_TYPE_LIST_BASE: TGType;
function GTK_LIST_BASE(obj: Pointer): PGtkListBase;
function GTK_LIST_BASE_CLASS(klass: Pointer): PGtkListBaseClass;
function GTK_IS_LIST_BASE(obj: Pointer): Tgboolean;
function GTK_IS_LIST_BASE_CLASS(klass: Pointer): Tgboolean;
function GTK_LIST_BASE_GET_CLASS(obj: Pointer): PGtkListBaseClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_LIST_BASE: TGType;
begin
  GTK_TYPE_LIST_BASE := gtk_list_base_get_type;
end;

function GTK_LIST_BASE(obj: Pointer): PGtkListBase;
begin
  Result := PGtkListBase(g_type_check_instance_cast(obj, GTK_TYPE_LIST_BASE));
end;

function GTK_LIST_BASE_CLASS(klass: Pointer): PGtkListBaseClass;
begin
  Result := PGtkListBaseClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_BASE));
end;

function GTK_IS_LIST_BASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LIST_BASE);
end;

function GTK_IS_LIST_BASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LIST_BASE);
end;

function GTK_LIST_BASE_GET_CLASS(obj: Pointer): PGtkListBaseClass;
begin
  Result := PGtkListBaseClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
