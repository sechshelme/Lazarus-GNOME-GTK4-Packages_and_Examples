unit gtkrevealer;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkRevealer = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGtkRevealerTransitionType = ^TGtkRevealerTransitionType;
  TGtkRevealerTransitionType = longint;
const
  GTK_REVEALER_TRANSITION_TYPE_NONE = 0;
  GTK_REVEALER_TRANSITION_TYPE_CROSSFADE = 1;
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT = 2;
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT = 3;
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP = 4;
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN = 5;
  GTK_REVEALER_TRANSITION_TYPE_SWING_RIGHT = 6;
  GTK_REVEALER_TRANSITION_TYPE_SWING_LEFT = 7;
  GTK_REVEALER_TRANSITION_TYPE_SWING_UP = 8;
  GTK_REVEALER_TRANSITION_TYPE_SWING_DOWN = 9;
  GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_RIGHT = 10;
  GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_LEFT = 11;
  GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_UP = 12;
  GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_DOWN = 13;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_revealer_get_type: TGType; cdecl; external libgtk4;
function gtk_revealer_new: PGtkWidget; cdecl; external libgtk4;
function gtk_revealer_get_reveal_child(revealer: PGtkRevealer): Tgboolean; cdecl; external libgtk4;
procedure gtk_revealer_set_reveal_child(revealer: PGtkRevealer; reveal_child: Tgboolean); cdecl; external libgtk4;
function gtk_revealer_get_child_revealed(revealer: PGtkRevealer): Tgboolean; cdecl; external libgtk4;
function gtk_revealer_get_transition_duration(revealer: PGtkRevealer): Tguint; cdecl; external libgtk4;
procedure gtk_revealer_set_transition_duration(revealer: PGtkRevealer; duration: Tguint); cdecl; external libgtk4;
procedure gtk_revealer_set_transition_type(revealer: PGtkRevealer; transition: TGtkRevealerTransitionType); cdecl; external libgtk4;
function gtk_revealer_get_transition_type(revealer: PGtkRevealer): TGtkRevealerTransitionType; cdecl; external libgtk4;
procedure gtk_revealer_set_child(revealer: PGtkRevealer; child: PGtkWidget); cdecl; external libgtk4;
function gtk_revealer_get_child(revealer: PGtkRevealer): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:28:51 ===

function GTK_TYPE_REVEALER: TGType;
function GTK_REVEALER(obj: Pointer): PGtkRevealer;
function GTK_IS_REVEALER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_REVEALER: TGType;
begin
  GTK_TYPE_REVEALER := gtk_revealer_get_type;
end;

function GTK_REVEALER(obj: Pointer): PGtkRevealer;
begin
  Result := PGtkRevealer(g_type_check_instance_cast(obj, GTK_TYPE_REVEALER));
end;

function GTK_IS_REVEALER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_REVEALER);
end;



end.
