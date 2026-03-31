
unit plstrm;
interface

{
  Automatically converted by H2Pas 1.0.0 from plstrm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    plstrm.h
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
PFILE  = ^FILE;
Plongint  = ^longint;
PPDFstrm  = ^PDFstrm;
PPLColor  = ^PLColor;
PPLDev  = ^PLDev;
PPLDispatchTable  = ^PLDispatchTable;
PPLFLT  = ^PLFLT;
PPLGraphicsIn  = ^PLGraphicsIn;
PPLINT  = ^PLINT;
PPlPlotter  = ^PlPlotter;
PPLStream  = ^PLStream;
PQSASConfig  = ^QSASConfig;
Psmallint  = ^smallint;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{	Contains declarations for PLStream and PLDev structs. }
{	Also prototypes for stream & device utility functions. }
{ }
{  Copyright (C) 2004  Andrew Ross }
{  Copyright (C) 2004  Andrew Roach }
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
{$include "pdf.h"}
{$ifndef __PLSTRM_H__}
{$define __PLSTRM_H__}
{$include "disptab.h"}
{$include "pldll.h"}
{$include "qsastime.h"}
{-------------------------------------------------------------------------- }
{ Define the PLDev data structure. }
{ }
{ These are all quantities that must be saved on a per-device basis. }
{ Some drivers (xwin, tk) allocate structures defined internally. }
{-------------------------------------------------------------------------- }
type
  PPLDev = ^TPLDev;
  TPLDev = record
      pxlx : TPLFLT;
      pxly : TPLFLT;
      xold : TPLINT;
      yold : TPLINT;
      xmin : TPLINT;
      xmax : TPLINT;
      xlen : TPLINT;
      ymin : TPLINT;
      ymax : TPLINT;
      ylen : TPLINT;
      xmin_dev : TPLINT;
      xmax_dev : TPLINT;
      xlen_dev : TPLINT;
      ymin_dev : TPLINT;
      ymax_dev : TPLINT;
      ylen_dev : TPLINT;
      xscale_dev : TPLFLT;
      yscale_dev : TPLFLT;
    end;
{-------------------------------------------------------------------------- }
{ Define the PLStream data structure. }
{ }
{ This contains a copy of every variable that is stream dependent, which }
{ tends to be those which are settable by the user and persist for longer }
{ than one plot. }
{ }
{ Only those quantities listed in the PLStream struct will be preserved }
{ for an individual stream.  Note that the lack of every plplot constant }
{ means that one should only switch streams at a fairly high level, i.e. }
{ on the scale of an entire plot.  Otherwise intermediate quantities }
{ will be confused between the streams, possibly resulting in garbage plots. }
{ This structure may be expanded in time to improve intra-stream independence, }
{ but it is doubtful streams will ever be fully independent (perhaps }
{ neither necessary nor desirable? -- time will tell). }
{ }
{ There are undoubtably some inconsistencies in the declaration & use of }
{ the variables below.  This is a result of the continuing evolution of }
{ plplot and the numerous authors involved.  Hopefully in time the function }
{ of all variables can be fully documented and made more consistent. }
{ }
{ The quantities in each stream are as follows: }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Misc control variables }
{ }
{ ipls		PLINT	Stream number }
{ level	PLINT	Initialization level }
{ program	char*	Program name }
{ verbose	PLINT	Be more verbose than usual }
{ debug	PLINT	Generate debugging output }
{ initialized	PLINT	Set if the stream has been initialized }
{ dev_initialized PLINT Set if the device driver has been loaded }
{ stream_closed PLBOOL  Set if the stream was closed or if there }
{                       was some sort of error }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Palettes (two of them) }
{ }
{ Color map 0 is intended for static objects, such as boxes, lines, points, }
{ labels, etc.  These should be allocated before calling plinit (else you }
{ get 16 by default, which can be undesirable on some platforms).  These }
{ are then explicitly selected by number (in order of allocation).  The }
{ lowest number is 0, but this is used for the background color, so all }
{ color drivers start with 1 as the default color. }
{ }
{ Color map 1 is for continuous-tone plots, where color is used to }
{ represent function value or intensity.  These are set in a relative way }
{ only, for increased portability and flexibility.  The actual number of }
{ colors used to represent intensity levels is determined by the driver. }
{ Note that it is only necessary to specify intensity (on a scale from 0 }
{ to 1) to get an appropriate color.  Drivers incapable of fine shading }
{ will do the best job they can. }
{ }
{ A palette selection tool for both palettes is available for the Tk }
{ driver.  Direct writing of RGB values (i.e.  banging on the hardware) is }
{ supported but highly discouraged (colors so written will be affected }
{ unpredictably by the palette tools). }
{ }
{ icol0	PLINT	Color map 0 entry, current color (0 <= icol0 <= ncol0) }
{ ncol0	PLINT	Number of colors allocated in color map 0. }
{ icol1	PLINT	Color map 1 entry, current color (0 <= icol1 <= ncol1) }
{ ncol1	PLINT	Number of colors allocated in color map 1. }
{ ncol1cp	PLINT	Number of control points in cmap1 allocation (max PL_MAX_CMAP1CP) }
{ lcol1cp	PLFLT	Locations of control points in cmap1 [0,1] }
{ curcmap	PLINT	Current color map }
{ curcolor	RGB[]	Current color }
{ tmpcolor	RGB[]	Temporary color storage }
{ cmap0        RGB[]	Color map 0: maximum of ncol0 RGB 8-bit values }
{ cmap1        RGB[]	Color map 1: maximum of ncol1 RGB 8-bit values }
{ cmap1_min    PLFLT   Minimum color map 1 color to use in continuous tone plots }
{ cmap1_max    PLFLT   Maximum color map 1 color to use in continuous tone plots }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables governing pen width }
{ }
{ width	Current pen width }
{ widthset	Set if pen width was specified }
{ widthlock	Set if pen width is locked }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables governing arrow type }
{ }
{ arrow_x      x coordinates of points in arrow }
{ arrow_y      y coordinates of points in arrow }
{ arrow_npts   number of points in arrow_x, arrow_y }
{ arrow_fill   whether the arrow should be filled or not }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables used to pass information between the core and the driver }
{ }
{ It would be nice to use the "dev_" prefix uniformly but changing }
{ all that old code would be quite a lot of work.. }
{ }
{ device	PLINT	Graphics device id number }
{ dev_minor	PLINT	Minor device id (for variations on one type) }
{ color	PLINT	Set if color is available }
{ colorset	PLINT	Set if "color" was set prior to calling plinit }
{ plbuf_read	PLINT	Set during a plot buffer redraw }
{ plbuf_write	PLINT	Set if driver needs to use the plot buffer }
{ dev_fill0	PLINT	Set if driver can do solid area fills }
{ dev_gradient	PLINT	Set if driver can do (linear) gradients }
{ dev_text	PLINT	Set if driver want to do it's only text drawing }
{ dev_unicode	PLINT	Set if driver wants unicode }
{ dev_hrshsym	PLINT	Set for Hershey symbols to be used }
{ dev_fill1	PLINT	Set if driver can do pattern area fills }
{ dev_dash     PLINT   Set if driver can do dashed lines }
{ dev_di	PLINT	Set if driver wants to handle DI commands }
{ dev_flush	PLINT	Set if driver wants to handle flushes itself }
{ dev_swin	PLINT	Set if driver wants to handle 'set window' commands }
{ dev_fastimg  PLINT   Set if driver has fast image drawing capabilities }
{ dev_xor      PLINT   Set if driver supports xor mode. }
{ dev_clear    PLINT   Set if driver support clear. }
{ termin	PLINT	Set for interactive devices }
{ graphx	PLINT	Set if currently in graphics mode }
{ nopause	PLINT	Set if we are skipping the pause between frames }
{ family	PLINT	Set if familying is enabled }
{ member	PLINT	Number of current family member file open }
{ finc		PLINT	Number to increment between member files }
{ fflen	PLINT	Minimum field length to use in member file number }
{ bytemax	PLINT	Number of bytes maximum per member file }
{ famadv	PLINT	Set to advance to the next family member }
{ DevName	char*	Device name }
{ OutFile	FILE	Output file pointer }
{ BaseName	char*	Output base name (i.e. family) }
{ FileName	char*	Output file name }
{ output_type	int	0 for file, 1 for stream }
{ bytecnt	PLINT	Byte count for output stream }
{ page		PLINT	Page count for output stream }
{ linepos	PLINT	Line count for output stream }
{ pdfs		PDFstrm* PDF stream pointer }
{ dev_mem_alpha     PLINT  The user supplied memory buffer supports alpha values }
{ has_string_length PLINT  The driver can calculate the lengths of strings }
{ string_length     PLFLT  Set to the length of the current string (in mm) by the driver }
{ get_string_length PLINT  Tells the driver to calculate the length of the string }
{                             but not to render it. }
{ }
{ These are used by the escape function (for area fill, etc). }
{ }
{ dev_npts	PLINT	Number of points we are plotting }
{ dev_x	short*	Pointer to array of x values }
{ dev_y	short*	Pointer to array of x values }
{ For the case where the boundary of the filled region is }
{ self-intersecting, use the even-odd fill rule rather than the }
{ default nonzero fill rule. }
{ dev_eofill   PLINT }
{ }
{ For images }
{ dev_nptsX	PLINT	Number of points we are plotting in X }
{ dev_nptsY	PLINT	Number of points we are plotting in Y }
{ dev_z	ushort*	Pointer to array of z values for the color }
{ dev_zmin, }
{ dev_zmax     ushort  Min and max values of z to plot }
{ }
{ The following pointer is for drivers that require device-specific }
{ data.  At initialization the driver should malloc the necessary }
{ space and set pls->dev to point to this area.  This way there can }
{ be multiple streams using the same driver without conflict. }
{ }
{ dev		void*	pointer to device-specific data (malloc'ed) }
{ }
{ User-supplied event handlers for use by interactive drivers (e.g. X). }
{ Can be used to take various actions depending on input.  Currently }
{ only a keyboard event handler is supported. }
{ }
{ KeyEH	void*	Keyboard event handler }
{ KeyEH_data	void*	Pointer to client data to pass }
{ }
{ ButtonEH	void*	(Mouse) Button event handler }
{ ButtonEH_data void*	Pointer to client data to pass }
{ }
{ bop_handler	void*	bop handler }
{ bop_data	void*	Pointer to client data to pass }
{ }
{ eop_handler	void*	eop handler }
{ eop_data	void*	Pointer to client data to pass }
{ }
{ Variables used for direct specification of device characteristics }
{ Not supported by all drivers (or even very many) }
{ }
{ xdpi..	PLFLT	Device DPI settings in x and y }
{ xlength..	PLINT	Device output lengths in x and y }
{ xoffset..	PLINT	Device offsets from upper left hand corner }
{ hack		PLINT	Enables driver-specific hack(s) if set }
{ }
{-------------------------------------------------------------------------- }
{ }
{ User customization tidy routine.  This is called before closing a stream }
{ to do any program specific cleanup. }
{ }
{ tidy		void*   pointer to cleanup routine }
{ tidy_data	void*   pointer to client data to pass }
{ }
{-------------------------------------------------------------------------- }
{ }
{ User error control variables.  Pass in a pointer for either to be set }
{ in exceptional conditions.  The caller is responsible for clearing the }
{ error code. }
{ }
{ errcode	PLINT*	pointer to variable to assign error code }
{ errmsg	char*	pointer to error message buffer (must be >= 160 bytes) }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Stuff used by Xlib driver }
{ }
{ geometry	char*	Window geometry (malloc'ed) }
{ window_id	long	X-window window ID }
{ nopixmap	int	Set if you want to forbid allocation of pixmaps }
{ db		int	Set if you want to double buffer output }
{			(only pixmap is drawn to directly; it is blitted }
{			to output window on EOP or an Expose) }
{ ext_resize_draw int  Set if you want to control the redraw caused by a }
{                      window resize by an external agent. }
{-------------------------------------------------------------------------- }
{ }
{ These are for support of the TK driver. }
{ }
{ server_name	char*	Main window name of server }
{ server_host	char*	Name of host to run server on }
{ server_port	char*	Port to talk to server on }
{ user		char*	Your user name on remote host (for remsh command) }
{ plserver	char*	Name of server }
{ plwindow	char*	Name of reference server window (malloc'ed) }
{ tk_file	char*   File for plserver use with its -file option }
{ auto_path	char*	Additional directories to autoload }
{ bufmax	int	Number of bytes sent before output buffer is flushed }
{ dp		int	Use Tcl-DP for communication, if set }
{ server_nokill int	Don't kill plserver on a ^C if set }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables for use by the plot buffer }
{ }
{ For Memory Buffer (default) }
{ plbuf_buffer_grow  size_t  Memory buffer growth step }
{ plbuf_buffer_size  size_t  Current size of memory buffer }
{ plbuf_buffer	      void *  Pointer to memory buffer }
{ plbuf_top	      size_t  Offset to the top of used area/start of free area }
{ plbuf_readpos      size_t  Offset to current position being read }
{ }
{ plbufOwner	int	Typically set; only zero if current stream is cloned. }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Driver interface (DI) }
{ }
{ difilt	PLINT	Driver interface filter flag }
{ }
{ dipxmin	PLFLT }
{ dipymin	PLFLT	Min, max relative plot coordinates }
{ dipxmax	PLFLT }
{ dipymax	PLFLT }
{ dipxax       PLFLT	Plot window transformation: }
{ dipxb        PLFLT	  x' = dipxax * x + dipxb }
{ dipyay       PLFLT }
{ dipyb        PLFLT	  y' = dipyay * y + dipyb }
{ }
{ aspdev	PLFLT	Original device aspect ratio }
{ aspect	PLFLT	Page aspect ratio }
{ aspori	PLFLT	Rotation-induced aspect ratio }
{ caspfactor	PLFLT	Factor applied to preserve character aspect ratio }
{ freeaspect	PLINT	Allow aspect ratio to adjust to orientation swaps }
{                      when overall aspect ratio is changed. }
{ portrait	PLINT	Portrait mode (orientation and aspect ratio) }
{ mar		PLFLT	Page margin (minimum) }
{ jx		PLFLT	Page justification in x }
{ jy		PLFLT	Page justification in y }
{ }
{ didxax       PLFLT	Device window transformation: }
{ didxb        PLFLT	  x' = didxax * x + didxb }
{ didyay       PLFLT }
{ didyb        PLFLT	  y' = didyay * y + didyb }
{ }
{ diclpxmi	PLINT }
{ diclpxma	PLINT	Device clip limits }
{ diclpymi	PLINT }
{ diclpyma	PLINT }
{ }
{ diorot	PLFLT	Rotation angle (in units of pi/2) }
{ dioxax	PLFLT	Orientation transformation: }
{ dioxay	PLFLT	  x' = dioxax * x + dioxay * y + dioxb }
{ dioxb        PLFLT }
{ dioyax	PLFLT	  y' = dioyax * x + dioyay * y + dioyb }
{ dioyay	PLFLT }
{ dioyb        PLFLT }
{ }
{ dimxmin	PLFLT }
{ dimymin	PLFLT	Target coordinate system parameters. }
{ dimxmax	PLFLT }
{ dimymax	PLFLT }
{ dimxpmm	PLFLT }
{ dimypmm	PLFLT }
{ dimxax       PLFLT	Map meta to physical coordinates: }
{ dimxb        PLFLT	  x' = dimxax * x + dimxb }
{ dimyay       PLFLT }
{ dimyb        PLFLT	  y' = dimyay * y + dimyb }
{ }
{ page_status	PLINT	Flag to indicate current action }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Fill pattern state information. }
{ patt < 0: Hardware fill, if available (not implemented yet) }
{ patt ==0: Hardware fill, if available, solid }
{ patt > 0: Software fill }
{ }
{ patt		Fill pattern number }
{ inclin	Array of inclinations in tenths of degree for fill lines }
{ delta	Array of spacings in micrometers between fill lines }
{ nps		Number of distinct line styles for fills }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables used in line drawing }
{ }
{ currx	Physical x-coordinate of current point }
{ curry	Physical y-coordinate of current point }
{ line_style	index of last call to pllsty }
{ mark		Array of mark lengths in micrometers for broken lines }
{ space	Array of space lengths in micrometers for broken lines }
{ nms		Number of elements for current broken line style }
{ timecnt	Timer for broken lines }
{ alarm	Alarm indicating change of broken line status }
{ pendn	Flag indicating if pen is up or down }
{ curel	Current element within broken line }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables governing character strings }
{ }
{ esc		Text string escape character }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Scale factors for characters, symbols, and tick marks. }
{ }
{ scale	Scaling factor for chr, sym, maj, min. }
{ chr...	Character default height and current (scaled) height }
{ sym...	Symbol    default height and current (scaled) height }
{ maj...	Major tick default height and current (scaled) height }
{ min...	Minor tick default height and current (scaled) height }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables governing numeric axis label appearance }
{ }
{ setpre	Non-zero to set precision using "prec" }
{ precis	User-specified precision }
{ xdigmax..	Allowed #digits in axes labels }
{ xdigits..	Actual field widths (returned) }
{ timefmt      Format string (for strftime) }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables governing physical coordinate system }
{ }
{ vpp..	Viewport boundaries in physical coordinates }
{ spp..	Subpage  boundaries in physical coordinates }
{ clp..	Clip     boundaries in physical coordinates }
{ phy...	Physical device limits in physical coordinates }
{ um.		Number of micrometers in a pixel }
{ pmm		Number of pixels to a millimeter }
{ }
{-------------------------------------------------------------------------- }
{ }
{ State variables for 3d plots }
{ }
{ base3.	World coordinate size of base for 3-d plot }
{ basec.	Position of centre of base for 3-d plot }
{ dom...	Minimum and maximum values for domain }
{ zzscl	Vertical (z) scale for 3-d plot }
{ ran..	Minimum and maximum z values for 3-d plot }
{ c..		Coordinate transformation from 3-d to 2-d }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables for keeping track of world coordinate windows on a page. }
{ }
{ nCWindows	Number of coordinate windows on current page }
{ windows	Array of plCWindow's for current page }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables governing subpages and viewports. }
{ }
{ nsub...	Number of subpages on physical device }
{ cursub	Current subpage }
{ spd...	Subpage  boundaries in normalized device coordinates }
{ vpd...	Viewport boundaries in normalized device coordinates }
{ vpw...	Viewport boundaries in world coordinates }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Transformation variables }
{ }
{ wp....	Transformation variables for world  to physical conversion }
{ wm....	Transformation variables for world coordinates to mm }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Other variables }
{ }
{ dev_compression Compression level for supporting devices }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Font related variables }
{ }
{ cfont           Current font number, replaces global 'font' in plsym.c }
{                 This can be latter extended for font shape, series, family and size }
{ fci             FCI (font characterization integer) }
{ An FCI is sometimes inserted in the middle of a stream of }
{ unicode glyph indices.  Thus to distinguish it from those, the FCI is marked }
{ by 0x8 in the most significant 4 bits.  The remaining 7 hex digits }
{ stored in the 32-bit integer characterize 7 different font attributes. }
{ The font attributes are interpreted as follows: }
{ hexdigit =>                    0        1          2        3       4        5 }
{ hexpower   Font attribute               Possible attribute values }
{    0       font-family     sans-serif  serif    monospace  script  symbol |fantasy }
{    1       font-style        upright   italic    oblique | }
{    2       font-weight       medium     bold  |   bolder    light  lighter }
{    3       font-variant      normal | small caps }
{ }
{ Everything to the right of the vertical bars is not implemented and is }
{ subject to change.  The four font attributes (font-family, font-style, }
{ font-weight, and font-variant are stored in the FCI in the order of }
{ hexpower, the left shift that is applied to the hex digit to place the }
{ hexdigit in the FCI.  The hexpower = 3 position is essentially undefined }
{ since there is currently only one hexdigit (0) defined, and similarly }
{ for hexpower = 4-6 so there is room for expansion of this scheme into more }
{ font attributes if required.  (hexpower = 7 is reserved for the 0x8 marker }
{ of the FCI.) }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Time related variable }
{ }
{ qsasconfig is a pointer to a struct that keeps track of the details }
{ of the transformation between broken-down and continuous time used }
{ in the qsastime library. }
{ }
{-------------------------------------------------------------------------- }
{ }
{ Variables used in plgradient software fallback to communicate the polygon }
{ to the gradient_define callback used by plshades. }
{ }
{ n_polygon       Number of vertex points in the polygon defining the }
{                 boundary of the gradient. }
{ x_polygon       Pointer to array of x vertex points in the polygon }
{                 defining the boundary of the gradient. }
{ y_polygon       Pointer to array of y vertex points in the polygon }
{                 defining the boundary of the gradient. }
{-------------------------------------------------------------------------- }
{ }
{ Variables used to store gradient information for device drivers. }
{ }
{ xgradient       Pointer to array of x coordinates of gradient vector. }
{ ygradient       Pointer to array of y coordinates of gradient vector. }
{ ngradient       Number of points (two) in gradient vector. }
{-------------------------------------------------------------------------- }

const
  PL_MAX_CMAP1CP = 256;  
{ Misc control information }
{CONSTANT SOVERSION FIX }
{    PLBOOL     stream_closed; }
{ Plot-wide coordinate transform }
{ Colormaps }
{ Variables governing pen width }
{ Variables governing arrow }
{ Driver dispatch table, obsoletes "device" member below. }
{ Variables used for interacting with or by device driver }
{ variables for plimage() }
{ end of variables for plimage() }
{ Per stream tidy function. }
{ Error info }
{ Stuff used by Xlib driver }
{ Stuff used by TK, DP drivers }
{ plserver -file option }
{ Plot buffer settings }
{ Driver interface (DI) }
{ Fill pattern info }
{ Variables used in line drawing }
{CONSTANT SOVERSION FIX }
{PLINT line_style; }
{ Variables governing character strings }
{ Scale factors for characters, symbols, and tick marks. }
{ Variables governing numeric axis label appearance }
{ Variables governing physical coordinate system }
{ State variables for 3d plots }
{ Variables for keeping track of windows on a page. }
{ Variables governing subpages and viewports. }
{ Transformation variables }
{ Other variables }
{ Stuff used by the Tkwin driver for Plframe }
{ Unicode section }
{ The alternative interface for unicode text rendering. }
{ Used to keep a hold of a temporary copy of the original character height }
{ which I overload as a quick hack to fix up a bug in freetype an plsym() }
{ }
{ }
{ Pointer to postscript document class used by psttf }
{ }
{ pointer to a struct that keeps track of the details of the }
{ transformation between broken-down and continuous time used in }
{ the qsastime library. }
{ Gradient section. }
{ The next three variables define the polygon boundary used }
{ in the software fallback for the gradient. }
(* Const before type ignored *)
{CONSTANT SOVERSION FIX }
{ Drawing mode section }
{ Calculate bounding-box limits rather than plot box? }
{ Bounding box limits in mm for box including decorations }
{ (inverted tick marks and numerical tick labels if either is }
{ present). }
{ Plot metafile variables }
{ }
type
  PPLStream = ^TPLStream;
  TPLStream = record
      ipls : TPLINT;
      level : TPLINT;
      verbose : TPLINT;
      debug : TPLINT;
      initialized : TPLINT;
      dev_initialized : TPLINT;
      program : Pchar;
      coordinate_transform : TPLTRANSFORM_callback;
      coordinate_transform_data : TPLPointer;
      icol0 : TPLINT;
      ncol0 : TPLINT;
      icol1 : TPLINT;
      ncol1 : TPLINT;
      ncp1 : TPLINT;
      curcmap : TPLINT;
      cmap1_min : TPLFLT;
      cmap1_max : TPLFLT;
      curcolor : TPLColor;
      tmpcolor : TPLColor;
      cmap0 : PPLColor;
      cmap1 : PPLColor;
      cmap1cp : array[0..(PL_MAX_CMAP1CP)-1] of TPLControlPt;
      cmap1cp_is_rgb : TPLBOOL;
      width : TPLFLT;
      widthset : TPLINT;
      widthlock : TPLINT;
      arrow_x : PPLFLT;
      arrow_y : PPLFLT;
      arrow_npts : TPLINT;
      arrow_fill : TPLINT;
      dispatch_table : PPLDispatchTable;
      plbuf_read : TPLINT;
      plbuf_write : TPLINT;
      device : TPLINT;
      dev_minor : TPLINT;
      termin : TPLINT;
      graphx : TPLINT;
      nopause : TPLINT;
      color : TPLINT;
      colorset : TPLINT;
      family : TPLINT;
      member : TPLINT;
      finc : TPLINT;
      fflen : TPLINT;
      bytemax : TPLINT;
      famadv : TPLINT;
      dev_fill0 : TPLINT;
      dev_fill1 : TPLINT;
      dev_dash : TPLINT;
      dev_di : TPLINT;
      dev_flush : TPLINT;
      dev_swin : TPLINT;
      dev_text : TPLINT;
      dev_xor : TPLINT;
      dev_clear : TPLINT;
      dev_fastimg : TPLINT;
      dev_arc : TPLINT;
      DevName : array[0..79] of char;
      OutFile : PFILE;
      BaseName : Pchar;
      FileName : Pchar;
      output_type : longint;
      bytecnt : TPLINT;
      page : TPLINT;
      linepos : TPLINT;
      pdfs : PPDFstrm;
      dev_npts : TPLINT;
      dev_x : Psmallint;
      dev_y : Psmallint;
      dev_nptsX : TPLINT;
      dev_nptsY : TPLINT;
      dev_ix : Psmallint;
      dev_iy : Psmallint;
      dev_z : Pword;
      dev_zmin : word;
      dev_zmax : word;
      imclxmin : TPLINT;
      imclxmax : TPLINT;
      imclymin : TPLINT;
      imclymax : TPLINT;
      dev : pointer;
      dev_data : pointer;
      KeyEH : procedure (gin:PPLGraphicsIn; KeyEH_data:pointer; exit_eventloop:Plongint);cdecl;
      KeyEH_data : pointer;
      ButtonEH : procedure (gin:PPLGraphicsIn; ButtonEH_data:pointer; exit_eventloop:Plongint);cdecl;
      ButtonEH_data : pointer;
      LocateEH : procedure (gin:PPLGraphicsIn; LocateEH_data:pointer; locate_mode:Plongint);cdecl;
      LocateEH_data : pointer;
      bop_handler : procedure (bop_data:pointer; skip_driver_bop:Plongint);cdecl;
      bop_data : pointer;
      eop_handler : procedure (eop_data:pointer; skip_driver_eop:Plongint);cdecl;
      eop_data : pointer;
      xdpi : TPLFLT;
      ydpi : TPLFLT;
      xlength : TPLINT;
      ylength : TPLINT;
      xoffset : TPLINT;
      yoffset : TPLINT;
      hack : TPLINT;
      tidy : procedure (para1:pointer);cdecl;
      tidy_data : pointer;
      errcode : PPLINT;
      errmsg : Pchar;
      geometry : Pchar;
      window_id : longint;
      nopixmap : longint;
      db : longint;
      ext_resize_draw : longint;
      server_name : Pchar;
      server_host : Pchar;
      server_port : Pchar;
      user : Pchar;
      plserver : Pchar;
      plwindow : Pchar;
      auto_path : Pchar;
      tk_file : Pchar;
      bufmax : longint;
      dp : longint;
      server_nokill : longint;
      plbuf_buffer_grow : Tsize_t;
      plbuf_buffer_size : Tsize_t;
      plbuf_buffer : pointer;
      plbuf_top : Tsize_t;
      plbuf_readpos : Tsize_t;
      plbufOwner : longint;
      difilt : TPLINT;
      diclpxmi : TPLINT;
      diclpxma : TPLINT;
      diclpymi : TPLINT;
      diclpyma : TPLINT;
      dipxmin : TPLFLT;
      dipymin : TPLFLT;
      dipxmax : TPLFLT;
      dipymax : TPLFLT;
      dipxax : TPLFLT;
      dipxb : TPLFLT;
      dipyay : TPLFLT;
      dipyb : TPLFLT;
      aspdev : TPLFLT;
      aspect : TPLFLT;
      aspori : TPLFLT;
      caspfactor : TPLFLT;
      mar : TPLFLT;
      jx : TPLFLT;
      jy : TPLFLT;
      didxax : TPLFLT;
      didxb : TPLFLT;
      didyay : TPLFLT;
      didyb : TPLFLT;
      diorot : TPLFLT;
      dioxax : TPLFLT;
      dioxay : TPLFLT;
      dioxb : TPLFLT;
      dioyax : TPLFLT;
      dioyay : TPLFLT;
      dioyb : TPLFLT;
      dimxax : TPLFLT;
      dimxb : TPLFLT;
      dimyay : TPLFLT;
      dimyb : TPLFLT;
      dimxmin : TPLFLT;
      dimymin : TPLFLT;
      dimxmax : TPLFLT;
      dimymax : TPLFLT;
      dimxpmm : TPLFLT;
      dimypmm : TPLFLT;
      page_status : TPLINT;
      freeaspect : TPLINT;
      portrait : TPLINT;
      patt : TPLINT;
      inclin : array[0..1] of TPLINT;
      delta : array[0..1] of TPLINT;
      nps : TPLINT;
      currx : TPLINT;
      curry : TPLINT;
      mark : array[0..9] of TPLINT;
      space : array[0..9] of TPLINT;
      nms : TPLINT;
      timecnt : TPLINT;
      alarm : TPLINT;
      pendn : TPLINT;
      curel : TPLINT;
      esc : char;
      scale : TPLFLT;
      chrdef : TPLFLT;
      chrht : TPLFLT;
      symdef : TPLFLT;
      symht : TPLFLT;
      majdef : TPLFLT;
      majht : TPLFLT;
      mindef : TPLFLT;
      minht : TPLFLT;
      setpre : TPLINT;
      precis : TPLINT;
      xdigmax : TPLINT;
      ydigmax : TPLINT;
      zdigmax : TPLINT;
      xdigits : TPLINT;
      ydigits : TPLINT;
      zdigits : TPLINT;
      timefmt : Pchar;
      label_func : TPLLABEL_FUNC_callback;
      label_data : TPLPointer;
      vppxmi : TPLINT;
      vppxma : TPLINT;
      vppymi : TPLINT;
      vppyma : TPLINT;
      sppxmi : TPLINT;
      sppxma : TPLINT;
      sppymi : TPLINT;
      sppyma : TPLINT;
      clpxmi : TPLINT;
      clpxma : TPLINT;
      clpymi : TPLINT;
      clpyma : TPLINT;
      phyxmi : TPLINT;
      phyxma : TPLINT;
      phyxlen : TPLINT;
      phyymi : TPLINT;
      phyyma : TPLINT;
      phyylen : TPLINT;
      umx : TPLINT;
      umy : TPLINT;
      xpmm : TPLFLT;
      ypmm : TPLFLT;
      base3x : TPLFLT;
      base3y : TPLFLT;
      basecx : TPLFLT;
      basecy : TPLFLT;
      domxmi : TPLFLT;
      domxma : TPLFLT;
      domymi : TPLFLT;
      domyma : TPLFLT;
      zzscl : TPLFLT;
      ranmi : TPLFLT;
      ranma : TPLFLT;
      cxx : TPLFLT;
      cxy : TPLFLT;
      cyx : TPLFLT;
      cyy : TPLFLT;
      cyz : TPLFLT;
      czx : TPLFLT;
      czy : TPLFLT;
      czz : TPLFLT;
      nplwin : longint;
      plwin : array[0..(PL_MAXWINDOWS)-1] of TPLWindow;
      nsubx : TPLINT;
      nsuby : TPLINT;
      cursub : TPLINT;
      spdxmi : TPLFLT;
      spdxma : TPLFLT;
      spdymi : TPLFLT;
      spdyma : TPLFLT;
      vpdxmi : TPLFLT;
      vpdxma : TPLFLT;
      vpdymi : TPLFLT;
      vpdyma : TPLFLT;
      vpwxmi : TPLFLT;
      vpwxma : TPLFLT;
      vpwymi : TPLFLT;
      vpwyma : TPLFLT;
      wpxscl : TPLFLT;
      wpxoff : TPLFLT;
      wpyscl : TPLFLT;
      wpyoff : TPLFLT;
      wmxscl : TPLFLT;
      wmxoff : TPLFLT;
      wmyscl : TPLFLT;
      wmyoff : TPLFLT;
      wdxscl : TPLFLT;
      wdxoff : TPLFLT;
      wdyscl : TPLFLT;
      wdyoff : TPLFLT;
      dev_compression : TPLINT;
      cfont : TPLINT;
      FT : pointer;
      plPlotterPtr : PPlPlotter;
      dev_unicode : TPLINT;
      alt_unicode : TPLINT;
      fci : TPLUNICODE;
      dev_hrshsym : TPLINT;
      original_chrdef : TPLFLT;
      original_chrht : TPLFLT;
      psdoc : pointer;
      qsasconfig : PQSASConfig;
      dev_gradient : TPLINT;
      ngradient : TPLINT;
      xgradient : PPLINT;
      ygradient : PPLINT;
      n_polygon : TPLINT;
      x_polygon : PPLFLT;
      y_polygon : PPLFLT;
      stream_closed : TPLBOOL;
      line_style : TPLINT;
      dev_mem_alpha : TPLINT;
      has_string_length : TPLINT;
      string_length : TPLFLT;
      get_string_length : TPLINT;
      dev_eofill : TPLINT;
      dev_modeset : TPLINT;
      if_boxbb : TPLBOOL;
      boxbb_xmin : TPLFLT;
      boxbb_xmax : TPLFLT;
      boxbb_ymin : TPLFLT;
      boxbb_ymax : TPLFLT;
      mf_infile : Pchar;
      mf_outfile : Pchar;
    end;
{-------------------------------------------------------------------------- }
{ Prototypes for stream & device utility functions. }
{-------------------------------------------------------------------------- }
{ C++ extern C conditionnal removed }
{ Get the current stream pointer }

procedure plgpls(p_pls:PPPLStream);cdecl;external;
{ Initializes device cmap 1 entry by interpolation from pls->cmap1 entries }
procedure plcol_interp(pls:PPLStream; newcolor:PPLColor; i:longint; ncol:longint);cdecl;external;
{ Opens file for output, prompting if not set. }
procedure plOpenFile(pls:PPLStream);cdecl;external;
{ Close output file }
procedure plCloseFile(pls:PPLStream);cdecl;external;
{ Sets up next file member name (in pls->FileName), but does not open it. }
procedure plP_getmember(pls:PPLStream);cdecl;external;
{ Sets up file name & family stem name. }
(* Const before type ignored *)
procedure plP_sfnam(pls:PPLStream; fnam:Pchar);cdecl;external;
{ Initializes family file parameters. }
procedure plFamInit(pls:PPLStream);cdecl;external;
{ Starts new member file of family file set if necessary. }
procedure plGetFam(pls:PPLStream);cdecl;external;
{ Rotates physical coordinates if necessary for given orientation. }
procedure plRotPhy(orient:TPLINT; xmin:TPLINT; ymin:TPLINT; xmax:TPLINT; ymax:TPLINT; 
            px:PPLINT; py:PPLINT);cdecl;external;
{ Allocates a standard PLDev structure for device-specific data }
function plAllocDev(pls:PPLStream):PPLDev;cdecl;external;
{ Just fills in the PLGraphicsIn with appropriate initial values. }
procedure plGinInit(gin:PPLGraphicsIn);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __PLSTRM_H__ }

implementation


end.
