unit gtksourcemark;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {G_DECLARE_DERIVABLE_TYPE (GtkSourceMark, gtk_source_mark, GTK_SOURCE, MARK, GtkTextMark) }
type
  TGtkSourceMarkClass = record
    parent_class: TGtkTextMarkClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceMarkClass = ^TGtkSourceMarkClass;

  TGtkSourceMark = record
    parent_instance: TGtkTextMark;
  end;
  PGtkSourceMark = ^TGtkSourceMark;

function gtk_source_mark_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_mark_new(Name: Pgchar; category: Pgchar): PGtkSourceMark; cdecl; external libgtksourceview5;
function gtk_source_mark_get_category(mark: PGtkSourceMark): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_mark_next(mark: PGtkSourceMark; category: Pgchar): PGtkSourceMark; cdecl; external libgtksourceview5;
function gtk_source_mark_prev(mark: PGtkSourceMark; category: Pgchar): PGtkSourceMark; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 14:01:30 ===

function GTK_SOURCE_TYPE_MARK: TGType;
function GTK_SOURCE_MARK(obj: Pointer): PGtkSourceMark;
function GTK_SOURCE_IS_MARK(obj: Pointer): Tgboolean;
function GTK_SOURCE_MARK_CLASS(klass: Pointer): PGtkSourceMarkClass;
function GTK_SOURCE_IS_MARK_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_MARK_GET_CLASS(obj: Pointer): PGtkSourceMarkClass;

implementation

function GTK_SOURCE_TYPE_MARK: TGType;
begin
  Result := gtk_source_mark_get_type;
end;

function GTK_SOURCE_MARK(obj: Pointer): PGtkSourceMark;
begin
  Result := PGtkSourceMark(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_MARK));
end;

function GTK_SOURCE_IS_MARK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_MARK);
end;

function GTK_SOURCE_MARK_CLASS(klass: Pointer): PGtkSourceMarkClass;
begin
  Result := PGtkSourceMarkClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_MARK));
end;

function GTK_SOURCE_IS_MARK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_MARK);
end;

function GTK_SOURCE_MARK_GET_CLASS(obj: Pointer): PGtkSourceMarkClass;
begin
  Result := PGtkSourceMarkClass(PGTypeInstance(obj)^.g_class);
end;


end.
