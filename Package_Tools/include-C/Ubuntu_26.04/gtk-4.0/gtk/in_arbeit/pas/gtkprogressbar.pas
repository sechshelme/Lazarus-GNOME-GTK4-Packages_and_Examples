unit gtkprogressbar;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_pango, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkProgressBar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_progress_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_progress_bar_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_progress_bar_pulse(pbar: PGtkProgressBar); cdecl; external libgtk4;
procedure gtk_progress_bar_set_text(pbar: PGtkProgressBar; text: pchar); cdecl; external libgtk4;
procedure gtk_progress_bar_set_fraction(pbar: PGtkProgressBar; fraction: double); cdecl; external libgtk4;
procedure gtk_progress_bar_set_pulse_step(pbar: PGtkProgressBar; fraction: double); cdecl; external libgtk4;
procedure gtk_progress_bar_set_inverted(pbar: PGtkProgressBar; inverted: Tgboolean); cdecl; external libgtk4;
function gtk_progress_bar_get_text(pbar: PGtkProgressBar): pchar; cdecl; external libgtk4;
function gtk_progress_bar_get_fraction(pbar: PGtkProgressBar): double; cdecl; external libgtk4;
function gtk_progress_bar_get_pulse_step(pbar: PGtkProgressBar): double; cdecl; external libgtk4;
function gtk_progress_bar_get_inverted(pbar: PGtkProgressBar): Tgboolean; cdecl; external libgtk4;
procedure gtk_progress_bar_set_ellipsize(pbar: PGtkProgressBar; mode: TPangoEllipsizeMode); cdecl; external libgtk4;
function gtk_progress_bar_get_ellipsize(pbar: PGtkProgressBar): TPangoEllipsizeMode; cdecl; external libgtk4;
procedure gtk_progress_bar_set_show_text(pbar: PGtkProgressBar; show_text: Tgboolean); cdecl; external libgtk4;
function gtk_progress_bar_get_show_text(pbar: PGtkProgressBar): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:33:11 ===

function GTK_TYPE_PROGRESS_BAR: TGType;
function GTK_PROGRESS_BAR(obj: Pointer): PGtkProgressBar;
function GTK_IS_PROGRESS_BAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_PROGRESS_BAR: TGType;
begin
  GTK_TYPE_PROGRESS_BAR := gtk_progress_bar_get_type;
end;

function GTK_PROGRESS_BAR(obj: Pointer): PGtkProgressBar;
begin
  Result := PGtkProgressBar(g_type_check_instance_cast(obj, GTK_TYPE_PROGRESS_BAR));
end;

function GTK_IS_PROGRESS_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PROGRESS_BAR);
end;



end.
