unit gplot;

interface

uses
  fp_lept, environ, array_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GPLOT_VERSION_NUMBER = 1;
  NUM_GPLOT_STYLES = 5;

type
  TGPLOT_STYLE = longint;

const
  GPLOT_LINES = 0;
  GPLOT_POINTS = 1;
  GPLOT_IMPULSES = 2;
  GPLOT_LINESPOINTS = 3;
  GPLOT_DOTS = 4;

const
  NUM_GPLOT_OUTPUTS = 6;

type
  TGPLOT_OUTPUT = longint;

const
  GPLOT_NONE = 0;
  GPLOT_PNG = 1;
  GPLOT_PS = 2;
  GPLOT_EPS = 3;
  GPLOT_LATEX = 4;
  GPLOT_PNM = 5;

type
  TGPLOT_SCALING = longint;

const
  GPLOT_LINEAR_SCALE = 0;
  GPLOT_LOG_SCALE_X = 1;
  GPLOT_LOG_SCALE_Y = 2;
  GPLOT_LOG_SCALE_X_Y = 3;

var
  gplotstylenames: PPchar; cvar;external libleptb;
  gplotfileoutputs: PPchar; cvar;external libleptb;

type
  TGPlot = record
    rootname: pchar;
    cmdname: pchar;
    cmddata: PSarray;
    datanames: PSarray;
    plotdata: PSarray;
    plotlabels: PSarray;
    plotstyles: PNuma;
    nplots: Tl_int32;
    outname: pchar;
    outformat: Tl_int32;
    scaling: Tl_int32;
    title: pchar;
    xlabel: pchar;
    ylabel: pchar;
  end;
  PGPlot = ^TGPlot;
  PPGPlot = ^PGPlot;

  // === Konventiert am: 17-8-25 13:40:05 ===


implementation



end.
