

  {$IFDEF read_struct}
type
  PGEmblem = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_emblem_get_type: TGType; cdecl; external libgio2;
function g_emblem_new(icon: PGIcon): PGEmblem; cdecl; external libgio2;
function g_emblem_new_with_origin(icon: PGIcon; origin: TGEmblemOrigin): PGEmblem; cdecl; external libgio2;
function g_emblem_get_icon(emblem: PGEmblem): PGIcon; cdecl; external libgio2;
function g_emblem_get_origin(emblem: PGEmblem): TGEmblemOrigin; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:23:10 ===

function G_TYPE_EMBLEM: TGType;
function G_EMBLEM(obj: Pointer): PGEmblem;
function G_EMBLEM_CLASS(klass: Pointer): PGEmblemClass;
function G_IS_EMBLEM(obj: Pointer): Tgboolean;
function G_IS_EMBLEM_CLASS(klass: Pointer): Tgboolean;
function G_EMBLEM_GET_CLASS(obj: Pointer): PGEmblemClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_EMBLEM: TGType;
begin
  G_TYPE_EMBLEM := g_emblem_get_type;
end;

function G_EMBLEM(obj: Pointer): PGEmblem;
begin
  Result := PGEmblem(g_type_check_instance_cast(obj, G_TYPE_EMBLEM));
end;

function G_EMBLEM_CLASS(klass: Pointer): PGEmblemClass;
begin
  Result := PGEmblemClass(g_type_check_class_cast(klass, G_TYPE_EMBLEM));
end;

function G_IS_EMBLEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_EMBLEM);
end;

function G_IS_EMBLEM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_EMBLEM);
end;

function G_EMBLEM_GET_CLASS(obj: Pointer): PGEmblemClass;
begin
  Result := PGEmblemClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
