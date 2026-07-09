unit gtktextchild;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkTextChildAnchor = ^TGtkTextChildAnchor;
  TGtkTextChildAnchor = record
    parent_instance: TGObject;
    segment: Tgpointer;
  end;

  PGtkTextChildAnchorClass = ^TGtkTextChildAnchorClass;
  TGtkTextChildAnchorClass = record
    parent_class: TGObjectClass;
    _gtk_reserved1: procedure; cdecl;
    _gtk_reserved2: procedure; cdecl;
    _gtk_reserved3: procedure; cdecl;
    _gtk_reserved4: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_text_child_anchor_get_type: TGType; cdecl; external libgtk4;
function gtk_text_child_anchor_new: PGtkTextChildAnchor; cdecl; external libgtk4;
function gtk_text_child_anchor_new_with_replacement(character: pchar): PGtkTextChildAnchor; cdecl; external libgtk4;
function gtk_text_child_anchor_get_widgets(anchor: PGtkTextChildAnchor; out_len: Pguint): PPGtkWidget; cdecl; external libgtk4;
function gtk_text_child_anchor_get_deleted(anchor: PGtkTextChildAnchor): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:36:24 ===

function GTK_TYPE_TEXT_CHILD_ANCHOR: TGType;
function GTK_TEXT_CHILD_ANCHOR(obj: Pointer): PGtkTextChildAnchor;
function GTK_TEXT_CHILD_ANCHOR_CLASS(klass: Pointer): PGtkTextChildAnchorClass;
function GTK_IS_TEXT_CHILD_ANCHOR(obj: Pointer): Tgboolean;
function GTK_IS_TEXT_CHILD_ANCHOR_CLASS(klass: Pointer): Tgboolean;
function GTK_TEXT_CHILD_ANCHOR_GET_CLASS(obj: Pointer): PGtkTextChildAnchorClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_TEXT_CHILD_ANCHOR: TGType;
begin
  GTK_TYPE_TEXT_CHILD_ANCHOR := gtk_text_child_anchor_get_type;
end;

function GTK_TEXT_CHILD_ANCHOR(obj: Pointer): PGtkTextChildAnchor;
begin
  Result := PGtkTextChildAnchor(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_CHILD_ANCHOR));
end;

function GTK_TEXT_CHILD_ANCHOR_CLASS(klass: Pointer): PGtkTextChildAnchorClass;
begin
  Result := PGtkTextChildAnchorClass(g_type_check_class_cast(klass, GTK_TYPE_TEXT_CHILD_ANCHOR));
end;

function GTK_IS_TEXT_CHILD_ANCHOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TEXT_CHILD_ANCHOR);
end;

function GTK_IS_TEXT_CHILD_ANCHOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_TEXT_CHILD_ANCHOR);
end;

function GTK_TEXT_CHILD_ANCHOR_GET_CLASS(obj: Pointer): PGtkTextChildAnchorClass;
begin
  Result := PGtkTextChildAnchorClass(PGTypeInstance(obj)^.g_class);
end;



end.
