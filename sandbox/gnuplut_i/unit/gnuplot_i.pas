unit gnuplot_i;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF unix}
  libssl = 'gnuplot_i';
  {$ENDIF}

  {$IFDEF mswindows}
  libssl = 'gnuplot_i.dll';
  {$ENDIF}

  {$IFDEF darwin}
  libssl = 'gnuplot_i.dll';
  {$ENDIF}


type
  PFILE = Pointer;

  // =====================




  //{$include <stdio.h>}
  //{$include <stdlib.h>}
  //{$include <string.h>}
  //{$include <unistd.h>}
  //{$include <stdarg.h>}
  //{$include <fcntl.h>}
  //{$include <time.h>}

const
  GP_MAX_TMP_FILES = 64;
  GP_TMP_NAME_SIZE = 512;

type
  TGNUPLOT_CTRL_ = record
    gnucmd: PFILE;
    nplots: longint;
    pstyle: array[0..31] of char;
    term: array[0..31] of char;
    to_delete: array[0..(GP_MAX_TMP_FILES) - 1] of array[0..(GP_TMP_NAME_SIZE) - 1] of char;
    ntmp: longint;
  end;

  Tgnuplot_ctrl = TGNUPLOT_CTRL_;
  Pgnuplot_ctrl = ^Tgnuplot_ctrl;

  TGNUPLOT_POINT_ = record
    x: double;
    y: double;
    z: double;
  end;

  Tgnuplot_point = TGNUPLOT_POINT_;
  Pgnuplot_point = ^Tgnuplot_point;

function gnuplot_get_program_path(pname: pchar): pchar; cdecl; external libssl;
procedure print_gnuplot_handle(handle: Pgnuplot_ctrl); cdecl; external libssl;
function gnuplot_init: Pgnuplot_ctrl; cdecl; external libssl;
procedure gnuplot_close(handle: Pgnuplot_ctrl); cdecl; external libssl;
procedure gnuplot_cmd(handle: Pgnuplot_ctrl; cmd: pchar); cdecl; varargs; external libssl;
procedure gnuplot_setstyle(handle: Pgnuplot_ctrl; plot_style: pchar); cdecl; external libssl;
procedure gnuplot_setterm(handle: Pgnuplot_ctrl; terminal: pchar; width: longint; height: longint); cdecl; external libssl;
procedure gnuplot_set_axislabel(handle: Pgnuplot_ctrl; axis: pchar; _label: pchar); cdecl; external libssl;
procedure gnuplot_resetplot(handle: Pgnuplot_ctrl); cdecl; external libssl;
procedure gnuplot_plot_coordinates(handle: Pgnuplot_ctrl; x: Pdouble; y: Pdouble; n: longint; title: pchar); cdecl; external libssl;
procedure gnuplot_splot(handle: Pgnuplot_ctrl; x: Pdouble; y: Pdouble; z: Pdouble; n: longint; title: pchar); cdecl; external libssl;
procedure gnuplot_splot_grid(handle: Pgnuplot_ctrl; points: Pdouble; rows: longint; cols: longint; title: pchar); cdecl; external libssl;
procedure gnuplot_contour_plot(handle: Pgnuplot_ctrl; x: Pdouble; y: Pdouble; z: Pdouble; nx: longint; ny: longint; title: pchar); cdecl; external libssl;

type
  TgetPointProc = procedure(para1: pointer; para2: Pgnuplot_point; para3: longint; para4: longint);

procedure gnuplot_splot_obj(handle: Pgnuplot_ctrl; obj: pointer; getPoint: TgetPointProc; n: longint; title: pchar); cdecl; external libssl;
procedure gnuplot_plot_obj_xy(handle: Pgnuplot_ctrl; obj: pointer; getPoint: TgetPointProc; n: longint; title: pchar); cdecl; external libssl;
procedure gnuplot_plot_once(style: pchar; label_x: pchar; label_y: pchar; x: Pdouble; y: Pdouble;
  n: longint; title: pchar); cdecl; external libssl;
procedure gnuplot_plot_equation(handle: Pgnuplot_ctrl; equation: pchar; title: pchar); cdecl; external libssl;
procedure gnuplot_hardcopy(handle: Pgnuplot_ctrl; filename: pchar; color: pchar); cdecl; external libssl;

// === Konventiert am: 5-7-25 13:38:14 ===


implementation



end.
