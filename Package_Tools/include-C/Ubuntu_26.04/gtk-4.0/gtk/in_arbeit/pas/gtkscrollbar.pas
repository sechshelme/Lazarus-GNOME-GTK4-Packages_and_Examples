unit gtkscrollbar;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkwidget, gtkadjustment;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkScrollbar = type Pointer;
  PGtkScrollbarClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_scrollbar_get_type: TGType; cdecl; external libgtk4;
function gtk_scrollbar_new(orientation: TGtkOrientation; adjustment: PGtkAdjustment): PGtkWidget; cdecl; external libgtk4;
procedure gtk_scrollbar_set_adjustment(self: PGtkScrollbar; adjustment: PGtkAdjustment); cdecl; external libgtk4;
function gtk_scrollbar_get_adjustment(self: PGtkScrollbar): PGtkAdjustment; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:06:55 ===

function GTK_TYPE_SCROLLBAR: TGType;
function GTK_SCROLLBAR(obj: Pointer): PGtkScrollbar;
function GTK_IS_SCROLLBAR(obj: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

function GTK_TYPE_SCROLLBAR: TGType;
begin
  GTK_TYPE_SCROLLBAR := gtk_scrollbar_get_type;
end;

function GTK_SCROLLBAR(obj: Pointer): PGtkScrollbar;
begin
  Result := PGtkScrollbar(g_type_check_instance_cast(obj, GTK_TYPE_SCROLLBAR));
end;

function GTK_IS_SCROLLBAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SCROLLBAR);
end;



end.
