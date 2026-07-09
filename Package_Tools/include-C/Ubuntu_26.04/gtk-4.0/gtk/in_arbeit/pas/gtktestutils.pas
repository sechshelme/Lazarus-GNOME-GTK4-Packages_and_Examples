unit gtktestutils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
procedure gtk_test_init(argcp: Plongint; argvp: PPPchar); cdecl; varargs; external libgtk4;
procedure gtk_test_register_all_types; cdecl; external libgtk4;
function gtk_test_list_all_types(n_types: Pguint): PGType; cdecl; external libgtk4;
procedure gtk_test_widget_wait_for_draw(widget: PGtkWidget); cdecl; external libgtk4;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 17:18:06 ===


implementation



end.
