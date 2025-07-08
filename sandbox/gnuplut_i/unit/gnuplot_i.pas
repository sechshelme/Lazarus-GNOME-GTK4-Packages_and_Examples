unit gnuplot_i;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF unix}
  libgnuplot_i = 'libgnuplot_i';
  {$ENDIF}

  {$IFDEF mswindows}
  libgnuplot_i = 'gnuplot_i.dll';
  {$ENDIF}


type
  PFILE = Pointer;

  // =====================

const
  GP_MAX_TMP_FILES = 64;
  GP_TMP_NAME_SIZE = 512;

type
  Tgnuplot_ctrl = record
    gnucmd: PFILE;
    nplots: longint;
    pstyle: array[0..31] of char;
    term: array[0..31] of char;
    to_delete: array[0..(GP_MAX_TMP_FILES) - 1] of array[0..(GP_TMP_NAME_SIZE) - 1] of char;
    ntmp: longint;
  end;
  Pgnuplot_ctrl = ^Tgnuplot_ctrl;

  Tgnuplot_point = record
    x: double;
    y: double;
    z: double;
  end;
  Pgnuplot_point = ^Tgnuplot_point;

function gnuplot_get_program_path(pname: pchar): pchar; cdecl; external libgnuplot_i;
procedure print_gnuplot_handle(handle: Pgnuplot_ctrl); cdecl; external libgnuplot_i;
function gnuplot_init: Pgnuplot_ctrl; cdecl; external libgnuplot_i;
procedure gnuplot_close(handle: Pgnuplot_ctrl); cdecl; external libgnuplot_i;
procedure gnuplot_cmd(handle: Pgnuplot_ctrl; cmd: pchar); cdecl; varargs; external libgnuplot_i;
procedure gnuplot_setstyle(handle: Pgnuplot_ctrl; plot_style: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_setterm(handle: Pgnuplot_ctrl; terminal: pchar; width: longint; height: longint); cdecl; external libgnuplot_i;
procedure gnuplot_set_axislabel(handle: Pgnuplot_ctrl; axis: pchar; _label: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_resetplot(handle: Pgnuplot_ctrl); cdecl; external libgnuplot_i;
procedure gnuplot_plot_coordinates(handle: Pgnuplot_ctrl; x: Pdouble; y: Pdouble; n: longint; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_splot(handle: Pgnuplot_ctrl; x: Pdouble; y: Pdouble; z: Pdouble; n: longint; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_splot_grid(handle: Pgnuplot_ctrl; points: Pdouble; rows: longint; cols: longint; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_contour_plot(handle: Pgnuplot_ctrl; x: Pdouble; y: Pdouble; z: Pdouble; nx: longint; ny: longint; title: pchar); cdecl; external libgnuplot_i;

type
  TgetPointProc = procedure(para1: pointer; para2: Pgnuplot_point; para3: longint; para4: longint); cdecl;

procedure gnuplot_splot_obj(handle: Pgnuplot_ctrl; obj: pointer; getPoint: TgetPointProc; n: longint; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_plot_obj_xy(handle: Pgnuplot_ctrl; obj: pointer; getPoint: TgetPointProc; n: longint; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_plot_once(style: pchar; label_x: pchar; label_y: pchar; x: Pdouble; y: Pdouble; n: longint; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_plot_equation(handle: Pgnuplot_ctrl; equation: pchar; title: pchar); cdecl; external libgnuplot_i;
procedure gnuplot_hardcopy(handle: Pgnuplot_ctrl; filename: pchar; color: pchar); cdecl; external libgnuplot_i;

// === Konventiert am: 5-7-25 13:38:14 ===


implementation



end.
