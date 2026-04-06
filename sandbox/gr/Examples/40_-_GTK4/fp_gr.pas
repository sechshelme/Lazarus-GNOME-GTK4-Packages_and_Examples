unit fp_gr;

interface

const
  {$IFDEF Linux}
  libgr = 'GR';
  {$ENDIF}

  {$IFDEF Windows}
  libgr = 'libGR.dll';
  {$ENDIF}

  {$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pprojection_type_t = ^Tprojection_type_t;
  Tprojection_type_t =  Longint;
  Const
    GR_PROJECTION_DEFAULT = 0;
    GR_PROJECTION_ORTHOGRAPHIC = 1;
    GR_PROJECTION_PERSPECTIVE = 2;

type
  Pvolume_border_calculation_t = ^Tvolume_border_calculation_t;
  Tvolume_border_calculation_t =  Longint;
  Const
    GR_VOLUME_WITHOUT_BORDER = 0;
    GR_VOLUME_WITH_BORDER = 1;

type
  Pvolume_rendering_model_t = ^Tvolume_rendering_model_t;
  Tvolume_rendering_model_t =  Longint;
  Const
    GR_VOLUME_EMISSION = 0;
    GR_VOLUME_ABSORPTION = 1;
    GR_VOLUME_MIP = 2;

type
  Ptextx_option_t = ^Ttextx_option_t;
  Ttextx_option_t =  Longint;
  Const
    GR_TEXT_USE_WC = 1 shl 0;
    GR_TEXT_ENABLE_INLINE_MATH = 1 shl 1;

type
  Pf2pass_option_t = ^Tf2pass_option_t;
  Tf2pass_option_t =  Longint;
  Const
    GR_2PASS_CLEANUP = 1;
    GR_2PASS_RENDER = 2;
const
  GR_MAX_CONTEXT = 8192;  
  GR_DEFAULT_MATH_FONT = 232;  
  GR_COLORMAP_DEFAULT = 0;  
  GR_COLORMAP_TEMPERATURE = 1;  
  GR_COLORMAP_GRAYSCALE = 2;  
  GR_COLORMAP_GLOWING = 3;  
  GR_COLORMAP_RAINBOWLIKE = 4;  
  GR_COLORMAP_GEOLOGIC = 5;  
  GR_COLORMAP_GREENSCALE = 6;  
  GR_COLORMAP_CYANSCALE = 7;  
  GR_COLORMAP_BLUESCALE = 8;  
  GR_COLORMAP_MAGENTASCALE = 9;  
  GR_COLORMAP_REDSCALE = 10;  
  GR_COLORMAP_FLAME = 11;  
  GR_COLORMAP_BROWNSCALE = 12;  
  GR_COLORMAP_PILATUS = 13;  
  GR_COLORMAP_AUTUMN = 14;  
  GR_COLORMAP_BONE = 15;  
  GR_COLORMAP_COOL = 16;  
  GR_COLORMAP_COPPER = 17;  
  GR_COLORMAP_GRAY = 18;  
  GR_COLORMAP_HOT = 19;  
  GR_COLORMAP_HSV = 20;  
  GR_COLORMAP_JET = 21;  
  GR_COLORMAP_PINK = 22;  
  GR_COLORMAP_SPECTRAL = 23;  
  GR_COLORMAP_SPRING = 24;  
  GR_COLORMAP_SUMMER = 25;  
  GR_COLORMAP_WINTER = 26;  
  GR_COLORMAP_GIST_EARTH = 27;  
  GR_COLORMAP_GIST_HEAT = 28;  
  GR_COLORMAP_GIST_NCAR = 29;  
  GR_COLORMAP_GIST_RAINBOW = 30;  
  GR_COLORMAP_GIST_STERN = 31;  
  GR_COLORMAP_AFMHOT = 32;  
  GR_COLORMAP_BRG = 33;  
  GR_COLORMAP_BWR = 34;  
  GR_COLORMAP_COOLWARM = 35;  
  GR_COLORMAP_CMRMAP = 36;  
  GR_COLORMAP_CUBEHELIX = 37;  
  GR_COLORMAP_GNUPLOT = 38;  
  GR_COLORMAP_GNUPLOT2 = 39;  
  GR_COLORMAP_OCEAN = 40;  
  GR_COLORMAP_RAINBOW = 41;  
  GR_COLORMAP_SEISMIC = 42;  
  GR_COLORMAP_TERRAIN = 43;  
  GR_COLORMAP_VIRIDIS = 44;  
  GR_COLORMAP_INFERNO = 45;  
  GR_COLORMAP_PLASMA = 46;  
  GR_COLORMAP_MAGMA = 47;  
  GR_COLORMAP_UNIFORM = 48;  
  GR_COLOR_RED = 236;  
  GR_COLOR_GREEN = 237;  
  GR_COLOR_YELLOW = 238;  
  GR_COLOR_BLUE = 239;  
  GR_COLOR_ORANGE = 240;  
  GR_COLOR_PURPLE = 241;  
  GR_COLOR_CYAN = 242;  
  GR_COLOR_MAGENTA = 243;  
  GR_COLOR_LIME = 244;  
  GR_COLOR_PINK = 245;  
  GR_COLOR_TEAL = 246;  
  GR_COLOR_LAVENDER = 247;  
  GR_COLOR_BROWN = 248;  
  GR_COLOR_BEIGE = 249;  
  GR_COLOR_MAROON = 250;  
  GR_COLOR_MINT = 251;  
  GR_COLOR_OLIVE = 252;  
  GR_COLOR_APRICOT = 253;  
  GR_COLOR_NAVY = 254;  
  GR_COLOR_GREY = 255;  
type
  Pscale_option_t = ^Tscale_option_t;
  Tscale_option_t =  Longint;
  Const
    GR_OPTION_X_LOG = 1 shl 0;
    GR_OPTION_Y_LOG = 1 shl 1;
    GR_OPTION_Z_LOG = 1 shl 2;
    GR_OPTION_FLIP_X = 1 shl 3;
    GR_OPTION_FLIP_Y = 1 shl 4;
    GR_OPTION_FLIP_Z = 1 shl 5;
    GR_OPTION_X_LOG2 = 1 shl 6;
    GR_OPTION_Y_LOG2 = 1 shl 7;
    GR_OPTION_Z_LOG2 = 1 shl 8;
    GR_OPTION_X_LN = 1 shl 9;
    GR_OPTION_Y_LN = 1 shl 10;
    GR_OPTION_Z_LN = 1 shl 11;

type
  Plinespec_t = ^Tlinespec_t;
  Tlinespec_t =  Longint;
  Const
    GR_SPEC_LINE = 1 shl 0;
    GR_SPEC_MARKER = 1 shl 1;
    GR_SPEC_COLOR = 1 shl 2;
type
  Psurface_option_t = ^Tsurface_option_t;
  Tsurface_option_t =  Longint;
  Const
    GR_OPTION_LINES = 0;
    GR_OPTION_MESH = 1;
    GR_OPTION_FILLED_MESH = 2;
    GR_OPTION_Z_SHADED_MESH = 3;
    GR_OPTION_COLORED_MESH = 4;
    GR_OPTION_CELL_ARRAY = 5;
    GR_OPTION_SHADED_MESH = 6;
    GR_OPTION_3D_MESH = 7;

type
  Pcolor_model_t = ^Tcolor_model_t;
  Tcolor_model_t =  Longint;
  Const
    GR_MODEL_RGB = 0;
    GR_MODEL_HSV = 1;

type
  Ppath_code_t = ^Tpath_code_t;
  Tpath_code_t =  Longint;
  Const
    GR_STOP = 0;
    GR_MOVETO = 1;
    GR_LINETO = 2;
    GR_CURVE3 = 3;
    GR_CURVE4 = 4;
    GR_CLOSEPOLY = $4f;

type
  Pxform_types_t = ^Txform_types_t;
  Txform_types_t =  Longint;
  Const
    GR_XFORM_BOOLEAN = 0;
    GR_XFORM_LINEAR = 1;
    GR_XFORM_LOG = 2;
    GR_XFORM_LOGLOG = 3;
    GR_XFORM_CUBIC = 4;
    GR_XFORM_EQUALIZED = 5;

type
  Pinterp2_method_t = ^Tinterp2_method_t;
  Tinterp2_method_t =  Longint;
  Const
    GR_INTERP2_NEAREST = 0;
    GR_INTERP2_LINEAR = 1;
    GR_INTERP2_SPLINE = 2;
    GR_INTERP2_CUBIC = 3;

type
  Tvertex_t = record
      x : double;
      y : double;
    end;
  Pvertex_t = ^Tvertex_t;

  Tpoint3d_t = record
      x : double;
      y : double;
      z : double;
    end;
  Ppoint3d_t = ^Tpoint3d_t;

  Tdata_point3d_t = record
      pt : Tpoint3d_t;
      data : double;
    end;
  Pdata_point3d_t = ^Tdata_point3d_t;

  Tgauss_t = record
      sqrt_det : double;
      gauss_sig_1 : Tpoint3d_t;
      gauss_sig_2 : Tpoint3d_t;
      gauss_sig_3 : Tpoint3d_t;
    end;
  Pgauss_t = ^Tgauss_t;

  Ttri_linear_t = record
      grid_x_re : double;
      grid_y_re : double;
      grid_z_re : double;
    end;
  Ptri_linear_t = ^Ttri_linear_t;

  Pcpubasedvolume_2pass_priv_t=type Pointer;

  Tcpubasedvolume_2pass_t = record
      dmin : double;
      dmax : double;
      action : longint;
      priv : Pcpubasedvolume_2pass_priv_t;
    end;
  Pcpubasedvolume_2pass_t = ^Tcpubasedvolume_2pass_t;

  Phexbin_2pass_priv_t=type Pointer;

  Thexbin_2pass_t = record
      nc : longint;
      cntmax : longint;
      action : longint;
      priv : Phexbin_2pass_priv_t;
    end;
  Phexbin_2pass_t = ^Thexbin_2pass_t;

  Tformat_reference_t = record
      scientific : longint;
      decimal_digits : longint;
    end;
  Pformat_reference_t = ^Tformat_reference_t;

  Ttick_t = record
      value : double;
      is_major : longint;
    end;
  Ptick_t = ^Ttick_t;

  Ttick_label_t = record
      tick : double;
      _label : Pchar;
      width : double;
    end;
  Ptick_label_t = ^Ttick_label_t;

  Taxis_t = record
      min : double;
      max : double;
      tick : double;
      org : double;
      position : double;
      major_count : longint;
      num_ticks : longint;
      ticks : Ptick_t;
      tick_size : double;
      num_tick_labels : longint;
      tick_labels : Ptick_label_t;
      label_position : double;
      draw_axis_line : longint;
      label_orientation : longint;
    end;
  Paxis_t = ^Taxis_t;

const
  GR_AXES_SIMPLE_AXES = 1 shl 0;  
  GR_AXES_TWIN_AXES = 1 shl 1;  
  GR_AXES_WITH_GRID = 1 shl 2;  

procedure gr_initgr;cdecl;external libgr;
function gr_debug:longint;cdecl;external libgr;
procedure gr_opengks;cdecl;external libgr;
procedure gr_closegks;cdecl;external libgr;
procedure gr_inqdspsize(para1:Pdouble; para2:Pdouble; para3:Plongint; para4:Plongint);cdecl;external libgr;
procedure gr_openws(para1:longint; para2:Pchar; para3:longint);cdecl;external libgr;
procedure gr_closews(para1:longint);cdecl;external libgr;
procedure gr_activatews(para1:longint);cdecl;external libgr;
procedure gr_deactivatews(para1:longint);cdecl;external libgr;
procedure gr_configurews;cdecl;external libgr;
procedure gr_clearws;cdecl;external libgr;
procedure gr_updatews;cdecl;external libgr;
procedure gr_polyline(para1:longint; para2:Pdouble; para3:Pdouble);cdecl;external libgr;
procedure gr_polymarker(para1:longint; para2:Pdouble; para3:Pdouble);cdecl;external libgr;
procedure gr_text(para1:double; para2:double; para3:Pchar);cdecl;external libgr;
procedure gr_textx(para1:double; para2:double; para3:Pchar; para4:longint);cdecl;external libgr;
procedure gr_inqtext(para1:double; para2:double; para3:Pchar; para4:Pdouble; para5:Pdouble);cdecl;external libgr;
procedure gr_inqtextx(para1:double; para2:double; para3:Pchar; para4:longint; para5:Pdouble; 
            para6:Pdouble);cdecl;external libgr;
procedure gr_fillarea(para1:longint; para2:Pdouble; para3:Pdouble);cdecl;external libgr;
procedure gr_cellarray(para1:double; para2:double; para3:double; para4:double; para5:longint; 
            para6:longint; para7:longint; para8:longint; para9:longint; para10:longint; 
            para11:Plongint);cdecl;external libgr;
procedure gr_nonuniformcellarray(para1:Pdouble; para2:Pdouble; para3:longint; para4:longint; para5:longint; 
            para6:longint; para7:longint; para8:longint; para9:Plongint);cdecl;external libgr;
procedure gr_polarcellarray(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double; para7:longint; para8:longint; para9:longint; para10:longint; 
            para11:longint; para12:longint; para13:Plongint);cdecl;external libgr;
procedure gr_nonuniformpolarcellarray(para1:double; para2:double; para3:Pdouble; para4:Pdouble; para5:longint; 
            para6:longint; para7:longint; para8:longint; para9:longint; para10:longint; 
            para11:Plongint);cdecl;external libgr;
procedure gr_gdp(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:longint; 
            para6:Plongint);cdecl;external libgr;
procedure gr_spline(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:longint);cdecl;external libgr;
procedure gr_gridit(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:longint; 
            para6:longint; para7:Pdouble; para8:Pdouble; para9:Pdouble);cdecl;external libgr;
procedure gr_setlinetype(para1:longint);cdecl;external libgr;
procedure gr_inqlinetype(para1:Plongint);cdecl;external libgr;
procedure gr_setlinewidth(para1:double);cdecl;external libgr;
procedure gr_inqlinewidth(para1:Pdouble);cdecl;external libgr;
procedure gr_setlinecolorind(para1:longint);cdecl;external libgr;
procedure gr_inqlinecolorind(para1:Plongint);cdecl;external libgr;
procedure gr_setmarkertype(para1:longint);cdecl;external libgr;
procedure gr_inqmarkertype(para1:Plongint);cdecl;external libgr;
procedure gr_setmarkersize(para1:double);cdecl;external libgr;
procedure gr_inqmarkersize(para1:Pdouble);cdecl;external libgr;
procedure gr_setmarkercolorind(para1:longint);cdecl;external libgr;
procedure gr_inqmarkercolorind(para1:Plongint);cdecl;external libgr;
procedure gr_settextfontprec(para1:longint; para2:longint);cdecl;external libgr;
procedure gr_setcharexpan(para1:double);cdecl;external libgr;
procedure gr_setcharspace(para1:double);cdecl;external libgr;
procedure gr_settextcolorind(para1:longint);cdecl;external libgr;
procedure gr_inqtextcolorind(para1:Plongint);cdecl;external libgr;
procedure gr_setcharheight(para1:double);cdecl;external libgr;
procedure gr_setwscharheight(chh:double; height:double);cdecl;external libgr;
procedure gr_inqcharheight(para1:Pdouble);cdecl;external libgr;
procedure gr_setcharup(para1:double; para2:double);cdecl;external libgr;
procedure gr_settextpath(para1:longint);cdecl;external libgr;
procedure gr_settextalign(para1:longint; para2:longint);cdecl;external libgr;
procedure gr_setfillintstyle(para1:longint);cdecl;external libgr;
procedure gr_inqfillintstyle(para1:Plongint);cdecl;external libgr;
procedure gr_setfillstyle(para1:longint);cdecl;external libgr;
procedure gr_inqfillstyle(para1:Plongint);cdecl;external libgr;
procedure gr_setfillcolorind(para1:longint);cdecl;external libgr;
procedure gr_inqfillcolorind(para1:Plongint);cdecl;external libgr;
procedure gr_setnominalsize(para1:double);cdecl;external libgr;
procedure gr_inqnominalsize(para1:Pdouble);cdecl;external libgr;
procedure gr_setcolorrep(para1:longint; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_setwindow(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_inqwindow(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libgr;
procedure gr_setviewport(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_inqviewport(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libgr;
procedure gr_selntran(para1:longint);cdecl;external libgr;
procedure gr_setclip(para1:longint);cdecl;external libgr;
procedure gr_setwswindow(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_setwsviewport(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_createseg(para1:longint);cdecl;external libgr;
procedure gr_copysegws(para1:longint);cdecl;external libgr;
procedure gr_redrawsegws;cdecl;external libgr;
procedure gr_setsegtran(para1:longint; para2:double; para3:double; para4:double; para5:double; 
            para6:double; para7:double; para8:double);cdecl;external libgr;
procedure gr_closeseg;cdecl;external libgr;
procedure gr_samplelocator(para1:Pdouble; para2:Pdouble; para3:Plongint);cdecl;external libgr;
procedure gr_emergencyclosegks;cdecl;external libgr;
procedure gr_updategks;cdecl;external libgr;
function gr_setspace(para1:double; para2:double; para3:longint; para4:longint):longint;cdecl;external libgr;
procedure gr_inqspace(para1:Pdouble; para2:Pdouble; para3:Plongint; para4:Plongint);cdecl;external libgr;
function gr_setscale(para1:longint):longint;cdecl;external libgr;
procedure gr_inqscale(para1:Plongint);cdecl;external libgr;
function gr_textext(para1:double; para2:double; para3:Pchar):longint;cdecl;external libgr;
procedure gr_inqtextext(para1:double; para2:double; para3:Pchar; para4:Pdouble; para5:Pdouble);cdecl;external libgr;
procedure gr_setscientificformat(para1:longint);cdecl;external libgr;
procedure gr_axes(para1:double; para2:double; para3:double; para4:double; para5:longint; 
            para6:longint; para7:double);cdecl;external libgr;
type TaxesFunc=procedure (para1:double; para2:double; para3:Pchar; para4:double);cdecl;
procedure gr_axeslbl(para1:double; para2:double; para3:double; para4:double; para5:longint;
            para6:longint; para7:double; para8:TaxesFunc; para9:TaxesFunc);cdecl;external libgr;
procedure gr_axis(para1:char; para2:Paxis_t);cdecl;external libgr;
procedure gr_drawaxis(para1:char; para2:Paxis_t);cdecl;external libgr;
procedure gr_drawaxes(para1:Paxis_t; para2:Paxis_t; para3:longint);cdecl;external libgr;
procedure gr_freeaxis(para1:Paxis_t);cdecl;external libgr;
procedure gr_grid(para1:double; para2:double; para3:double; para4:double; para5:longint; 
            para6:longint);cdecl;external libgr;
procedure gr_grid3d(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double; para7:longint; para8:longint; para9:longint);cdecl;external libgr;
procedure gr_verrorbars(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble);cdecl;external libgr;
procedure gr_herrorbars(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble);cdecl;external libgr;
procedure gr_polyline3d(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libgr;
procedure gr_polymarker3d(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libgr;
procedure gr_axes3d(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double; para7:longint; para8:longint; para9:longint; para10:double);cdecl;external libgr;
procedure gr_titles3d(para1:Pchar; para2:Pchar; para3:Pchar);cdecl;external libgr;
procedure gr_settitles3d(para1:Pchar; para2:Pchar; para3:Pchar);cdecl;external libgr;
procedure gr_surface(para1:longint; para2:longint; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:longint);cdecl;external libgr;
procedure gr_contour(para1:longint; para2:longint; para3:longint; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:longint);cdecl;external libgr;
procedure gr_contourf(para1:longint; para2:longint; para3:longint; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:longint);cdecl;external libgr;
procedure gr_tricontour(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:longint; 
            para6:Pdouble);cdecl;external libgr;
function gr_hexbin(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint):longint;cdecl;external libgr;
function gr_hexbin_2pass(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:Phexbin_2pass_t):Phexbin_2pass_t;cdecl;external libgr;
procedure gr_setcolormap(para1:longint);cdecl;external libgr;
procedure gr_inqcolormap(para1:Plongint);cdecl;external libgr;
procedure gr_setcolormapfromrgb(n:longint; r:Pdouble; g:Pdouble; b:Pdouble; x:Pdouble);cdecl;external libgr;
procedure gr_inqcolormapinds(para1:Plongint; para2:Plongint);cdecl;external libgr;
procedure gr_colorbar;cdecl;external libgr;
procedure gr_inqcolor(para1:longint; para2:Plongint);cdecl;external libgr;
function gr_inqcolorfromrgb(para1:double; para2:double; para3:double):longint;cdecl;external libgr;
procedure gr_hsvtorgb(h:double; s:double; v:double; r:Pdouble; g:Pdouble; 
            b:Pdouble);cdecl;external libgr;
function gr_tick(para1:double; para2:double):double;cdecl;external libgr;
function gr_validaterange(para1:double; para2:double):longint;cdecl;external libgr;
procedure gr_adjustlimits(para1:Pdouble; para2:Pdouble);cdecl;external libgr;
procedure gr_adjustrange(para1:Pdouble; para2:Pdouble);cdecl;external libgr;
procedure gr_beginprint(para1:Pchar);cdecl;external libgr;
procedure gr_beginprintext(para1:Pchar; para2:Pchar; para3:Pchar; para4:Pchar);cdecl;external libgr;
procedure gr_endprint;cdecl;external libgr;
procedure gr_ndctowc(para1:Pdouble; para2:Pdouble);cdecl;external libgr;
procedure gr_wctondc(para1:Pdouble; para2:Pdouble);cdecl;external libgr;
procedure gr_wc3towc(para1:Pdouble; para2:Pdouble; para3:Pdouble);cdecl;external libgr;
procedure gr_drawrect(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_fillrect(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_drawarc(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double);cdecl;external libgr;
procedure gr_fillarc(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double);cdecl;external libgr;
procedure gr_drawpath(para1:longint; para2:Pvertex_t; para3:Pbyte; para4:longint);cdecl;external libgr;
procedure gr_setarrowstyle(para1:longint);cdecl;external libgr;
procedure gr_setarrowsize(para1:double);cdecl;external libgr;
procedure gr_drawarrow(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
function gr_readimage(para1:Pchar; para2:Plongint; para3:Plongint; para4:PPlongint):longint;cdecl;external libgr;
procedure gr_drawimage(para1:double; para2:double; para3:double; para4:double; para5:longint; 
            para6:longint; para7:Plongint; para8:longint);cdecl;external libgr;
function gr_importgraphics(para1:Pchar):longint;cdecl;external libgr;
procedure gr_setshadow(para1:double; para2:double; para3:double);cdecl;external libgr;
procedure gr_settransparency(para1:double);cdecl;external libgr;
procedure gr_inqtransparency(para1:Pdouble);cdecl;external libgr;
procedure gr_setcoordxform(para1:PPdouble);cdecl;external libgr;
procedure gr_begingraphics(para1:Pchar);cdecl;external libgr;
procedure gr_endgraphics;cdecl;external libgr;
function gr_getgraphics:Pchar;cdecl;external libgr;
function gr_drawgraphics(para1:Pchar):longint;cdecl;external libgr;
function gr_startlistener:longint;cdecl;external libgr;
function gr_inqgrplotport:longint;cdecl;external libgr;
function gr_setgrplotport(para1:longint):longint;cdecl;external libgr;
procedure gr_mathtex(para1:double; para2:double; para3:Pchar);cdecl;external libgr;
procedure gr_inqmathtex(para1:double; para2:double; para3:Pchar; para4:Pdouble; para5:Pdouble);cdecl;external libgr;
procedure gr_mathtex3d(para1:double; para2:double; para3:double; para4:Pchar; para5:longint);cdecl;external libgr;
procedure gr_inqmathtex3d(para1:double; para2:double; para3:double; para4:Pchar; para5:longint; 
            para6:Pdouble; para7:Pdouble; para8:Pdouble; para9:Pdouble);cdecl;external libgr;
procedure gr_beginselection(para1:longint; para2:longint);cdecl;external libgr;
procedure gr_endselection;cdecl;external libgr;

type
  TGRBoundingBoxCanvasCallback = procedure(    id: LongInt;    left, right, bottom, top: Double  ); cdecl;
  TGRBoundingBoxContextCallback = procedure(    ptr: DWORD;    size: DWORD;    data: PDWORD  ); cdecl;
  TGRPartialUpdateCallback = procedure(    id: LongInt;    x: DWORD;    y: DWORD;    width: DWORD;    height: DWORD;    data: PDWORD  ); cdecl;

procedure gr_setbboxcallback(  id: LongInt;  canvas_callback: TGRBoundingBoxCanvasCallback;  context_callback: TGRBoundingBoxContextCallback); cdecl; external libgr;
procedure gr_cancelbboxcallback;cdecl;external libgr;
procedure gr_beginpartial(  id: LongInt;  update_callback: TGRPartialUpdateCallback); cdecl; external libgr;
procedure gr_endpartial(para1:longint);cdecl;external libgr;
procedure gr_moveselection(para1:double; para2:double);cdecl;external libgr;
procedure gr_resizeselection(para1:longint; para2:double; para3:double);cdecl;external libgr;
procedure gr_inqbbox(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libgr;
procedure gr_setbackground(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_clearbackground;cdecl;external libgr;
function gr_precision:double;cdecl;external libgr;
function gr_text_maxsize:longint;cdecl;external libgr;
procedure gr_setregenflags(para1:longint);cdecl;external libgr;
function gr_inqregenflags:longint;cdecl;external libgr;
procedure gr_savestate;cdecl;external libgr;
procedure gr_restorestate;cdecl;external libgr;
procedure gr_savecontext(para1:longint);cdecl;external libgr;
procedure gr_selectcontext(para1:longint);cdecl;external libgr;
procedure gr_destroycontext(para1:longint);cdecl;external libgr;
procedure gr_unselectcontext;cdecl;external libgr;
function gr_uselinespec(para1:Pchar):longint;cdecl;external libgr;
procedure gr_delaunay(para1:longint; para2:Pdouble; para3:Pdouble; para4:Plongint; para5:PPlongint);cdecl;external libgr;
procedure gr_reducepoints(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:Pdouble; 
            para6:Pdouble);cdecl;external libgr;
procedure gr_trisurface(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libgr;
procedure gr_gradient(para1:longint; para2:longint; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble);cdecl;external libgr;
procedure gr_quiver(para1:longint; para2:longint; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:longint);cdecl;external libgr;
procedure gr_interp2(nx:longint; ny:longint; x:Pdouble; y:Pdouble; z:Pdouble; 
            nxq:longint; nyq:longint; xq:Pdouble; yq:Pdouble; zq:Pdouble; 
            method:Tinterp2_method_t; extrapval:double);cdecl;external libgr;
function gr_version:Pchar;cdecl;external libgr;
procedure gr_shade(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:longint; 
            para6:Pdouble; para7:longint; para8:longint; para9:Plongint);cdecl;external libgr;
procedure gr_shadepoints(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:longint; 
            para6:longint);cdecl;external libgr;
procedure gr_shadelines(para1:longint; para2:Pdouble; para3:Pdouble; para4:longint; para5:longint; 
            para6:longint);cdecl;external libgr;
procedure gr_panzoom(para1:double; para2:double; para3:double; para4:double; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:Pdouble);cdecl;external libgr;

type
  TGRBoundaryFunction = function(    x: Double;    y: Double  ): Double; cdecl;

function gr_findboundary(  id: LongInt;  x_coords: PDouble;  y_coords: PDouble;  target_value: Double;  func: TGRBoundaryFunction;  max_points: LongInt;  n_points: PLongInt): LongInt; cdecl; external libgr;
procedure gr_setresamplemethod(para1:dword);cdecl;external libgr;
procedure gr_inqresamplemethod(para1:Pdword);cdecl;external libgr;
procedure gr_path(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pchar);cdecl;external libgr;
procedure gr_setborderwidth(para1:double);cdecl;external libgr;
procedure gr_inqborderwidth(para1:Pdouble);cdecl;external libgr;
procedure gr_setbordercolorind(para1:longint);cdecl;external libgr;
procedure gr_inqbordercolorind(para1:Plongint);cdecl;external libgr;
procedure gr_selectclipxform(para1:longint);cdecl;external libgr;
procedure gr_inqclipxform(para1:Plongint);cdecl;external libgr;
procedure gr_inqclip(para1:Plongint; para2:Pdouble);cdecl;external libgr;
procedure gr_setprojectiontype(para1:longint);cdecl;external libgr;
procedure gr_inqprojectiontype(para1:Plongint);cdecl;external libgr;
procedure gr_setperspectiveprojection(para1:double; para2:double; para3:double);cdecl;external libgr;
procedure gr_inqperspectiveprojection(para1:Pdouble; para2:Pdouble; para3:Pdouble);cdecl;external libgr;
procedure gr_settransformationparameters(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double; para7:double; para8:double; para9:double);cdecl;external libgr;
procedure gr_inqtransformationparameters(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:Pdouble; para9:Pdouble);cdecl;external libgr;
procedure gr_setorthographicprojection(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double);cdecl;external libgr;
procedure gr_inqorthographicprojection(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libgr;
procedure gr_camerainteraction(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_setwindow3d(para1:double; para2:double; para3:double; para4:double; para5:double; 
            para6:double);cdecl;external libgr;
procedure gr_inqwindow3d(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libgr;
procedure gr_setscalefactors3d(para1:double; para2:double; para3:double);cdecl;external libgr;
procedure gr_inqscalefactors3d(para1:Pdouble; para2:Pdouble; para3:Pdouble);cdecl;external libgr;
procedure gr_setspace3d(para1:double; para2:double; para3:double; para4:double);cdecl;external libgr;
procedure gr_inqspace3d(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble);cdecl;external libgr;
procedure gr_text3d(para1:double; para2:double; para3:double; para4:Pchar; axis:longint);cdecl;external libgr;
procedure gr_inqtext3d(para1:double; para2:double; para3:double; para4:Pchar; axis:longint; 
            para6:Pdouble; para7:Pdouble);cdecl;external libgr;
procedure gr_settextencoding(para1:longint);cdecl;external libgr;
procedure gr_inqtextencoding(para1:Plongint);cdecl;external libgr;
procedure gr_loadfont(para1:Pchar; para2:Plongint);cdecl;external libgr;
type
  TGRStringHandlerCallback = function(    input_str: PAnsiChar  ): AnsiChar; cdecl;

procedure gr_setcallback(  callback_func: TGRStringHandlerCallback); cdecl; external libgr;
procedure gr_setthreadnumber(para1:longint);cdecl;external libgr;
procedure gr_setpicturesizeforvolume(para1:longint; para2:longint);cdecl;external libgr;
procedure gr_setvolumebordercalculation(para1:longint);cdecl;external libgr;
procedure gr_setapproximativecalculation(para1:longint);cdecl;external libgr;
procedure gr_inqvolumeflags(para1:Plongint; para2:Plongint; para3:Plongint; para4:Plongint; para5:Plongint);cdecl;external libgr;
procedure gr_cpubasedvolume(para1:longint; para2:longint; para3:longint; para4:Pdouble; para5:longint; 
            para6:Pdouble; para7:Pdouble; para8:Pdouble; para9:Pdouble);cdecl;external libgr;
function gr_cpubasedvolume_2pass(para1:longint; para2:longint; para3:longint; para4:Pdouble; para5:longint; 
           para6:Pdouble; para7:Pdouble; para8:Pdouble; para9:Pdouble; para10:Pcpubasedvolume_2pass_t):Pcpubasedvolume_2pass_t;cdecl;external libgr;
procedure gr_inqvpsize(para1:Plongint; para2:Plongint; para3:Pdouble);cdecl;external libgr;
procedure gr_polygonmesh3d(para1:longint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:longint; 
            para6:Plongint; para7:Plongint);cdecl;external libgr;
type
  Tkernel_f = function (para1:Pdata_point3d_t; para2:pointer; para3:Ppoint3d_t; para4:Ppoint3d_t):double;cdecl;
  Tradius_f = function (para1:Pdata_point3d_t; para2:pointer):double;cdecl;

procedure gr_volume_nogrid(para1:dword; para2:Pdata_point3d_t; para3:pointer; para4:longint; para5:Tkernel_f; 
            para6:Pdouble; para7:Pdouble; para8:double; para9:Tradius_f);cdecl;external libgr;
procedure gr_volume_interp_tri_linear_init(para1:double; para2:double; para3:double);cdecl;external libgr;
procedure gr_volume_interp_gauss_init(para1:double; para2:Pdouble);cdecl;external libgr;
function gr_volume_interp_tri_linear(para1:Pdata_point3d_t; para2:pointer; para3:Ppoint3d_t; para4:Ppoint3d_t):double;cdecl;external libgr;
function gr_volume_interp_gauss(para1:Pdata_point3d_t; para2:pointer; para3:Ppoint3d_t; para4:Ppoint3d_t):double;cdecl;external libgr;
procedure gr_setmathfont(font:longint);cdecl;external libgr;
procedure gr_inqmathfont(font:Plongint);cdecl;external libgr;
procedure gr_setclipregion(region:longint);cdecl;external libgr;
procedure gr_inqclipregion(region:Plongint);cdecl;external libgr;
procedure gr_setclipsector(start_angle:double; end_angle:double);cdecl;external libgr;
procedure gr_inqclipsector(start_angle:Pdouble; end_angle:Pdouble);cdecl;external libgr;
procedure gr_settextoffset(xoff:double; yoff:double);cdecl;external libgr;
function gr_ftoa(_string:Pchar; value:double; reference:Pformat_reference_t):Pchar;cdecl;external libgr;
procedure gr_getformat(result:Pformat_reference_t; origin:double; min:double; max:double; tick_width:double; 
            major:longint);cdecl;external libgr;

// === Konventiert am: 6-4-26 13:07:44 ===


implementation



end.
