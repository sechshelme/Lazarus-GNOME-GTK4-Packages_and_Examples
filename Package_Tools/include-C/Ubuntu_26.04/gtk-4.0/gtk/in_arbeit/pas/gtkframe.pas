unit gtkframe;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkFrame = ^TGtkFrame;
  TGtkFrame = record
    parent_instance: TGtkWidget;
  end;

  PGtkFrameClass = ^TGtkFrameClass;
  TGtkFrameClass = record
    parent_class: TGtkWidgetClass;
    compute_child_allocation: procedure(frame: PGtkFrame; allocation: PGtkAllocation); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_frame_get_type: TGType; cdecl; external libgtk4;
function gtk_frame_new(_label: pchar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_frame_set_label(frame: PGtkFrame; _label: pchar); cdecl; external libgtk4;
function gtk_frame_get_label(frame: PGtkFrame): pchar; cdecl; external libgtk4;
procedure gtk_frame_set_label_widget(frame: PGtkFrame; label_widget: PGtkWidget); cdecl; external libgtk4;
function gtk_frame_get_label_widget(frame: PGtkFrame): PGtkWidget; cdecl; external libgtk4;
procedure gtk_frame_set_label_align(frame: PGtkFrame; xalign: single); cdecl; external libgtk4;
function gtk_frame_get_label_align(frame: PGtkFrame): single; cdecl; external libgtk4;
procedure gtk_frame_set_child(frame: PGtkFrame; child: PGtkWidget); cdecl; external libgtk4;
function gtk_frame_get_child(frame: PGtkFrame): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:33:19 ===

function GTK_TYPE_FRAME: TGType;
function GTK_FRAME(obj: Pointer): PGtkFrame;
function GTK_FRAME_CLASS(klass: Pointer): PGtkFrameClass;
function GTK_IS_FRAME(obj: Pointer): Tgboolean;
function GTK_IS_FRAME_CLASS(klass: Pointer): Tgboolean;
function GTK_FRAME_GET_CLASS(obj: Pointer): PGtkFrameClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_FRAME: TGType;
begin
  GTK_TYPE_FRAME := gtk_frame_get_type;
end;

function GTK_FRAME(obj: Pointer): PGtkFrame;
begin
  Result := PGtkFrame(g_type_check_instance_cast(obj, GTK_TYPE_FRAME));
end;

function GTK_FRAME_CLASS(klass: Pointer): PGtkFrameClass;
begin
  Result := PGtkFrameClass(g_type_check_class_cast(klass, GTK_TYPE_FRAME));
end;

function GTK_IS_FRAME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FRAME);
end;

function GTK_IS_FRAME_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_FRAME);
end;

function GTK_FRAME_GET_CLASS(obj: Pointer): PGtkFrameClass;
begin
  Result := PGtkFrameClass(PGTypeInstance(obj)^.g_class);
end;



end.
