
{$IFDEF read_interface}


type
  TGtkScrollable = record // _GtkScrollable
  end;
  PGtkScrollable = ^TGtkScrollable;

  PGtkScrollableInterface = ^TGtkScrollableInterface;

  TGtkScrollableInterface = record
    base_iface: TGTypeInterface;
    get_border: function(scrollable: PGtkScrollable; border: PGtkBorder): Tgboolean; cdecl;
  end;

function gtk_scrollable_get_type: TGType; cdecl; external libgtk4;
function gtk_scrollable_get_hadjustment(scrollable: PGtkScrollable): PGtkAdjustment; cdecl; external libgtk4;
procedure gtk_scrollable_set_hadjustment(scrollable: PGtkScrollable; hadjustment: PGtkAdjustment); cdecl; external libgtk4;
function gtk_scrollable_get_vadjustment(scrollable: PGtkScrollable): PGtkAdjustment; cdecl; external libgtk4;
procedure gtk_scrollable_set_vadjustment(scrollable: PGtkScrollable; vadjustment: PGtkAdjustment); cdecl; external libgtk4;
function gtk_scrollable_get_hscroll_policy(scrollable: PGtkScrollable): TGtkScrollablePolicy; cdecl; external libgtk4;
procedure gtk_scrollable_set_hscroll_policy(scrollable: PGtkScrollable; policy: TGtkScrollablePolicy); cdecl; external libgtk4;
function gtk_scrollable_get_vscroll_policy(scrollable: PGtkScrollable): TGtkScrollablePolicy; cdecl; external libgtk4;
procedure gtk_scrollable_set_vscroll_policy(scrollable: PGtkScrollable; policy: TGtkScrollablePolicy); cdecl; external libgtk4;
function gtk_scrollable_get_border(scrollable: PGtkScrollable; border: PGtkBorder): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:27:13 ===

function GTK_TYPE_SCROLLABLE: TGType;
function GTK_SCROLLABLE(obj: Pointer): PGtkScrollable;
function GTK_IS_SCROLLABLE(obj: Pointer): Tgboolean;
function GTK_SCROLLABLE_GET_IFACE(inst: Pointer): PGtkScrollableInterface;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SCROLLABLE: TGType;
begin
  GTK_TYPE_SCROLLABLE := gtk_scrollable_get_type;
end;

function GTK_SCROLLABLE(obj: Pointer): PGtkScrollable;
begin
  Result := PGtkScrollable(g_type_check_instance_cast(obj, GTK_TYPE_SCROLLABLE));
end;

function GTK_IS_SCROLLABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SCROLLABLE);
end;

function GTK_SCROLLABLE_GET_IFACE(inst: Pointer): PGtkScrollableInterface;
begin
  Result := g_type_interface_peek(inst, GTK_TYPE_SCROLLABLE);
end;


{$ENDIF read_implementation}
