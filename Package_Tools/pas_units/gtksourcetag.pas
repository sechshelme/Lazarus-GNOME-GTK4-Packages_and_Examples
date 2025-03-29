unit gtksourcetag;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {G_DECLARE_DERIVABLE_TYPE (GtkSourceTag, gtk_source_tag, GTK_SOURCE, TAG, GtkTextTag) }
type
  TGtkSourceTag = record
    parent_instance: TGtkTextTag;
  end;
  PGtkSourceTag = ^TGtkSourceTag;

  TGtkSourceTagClass = record
    parent_class: TGtkTextTagClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceTagClass = ^TGtkSourceTagClass;

function gtk_source_tag_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_tag_new(Name: Pgchar): PGtkTextTag; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:37:50 ===

function GTK_SOURCE_TYPE_TAG: TGType;
function GTK_SOURCE_TAG(obj: Pointer): PGtkSourceTag;
function GTK_SOURCE_IS_TAG(obj: Pointer): Tgboolean;
function GTK_SOURCE_TAG_CLASS(klass: Pointer): PGtkSourceTagClass;
function GTK_SOURCE_IS_TAG_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_TAG_GET_CLASS(obj: Pointer): PGtkSourceTagClass;

implementation

function GTK_SOURCE_TYPE_TAG: TGType;
begin
  Result := gtk_source_tag_get_type;
end;

function GTK_SOURCE_TAG(obj: Pointer): PGtkSourceTag;
begin
  Result := PGtkSourceTag(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_TAG));
end;

function GTK_SOURCE_IS_TAG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_TAG);
end;

function GTK_SOURCE_TAG_CLASS(klass: Pointer): PGtkSourceTagClass;
begin
  Result := PGtkSourceTagClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_TAG));
end;

function GTK_SOURCE_IS_TAG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_TAG);
end;

function GTK_SOURCE_TAG_GET_CLASS(obj: Pointer): PGtkSourceTagClass;
begin
  Result := PGtkSourceTagClass(PGTypeInstance(obj)^.g_class);
end;


end.
