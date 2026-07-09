unit gtktestatcontext;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes, gtkenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gtk_test_accessible_has_role(accessible: PGtkAccessible; role: TGtkAccessibleRole): Tgboolean; cdecl; external libgtk4;
function gtk_test_accessible_has_property(accessible: PGtkAccessible; _property: TGtkAccessibleProperty): Tgboolean; cdecl; external libgtk4;
function gtk_test_accessible_has_relation(accessible: PGtkAccessible; relation: TGtkAccessibleRelation): Tgboolean; cdecl; external libgtk4;
function gtk_test_accessible_has_state(accessible: PGtkAccessible; state: TGtkAccessibleState): Tgboolean; cdecl; external libgtk4;
function gtk_test_accessible_check_property(accessible: PGtkAccessible; _property: TGtkAccessibleProperty): pchar; cdecl; varargs; external libgtk4;
function gtk_test_accessible_check_relation(accessible: PGtkAccessible; relation: TGtkAccessibleRelation): pchar; cdecl; varargs; external libgtk4;
function gtk_test_accessible_check_state(accessible: PGtkAccessible; state: TGtkAccessibleState): pchar; cdecl; varargs; external libgtk4;
procedure gtk_test_accessible_assertion_message_role(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar;
  accessible: PGtkAccessible; expected_role: TGtkAccessibleRole; actual_role: TGtkAccessibleRole); cdecl; external libgtk4;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 16:13:50 ===


implementation



end.
