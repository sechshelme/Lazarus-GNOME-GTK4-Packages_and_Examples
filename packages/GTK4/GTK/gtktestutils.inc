
{$IFDEF read_interface}

procedure gtk_test_init(argcp: Plongint; argvp: PPPchar); varargs cdecl; external libgtk4;
procedure gtk_test_register_all_types; cdecl; external libgtk4;
function gtk_test_list_all_types(n_types: Pguint): PGType; cdecl; external libgtk4;
procedure gtk_test_widget_wait_for_draw(widget: PGtkWidget); cdecl; external libgtk4;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
