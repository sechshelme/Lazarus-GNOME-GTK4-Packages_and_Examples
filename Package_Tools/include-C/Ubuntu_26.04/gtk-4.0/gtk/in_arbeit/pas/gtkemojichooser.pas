unit gtkemojichooser;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkEmojiChooser = type Pointer;
  PGtkEmojiChooserClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_emoji_chooser_get_type: TGType; cdecl; external libgtk4;
function gtk_emoji_chooser_new: PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:10:49 ===

function GTK_TYPE_EMOJI_CHOOSER: TGType;
function GTK_EMOJI_CHOOSER(obj: Pointer): PGtkEmojiChooser;
function GTK_EMOJI_CHOOSER_CLASS(klass: Pointer): PGtkEmojiChooserClass;
function GTK_IS_EMOJI_CHOOSER(obj: Pointer): Tgboolean;
function GTK_IS_EMOJI_CHOOSER_CLASS(klass: Pointer): Tgboolean;
function GTK_EMOJI_CHOOSER_GET_CLASS(obj: Pointer): PGtkEmojiChooserClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_EMOJI_CHOOSER: TGType;
begin
  GTK_TYPE_EMOJI_CHOOSER := gtk_emoji_chooser_get_type;
end;

function GTK_EMOJI_CHOOSER(obj: Pointer): PGtkEmojiChooser;
begin
  Result := PGtkEmojiChooser(g_type_check_instance_cast(obj, GTK_TYPE_EMOJI_CHOOSER));
end;

function GTK_EMOJI_CHOOSER_CLASS(klass: Pointer): PGtkEmojiChooserClass;
begin
  Result := PGtkEmojiChooserClass(g_type_check_class_cast(klass, GTK_TYPE_EMOJI_CHOOSER));
end;

function GTK_IS_EMOJI_CHOOSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EMOJI_CHOOSER);
end;

function GTK_IS_EMOJI_CHOOSER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EMOJI_CHOOSER);
end;

function GTK_EMOJI_CHOOSER_GET_CLASS(obj: Pointer): PGtkEmojiChooserClass;
begin
  Result := PGtkEmojiChooserClass(PGTypeInstance(obj)^.g_class);
end;



end.
