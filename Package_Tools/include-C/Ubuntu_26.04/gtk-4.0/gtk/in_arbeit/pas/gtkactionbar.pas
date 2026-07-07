unit gtkactionbar;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkActionBar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_action_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_action_bar_new: PGtkWidget; cdecl; external libgtk4;
function gtk_action_bar_get_center_widget(action_bar: PGtkActionBar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_action_bar_set_center_widget(action_bar: PGtkActionBar; center_widget: PGtkWidget); cdecl; external libgtk4;
procedure gtk_action_bar_pack_start(action_bar: PGtkActionBar; child: PGtkWidget); cdecl; external libgtk4;
procedure gtk_action_bar_pack_end(action_bar: PGtkActionBar; child: PGtkWidget); cdecl; external libgtk4;
procedure gtk_action_bar_remove(action_bar: PGtkActionBar; child: PGtkWidget); cdecl; external libgtk4;
procedure gtk_action_bar_set_revealed(action_bar: PGtkActionBar; revealed: Tgboolean); cdecl; external libgtk4;
function gtk_action_bar_get_revealed(action_bar: PGtkActionBar): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 16:28:08 ===

function GTK_TYPE_ACTION_BAR: TGType;
function GTK_ACTION_BAR(obj: Pointer): PGtkActionBar;
function GTK_IS_ACTION_BAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_ACTION_BAR: TGType;
begin
  GTK_TYPE_ACTION_BAR := gtk_action_bar_get_type;
end;

function GTK_ACTION_BAR(obj: Pointer): PGtkActionBar;
begin
  Result := PGtkActionBar(g_type_check_instance_cast(obj, GTK_TYPE_ACTION_BAR));
end;

function GTK_IS_ACTION_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACTION_BAR);
end;



end.
