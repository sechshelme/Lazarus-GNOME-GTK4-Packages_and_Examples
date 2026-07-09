

  {$IFDEF read_struct}
type
  PGtkTextTagPrivate = type Pointer;

  PGtkTextTag = ^TGtkTextTag;
  TGtkTextTag = record
    parent_instance: TGObject;
    priv: PGtkTextTagPrivate;
  end;

  PGtkTextTagClass = ^TGtkTextTagClass;
  TGtkTextTagClass = record
    parent_class: TGObjectClass;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_text_tag_get_type: TGType; cdecl; external libgtk4;
function gtk_text_tag_new(name: pchar): PGtkTextTag; cdecl; external libgtk4;
function gtk_text_tag_get_priority(tag: PGtkTextTag): longint; cdecl; external libgtk4;
procedure gtk_text_tag_set_priority(tag: PGtkTextTag; priority: longint); cdecl; external libgtk4;
procedure gtk_text_tag_changed(tag: PGtkTextTag; size_changed: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:24:33 ===

function GTK_TYPE_TEXT_TAG: TGType;
function GTK_TEXT_TAG(obj: Pointer): PGtkTextTag;
function GTK_TEXT_TAG_CLASS(klass: Pointer): PGtkTextTagClass;
function GTK_IS_TEXT_TAG(obj: Pointer): Tgboolean;
function GTK_IS_TEXT_TAG_CLASS(klass: Pointer): Tgboolean;
function GTK_TEXT_TAG_GET_CLASS(obj: Pointer): PGtkTextTagClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TEXT_TAG: TGType;
begin
  GTK_TYPE_TEXT_TAG := gtk_text_tag_get_type;
end;

function GTK_TEXT_TAG(obj: Pointer): PGtkTextTag;
begin
  Result := PGtkTextTag(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_TAG));
end;

function GTK_TEXT_TAG_CLASS(klass: Pointer): PGtkTextTagClass;
begin
  Result := PGtkTextTagClass(g_type_check_class_cast(klass, GTK_TYPE_TEXT_TAG));
end;

function GTK_IS_TEXT_TAG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TEXT_TAG);
end;

function GTK_IS_TEXT_TAG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_TEXT_TAG);
end;

function GTK_TEXT_TAG_GET_CLASS(obj: Pointer): PGtkTextTagClass;
begin
  Result := PGtkTextTagClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
