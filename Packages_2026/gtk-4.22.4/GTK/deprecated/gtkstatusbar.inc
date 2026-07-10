

  {$IFDEF read_struct}
type
  PGtkStatusbar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_statusbar_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_statusbar_new: PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_statusbar_get_context_id(statusbar: PGtkStatusbar; context_description: pchar): Tguint; cdecl; external libgtk4; deprecated;
function gtk_statusbar_push(statusbar: PGtkStatusbar; context_id: Tguint; text: pchar): Tguint; cdecl; external libgtk4; deprecated;
procedure gtk_statusbar_pop(statusbar: PGtkStatusbar; context_id: Tguint); cdecl; external libgtk4; deprecated;
procedure gtk_statusbar_remove(statusbar: PGtkStatusbar; context_id: Tguint; message_id: Tguint); cdecl; external libgtk4; deprecated;
procedure gtk_statusbar_remove_all(statusbar: PGtkStatusbar; context_id: Tguint); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:49:25 ===

function GTK_TYPE_STATUSBAR: TGType;
function GTK_STATUSBAR(obj: Pointer): PGtkStatusbar;
function GTK_IS_STATUSBAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_STATUSBAR: TGType;
begin
  GTK_TYPE_STATUSBAR := gtk_statusbar_get_type;
end;

function GTK_STATUSBAR(obj: Pointer): PGtkStatusbar;
begin
  Result := PGtkStatusbar(g_type_check_instance_cast(obj, GTK_TYPE_STATUSBAR));
end;

function GTK_IS_STATUSBAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STATUSBAR);
end;



{$ENDIF read_implementation}
