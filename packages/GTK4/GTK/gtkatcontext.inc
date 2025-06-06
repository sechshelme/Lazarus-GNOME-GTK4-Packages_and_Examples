
{$IFDEF read_interface}

  {GDK_DECLARE_INTERNAL_TYPE (GtkATContext, gtk_at_context, GTK, AT_CONTEXT, GObject) }
type
  TGtkATContext = record
  end;
  PGtkATContext = ^TGtkATContext;

  TGtkATContextClass = record
  end;
  PGtkATContextClass = ^TGtkATContextClass;

function gtk_at_context_get_type: TGType; cdecl; external libgtk4;
function gtk_at_context_get_accessible(self: PGtkATContext): PGtkAccessible; cdecl; external libgtk4;
function gtk_at_context_get_accessible_role(self: PGtkATContext): TGtkAccessibleRole; cdecl; external libgtk4;
function gtk_at_context_create(accessible_role: TGtkAccessibleRole; accessible: PGtkAccessible; display: PGdkDisplay): PGtkATContext; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 14:05:43 ===

function GTK_TYPE_AT_CONTEXT: TGType;
function GTK_AT_CONTEXT(obj: Pointer): PGtkATContext;
function GTK_IS_AT_CONTEXT(obj: Pointer): Tgboolean;
function GTK_AT_CONTEXT_CLASS(klass: Pointer): PGtkATContextClass;
function GTK_IS_AT_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GTK_AT_CONTEXT_GET_CLASS(obj: Pointer): PGtkATContextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_AT_CONTEXT: TGType;
begin
  Result := gtk_at_context_get_type;
end;

function GTK_AT_CONTEXT(obj: Pointer): PGtkATContext;
begin
  Result := PGtkATContext(g_type_check_instance_cast(obj, GTK_TYPE_AT_CONTEXT));
end;

function GTK_IS_AT_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_AT_CONTEXT);
end;

function GTK_AT_CONTEXT_CLASS(klass: Pointer): PGtkATContextClass;
begin
  Result := PGtkATContextClass(g_type_check_class_cast(klass, GTK_TYPE_AT_CONTEXT));
end;

function GTK_IS_AT_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_AT_CONTEXT);
end;

function GTK_AT_CONTEXT_GET_CLASS(obj: Pointer): PGtkATContextClass;
begin
  Result := PGtkATContextClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
