
unit gplot;
interface

{
  Automatically converted by H2Pas 1.0.0 from gplot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gplot.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGPlot  = ^GPlot;
PGPLOT_OUTPUT  = ^GPLOT_OUTPUT;
PGPLOT_SCALING  = ^GPLOT_SCALING;
PGPLOT_STYLE  = ^GPLOT_STYLE;
PNuma  = ^Numa;
PSarray  = ^Sarray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *==================================================================== }
{$ifndef  LEPTONICA_GPLOT_H}
{$define LEPTONICA_GPLOT_H}
{!
 * \file gplot.h
 *
 * <pre>
 *   Data structures and parameters for generating gnuplot files
 *
 *   We used to support X11 output, but recent versions of gnuplot do not
 *   support the X11 terminal.  To get display to your screen, use
 *   GPLOT_PNG output; e.g.,
 *       gplotSimple1(na, GPLOT_PNG, "/tmp/someroot", ...);
 *       l_fileDisplay("/tmp/someroot.png", ...);
 * </pre>
  }

const
  GPLOT_VERSION_NUMBER = 1;  
  NUM_GPLOT_STYLES = 5;  
type
  TGPLOT_STYLE =  Longint;
  Const
    GPLOT_LINES = 0;
    GPLOT_POINTS = 1;
    GPLOT_IMPULSES = 2;
    GPLOT_LINESPOINTS = 3;
    GPLOT_DOTS = 4;

  NUM_GPLOT_OUTPUTS = 6;  
type
  TGPLOT_OUTPUT =  Longint;
  Const
    GPLOT_NONE = 0;
    GPLOT_PNG = 1;
    GPLOT_PS = 2;
    GPLOT_EPS = 3;
    GPLOT_LATEX = 4;
    GPLOT_PNM = 5;

{!< default  }
type
  TGPLOT_SCALING =  Longint;
  Const
    GPLOT_LINEAR_SCALE = 0;
    GPLOT_LOG_SCALE_X = 1;
    GPLOT_LOG_SCALE_Y = 2;
    GPLOT_LOG_SCALE_X_Y = 3;

(* Const before type ignored *)
  var
    gplotstylenames : ^Pchar;cvar;external;
{!< used in gnuplot cmd file  }
(* Const before type ignored *)
    gplotfileoutputs : ^Pchar;cvar;external;
{!< used in simple file input  }
{! Data structure for generating gnuplot files  }
{!< for cmd, data, output             }
{!< command file name                 }
{!< command file contents             }
{!< data file names                   }
{!< plot data (1 string/file)         }
{!< label for each individual plot    }
{!< plot style for individual plots   }
{!< current number of plots           }
{!< output file name                  }
{!< GPLOT_OUTPUT values               }
{!< GPLOT_SCALING values              }
{!< optional                          }
{!< optional x axis label             }
{!< optional y axis label             }
type
  PGPlot = ^TGPlot;
  TGPlot = record
      rootname : Pchar;
      cmdname : Pchar;
      cmddata : PSarray;
      datanames : PSarray;
      plotdata : PSarray;
      plotlabels : PSarray;
      plotstyles : PNuma;
      nplots : Tl_int32;
      outname : Pchar;
      outformat : Tl_int32;
      scaling : Tl_int32;
      title : Pchar;
      xlabel : Pchar;
      ylabel : Pchar;
    end;

{$endif}
{ LEPTONICA_GPLOT_H  }

implementation


end.
