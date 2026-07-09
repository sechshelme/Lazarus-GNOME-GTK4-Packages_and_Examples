

  {$IFDEF read_enum}
type
  PGtkFilterMatch = ^TGtkFilterMatch;
  TGtkFilterMatch = longint;
const
  GTK_FILTER_MATCH_SOME = 0;
  GTK_FILTER_MATCH_NONE = 1;
  GTK_FILTER_MATCH_ALL = 2;

type
  PGtkFilterChange = ^TGtkFilterChange;
  TGtkFilterChange = longint;
const
  GTK_FILTER_CHANGE_DIFFERENT = 0;
  GTK_FILTER_CHANGE_LESS_STRICT = 1;
  GTK_FILTER_CHANGE_MORE_STRICT = 2;
  GTK_FILTER_CHANGE_DIFFERENT_REWATCH = 3;
  GTK_FILTER_CHANGE_LESS_STRICT_REWATCH = 4;
  GTK_FILTER_CHANGE_MORE_STRICT_REWATCH = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGtkFilter = record
    parent_instance: TGObject;
  end;
  PGtkFilter = ^TGtkFilter;

  PGtkFilterClass = ^TGtkFilterClass;
  TGtkFilterClass = record
    parent_class: TGObjectClass;
    match: function(self: PGtkFilter; item: Tgpointer): Tgboolean; cdecl;
    get_strictness: function(self: PGtkFilter): TGtkFilterMatch; cdecl;
    _gtk_reserved1: procedure; cdecl;
    _gtk_reserved2: procedure; cdecl;
    _gtk_reserved3: procedure; cdecl;
    _gtk_reserved4: procedure; cdecl;
    _gtk_reserved5: procedure; cdecl;
    _gtk_reserved6: procedure; cdecl;
    _gtk_reserved7: procedure; cdecl;
    _gtk_reserved8: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_filter_get_type: TGType; cdecl; external libgtk4;
function gtk_filter_match(self: PGtkFilter; item: Tgpointer): Tgboolean; cdecl; external libgtk4;
function gtk_filter_get_strictness(self: PGtkFilter): TGtkFilterMatch; cdecl; external libgtk4;
procedure gtk_filter_changed(self: PGtkFilter; change: TGtkFilterChange); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:21:10 ===

function GTK_TYPE_FILTER: TGType;
function GTK_FILTER(obj: Pointer): PGtkFilter;
function GTK_IS_FILTER(obj: Pointer): Tgboolean;
function GTK_FILTER_CLASS(klass: Pointer): PGtkFilterClass;
function GTK_IS_FILTER_CLASS(klass: Pointer): Tgboolean;
function GTK_FILTER_GET_CLASS(obj: Pointer): PGtkFilterClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FILTER: TGType;
begin
  Result := gtk_filter_get_type;
end;

function GTK_FILTER(obj: Pointer): PGtkFilter;
begin
  Result := PGtkFilter(g_type_check_instance_cast(obj, GTK_TYPE_FILTER));
end;

function GTK_IS_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILTER);
end;

function GTK_FILTER_CLASS(klass: Pointer): PGtkFilterClass;
begin
  Result := PGtkFilterClass(g_type_check_class_cast(klass, GTK_TYPE_FILTER));
end;

function GTK_IS_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_FILTER);
end;

function GTK_FILTER_GET_CLASS(obj: Pointer): PGtkFilterClass;
begin
  Result := PGtkFilterClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
