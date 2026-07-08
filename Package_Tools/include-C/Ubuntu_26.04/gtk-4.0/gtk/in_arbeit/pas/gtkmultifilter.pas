unit gtkmultifilter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkfilter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkMultiFilter = type Pointer;
  PGtkMultiFilterClass = type Pointer;

  PGtkAnyFilter = type Pointer;
  PGtkAnyFilterClass = type Pointer;

  PGtkEveryFilter = type Pointer;
  PGtkEveryFilterClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_multi_filter_get_type: TGType; cdecl; external libgtk4;
procedure gtk_multi_filter_append(self: PGtkMultiFilter; filter: PGtkFilter); cdecl; external libgtk4;
procedure gtk_multi_filter_remove(self: PGtkMultiFilter; position: Tguint); cdecl; external libgtk4;

function gtk_any_filter_get_type: TGType; cdecl; external libgtk4;
function gtk_any_filter_new: PGtkAnyFilter; cdecl; external libgtk4;

function gtk_every_filter_get_type: TGType; cdecl; external libgtk4;
function gtk_every_filter_new: PGtkEveryFilter; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:07:30 ===

function GTK_TYPE_MULTI_FILTER: TGType;
function GTK_MULTI_FILTER(obj: Pointer): PGtkMultiFilter;
function GTK_IS_MULTI_FILTER(obj: Pointer): Tgboolean;
function GTK_MULTI_FILTER_CLASS(klass: Pointer): PGtkMultiFilterClass;
function GTK_IS_MULTI_FILTER_CLASS(klass: Pointer): Tgboolean;
function GTK_MULTI_FILTER_GET_CLASS(obj: Pointer): PGtkMultiFilterClass;

function GTK_TYPE_ANY_FILTER: TGType;
function GTK_ANY_FILTER(obj: Pointer): PGtkAnyFilter;
function GTK_IS_ANY_FILTER(obj: Pointer): Tgboolean;
function GTK_ANY_FILTER_CLASS(klass: Pointer): PGtkAnyFilterClass;
function GTK_IS_ANY_FILTER_CLASS(klass: Pointer): Tgboolean;
function GTK_ANY_FILTER_GET_CLASS(obj: Pointer): PGtkAnyFilterClass;

function GTK_TYPE_EVERY_FILTER: TGType;
function GTK_EVERY_FILTER(obj: Pointer): PGtkEveryFilter;
function GTK_IS_EVERY_FILTER(obj: Pointer): Tgboolean;
function GTK_EVERY_FILTER_CLASS(klass: Pointer): PGtkEveryFilterClass;
function GTK_IS_EVERY_FILTER_CLASS(klass: Pointer): Tgboolean;
function GTK_EVERY_FILTER_GET_CLASS(obj: Pointer): PGtkEveryFilterClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_MULTI_FILTER: TGType;
begin
  Result := gtk_multi_filter_get_type;
end;

function GTK_MULTI_FILTER(obj: Pointer): PGtkMultiFilter;
begin
  Result := PGtkMultiFilter(g_type_check_instance_cast(obj, GTK_TYPE_MULTI_FILTER));
end;

function GTK_IS_MULTI_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MULTI_FILTER);
end;

function GTK_MULTI_FILTER_CLASS(klass: Pointer): PGtkMultiFilterClass;
begin
  Result := PGtkMultiFilterClass(g_type_check_class_cast(klass, GTK_TYPE_MULTI_FILTER));
end;

function GTK_IS_MULTI_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MULTI_FILTER);
end;

function GTK_MULTI_FILTER_GET_CLASS(obj: Pointer): PGtkMultiFilterClass;
begin
  Result := PGtkMultiFilterClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_ANY_FILTER: TGType;
begin
  Result := gtk_any_filter_get_type;
end;

function GTK_ANY_FILTER(obj: Pointer): PGtkAnyFilter;
begin
  Result := PGtkAnyFilter(g_type_check_instance_cast(obj, GTK_TYPE_ANY_FILTER));
end;

function GTK_IS_ANY_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ANY_FILTER);
end;

function GTK_ANY_FILTER_CLASS(klass: Pointer): PGtkAnyFilterClass;
begin
  Result := PGtkAnyFilterClass(g_type_check_class_cast(klass, GTK_TYPE_ANY_FILTER));
end;

function GTK_IS_ANY_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_ANY_FILTER);
end;

function GTK_ANY_FILTER_GET_CLASS(obj: Pointer): PGtkAnyFilterClass;
begin
  Result := PGtkAnyFilterClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_EVERY_FILTER: TGType;
begin
  Result := gtk_every_filter_get_type;
end;

function GTK_EVERY_FILTER(obj: Pointer): PGtkEveryFilter;
begin
  Result := PGtkEveryFilter(g_type_check_instance_cast(obj, GTK_TYPE_EVERY_FILTER));
end;

function GTK_IS_EVERY_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EVERY_FILTER);
end;

function GTK_EVERY_FILTER_CLASS(klass: Pointer): PGtkEveryFilterClass;
begin
  Result := PGtkEveryFilterClass(g_type_check_class_cast(klass, GTK_TYPE_EVERY_FILTER));
end;

function GTK_IS_EVERY_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EVERY_FILTER);
end;

function GTK_EVERY_FILTER_GET_CLASS(obj: Pointer): PGtkEveryFilterClass;
begin
  Result := PGtkEveryFilterClass(PGTypeInstance(obj)^.g_class);
end;

end.
