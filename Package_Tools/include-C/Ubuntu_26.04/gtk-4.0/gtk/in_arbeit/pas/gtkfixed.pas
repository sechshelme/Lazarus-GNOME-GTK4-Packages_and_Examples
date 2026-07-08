unit gtkfixed;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkFixed = ^TGtkFixed;
  TGtkFixed = record
    parent_instance: TGtkWidget;
  end;

  PGtkFixedClass = ^TGtkFixedClass;
  TGtkFixedClass = record
    parent_class: TGtkWidgetClass;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_fixed_get_type: TGType; cdecl; external libgtk4;
function gtk_fixed_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_fixed_put(fixed: PGtkFixed; widget: PGtkWidget; x: double; y: double); cdecl; external libgtk4;
procedure gtk_fixed_remove(fixed: PGtkFixed; widget: PGtkWidget); cdecl; external libgtk4;
procedure gtk_fixed_move(fixed: PGtkFixed; widget: PGtkWidget; x: double; y: double); cdecl; external libgtk4;
procedure gtk_fixed_get_child_position(fixed: PGtkFixed; widget: PGtkWidget; x: Pdouble; y: Pdouble); cdecl; external libgtk4;
procedure gtk_fixed_set_child_transform(fixed: PGtkFixed; widget: PGtkWidget; transform: PGskTransform); cdecl; external libgtk4;
function gtk_fixed_get_child_transform(fixed: PGtkFixed; widget: PGtkWidget): PGskTransform; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:33:23 ===

function GTK_TYPE_FIXED: TGType;
function GTK_FIXED(obj: Pointer): PGtkFixed;
function GTK_FIXED_CLASS(klass: Pointer): PGtkFixedClass;
function GTK_IS_FIXED(obj: Pointer): Tgboolean;
function GTK_IS_FIXED_CLASS(klass: Pointer): Tgboolean;
function GTK_FIXED_GET_CLASS(obj: Pointer): PGtkFixedClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_FIXED: TGType;
begin
  GTK_TYPE_FIXED := gtk_fixed_get_type;
end;

function GTK_FIXED(obj: Pointer): PGtkFixed;
begin
  Result := PGtkFixed(g_type_check_instance_cast(obj, GTK_TYPE_FIXED));
end;

function GTK_FIXED_CLASS(klass: Pointer): PGtkFixedClass;
begin
  Result := PGtkFixedClass(g_type_check_class_cast(klass, GTK_TYPE_FIXED));
end;

function GTK_IS_FIXED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FIXED);
end;

function GTK_IS_FIXED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_FIXED);
end;

function GTK_FIXED_GET_CLASS(obj: Pointer): PGtkFixedClass;
begin
  Result := PGtkFixedClass(PGTypeInstance(obj)^.g_class);
end;



end.
