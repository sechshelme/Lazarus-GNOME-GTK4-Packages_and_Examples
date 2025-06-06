
{$IFDEF read_interface}


const
  GTK_LEVEL_BAR_OFFSET_LOW = 'low';
  GTK_LEVEL_BAR_OFFSET_HIGH = 'high';
  GTK_LEVEL_BAR_OFFSET_FULL = 'full';

type
  TGtkLevelBar = record // _GtkLevelBar
  end;
  PGtkLevelBar = ^TGtkLevelBar;

function gtk_level_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_level_bar_new: PGtkWidget; cdecl; external libgtk4;
function gtk_level_bar_new_for_interval(min_value: Tdouble; max_value: Tdouble): PGtkWidget; cdecl; external libgtk4;
procedure gtk_level_bar_set_mode(self: PGtkLevelBar; mode: TGtkLevelBarMode); cdecl; external libgtk4;
function gtk_level_bar_get_mode(self: PGtkLevelBar): TGtkLevelBarMode; cdecl; external libgtk4;
procedure gtk_level_bar_set_value(self: PGtkLevelBar; Value: Tdouble); cdecl; external libgtk4;
function gtk_level_bar_get_value(self: PGtkLevelBar): Tdouble; cdecl; external libgtk4;
procedure gtk_level_bar_set_min_value(self: PGtkLevelBar; Value: Tdouble); cdecl; external libgtk4;
function gtk_level_bar_get_min_value(self: PGtkLevelBar): Tdouble; cdecl; external libgtk4;
procedure gtk_level_bar_set_max_value(self: PGtkLevelBar; Value: Tdouble); cdecl; external libgtk4;
function gtk_level_bar_get_max_value(self: PGtkLevelBar): Tdouble; cdecl; external libgtk4;
procedure gtk_level_bar_set_inverted(self: PGtkLevelBar; inverted: Tgboolean); cdecl; external libgtk4;
function gtk_level_bar_get_inverted(self: PGtkLevelBar): Tgboolean; cdecl; external libgtk4;
procedure gtk_level_bar_add_offset_value(self: PGtkLevelBar; Name: PChar; Value: Tdouble); cdecl; external libgtk4;
procedure gtk_level_bar_remove_offset_value(self: PGtkLevelBar; Name: PChar); cdecl; external libgtk4;
function gtk_level_bar_get_offset_value(self: PGtkLevelBar; Name: PChar; Value: Pdouble): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 19:48:34 ===

function GTK_TYPE_LEVEL_BAR: TGType;
function GTK_LEVEL_BAR(obj: Pointer): PGtkLevelBar;
function GTK_IS_LEVEL_BAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_LEVEL_BAR: TGType;
begin
  GTK_TYPE_LEVEL_BAR := gtk_level_bar_get_type;
end;

function GTK_LEVEL_BAR(obj: Pointer): PGtkLevelBar;
begin
  Result := PGtkLevelBar(g_type_check_instance_cast(obj, GTK_TYPE_LEVEL_BAR));
end;

function GTK_IS_LEVEL_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LEVEL_BAR);
end;



{$ENDIF read_implementation}
