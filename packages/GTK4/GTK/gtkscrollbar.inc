
{$IFDEF read_interface}

type
  TGtkScrollbar = record  // _GtkScrollbar
  end;
  PGtkScrollbar = ^TGtkScrollbar;


function gtk_scrollbar_get_type: TGType; cdecl; external libgtk4;
function gtk_scrollbar_new(orientation: TGtkOrientation; adjustment: PGtkAdjustment): PGtkWidget; cdecl; external libgtk4;
procedure gtk_scrollbar_set_adjustment(self: PGtkScrollbar; adjustment: PGtkAdjustment); cdecl; external libgtk4;
function gtk_scrollbar_get_adjustment(self: PGtkScrollbar): PGtkAdjustment; cdecl; external libgtk4;

// === Konventiert am: 12-7-24 19:54:45 ===

function GTK_TYPE_SCROLLBAR: TGType;
function GTK_SCROLLBAR(obj: Pointer): PGtkScrollbar;
function GTK_IS_SCROLLBAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
