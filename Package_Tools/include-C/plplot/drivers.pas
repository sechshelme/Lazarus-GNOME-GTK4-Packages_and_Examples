unit drivers;

interface

uses
  fp_plplot;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{      Contains all prototypes for driver functions. }
{ }
{  Copyright (C) 2004  Andrew Roach }
{  Copyright (C) 2005  Thomas J. Duck }
{  Copyright (C) 2006  Andrew Ross }
{ }
{  This file is part of PLplot. }
{ }
{  PLplot is free software; you can redistribute it and/or modify }
{  it under the terms of the GNU Library General Public License as published }
{  by the Free Software Foundation; either version 2 of the License, or }
{  (at your option) any later version. }
{ }
{  PLplot is distributed in the hope that it will be useful, }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{  GNU Library General Public License for more details. }
{ }
{  You should have received a copy of the GNU Library General Public License }
{  along with PLplot; if not, write to the Free Software }
{  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA }
{ }
{ }
{$ifndef __DRIVERS_H__}
{$define __DRIVERS_H__}
{$include "pdf.h"}
{$include "plstrm.h"}
{ C++ extern C conditionnal removed }
{ The order of these results (in alphabetic order by source file name and device) }
{ may be found from the following command: }
{ }
{ find drivers -type f | grep -v .git | grep -v deprecated | xargs grep 'plD_dispatch_init.*)$'  | grep -v // |sort }
{ }
{ with suitable editing afterward to remove file name prepend "extern " and append ";" }

procedure plD_dispatch_init_aqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_epscairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_extcairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_memcairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pdfcairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pngcairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pscairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_svgcairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_wincairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_xcairo(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_cgm(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_gif(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_jpeg(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_png(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_mem(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_ntk(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_null(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pdf(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_plm(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_psc(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_ps(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pstex(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_psttfc(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_psttf(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_bmpqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_epsqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_extqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_jpgqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_memqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pdfqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_pngqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_ppmqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_qtwidget(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_svgqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_tiffqt(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_svg(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_tk(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_tkwin(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_wingcc(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_wxpng(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_wxwidgets(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_xfig(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_xw(pdt:PPLDispatchTable);cdecl;external libplplot;
procedure plD_dispatch_init_wingdi(pdt:PPLDispatchTable);cdecl;external libplplot;
{ Prototypes for plot buffer calls. }
procedure plbuf_init(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_line(para1:PPLStream; para2:smallint; para3:smallint; para4:smallint; para5:smallint);cdecl;external libplplot;
procedure plbuf_polyline(para1:PPLStream; para2:Psmallint; para3:Psmallint; para4:TPLINT);cdecl;external libplplot;
procedure plbuf_eop(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_bop(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_tidy(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_state(para1:PPLStream; para2:TPLINT);cdecl;external libplplot;
procedure plbuf_esc(para1:PPLStream; para2:TPLINT; para3:pointer);cdecl;external libplplot;
procedure plbuf_di(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_setsub(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_ssub(para1:PPLStream);cdecl;external libplplot;
procedure plbuf_clip(para1:PPLStream);cdecl;external libplplot;
function plbuf_save(para1:PPLStream; para2:pointer):pointer;cdecl;external libplplot;
function plbuf_switch(para1:PPLStream; para2:pointer):pointer;cdecl;external libplplot;
procedure plbuf_restore(para1:PPLStream; para2:pointer);cdecl;external libplplot;
procedure plRemakePlot(para1:PPLStream);cdecl;external libplplot;
procedure plFlushBuffer(pls:PPLStream; restart:TPLBOOL; amount:Tsize_t);cdecl;external libplplot;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __DRIVERS_H__ }

// === Konventiert am: 31-3-26 20:05:03 ===


implementation



end.
