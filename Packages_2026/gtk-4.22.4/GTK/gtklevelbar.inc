
  {$IFDEF read_enum}
const
  GTK_LEVEL_BAR_OFFSET_LOW = 'low';
  GTK_LEVEL_BAR_OFFSET_HIGH = 'high';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkLevelBar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_level_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_level_bar_new: PGtkWidget; cdecl; external libgtk4;
function gtk_level_bar_new_for_interval(min_value: double; max_value: double): PGtkWidget; cdecl; external libgtk4;
procedure gtk_level_bar_set_mode(self: PGtkLevelBar; mode: TGtkLevelBarMode); cdecl; external libgtk4;
function gtk_level_bar_get_mode(self: PGtkLevelBar): TGtkLevelBarMode; cdecl; external libgtk4;
procedure gtk_level_bar_set_value(self: PGtkLevelBar; value: double); cdecl; external libgtk4;
function gtk_level_bar_get_value(self: PGtkLevelBar): double; cdecl; external libgtk4;
procedure gtk_level_bar_set_min_value(self: PGtkLevelBar; value: double); cdecl; external libgtk4;
function gtk_level_bar_get_min_value(self: PGtkLevelBar): double; cdecl; external libgtk4;
procedure gtk_level_bar_set_max_value(self: PGtkLevelBar; value: double); cdecl; external libgtk4;
function gtk_level_bar_get_max_value(self: PGtkLevelBar): double; cdecl; external libgtk4;
procedure gtk_level_bar_set_inverted(self: PGtkLevelBar; inverted: Tgboolean); cdecl; external libgtk4;
function gtk_level_bar_get_inverted(self: PGtkLevelBar): Tgboolean; cdecl; external libgtk4;
procedure gtk_level_bar_add_offset_value(self: PGtkLevelBar; name: pchar; value: double); cdecl; external libgtk4;
procedure gtk_level_bar_remove_offset_value(self: PGtkLevelBar; name: pchar); cdecl; external libgtk4;
function gtk_level_bar_get_offset_value(self: PGtkLevelBar; name: pchar; value: Pdouble): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:29:16 ===

function GTK_TYPE_LEVEL_BAR: TGType;
function GTK_LEVEL_BAR(obj: Pointer): PGtkLevelBar;
function GTK_IS_LEVEL_BAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}


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
